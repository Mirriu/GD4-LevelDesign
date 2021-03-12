// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/URP Surface/Surface Height Detail Tessellation"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(VERSION 1.4.0 URP 7_5_2)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		[Enum(Standard,0,Scale Independent,1)]_TillingMode("Tilling Mode", Int) = 0
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[NoScaleOffset][Normal][SingleLineTexture]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[SingleLineTexture]_Metal("Metallic Map", 2D) = "white" {}
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[SingleLineTexture]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Smoothness,0,Roughness,1)]_SmoothnessType("Smoothness Type", Int) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[Enum(Texture,0,Baked,1)]_OcclusionSourceMode("Occlusion Source Mode", Int) = 1
		[SingleLineTexture]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		[Enum(Off,0,Active,1)][Header(DISPLACEMENT)]_Displacement_Mode("Displacement Mode", Int) = 0
		[NoScaleOffset][SingleLineTexture]_ParallaxMap("Displacement Map", 2D) = "white" {}
		_DisplacementStrength("Displacement Strength", Range( 0 , 1)) = 0.00125
		[Enum(Off,0,Active,1)][Header(MAP DETAIL)]_EnableDetailMap("Enable Detail Map", Int) = 0
		_ColorDetail("Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_DetailAlbedoMap("Albedo Map", 2D) = "white" {}
		_DetailBrightness("Brightness", Range( 0 , 2)) = 1
		[Enum(Standard,0,Scale Independent,1)]_TillingModeDetail("Tilling Mode", Int) = 0
		_DetailTilingXDetail("Tiling X", Float) = 1
		_DetailTilingYDetail("Tiling Y", Float) = 1
		_DetailOffsetXDetail("Offset X", Float) = 0
		_DetailOffsetYDetail("Offset Y", Float) = 0
		[NoScaleOffset][Normal][SingleLineTexture]_DetailNormalMap("Normal Map", 2D) = "bump" {}
		_DetailNormalMapScale("Normal Strength", Float) = 1
		_DetailBlendInfluence("Blend Influence", Range( 0 , 3)) = 1
		_DetailBlendHeight("Blend Height", Range( 0 , 1.25)) = 1
		_DetailBlendSmooth("Blend Smooth", Range( 0.01 , 0.5)) = 0.35
		[Enum(Off,0,Active,1)][Header(MAP DETAIL MASK)]_EnableDetailMask("Enable Detail Mask", Int) = 0
		[SingleLineTexture]_DetailMaskMap("Mask Map", 2D) = "white" {}
		_DetailTilingXDetailMask("Tiling X", Float) = 1
		_DetailTilingYDetailMask("Tiling Y", Float) = 1
		_DetailOffsetXDetailMask("Offset X", Float) = 0
		_DetailOffsetYDetailMask("Offset Y", Float) = 0
		[Header(TESSELLATION URP)]_TessellationStrength("Tessellation Strength", Range( 0.001 , 100)) = 6
		_TessellationPhong("Tessellation Phong", Range( 0 , 1)) = 0.5
		_TessellationDistanceMin("Tessellation Distance Min", Float) = 0
		[ASEEnd]_TessellationDistanceMax("Tessellation Distance Max ", Float) = 5

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry-10" "NatureRendererInstancing"="True" }
		Cull [_CullMode]
		AlphaToMask Off
		HLSLINCLUDE
		#pragma target 2.0

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" "NatureRendererInstancing"="True" }
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _ColorDetail;
			half _TessellationDistanceMax;
			float _DetailTilingYDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			half _DetailBrightness;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _DetailBlendHeight;
			half _DetailBlendSmooth;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			float _SmoothnessStrength;
			int _SmoothnessType;
			half _DetailBlendInfluence;
			float _DetailTilingXDetail;
			int _TillingModeDetail;
			int _EnableDetailMask;
			half _TessellationStrength;
			int _ColorMask;
			half _TessellationPhong;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationDistanceMin;
			int _Displacement_Mode;
			half _DisplacementStrength;
			int _TillingMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			int _EnableDetailMap;
			half _Brightness;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_Metal);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			float2 float2switch214_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch361_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch393_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch476_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch506_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch467_g3103( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch502_g3103( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch547_g3103( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_538_0_g3103 = float3(0,0,0);
				int m_switch361_g3103 = _Displacement_Mode;
				float4 temp_cast_1 = (0.0).xxxx;
				float4 m_Off361_g3103 = temp_cast_1;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( v.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = v.texcoord.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float2 CUSTOM_UV1179_g3103 = texCoord165_g3103;
				float4 m_Active361_g3103 = ( _DisplacementStrength * ( SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3103, 1.0 ) * float4( v.ase_normal , 0.0 ) ) );
				float4 localfloat4switch361_g3103 = float4switch361_g3103( m_switch361_g3103 , m_Off361_g3103 , m_Active361_g3103 );
				float4 DISPLACEMENT_OUT543_g3103 = localfloat4switch361_g3103;
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( float4( temp_output_538_0_g3103 , 0.0 ) + DISPLACEMENT_OUT543_g3103 ).xyz;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				int SURFACE_MAP_MODE456_g3103 = _EnableDetailMap;
				int m_switch506_g3103 = SURFACE_MAP_MODE456_g3103;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( IN.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = IN.ase_texcoord7.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float4 tex2DNode35_g3103 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord165_g3103 );
				float4 temp_output_159_0_g3103 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3103 * _Brightness );
				float4 ALBEDO_OUT91_g3103 = temp_output_159_0_g3103;
				float4 m_Off506_g3103 = ALBEDO_OUT91_g3103;
				int EnableDetailMask428_g3103 = _EnableDetailMask;
				int m_switch476_g3103 = EnableDetailMask428_g3103;
				int TILLING_MODE_DETAIL435_g3103 = _TillingModeDetail;
				int m_switch393_g3103 = TILLING_MODE_DETAIL435_g3103;
				float2 appendResult432_g3103 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 TEXTURE_TILLING_DETAIL425_g3103 = appendResult432_g3103;
				float2 m_Standard393_g3103 = TEXTURE_TILLING_DETAIL425_g3103;
				float3 break420_g3103 = ase_parentObjectScale;
				float2 appendResult448_g3103 = (float2(break420_g3103.z , break420_g3103.y));
				float3 normalizeResult480_g3103 = normalize( IN.ase_normal );
				float3 break431_g3103 = normalizeResult480_g3103;
				float2 appendResult426_g3103 = (float2(break420_g3103.x , break420_g3103.z));
				float2 appendResult433_g3103 = (float2(break420_g3103.x , break420_g3103.y));
				float2 TEXTURE_TILLING_SCALE_DETAIL427_g3103 = ( ( ( appendResult448_g3103 * break431_g3103.x ) + ( break431_g3103.y * appendResult426_g3103 ) + ( break431_g3103.z * appendResult433_g3103 ) ) * TEXTURE_TILLING_DETAIL425_g3103 );
				float2 m_Scale393_g3103 = TEXTURE_TILLING_SCALE_DETAIL427_g3103;
				float2 localfloat2switch393_g3103 = float2switch393_g3103( m_switch393_g3103 , m_Standard393_g3103 , m_Scale393_g3103 );
				float2 appendResult394_g3103 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord414_g3103 = IN.ase_texcoord7.xy * localfloat2switch393_g3103 + appendResult394_g3103;
				float4 tex2DNode449_g3103 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord414_g3103 );
				float4 ALBEDO_OUT_DETAIL493_g3103 = ( _ColorDetail * tex2DNode449_g3103 * _DetailBrightness );
				float4 m_Off476_g3103 = ALBEDO_OUT_DETAIL493_g3103;
				float2 appendResult445_g3103 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult417_g3103 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord415_g3103 = IN.ase_texcoord7.xy * appendResult445_g3103 + appendResult417_g3103;
				float4 tex2DNode418_g3103 = SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord415_g3103 );
				float4 lerpResult477_g3103 = lerp( ALBEDO_OUT91_g3103 , ALBEDO_OUT_DETAIL493_g3103 , tex2DNode418_g3103.r);
				float4 m_Active476_g3103 = lerpResult477_g3103;
				float4 localfloat4switch476_g3103 = float4switch476_g3103( m_switch476_g3103 , m_Off476_g3103 , m_Active476_g3103 );
				float4 MASK_ALBEDO_OUT473_g3103 = localfloat4switch476_g3103;
				float4 break462_g3103 = ALBEDO_OUT91_g3103;
				float ALBEDO_IN_XYZ464_g3103 = ( break462_g3103.r + break462_g3103.g + break462_g3103.b );
				float clampResult486_g3103 = clamp( ( ( ( ( ALBEDO_IN_XYZ464_g3103 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( IN.ase_color.r - ( _DetailBlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DETAIL_BLEND396_g3103 = clampResult486_g3103;
				float4 lerpResult503_g3103 = lerp( MASK_ALBEDO_OUT473_g3103 , ALBEDO_OUT91_g3103 , DETAIL_BLEND396_g3103);
				float4 m_Active506_g3103 = lerpResult503_g3103;
				float4 localfloat4switch506_g3103 = float4switch506_g3103( m_switch506_g3103 , m_Off506_g3103 , m_Active506_g3103 );
				
				int m_switch502_g3103 = SURFACE_MAP_MODE456_g3103;
				float3 unpack92_g3103 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, texCoord165_g3103 ), _NormalStrength );
				unpack92_g3103.z = lerp( 1, unpack92_g3103.z, saturate(_NormalStrength) );
				float3 NORMAL_OUT23_g3103 = unpack92_g3103;
				float3 m_Off502_g3103 = NORMAL_OUT23_g3103;
				int m_switch467_g3103 = EnableDetailMask428_g3103;
				float3 unpack487_g3103 = UnpackNormalScale( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord414_g3103 ), _DetailNormalMapScale );
				unpack487_g3103.z = lerp( 1, unpack487_g3103.z, saturate(_DetailNormalMapScale) );
				float3 NORMAL_OUT_DETAIL491_g3103 = unpack487_g3103;
				float3 m_Off467_g3103 = NORMAL_OUT_DETAIL491_g3103;
				float3 lerpResult470_g3103 = lerp( NORMAL_OUT23_g3103 , NORMAL_OUT_DETAIL491_g3103 , tex2DNode418_g3103.r);
				float3 m_Active467_g3103 = saturate( lerpResult470_g3103 );
				float3 localfloat3switch467_g3103 = float3switch467_g3103( m_switch467_g3103 , m_Off467_g3103 , m_Active467_g3103 );
				float3 MASK_NORMAL_OUT469_g3103 = localfloat3switch467_g3103;
				float3 lerpResult498_g3103 = lerp( MASK_NORMAL_OUT469_g3103 , NORMAL_OUT23_g3103 , DETAIL_BLEND396_g3103);
				float3 m_Active502_g3103 = ( NORMAL_OUT23_g3103 + saturate( lerpResult498_g3103 ) );
				float3 localfloat3switch502_g3103 = float3switch502_g3103( m_switch502_g3103 , m_Off502_g3103 , m_Active502_g3103 );
				
				float2 CUSTOM_UV1179_g3103 = texCoord165_g3103;
				
				int m_switch547_g3103 = _SmoothnessType;
				float4 tex2DNode126_g3103 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3103 );
				float4 m_Smoothness547_g3103 = tex2DNode126_g3103;
				float4 m_Roughness547_g3103 = ( 1.0 - tex2DNode126_g3103 );
				float4 localfloat4switch547_g3103 = float4switch547_g3103( m_switch547_g3103 , m_Smoothness547_g3103 , m_Roughness547_g3103 );
				
				float4 color525_g3103 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float lerpResult134_g3103 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3103 ).r , IN.ase_color.a , (float)_OcclusionSourceMode);
				float4 temp_cast_14 = (lerpResult134_g3103).xxxx;
				float4 lerpResult135_g3103 = lerp( color525_g3103 , temp_cast_14 , _OcclusionStrengthAO);
				
				float3 Albedo = ( localfloat4switch506_g3103 + float4(0,0,0,0) ).xyz;
				float3 Normal = localfloat3switch502_g3103;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * SAMPLE_TEXTURE2D( _Metal, sampler_trilinear_repeat, CUSTOM_UV1179_g3103 ) ).r;
				float Smoothness = ( _SmoothnessStrength * localfloat4switch547_g3103 ).x;
				float Occlusion = lerpResult135_g3103.r;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _ColorDetail;
			half _TessellationDistanceMax;
			float _DetailTilingYDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			half _DetailBrightness;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _DetailBlendHeight;
			half _DetailBlendSmooth;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			float _SmoothnessStrength;
			int _SmoothnessType;
			half _DetailBlendInfluence;
			float _DetailTilingXDetail;
			int _TillingModeDetail;
			int _EnableDetailMask;
			half _TessellationStrength;
			int _ColorMask;
			half _TessellationPhong;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationDistanceMin;
			int _Displacement_Mode;
			half _DisplacementStrength;
			int _TillingMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			int _EnableDetailMap;
			half _Brightness;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);


			float2 float2switch214_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch361_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 temp_output_538_0_g3103 = float3(0,0,0);
				int m_switch361_g3103 = _Displacement_Mode;
				float4 temp_cast_1 = (0.0).xxxx;
				float4 m_Off361_g3103 = temp_cast_1;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( v.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = v.ase_texcoord.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float2 CUSTOM_UV1179_g3103 = texCoord165_g3103;
				float4 m_Active361_g3103 = ( _DisplacementStrength * ( SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3103, 1.0 ) * float4( v.ase_normal , 0.0 ) ) );
				float4 localfloat4switch361_g3103 = float4switch361_g3103( m_switch361_g3103 , m_Off361_g3103 , m_Active361_g3103 );
				float4 DISPLACEMENT_OUT543_g3103 = localfloat4switch361_g3103;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( float4( temp_output_538_0_g3103 , 0.0 ) + DISPLACEMENT_OUT543_g3103 ).xyz;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _ColorDetail;
			half _TessellationDistanceMax;
			float _DetailTilingYDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			half _DetailBrightness;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _DetailBlendHeight;
			half _DetailBlendSmooth;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			float _SmoothnessStrength;
			int _SmoothnessType;
			half _DetailBlendInfluence;
			float _DetailTilingXDetail;
			int _TillingModeDetail;
			int _EnableDetailMask;
			half _TessellationStrength;
			int _ColorMask;
			half _TessellationPhong;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationDistanceMin;
			int _Displacement_Mode;
			half _DisplacementStrength;
			int _TillingMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			int _EnableDetailMap;
			half _Brightness;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);


			float2 float2switch214_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch361_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_538_0_g3103 = float3(0,0,0);
				int m_switch361_g3103 = _Displacement_Mode;
				float4 temp_cast_1 = (0.0).xxxx;
				float4 m_Off361_g3103 = temp_cast_1;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( v.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = v.ase_texcoord.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float2 CUSTOM_UV1179_g3103 = texCoord165_g3103;
				float4 m_Active361_g3103 = ( _DisplacementStrength * ( SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3103, 1.0 ) * float4( v.ase_normal , 0.0 ) ) );
				float4 localfloat4switch361_g3103 = float4switch361_g3103( m_switch361_g3103 , m_Off361_g3103 , m_Active361_g3103 );
				float4 DISPLACEMENT_OUT543_g3103 = localfloat4switch361_g3103;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( float4( temp_output_538_0_g3103 , 0.0 ) + DISPLACEMENT_OUT543_g3103 ).xyz;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _ColorDetail;
			half _TessellationDistanceMax;
			float _DetailTilingYDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			half _DetailBrightness;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _DetailBlendHeight;
			half _DetailBlendSmooth;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			float _SmoothnessStrength;
			int _SmoothnessType;
			half _DetailBlendInfluence;
			float _DetailTilingXDetail;
			int _TillingModeDetail;
			int _EnableDetailMask;
			half _TessellationStrength;
			int _ColorMask;
			half _TessellationPhong;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationDistanceMin;
			int _Displacement_Mode;
			half _DisplacementStrength;
			int _TillingMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			int _EnableDetailMap;
			half _Brightness;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);


			float2 float2switch214_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch361_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch393_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch476_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch506_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_538_0_g3103 = float3(0,0,0);
				int m_switch361_g3103 = _Displacement_Mode;
				float4 temp_cast_1 = (0.0).xxxx;
				float4 m_Off361_g3103 = temp_cast_1;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( v.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = v.ase_texcoord.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float2 CUSTOM_UV1179_g3103 = texCoord165_g3103;
				float4 m_Active361_g3103 = ( _DisplacementStrength * ( SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3103, 1.0 ) * float4( v.ase_normal , 0.0 ) ) );
				float4 localfloat4switch361_g3103 = float4switch361_g3103( m_switch361_g3103 , m_Off361_g3103 , m_Active361_g3103 );
				float4 DISPLACEMENT_OUT543_g3103 = localfloat4switch361_g3103;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( float4( temp_output_538_0_g3103 , 0.0 ) + DISPLACEMENT_OUT543_g3103 ).xyz;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int SURFACE_MAP_MODE456_g3103 = _EnableDetailMap;
				int m_switch506_g3103 = SURFACE_MAP_MODE456_g3103;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( IN.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = IN.ase_texcoord2.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float4 tex2DNode35_g3103 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord165_g3103 );
				float4 temp_output_159_0_g3103 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3103 * _Brightness );
				float4 ALBEDO_OUT91_g3103 = temp_output_159_0_g3103;
				float4 m_Off506_g3103 = ALBEDO_OUT91_g3103;
				int EnableDetailMask428_g3103 = _EnableDetailMask;
				int m_switch476_g3103 = EnableDetailMask428_g3103;
				int TILLING_MODE_DETAIL435_g3103 = _TillingModeDetail;
				int m_switch393_g3103 = TILLING_MODE_DETAIL435_g3103;
				float2 appendResult432_g3103 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 TEXTURE_TILLING_DETAIL425_g3103 = appendResult432_g3103;
				float2 m_Standard393_g3103 = TEXTURE_TILLING_DETAIL425_g3103;
				float3 break420_g3103 = ase_parentObjectScale;
				float2 appendResult448_g3103 = (float2(break420_g3103.z , break420_g3103.y));
				float3 normalizeResult480_g3103 = normalize( IN.ase_normal );
				float3 break431_g3103 = normalizeResult480_g3103;
				float2 appendResult426_g3103 = (float2(break420_g3103.x , break420_g3103.z));
				float2 appendResult433_g3103 = (float2(break420_g3103.x , break420_g3103.y));
				float2 TEXTURE_TILLING_SCALE_DETAIL427_g3103 = ( ( ( appendResult448_g3103 * break431_g3103.x ) + ( break431_g3103.y * appendResult426_g3103 ) + ( break431_g3103.z * appendResult433_g3103 ) ) * TEXTURE_TILLING_DETAIL425_g3103 );
				float2 m_Scale393_g3103 = TEXTURE_TILLING_SCALE_DETAIL427_g3103;
				float2 localfloat2switch393_g3103 = float2switch393_g3103( m_switch393_g3103 , m_Standard393_g3103 , m_Scale393_g3103 );
				float2 appendResult394_g3103 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord414_g3103 = IN.ase_texcoord2.xy * localfloat2switch393_g3103 + appendResult394_g3103;
				float4 tex2DNode449_g3103 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord414_g3103 );
				float4 ALBEDO_OUT_DETAIL493_g3103 = ( _ColorDetail * tex2DNode449_g3103 * _DetailBrightness );
				float4 m_Off476_g3103 = ALBEDO_OUT_DETAIL493_g3103;
				float2 appendResult445_g3103 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult417_g3103 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord415_g3103 = IN.ase_texcoord2.xy * appendResult445_g3103 + appendResult417_g3103;
				float4 tex2DNode418_g3103 = SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord415_g3103 );
				float4 lerpResult477_g3103 = lerp( ALBEDO_OUT91_g3103 , ALBEDO_OUT_DETAIL493_g3103 , tex2DNode418_g3103.r);
				float4 m_Active476_g3103 = lerpResult477_g3103;
				float4 localfloat4switch476_g3103 = float4switch476_g3103( m_switch476_g3103 , m_Off476_g3103 , m_Active476_g3103 );
				float4 MASK_ALBEDO_OUT473_g3103 = localfloat4switch476_g3103;
				float4 break462_g3103 = ALBEDO_OUT91_g3103;
				float ALBEDO_IN_XYZ464_g3103 = ( break462_g3103.r + break462_g3103.g + break462_g3103.b );
				float clampResult486_g3103 = clamp( ( ( ( ( ALBEDO_IN_XYZ464_g3103 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( IN.ase_color.r - ( _DetailBlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DETAIL_BLEND396_g3103 = clampResult486_g3103;
				float4 lerpResult503_g3103 = lerp( MASK_ALBEDO_OUT473_g3103 , ALBEDO_OUT91_g3103 , DETAIL_BLEND396_g3103);
				float4 m_Active506_g3103 = lerpResult503_g3103;
				float4 localfloat4switch506_g3103 = float4switch506_g3103( m_switch506_g3103 , m_Off506_g3103 , m_Active506_g3103 );
				
				
				float3 Albedo = ( localfloat4switch506_g3103 + float4(0,0,0,0) ).xyz;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma enable_d3d11_debug_symbols
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_NORMAL
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _ColorDetail;
			half _TessellationDistanceMax;
			float _DetailTilingYDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			half _DetailBrightness;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _DetailBlendHeight;
			half _DetailBlendSmooth;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			float _SmoothnessStrength;
			int _SmoothnessType;
			half _DetailBlendInfluence;
			float _DetailTilingXDetail;
			int _TillingModeDetail;
			int _EnableDetailMask;
			half _TessellationStrength;
			int _ColorMask;
			half _TessellationPhong;
			int _CullMode;
			int _ZWriteMode;
			half _TessellationDistanceMin;
			int _Displacement_Mode;
			half _DisplacementStrength;
			int _TillingMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			int _EnableDetailMap;
			half _Brightness;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);


			float2 float2switch214_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch361_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch393_g3103( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch476_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch506_g3103( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 temp_output_538_0_g3103 = float3(0,0,0);
				int m_switch361_g3103 = _Displacement_Mode;
				float4 temp_cast_1 = (0.0).xxxx;
				float4 m_Off361_g3103 = temp_cast_1;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( v.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = v.ase_texcoord.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float2 CUSTOM_UV1179_g3103 = texCoord165_g3103;
				float4 m_Active361_g3103 = ( _DisplacementStrength * ( SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3103, 1.0 ) * float4( v.ase_normal , 0.0 ) ) );
				float4 localfloat4switch361_g3103 = float4switch361_g3103( m_switch361_g3103 , m_Off361_g3103 , m_Active361_g3103 );
				float4 DISPLACEMENT_OUT543_g3103 = localfloat4switch361_g3103;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( float4( temp_output_538_0_g3103 , 0.0 ) + DISPLACEMENT_OUT543_g3103 ).xyz;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int SURFACE_MAP_MODE456_g3103 = _EnableDetailMap;
				int m_switch506_g3103 = SURFACE_MAP_MODE456_g3103;
				int TILLING_MODE190_g3103 = _TillingMode;
				int m_switch214_g3103 = TILLING_MODE190_g3103;
				float2 appendResult192_g3103 = (float2(_TilingX , _TilingY));
				float2 TEXTURE_TILLING200_g3103 = appendResult192_g3103;
				float2 m_Standard214_g3103 = TEXTURE_TILLING200_g3103;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break206_g3103 = ase_parentObjectScale;
				float2 appendResult205_g3103 = (float2(break206_g3103.z , break206_g3103.y));
				float3 normalizeResult194_g3103 = normalize( IN.ase_normal );
				float3 break201_g3103 = normalizeResult194_g3103;
				float2 appendResult204_g3103 = (float2(break206_g3103.x , break206_g3103.z));
				float2 appendResult193_g3103 = (float2(break206_g3103.x , break206_g3103.y));
				float2 TEXTURE_TILLING_SCALE210_g3103 = ( ( ( appendResult205_g3103 * break201_g3103.x ) + ( break201_g3103.y * appendResult204_g3103 ) + ( break201_g3103.z * appendResult193_g3103 ) ) * TEXTURE_TILLING200_g3103 );
				float2 m_Scale214_g3103 = TEXTURE_TILLING_SCALE210_g3103;
				float2 localfloat2switch214_g3103 = float2switch214_g3103( m_switch214_g3103 , m_Standard214_g3103 , m_Scale214_g3103 );
				float2 appendResult166_g3103 = (float2(_OffsetX , _OffsetY));
				float2 texCoord165_g3103 = IN.ase_texcoord2.xy * localfloat2switch214_g3103 + appendResult166_g3103;
				float4 tex2DNode35_g3103 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord165_g3103 );
				float4 temp_output_159_0_g3103 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3103 * _Brightness );
				float4 ALBEDO_OUT91_g3103 = temp_output_159_0_g3103;
				float4 m_Off506_g3103 = ALBEDO_OUT91_g3103;
				int EnableDetailMask428_g3103 = _EnableDetailMask;
				int m_switch476_g3103 = EnableDetailMask428_g3103;
				int TILLING_MODE_DETAIL435_g3103 = _TillingModeDetail;
				int m_switch393_g3103 = TILLING_MODE_DETAIL435_g3103;
				float2 appendResult432_g3103 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 TEXTURE_TILLING_DETAIL425_g3103 = appendResult432_g3103;
				float2 m_Standard393_g3103 = TEXTURE_TILLING_DETAIL425_g3103;
				float3 break420_g3103 = ase_parentObjectScale;
				float2 appendResult448_g3103 = (float2(break420_g3103.z , break420_g3103.y));
				float3 normalizeResult480_g3103 = normalize( IN.ase_normal );
				float3 break431_g3103 = normalizeResult480_g3103;
				float2 appendResult426_g3103 = (float2(break420_g3103.x , break420_g3103.z));
				float2 appendResult433_g3103 = (float2(break420_g3103.x , break420_g3103.y));
				float2 TEXTURE_TILLING_SCALE_DETAIL427_g3103 = ( ( ( appendResult448_g3103 * break431_g3103.x ) + ( break431_g3103.y * appendResult426_g3103 ) + ( break431_g3103.z * appendResult433_g3103 ) ) * TEXTURE_TILLING_DETAIL425_g3103 );
				float2 m_Scale393_g3103 = TEXTURE_TILLING_SCALE_DETAIL427_g3103;
				float2 localfloat2switch393_g3103 = float2switch393_g3103( m_switch393_g3103 , m_Standard393_g3103 , m_Scale393_g3103 );
				float2 appendResult394_g3103 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord414_g3103 = IN.ase_texcoord2.xy * localfloat2switch393_g3103 + appendResult394_g3103;
				float4 tex2DNode449_g3103 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord414_g3103 );
				float4 ALBEDO_OUT_DETAIL493_g3103 = ( _ColorDetail * tex2DNode449_g3103 * _DetailBrightness );
				float4 m_Off476_g3103 = ALBEDO_OUT_DETAIL493_g3103;
				float2 appendResult445_g3103 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult417_g3103 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord415_g3103 = IN.ase_texcoord2.xy * appendResult445_g3103 + appendResult417_g3103;
				float4 tex2DNode418_g3103 = SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord415_g3103 );
				float4 lerpResult477_g3103 = lerp( ALBEDO_OUT91_g3103 , ALBEDO_OUT_DETAIL493_g3103 , tex2DNode418_g3103.r);
				float4 m_Active476_g3103 = lerpResult477_g3103;
				float4 localfloat4switch476_g3103 = float4switch476_g3103( m_switch476_g3103 , m_Off476_g3103 , m_Active476_g3103 );
				float4 MASK_ALBEDO_OUT473_g3103 = localfloat4switch476_g3103;
				float4 break462_g3103 = ALBEDO_OUT91_g3103;
				float ALBEDO_IN_XYZ464_g3103 = ( break462_g3103.r + break462_g3103.g + break462_g3103.b );
				float clampResult486_g3103 = clamp( ( ( ( ( ALBEDO_IN_XYZ464_g3103 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( IN.ase_color.r - ( _DetailBlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DETAIL_BLEND396_g3103 = clampResult486_g3103;
				float4 lerpResult503_g3103 = lerp( MASK_ALBEDO_OUT473_g3103 , ALBEDO_OUT91_g3103 , DETAIL_BLEND396_g3103);
				float4 m_Active506_g3103 = lerpResult503_g3103;
				float4 localfloat4switch506_g3103 = float4switch506_g3103( m_switch506_g3103 , m_Off506_g3103 , m_Active506_g3103 );
				
				
				float3 Albedo = ( localfloat4switch506_g3103 + float4(0,0,0,0) ).xyz;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	/*ase_lod*/
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback " "
	
}
/*ASEBEGIN
Version=18713
2068;279.3333;1602;805;20.79625;1222.666;1.3;True;False
Node;AmplifyShaderEditor.CommentaryNode;389;1390.695,-1042.718;Inherit;False;333;126;;1;293;;0.3740541,0.990566,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;290;1386.96,-890.2607;Inherit;False;346.5028;193.4201;;2;291;353;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1390.783,-1175.665;Inherit;False;319;123;;1;379;GLOBAL SETTINGS ;0.3731129,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;384;967.7153,-373.9511;Inherit;False;361.1923;438.7019;;4;386;387;385;388;Tessellation;0,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;387;990.2144,-260.0283;Half;False;Property;_TessellationDistanceMin;Tessellation Distance Min;57;0;Create;False;1;;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;379;1410.669,-1136.518;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;False;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;291;1396.189,-848.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;388;996.202,-100.5226;Half;False;Property;_TessellationPhong;Tessellation Phong;56;0;Create;False;1;;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1400.431,-777.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;385;994.0308,-180.8491;Half;False;Property;_TessellationDistanceMax;Tessellation Distance Max ;58;0;Create;False;1;;0;0;True;0;False;5;2000;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;382;816.6689,-686.0181;Inherit;False;DECSF Master Map Surface;3;;3103;6c26b12be02413b47bab527585da6bf6;6,185,4,508,1,520,1,533,0,534,0,542,1;2;538;FLOAT3;0,0,0;False;550;FLOAT4;0,0,0,0;False;9;FLOAT4;106;FLOAT3;88;COLOR;115;FLOAT4;129;COLOR;116;FLOAT;181;FLOAT;144;FLOAT;318;FLOAT4;535
Node;AmplifyShaderEditor.RangedFloatNode;386;989.7154,-334.2432;Half;False;Property;_TessellationStrength;Tessellation Strength;55;0;Create;False;1;;0;0;True;1;Header(TESSELLATION URP);False;6;0.5;0.001;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;293;1414.695,-1000.418;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 URP 7_5_2;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;375;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;378;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;377;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;373;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;376;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;374;1374.904,-680.6909;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;11;DEC/URP Surface/Surface Height Detail Tessellation;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;2;True;379;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;6;Include;;False;;Native;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom; ;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;1;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;1;  Phong;1;  Strength;0.5,True,388;  Type;1;  Tess;16,True,386;  Min;10,True,387;  Max;25,True,385;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;6;False;True;True;True;True;True;False;;True;0
WireConnection;374;0;382;106
WireConnection;374;1;382;88
WireConnection;374;3;382;115
WireConnection;374;4;382;129
WireConnection;374;5;382;116
WireConnection;374;8;382;535
ASEEND*/
//CHKSM=F4F156D1DAEAC697754A38D54F31EA5E2551741A