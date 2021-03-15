// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/URP Billboard/Billboard Wind Simple"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(VERSION 1.4.0 URP 7_5_2)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Off,0,Active,1)]_GlancingClipMode("Clip Glancing Angle Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1.5
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.49
		_AlphaCutoffBiasShadow("Alpha Cutoff Bias Shadow", Range( 0.01 , 1)) = 0.01
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[NoScaleOffset][Normal][SingleLineTexture]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceBillboard("Wind Strength", Float) = 1
		[Header(WIND MODE LOCAL)]_LocalWindStrength("Wind Strength", Float) = 1
		_LocalWindPulse("Wind Pulse", Float) = 0.1
		_LocalWindDirection("Wind Direction", Float) = 1
		_LocalRandomWindOffset("Wind Random Offset", Float) = 0.2
		[Header(WIND MASK)][Enum(Off,0,Active,1)]_WindMask_Texture("Wind Mask Texture", Int) = 0
		[NoKeywordToggle]_WindMask_TextureVisualize("Visualize", Float) = 0
		[SingleLineTexture]_WindMask_Map("Mask", 2D) = "white" {}
		_WindMask_Texture_Intensity("Mask Intensity", Range( 0 , 1)) = 1
		[Enum(Off,0,Top Down,1,Bottom Up,2,Side Wall,3,Spherical ,4,Spherical Inverted,5)]_WindMask_Procedural("Wind Mask Procedural", Int) = 0
		[NoKeywordToggle]_WindMask_ProceduralVisualize("Visualize", Float) = 0
		_WindMask_Offset1("Mask Offset", Float) = 1.5
		[ASEEnd]_WindMask_Procedural_Intensity("Mask Intensity", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_Map_ST;
			float4 _Color;
			int _ColorMask;
			half _AlphaCutoffBias;
			float _OcclusionStrengthAO;
			float _SmoothnessStrength;
			float _MetallicStrength;
			half _NormalStrength;
			float _WindMask_ProceduralVisualize;
			float _WindMask_TextureVisualize;
			half _Brightness;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _WindMask_Texture_Intensity;
			float _WindMask_Procedural_Intensity;
			float _WindMask_Offset1;
			float _LocalWindDirection;
			float _LocalWindPulse;
			float _LocalRandomWindOffset;
			float _LocalWindStrength;
			float _GlobalWindInfluenceBillboard;
			int _WindMask_Procedural;
			int _WindMask_Texture;
			int _WindMode;
			int _ZWriteMode;
			int _CullMode;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
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
			int _Global_Wind_Billboard_Enabled;
			float _Global_Wind_Billboard_Intensity;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_BumpMap);


			float floatswitch2460_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 float3switch2465_g3274( int m_switch, float3 m_Off, float3 m_On )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_On;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2328_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float floatswitch2655_g3274( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float(0);
			}
			
			float3 float3switch2966_g3274( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2527_g3274( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch2972_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2982_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2986_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2991_g3274( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float4(0,0,0,0);
			}
			
			float floatswitch263_g3276( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch2453_g3274 = _WindMode;
				float3 m_Off2453_g3274 = float3(0,0,0);
				int m_switch2527_g3274 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2966_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				int _WIND_MODE2462_g3274 = _WindMode;
				int m_switch2328_g3274 = _WIND_MODE2462_g3274;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3274 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 m_Off2328_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int _Global_Wind_Billboard_Enabled2614_g3274 = _Global_Wind_Billboard_Enabled;
				int m_switch2465_g3274 = _Global_Wind_Billboard_Enabled2614_g3274;
				float3 m_Off2465_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2265_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int m_switch2460_g3274 = _WIND_MODE2462_g3274;
				float m_Off2460_g3274 = 1.0;
				float _Global_Wind_Billboard_Intensity2372_g3274 = _Global_Wind_Billboard_Intensity;
				float _Global_Wind_Main_Intensity2403_g3274 = _Global_Wind_Main_Intensity;
				float m_Global2460_g3274 = ( ( _GlobalWindInfluenceBillboard * _Global_Wind_Billboard_Intensity2372_g3274 ) * _Global_Wind_Main_Intensity2403_g3274 );
				float m_Local2460_g3274 = _LocalWindStrength;
				float localfloatswitch2460_g3274 = floatswitch2460_g3274( m_switch2460_g3274 , m_Off2460_g3274 , m_Global2460_g3274 , m_Local2460_g3274 );
				float VAR_WindStrength2400_g3274 = localfloatswitch2460_g3274;
				int m_switch2468_g3274 = _WIND_MODE2462_g3274;
				float m_Off2468_g3274 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3274 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3274 = _Global_Wind_Main_RandomOffset2378_g3274;
				float m_Local2468_g3274 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3274 = floatswitch2468_g3274( m_switch2468_g3274 , m_Off2468_g3274 , m_Global2468_g3274 , m_Local2468_g3274 );
				float VAR_WindOffset2419_g3274 = localfloatswitch2468_g3274;
				float4 transform2423_g3274 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3274 = (float2(transform2423_g3274.x , transform2423_g3274.z));
				float dotResult2341_g3274 = dot( appendResult2307_g3274 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3274 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3274 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3274 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3274 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3274 );
				float FUNC_Turbulence2274_g3274 = ( sin( ( ( VAR_RandomTime2244_g3274 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3274 = _WIND_MODE2462_g3274;
				float m_Off2312_g3274 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3274 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3274 = _Global_Wind_Main_Pulse2302_g3274;
				float m_Local2312_g3274 = _LocalWindPulse;
				float localfloatswitch2312_g3274 = floatswitch2312_g3274( m_switch2312_g3274 , m_Off2312_g3274 , m_Global2312_g3274 , m_Local2312_g3274 );
				float VAR_WindPulse2421_g3274 = localfloatswitch2312_g3274;
				float FUNC_Angle2470_g3274 = ( VAR_WindStrength2400_g3274 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3274 * 2.0 ) + FUNC_Turbulence2274_g3274 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3274 );
				float VAR_SinA2424_g3274 = sin( FUNC_Angle2470_g3274 );
				float VAR_CosA2362_g3274 = cos( FUNC_Angle2470_g3274 );
				int m_switch2456_g3274 = _WIND_MODE2462_g3274;
				float m_Off2456_g3274 = 1.0;
				float _Global_Wind_Main_Direction2350_g3274 = _Global_Wind_Main_Direction;
				float m_Global2456_g3274 = _Global_Wind_Main_Direction2350_g3274;
				float m_Local2456_g3274 = _LocalWindDirection;
				float localfloatswitch2456_g3274 = floatswitch2456_g3274( m_switch2456_g3274 , m_Off2456_g3274 , m_Global2456_g3274 , m_Local2456_g3274 );
				float _WindDirection2249_g3274 = localfloatswitch2456_g3274;
				float2 localDirectionalEquation2249_g3274 = DirectionalEquation( _WindDirection2249_g3274 );
				float2 break2469_g3274 = localDirectionalEquation2249_g3274;
				float VAR_xLerp2418_g3274 = break2469_g3274.x;
				float lerpResult2258_g3274 = lerp( break2265_g3274.x , ( ( break2265_g3274.y * VAR_SinA2424_g3274 ) + ( break2265_g3274.x * VAR_CosA2362_g3274 ) ) , VAR_xLerp2418_g3274);
				float3 break2340_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2233_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float VAR_zLerp2416_g3274 = break2469_g3274.y;
				float lerpResult2275_g3274 = lerp( break2233_g3274.z , ( ( break2233_g3274.y * VAR_SinA2424_g3274 ) + ( break2233_g3274.z * VAR_CosA2362_g3274 ) ) , VAR_zLerp2416_g3274);
				float3 appendResult2235_g3274 = (float3(lerpResult2258_g3274 , ( ( break2340_g3274.y * VAR_CosA2362_g3274 ) - ( break2340_g3274.z * VAR_SinA2424_g3274 ) ) , lerpResult2275_g3274));
				float3 VAR_VERTEXPOSITION2354_g3274 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3274 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3274 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3274 );
				float3 m_On2465_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2465_g3274 = float3switch2465_g3274( m_switch2465_g3274 , m_Off2465_g3274 , m_On2465_g3274 );
				float3 m_Global2328_g3274 = localfloat3switch2465_g3274;
				float3 m_Local2328_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2328_g3274 = float3switch2328_g3274( m_switch2328_g3274 , m_Off2328_g3274 , m_Global2328_g3274 , m_Local2328_g3274 );
				float3 WIND_FINAL2753_g3274 = localfloat3switch2328_g3274;
				float3 m_Off2966_g3274 = WIND_FINAL2753_g3274;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( ase_worldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( ase_worldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_4 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( ase_worldNormal ) - temp_cast_4 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float3 lerpResult2917_g3274 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3274 , appendResult2916_g3274);
				float3 m_TopDown2966_g3274 = lerpResult2917_g3274;
				float3 m_BottomUp2966_g3274 = lerpResult2917_g3274;
				float3 m_SideWall2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical_Inverted2966_g3274 = lerpResult2917_g3274;
				float3 localfloat3switch2966_g3274 = float3switch2966_g3274( m_switch2966_g3274 , m_Off2966_g3274 , m_TopDown2966_g3274 , m_BottomUp2966_g3274 , m_SideWall2966_g3274 , m_Spherical2966_g3274 , m_Spherical_Inverted2966_g3274 );
				float3 m_Off2527_g3274 = localfloat3switch2966_g3274;
				float2 uv_WindMask_Map = v.texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3274 = ( localfloat3switch2966_g3274 * temp_output_2910_0_g3274 );
				float3 localfloat3switch2527_g3274 = float3switch2527_g3274( m_switch2527_g3274 , m_Off2527_g3274 , m_Active2527_g3274 );
				float3 WIND_MASK2748_g3274 = localfloat3switch2527_g3274;
				float3 m_Global2453_g3274 = WIND_MASK2748_g3274;
				float3 m_Local2453_g3274 = WIND_MASK2748_g3274;
				float3 localfloat3switch2453_g3274 = float3switch2453_g3274( m_switch2453_g3274 , m_Off2453_g3274 , m_Global2453_g3274 , m_Local2453_g3274 );
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = localfloat3switch2453_g3274;
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
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
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
				float phongStrength = _TessPhongStrength;
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

				float2 appendResult83_g3276 = (float2(_TilingX , _TilingY));
				float2 appendResult71_g3276 = (float2(_OffsetX , _OffsetY));
				float2 texCoord13_g3276 = IN.ase_texcoord7.xy * appendResult83_g3276 + appendResult71_g3276;
				float4 tex2DNode150_g3276 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord13_g3276 );
				float3 temp_output_55_0_g3276 = ( (_Color).rgb * (tex2DNode150_g3276).rgb * _Brightness );
				int _MASK_MODE_TEXTURE2980_g3274 = _WindMask_Texture;
				int m_switch2982_g3274 = _MASK_MODE_TEXTURE2980_g3274;
				float4 _Vector3 = float4(0,0,0,0);
				float4 m_Off2982_g3274 = _Vector3;
				int m_switch2972_g3274 = (int)_WindMask_TextureVisualize;
				float4 m_Off2972_g3274 = _Vector3;
				float4 color2979_g3274 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
				float4 _Visualize_Color2992_g3274 = color2979_g3274;
				float2 uv_WindMask_Map = IN.ase_texcoord7.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float4 appendResult2974_g3274 = (float4(temp_output_2910_0_g3274 , temp_output_2910_0_g3274.x));
				float4 lerpResult2967_g3274 = lerp( _Visualize_Color2992_g3274 , float4( 0,0,0,0 ) , appendResult2974_g3274);
				float4 m_Active2972_g3274 = lerpResult2967_g3274;
				float4 localfloat4switch2972_g3274 = float4switch2972_g3274( m_switch2972_g3274 , m_Off2972_g3274 , m_Active2972_g3274 );
				float4 m_Active2982_g3274 = localfloat4switch2972_g3274;
				float4 localfloat4switch2982_g3274 = float4switch2982_g3274( m_switch2982_g3274 , m_Off2982_g3274 , m_Active2982_g3274 );
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2991_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				float4 m_Off2991_g3274 = _Vector3;
				int m_switch2986_g3274 = (int)_WindMask_ProceduralVisualize;
				float4 m_Off2986_g3274 = _Vector3;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( WorldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( WorldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_6 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( WorldNormal ) - temp_cast_6 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float4 appendResult2977_g3274 = (float4(appendResult2916_g3274 , appendResult2916_g3274.x));
				float4 lerpResult2976_g3274 = lerp( _Visualize_Color2992_g3274 , float4( 0,0,0,0 ) , appendResult2977_g3274);
				float4 m_Active2986_g3274 = lerpResult2976_g3274;
				float4 localfloat4switch2986_g3274 = float4switch2986_g3274( m_switch2986_g3274 , m_Off2986_g3274 , m_Active2986_g3274 );
				float4 m_TopDown2991_g3274 = localfloat4switch2986_g3274;
				float4 m_BottomUp2991_g3274 = localfloat4switch2986_g3274;
				float4 m_SideWall2991_g3274 = localfloat4switch2986_g3274;
				float4 m_Spherical2991_g3274 = localfloat4switch2986_g3274;
				float4 m_Spherical_Inverted2991_g3274 = localfloat4switch2986_g3274;
				float4 localfloat4switch2991_g3274 = float4switch2991_g3274( m_switch2991_g3274 , m_Off2991_g3274 , m_TopDown2991_g3274 , m_BottomUp2991_g3274 , m_SideWall2991_g3274 , m_Spherical2991_g3274 , m_Spherical_Inverted2991_g3274 );
				
				float3 unpack45_g3276 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, texCoord13_g3276 ), _NormalStrength );
				unpack45_g3276.z = lerp( 1, unpack45_g3276.z, saturate(_NormalStrength) );
				float3 NORMAL_OUT_01292_g3276 = unpack45_g3276;
				float3 worldToViewDir283_g3276 = normalize( mul( UNITY_MATRIX_V, float4( SafeNormalize(_MainLightPosition.xyz), 0 ) ).xyz );
				float dotResult280_g3276 = dot( NORMAL_OUT_01292_g3276 , worldToViewDir283_g3276 );
				float3 appendResult279_g3276 = (float3(dotResult280_g3276 , dotResult280_g3276 , dotResult280_g3276));
				
				float4 color391_g3276 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_13 = (IN.ase_color.a).xxxx;
				float4 lerpResult389_g3276 = lerp( color391_g3276 , temp_cast_13 , _OcclusionStrengthAO);
				
				float ALBEDO_A366_g3276 = tex2DNode150_g3276.a;
				clip( ALBEDO_A366_g3276 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_377_0_g3276 = saturate( ( ( ALBEDO_A366_g3276 / max( fwidth( ALBEDO_A366_g3276 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch263_g3276 = _GlancingClipMode;
				float m_Off263_g3276 = 0.0;
				float3 normalizeResult332_g3276 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult317_g3276 = dot( WorldViewDirection , normalizeResult332_g3276 );
				float temp_output_319_0_g3276 = ( 1.0 - abs( dotResult317_g3276 ) );
				float m_Active263_g3276 = ( temp_output_319_0_g3276 * 1.45 );
				float localfloatswitch263_g3276 = floatswitch263_g3276( m_switch263_g3276 , m_Off263_g3276 , m_Active263_g3276 );
				
				float3 Albedo = ( float4( temp_output_55_0_g3276 , 0.0 ) + ( localfloat4switch2982_g3274 + localfloat4switch2991_g3274 ) ).xyz;
				float3 Normal = ( unpack45_g3276 + saturate( appendResult279_g3276 ) );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = _MetallicStrength;
				float Smoothness = _SmoothnessStrength;
				float Occlusion = lerpResult389_g3276.r;
				float Alpha = temp_output_377_0_g3276;
				float AlphaClipThreshold = localfloatswitch263_g3276;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
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
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_Map_ST;
			float4 _Color;
			int _ColorMask;
			half _AlphaCutoffBias;
			float _OcclusionStrengthAO;
			float _SmoothnessStrength;
			float _MetallicStrength;
			half _NormalStrength;
			float _WindMask_ProceduralVisualize;
			float _WindMask_TextureVisualize;
			half _Brightness;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _WindMask_Texture_Intensity;
			float _WindMask_Procedural_Intensity;
			float _WindMask_Offset1;
			float _LocalWindDirection;
			float _LocalWindPulse;
			float _LocalRandomWindOffset;
			float _LocalWindStrength;
			float _GlobalWindInfluenceBillboard;
			int _WindMask_Procedural;
			int _WindMask_Texture;
			int _WindMode;
			int _ZWriteMode;
			int _CullMode;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
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
			int _Global_Wind_Billboard_Enabled;
			float _Global_Wind_Billboard_Intensity;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2460_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 float3switch2465_g3274( int m_switch, float3 m_Off, float3 m_On )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_On;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2328_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float floatswitch2655_g3274( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float(0);
			}
			
			float3 float3switch2966_g3274( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2527_g3274( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float floatswitch263_g3276( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				int m_switch2453_g3274 = _WindMode;
				float3 m_Off2453_g3274 = float3(0,0,0);
				int m_switch2527_g3274 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2966_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				int _WIND_MODE2462_g3274 = _WindMode;
				int m_switch2328_g3274 = _WIND_MODE2462_g3274;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3274 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 m_Off2328_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int _Global_Wind_Billboard_Enabled2614_g3274 = _Global_Wind_Billboard_Enabled;
				int m_switch2465_g3274 = _Global_Wind_Billboard_Enabled2614_g3274;
				float3 m_Off2465_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2265_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int m_switch2460_g3274 = _WIND_MODE2462_g3274;
				float m_Off2460_g3274 = 1.0;
				float _Global_Wind_Billboard_Intensity2372_g3274 = _Global_Wind_Billboard_Intensity;
				float _Global_Wind_Main_Intensity2403_g3274 = _Global_Wind_Main_Intensity;
				float m_Global2460_g3274 = ( ( _GlobalWindInfluenceBillboard * _Global_Wind_Billboard_Intensity2372_g3274 ) * _Global_Wind_Main_Intensity2403_g3274 );
				float m_Local2460_g3274 = _LocalWindStrength;
				float localfloatswitch2460_g3274 = floatswitch2460_g3274( m_switch2460_g3274 , m_Off2460_g3274 , m_Global2460_g3274 , m_Local2460_g3274 );
				float VAR_WindStrength2400_g3274 = localfloatswitch2460_g3274;
				int m_switch2468_g3274 = _WIND_MODE2462_g3274;
				float m_Off2468_g3274 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3274 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3274 = _Global_Wind_Main_RandomOffset2378_g3274;
				float m_Local2468_g3274 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3274 = floatswitch2468_g3274( m_switch2468_g3274 , m_Off2468_g3274 , m_Global2468_g3274 , m_Local2468_g3274 );
				float VAR_WindOffset2419_g3274 = localfloatswitch2468_g3274;
				float4 transform2423_g3274 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3274 = (float2(transform2423_g3274.x , transform2423_g3274.z));
				float dotResult2341_g3274 = dot( appendResult2307_g3274 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3274 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3274 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3274 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3274 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3274 );
				float FUNC_Turbulence2274_g3274 = ( sin( ( ( VAR_RandomTime2244_g3274 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3274 = _WIND_MODE2462_g3274;
				float m_Off2312_g3274 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3274 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3274 = _Global_Wind_Main_Pulse2302_g3274;
				float m_Local2312_g3274 = _LocalWindPulse;
				float localfloatswitch2312_g3274 = floatswitch2312_g3274( m_switch2312_g3274 , m_Off2312_g3274 , m_Global2312_g3274 , m_Local2312_g3274 );
				float VAR_WindPulse2421_g3274 = localfloatswitch2312_g3274;
				float FUNC_Angle2470_g3274 = ( VAR_WindStrength2400_g3274 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3274 * 2.0 ) + FUNC_Turbulence2274_g3274 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3274 );
				float VAR_SinA2424_g3274 = sin( FUNC_Angle2470_g3274 );
				float VAR_CosA2362_g3274 = cos( FUNC_Angle2470_g3274 );
				int m_switch2456_g3274 = _WIND_MODE2462_g3274;
				float m_Off2456_g3274 = 1.0;
				float _Global_Wind_Main_Direction2350_g3274 = _Global_Wind_Main_Direction;
				float m_Global2456_g3274 = _Global_Wind_Main_Direction2350_g3274;
				float m_Local2456_g3274 = _LocalWindDirection;
				float localfloatswitch2456_g3274 = floatswitch2456_g3274( m_switch2456_g3274 , m_Off2456_g3274 , m_Global2456_g3274 , m_Local2456_g3274 );
				float _WindDirection2249_g3274 = localfloatswitch2456_g3274;
				float2 localDirectionalEquation2249_g3274 = DirectionalEquation( _WindDirection2249_g3274 );
				float2 break2469_g3274 = localDirectionalEquation2249_g3274;
				float VAR_xLerp2418_g3274 = break2469_g3274.x;
				float lerpResult2258_g3274 = lerp( break2265_g3274.x , ( ( break2265_g3274.y * VAR_SinA2424_g3274 ) + ( break2265_g3274.x * VAR_CosA2362_g3274 ) ) , VAR_xLerp2418_g3274);
				float3 break2340_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2233_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float VAR_zLerp2416_g3274 = break2469_g3274.y;
				float lerpResult2275_g3274 = lerp( break2233_g3274.z , ( ( break2233_g3274.y * VAR_SinA2424_g3274 ) + ( break2233_g3274.z * VAR_CosA2362_g3274 ) ) , VAR_zLerp2416_g3274);
				float3 appendResult2235_g3274 = (float3(lerpResult2258_g3274 , ( ( break2340_g3274.y * VAR_CosA2362_g3274 ) - ( break2340_g3274.z * VAR_SinA2424_g3274 ) ) , lerpResult2275_g3274));
				float3 VAR_VERTEXPOSITION2354_g3274 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3274 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3274 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3274 );
				float3 m_On2465_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2465_g3274 = float3switch2465_g3274( m_switch2465_g3274 , m_Off2465_g3274 , m_On2465_g3274 );
				float3 m_Global2328_g3274 = localfloat3switch2465_g3274;
				float3 m_Local2328_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2328_g3274 = float3switch2328_g3274( m_switch2328_g3274 , m_Off2328_g3274 , m_Global2328_g3274 , m_Local2328_g3274 );
				float3 WIND_FINAL2753_g3274 = localfloat3switch2328_g3274;
				float3 m_Off2966_g3274 = WIND_FINAL2753_g3274;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( ase_worldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( ase_worldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_4 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( ase_worldNormal ) - temp_cast_4 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float3 lerpResult2917_g3274 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3274 , appendResult2916_g3274);
				float3 m_TopDown2966_g3274 = lerpResult2917_g3274;
				float3 m_BottomUp2966_g3274 = lerpResult2917_g3274;
				float3 m_SideWall2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical_Inverted2966_g3274 = lerpResult2917_g3274;
				float3 localfloat3switch2966_g3274 = float3switch2966_g3274( m_switch2966_g3274 , m_Off2966_g3274 , m_TopDown2966_g3274 , m_BottomUp2966_g3274 , m_SideWall2966_g3274 , m_Spherical2966_g3274 , m_Spherical_Inverted2966_g3274 );
				float3 m_Off2527_g3274 = localfloat3switch2966_g3274;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3274 = ( localfloat3switch2966_g3274 * temp_output_2910_0_g3274 );
				float3 localfloat3switch2527_g3274 = float3switch2527_g3274( m_switch2527_g3274 , m_Off2527_g3274 , m_Active2527_g3274 );
				float3 WIND_MASK2748_g3274 = localfloat3switch2527_g3274;
				float3 m_Global2453_g3274 = WIND_MASK2748_g3274;
				float3 m_Local2453_g3274 = WIND_MASK2748_g3274;
				float3 localfloat3switch2453_g3274 = float3switch2453_g3274( m_switch2453_g3274 , m_Off2453_g3274 , m_Global2453_g3274 , m_Local2453_g3274 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = localfloat3switch2453_g3274;
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
				float4 ase_color : COLOR;
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
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
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

				float2 appendResult83_g3276 = (float2(_TilingX , _TilingY));
				float2 appendResult71_g3276 = (float2(_OffsetX , _OffsetY));
				float2 texCoord13_g3276 = IN.ase_texcoord2.xy * appendResult83_g3276 + appendResult71_g3276;
				float4 tex2DNode150_g3276 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord13_g3276 );
				float ALBEDO_A366_g3276 = tex2DNode150_g3276.a;
				clip( ALBEDO_A366_g3276 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_377_0_g3276 = saturate( ( ( ALBEDO_A366_g3276 / max( fwidth( ALBEDO_A366_g3276 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch263_g3276 = _GlancingClipMode;
				float m_Off263_g3276 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult332_g3276 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult317_g3276 = dot( ase_worldViewDir , normalizeResult332_g3276 );
				float temp_output_319_0_g3276 = ( 1.0 - abs( dotResult317_g3276 ) );
				float m_Active263_g3276 = ( temp_output_319_0_g3276 * 1.45 );
				float localfloatswitch263_g3276 = floatswitch263_g3276( m_switch263_g3276 , m_Off263_g3276 , m_Active263_g3276 );
				
				float Alpha = temp_output_377_0_g3276;
				float AlphaClipThreshold = localfloatswitch263_g3276;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;

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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
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
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_Map_ST;
			float4 _Color;
			int _ColorMask;
			half _AlphaCutoffBias;
			float _OcclusionStrengthAO;
			float _SmoothnessStrength;
			float _MetallicStrength;
			half _NormalStrength;
			float _WindMask_ProceduralVisualize;
			float _WindMask_TextureVisualize;
			half _Brightness;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _WindMask_Texture_Intensity;
			float _WindMask_Procedural_Intensity;
			float _WindMask_Offset1;
			float _LocalWindDirection;
			float _LocalWindPulse;
			float _LocalRandomWindOffset;
			float _LocalWindStrength;
			float _GlobalWindInfluenceBillboard;
			int _WindMask_Procedural;
			int _WindMask_Texture;
			int _WindMode;
			int _ZWriteMode;
			int _CullMode;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
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
			int _Global_Wind_Billboard_Enabled;
			float _Global_Wind_Billboard_Intensity;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2460_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 float3switch2465_g3274( int m_switch, float3 m_Off, float3 m_On )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_On;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2328_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float floatswitch2655_g3274( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float(0);
			}
			
			float3 float3switch2966_g3274( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2527_g3274( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float floatswitch263_g3276( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch2453_g3274 = _WindMode;
				float3 m_Off2453_g3274 = float3(0,0,0);
				int m_switch2527_g3274 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2966_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				int _WIND_MODE2462_g3274 = _WindMode;
				int m_switch2328_g3274 = _WIND_MODE2462_g3274;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3274 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 m_Off2328_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int _Global_Wind_Billboard_Enabled2614_g3274 = _Global_Wind_Billboard_Enabled;
				int m_switch2465_g3274 = _Global_Wind_Billboard_Enabled2614_g3274;
				float3 m_Off2465_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2265_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int m_switch2460_g3274 = _WIND_MODE2462_g3274;
				float m_Off2460_g3274 = 1.0;
				float _Global_Wind_Billboard_Intensity2372_g3274 = _Global_Wind_Billboard_Intensity;
				float _Global_Wind_Main_Intensity2403_g3274 = _Global_Wind_Main_Intensity;
				float m_Global2460_g3274 = ( ( _GlobalWindInfluenceBillboard * _Global_Wind_Billboard_Intensity2372_g3274 ) * _Global_Wind_Main_Intensity2403_g3274 );
				float m_Local2460_g3274 = _LocalWindStrength;
				float localfloatswitch2460_g3274 = floatswitch2460_g3274( m_switch2460_g3274 , m_Off2460_g3274 , m_Global2460_g3274 , m_Local2460_g3274 );
				float VAR_WindStrength2400_g3274 = localfloatswitch2460_g3274;
				int m_switch2468_g3274 = _WIND_MODE2462_g3274;
				float m_Off2468_g3274 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3274 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3274 = _Global_Wind_Main_RandomOffset2378_g3274;
				float m_Local2468_g3274 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3274 = floatswitch2468_g3274( m_switch2468_g3274 , m_Off2468_g3274 , m_Global2468_g3274 , m_Local2468_g3274 );
				float VAR_WindOffset2419_g3274 = localfloatswitch2468_g3274;
				float4 transform2423_g3274 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3274 = (float2(transform2423_g3274.x , transform2423_g3274.z));
				float dotResult2341_g3274 = dot( appendResult2307_g3274 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3274 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3274 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3274 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3274 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3274 );
				float FUNC_Turbulence2274_g3274 = ( sin( ( ( VAR_RandomTime2244_g3274 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3274 = _WIND_MODE2462_g3274;
				float m_Off2312_g3274 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3274 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3274 = _Global_Wind_Main_Pulse2302_g3274;
				float m_Local2312_g3274 = _LocalWindPulse;
				float localfloatswitch2312_g3274 = floatswitch2312_g3274( m_switch2312_g3274 , m_Off2312_g3274 , m_Global2312_g3274 , m_Local2312_g3274 );
				float VAR_WindPulse2421_g3274 = localfloatswitch2312_g3274;
				float FUNC_Angle2470_g3274 = ( VAR_WindStrength2400_g3274 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3274 * 2.0 ) + FUNC_Turbulence2274_g3274 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3274 );
				float VAR_SinA2424_g3274 = sin( FUNC_Angle2470_g3274 );
				float VAR_CosA2362_g3274 = cos( FUNC_Angle2470_g3274 );
				int m_switch2456_g3274 = _WIND_MODE2462_g3274;
				float m_Off2456_g3274 = 1.0;
				float _Global_Wind_Main_Direction2350_g3274 = _Global_Wind_Main_Direction;
				float m_Global2456_g3274 = _Global_Wind_Main_Direction2350_g3274;
				float m_Local2456_g3274 = _LocalWindDirection;
				float localfloatswitch2456_g3274 = floatswitch2456_g3274( m_switch2456_g3274 , m_Off2456_g3274 , m_Global2456_g3274 , m_Local2456_g3274 );
				float _WindDirection2249_g3274 = localfloatswitch2456_g3274;
				float2 localDirectionalEquation2249_g3274 = DirectionalEquation( _WindDirection2249_g3274 );
				float2 break2469_g3274 = localDirectionalEquation2249_g3274;
				float VAR_xLerp2418_g3274 = break2469_g3274.x;
				float lerpResult2258_g3274 = lerp( break2265_g3274.x , ( ( break2265_g3274.y * VAR_SinA2424_g3274 ) + ( break2265_g3274.x * VAR_CosA2362_g3274 ) ) , VAR_xLerp2418_g3274);
				float3 break2340_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2233_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float VAR_zLerp2416_g3274 = break2469_g3274.y;
				float lerpResult2275_g3274 = lerp( break2233_g3274.z , ( ( break2233_g3274.y * VAR_SinA2424_g3274 ) + ( break2233_g3274.z * VAR_CosA2362_g3274 ) ) , VAR_zLerp2416_g3274);
				float3 appendResult2235_g3274 = (float3(lerpResult2258_g3274 , ( ( break2340_g3274.y * VAR_CosA2362_g3274 ) - ( break2340_g3274.z * VAR_SinA2424_g3274 ) ) , lerpResult2275_g3274));
				float3 VAR_VERTEXPOSITION2354_g3274 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3274 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3274 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3274 );
				float3 m_On2465_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2465_g3274 = float3switch2465_g3274( m_switch2465_g3274 , m_Off2465_g3274 , m_On2465_g3274 );
				float3 m_Global2328_g3274 = localfloat3switch2465_g3274;
				float3 m_Local2328_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2328_g3274 = float3switch2328_g3274( m_switch2328_g3274 , m_Off2328_g3274 , m_Global2328_g3274 , m_Local2328_g3274 );
				float3 WIND_FINAL2753_g3274 = localfloat3switch2328_g3274;
				float3 m_Off2966_g3274 = WIND_FINAL2753_g3274;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( ase_worldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( ase_worldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_4 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( ase_worldNormal ) - temp_cast_4 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float3 lerpResult2917_g3274 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3274 , appendResult2916_g3274);
				float3 m_TopDown2966_g3274 = lerpResult2917_g3274;
				float3 m_BottomUp2966_g3274 = lerpResult2917_g3274;
				float3 m_SideWall2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical_Inverted2966_g3274 = lerpResult2917_g3274;
				float3 localfloat3switch2966_g3274 = float3switch2966_g3274( m_switch2966_g3274 , m_Off2966_g3274 , m_TopDown2966_g3274 , m_BottomUp2966_g3274 , m_SideWall2966_g3274 , m_Spherical2966_g3274 , m_Spherical_Inverted2966_g3274 );
				float3 m_Off2527_g3274 = localfloat3switch2966_g3274;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3274 = ( localfloat3switch2966_g3274 * temp_output_2910_0_g3274 );
				float3 localfloat3switch2527_g3274 = float3switch2527_g3274( m_switch2527_g3274 , m_Off2527_g3274 , m_Active2527_g3274 );
				float3 WIND_MASK2748_g3274 = localfloat3switch2527_g3274;
				float3 m_Global2453_g3274 = WIND_MASK2748_g3274;
				float3 m_Local2453_g3274 = WIND_MASK2748_g3274;
				float3 localfloat3switch2453_g3274 = float3switch2453_g3274( m_switch2453_g3274 , m_Off2453_g3274 , m_Global2453_g3274 , m_Local2453_g3274 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = localfloat3switch2453_g3274;
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
				float4 ase_color : COLOR;
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
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
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

				float2 appendResult83_g3276 = (float2(_TilingX , _TilingY));
				float2 appendResult71_g3276 = (float2(_OffsetX , _OffsetY));
				float2 texCoord13_g3276 = IN.ase_texcoord2.xy * appendResult83_g3276 + appendResult71_g3276;
				float4 tex2DNode150_g3276 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord13_g3276 );
				float ALBEDO_A366_g3276 = tex2DNode150_g3276.a;
				clip( ALBEDO_A366_g3276 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_377_0_g3276 = saturate( ( ( ALBEDO_A366_g3276 / max( fwidth( ALBEDO_A366_g3276 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch263_g3276 = _GlancingClipMode;
				float m_Off263_g3276 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult332_g3276 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult317_g3276 = dot( ase_worldViewDir , normalizeResult332_g3276 );
				float temp_output_319_0_g3276 = ( 1.0 - abs( dotResult317_g3276 ) );
				float m_Active263_g3276 = ( temp_output_319_0_g3276 * 1.45 );
				float localfloatswitch263_g3276 = floatswitch263_g3276( m_switch263_g3276 , m_Off263_g3276 , m_Active263_g3276 );
				
				float Alpha = temp_output_377_0_g3276;
				float AlphaClipThreshold = localfloatswitch263_g3276;

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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
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
				float4 ase_color : COLOR;
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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_Map_ST;
			float4 _Color;
			int _ColorMask;
			half _AlphaCutoffBias;
			float _OcclusionStrengthAO;
			float _SmoothnessStrength;
			float _MetallicStrength;
			half _NormalStrength;
			float _WindMask_ProceduralVisualize;
			float _WindMask_TextureVisualize;
			half _Brightness;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _WindMask_Texture_Intensity;
			float _WindMask_Procedural_Intensity;
			float _WindMask_Offset1;
			float _LocalWindDirection;
			float _LocalWindPulse;
			float _LocalRandomWindOffset;
			float _LocalWindStrength;
			float _GlobalWindInfluenceBillboard;
			int _WindMask_Procedural;
			int _WindMask_Texture;
			int _WindMode;
			int _ZWriteMode;
			int _CullMode;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
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
			int _Global_Wind_Billboard_Enabled;
			float _Global_Wind_Billboard_Intensity;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2460_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 float3switch2465_g3274( int m_switch, float3 m_Off, float3 m_On )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_On;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2328_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float floatswitch2655_g3274( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float(0);
			}
			
			float3 float3switch2966_g3274( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2527_g3274( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch2972_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2982_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2986_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2991_g3274( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float4(0,0,0,0);
			}
			
			float floatswitch263_g3276( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch2453_g3274 = _WindMode;
				float3 m_Off2453_g3274 = float3(0,0,0);
				int m_switch2527_g3274 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2966_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				int _WIND_MODE2462_g3274 = _WindMode;
				int m_switch2328_g3274 = _WIND_MODE2462_g3274;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3274 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 m_Off2328_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int _Global_Wind_Billboard_Enabled2614_g3274 = _Global_Wind_Billboard_Enabled;
				int m_switch2465_g3274 = _Global_Wind_Billboard_Enabled2614_g3274;
				float3 m_Off2465_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2265_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int m_switch2460_g3274 = _WIND_MODE2462_g3274;
				float m_Off2460_g3274 = 1.0;
				float _Global_Wind_Billboard_Intensity2372_g3274 = _Global_Wind_Billboard_Intensity;
				float _Global_Wind_Main_Intensity2403_g3274 = _Global_Wind_Main_Intensity;
				float m_Global2460_g3274 = ( ( _GlobalWindInfluenceBillboard * _Global_Wind_Billboard_Intensity2372_g3274 ) * _Global_Wind_Main_Intensity2403_g3274 );
				float m_Local2460_g3274 = _LocalWindStrength;
				float localfloatswitch2460_g3274 = floatswitch2460_g3274( m_switch2460_g3274 , m_Off2460_g3274 , m_Global2460_g3274 , m_Local2460_g3274 );
				float VAR_WindStrength2400_g3274 = localfloatswitch2460_g3274;
				int m_switch2468_g3274 = _WIND_MODE2462_g3274;
				float m_Off2468_g3274 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3274 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3274 = _Global_Wind_Main_RandomOffset2378_g3274;
				float m_Local2468_g3274 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3274 = floatswitch2468_g3274( m_switch2468_g3274 , m_Off2468_g3274 , m_Global2468_g3274 , m_Local2468_g3274 );
				float VAR_WindOffset2419_g3274 = localfloatswitch2468_g3274;
				float4 transform2423_g3274 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3274 = (float2(transform2423_g3274.x , transform2423_g3274.z));
				float dotResult2341_g3274 = dot( appendResult2307_g3274 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3274 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3274 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3274 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3274 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3274 );
				float FUNC_Turbulence2274_g3274 = ( sin( ( ( VAR_RandomTime2244_g3274 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3274 = _WIND_MODE2462_g3274;
				float m_Off2312_g3274 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3274 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3274 = _Global_Wind_Main_Pulse2302_g3274;
				float m_Local2312_g3274 = _LocalWindPulse;
				float localfloatswitch2312_g3274 = floatswitch2312_g3274( m_switch2312_g3274 , m_Off2312_g3274 , m_Global2312_g3274 , m_Local2312_g3274 );
				float VAR_WindPulse2421_g3274 = localfloatswitch2312_g3274;
				float FUNC_Angle2470_g3274 = ( VAR_WindStrength2400_g3274 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3274 * 2.0 ) + FUNC_Turbulence2274_g3274 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3274 );
				float VAR_SinA2424_g3274 = sin( FUNC_Angle2470_g3274 );
				float VAR_CosA2362_g3274 = cos( FUNC_Angle2470_g3274 );
				int m_switch2456_g3274 = _WIND_MODE2462_g3274;
				float m_Off2456_g3274 = 1.0;
				float _Global_Wind_Main_Direction2350_g3274 = _Global_Wind_Main_Direction;
				float m_Global2456_g3274 = _Global_Wind_Main_Direction2350_g3274;
				float m_Local2456_g3274 = _LocalWindDirection;
				float localfloatswitch2456_g3274 = floatswitch2456_g3274( m_switch2456_g3274 , m_Off2456_g3274 , m_Global2456_g3274 , m_Local2456_g3274 );
				float _WindDirection2249_g3274 = localfloatswitch2456_g3274;
				float2 localDirectionalEquation2249_g3274 = DirectionalEquation( _WindDirection2249_g3274 );
				float2 break2469_g3274 = localDirectionalEquation2249_g3274;
				float VAR_xLerp2418_g3274 = break2469_g3274.x;
				float lerpResult2258_g3274 = lerp( break2265_g3274.x , ( ( break2265_g3274.y * VAR_SinA2424_g3274 ) + ( break2265_g3274.x * VAR_CosA2362_g3274 ) ) , VAR_xLerp2418_g3274);
				float3 break2340_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2233_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float VAR_zLerp2416_g3274 = break2469_g3274.y;
				float lerpResult2275_g3274 = lerp( break2233_g3274.z , ( ( break2233_g3274.y * VAR_SinA2424_g3274 ) + ( break2233_g3274.z * VAR_CosA2362_g3274 ) ) , VAR_zLerp2416_g3274);
				float3 appendResult2235_g3274 = (float3(lerpResult2258_g3274 , ( ( break2340_g3274.y * VAR_CosA2362_g3274 ) - ( break2340_g3274.z * VAR_SinA2424_g3274 ) ) , lerpResult2275_g3274));
				float3 VAR_VERTEXPOSITION2354_g3274 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3274 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3274 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3274 );
				float3 m_On2465_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2465_g3274 = float3switch2465_g3274( m_switch2465_g3274 , m_Off2465_g3274 , m_On2465_g3274 );
				float3 m_Global2328_g3274 = localfloat3switch2465_g3274;
				float3 m_Local2328_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2328_g3274 = float3switch2328_g3274( m_switch2328_g3274 , m_Off2328_g3274 , m_Global2328_g3274 , m_Local2328_g3274 );
				float3 WIND_FINAL2753_g3274 = localfloat3switch2328_g3274;
				float3 m_Off2966_g3274 = WIND_FINAL2753_g3274;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( ase_worldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( ase_worldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_4 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( ase_worldNormal ) - temp_cast_4 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float3 lerpResult2917_g3274 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3274 , appendResult2916_g3274);
				float3 m_TopDown2966_g3274 = lerpResult2917_g3274;
				float3 m_BottomUp2966_g3274 = lerpResult2917_g3274;
				float3 m_SideWall2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical_Inverted2966_g3274 = lerpResult2917_g3274;
				float3 localfloat3switch2966_g3274 = float3switch2966_g3274( m_switch2966_g3274 , m_Off2966_g3274 , m_TopDown2966_g3274 , m_BottomUp2966_g3274 , m_SideWall2966_g3274 , m_Spherical2966_g3274 , m_Spherical_Inverted2966_g3274 );
				float3 m_Off2527_g3274 = localfloat3switch2966_g3274;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3274 = ( localfloat3switch2966_g3274 * temp_output_2910_0_g3274 );
				float3 localfloat3switch2527_g3274 = float3switch2527_g3274( m_switch2527_g3274 , m_Off2527_g3274 , m_Active2527_g3274 );
				float3 WIND_MASK2748_g3274 = localfloat3switch2527_g3274;
				float3 m_Global2453_g3274 = WIND_MASK2748_g3274;
				float3 m_Local2453_g3274 = WIND_MASK2748_g3274;
				float3 localfloat3switch2453_g3274 = float3switch2453_g3274( m_switch2453_g3274 , m_Off2453_g3274 , m_Global2453_g3274 , m_Local2453_g3274 );
				
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = localfloat3switch2453_g3274;
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
				float4 ase_color : COLOR;
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
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
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

				float2 appendResult83_g3276 = (float2(_TilingX , _TilingY));
				float2 appendResult71_g3276 = (float2(_OffsetX , _OffsetY));
				float2 texCoord13_g3276 = IN.ase_texcoord2.xy * appendResult83_g3276 + appendResult71_g3276;
				float4 tex2DNode150_g3276 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord13_g3276 );
				float3 temp_output_55_0_g3276 = ( (_Color).rgb * (tex2DNode150_g3276).rgb * _Brightness );
				int _MASK_MODE_TEXTURE2980_g3274 = _WindMask_Texture;
				int m_switch2982_g3274 = _MASK_MODE_TEXTURE2980_g3274;
				float4 _Vector3 = float4(0,0,0,0);
				float4 m_Off2982_g3274 = _Vector3;
				int m_switch2972_g3274 = (int)_WindMask_TextureVisualize;
				float4 m_Off2972_g3274 = _Vector3;
				float4 color2979_g3274 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
				float4 _Visualize_Color2992_g3274 = color2979_g3274;
				float2 uv_WindMask_Map = IN.ase_texcoord2.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float4 appendResult2974_g3274 = (float4(temp_output_2910_0_g3274 , temp_output_2910_0_g3274.x));
				float4 lerpResult2967_g3274 = lerp( _Visualize_Color2992_g3274 , float4( 0,0,0,0 ) , appendResult2974_g3274);
				float4 m_Active2972_g3274 = lerpResult2967_g3274;
				float4 localfloat4switch2972_g3274 = float4switch2972_g3274( m_switch2972_g3274 , m_Off2972_g3274 , m_Active2972_g3274 );
				float4 m_Active2982_g3274 = localfloat4switch2972_g3274;
				float4 localfloat4switch2982_g3274 = float4switch2982_g3274( m_switch2982_g3274 , m_Off2982_g3274 , m_Active2982_g3274 );
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2991_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				float4 m_Off2991_g3274 = _Vector3;
				int m_switch2986_g3274 = (int)_WindMask_ProceduralVisualize;
				float4 m_Off2986_g3274 = _Vector3;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( ase_worldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( ase_worldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_6 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( ase_worldNormal ) - temp_cast_6 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float4 appendResult2977_g3274 = (float4(appendResult2916_g3274 , appendResult2916_g3274.x));
				float4 lerpResult2976_g3274 = lerp( _Visualize_Color2992_g3274 , float4( 0,0,0,0 ) , appendResult2977_g3274);
				float4 m_Active2986_g3274 = lerpResult2976_g3274;
				float4 localfloat4switch2986_g3274 = float4switch2986_g3274( m_switch2986_g3274 , m_Off2986_g3274 , m_Active2986_g3274 );
				float4 m_TopDown2991_g3274 = localfloat4switch2986_g3274;
				float4 m_BottomUp2991_g3274 = localfloat4switch2986_g3274;
				float4 m_SideWall2991_g3274 = localfloat4switch2986_g3274;
				float4 m_Spherical2991_g3274 = localfloat4switch2986_g3274;
				float4 m_Spherical_Inverted2991_g3274 = localfloat4switch2986_g3274;
				float4 localfloat4switch2991_g3274 = float4switch2991_g3274( m_switch2991_g3274 , m_Off2991_g3274 , m_TopDown2991_g3274 , m_BottomUp2991_g3274 , m_SideWall2991_g3274 , m_Spherical2991_g3274 , m_Spherical_Inverted2991_g3274 );
				
				float ALBEDO_A366_g3276 = tex2DNode150_g3276.a;
				clip( ALBEDO_A366_g3276 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_377_0_g3276 = saturate( ( ( ALBEDO_A366_g3276 / max( fwidth( ALBEDO_A366_g3276 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch263_g3276 = _GlancingClipMode;
				float m_Off263_g3276 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult332_g3276 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult317_g3276 = dot( ase_worldViewDir , normalizeResult332_g3276 );
				float temp_output_319_0_g3276 = ( 1.0 - abs( dotResult317_g3276 ) );
				float m_Active263_g3276 = ( temp_output_319_0_g3276 * 1.45 );
				float localfloatswitch263_g3276 = floatswitch263_g3276( m_switch263_g3276 , m_Off263_g3276 , m_Active263_g3276 );
				
				
				float3 Albedo = ( float4( temp_output_55_0_g3276 , 0.0 ) + ( localfloat4switch2982_g3274 + localfloat4switch2991_g3274 ) ).xyz;
				float3 Emission = 0;
				float Alpha = temp_output_377_0_g3276;
				float AlphaClipThreshold = localfloatswitch263_g3276;

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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
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
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
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
				float4 ase_color : COLOR;
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
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_Map_ST;
			float4 _Color;
			int _ColorMask;
			half _AlphaCutoffBias;
			float _OcclusionStrengthAO;
			float _SmoothnessStrength;
			float _MetallicStrength;
			half _NormalStrength;
			float _WindMask_ProceduralVisualize;
			float _WindMask_TextureVisualize;
			half _Brightness;
			float _OffsetY;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _WindMask_Texture_Intensity;
			float _WindMask_Procedural_Intensity;
			float _WindMask_Offset1;
			float _LocalWindDirection;
			float _LocalWindPulse;
			float _LocalRandomWindOffset;
			float _LocalWindStrength;
			float _GlobalWindInfluenceBillboard;
			int _WindMask_Procedural;
			int _WindMask_Texture;
			int _WindMode;
			int _ZWriteMode;
			int _CullMode;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
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
			int _Global_Wind_Billboard_Enabled;
			float _Global_Wind_Billboard_Intensity;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2460_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2468_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2312_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float floatswitch2456_g3274( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 float3switch2465_g3274( int m_switch, float3 m_Off, float3 m_On )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_On;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2328_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float floatswitch2655_g3274( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float(0);
			}
			
			float3 float3switch2966_g3274( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2527_g3274( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3274( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch2972_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2982_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2986_g3274( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2991_g3274( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_TopDown;
				else if(m_switch ==2)
					return m_BottomUp;
				else if(m_switch ==3)
					return m_SideWall;
				else if(m_switch ==4)
					return m_Spherical;
				else if(m_switch ==5)
					return m_Spherical_Inverted;
				else
				return float4(0,0,0,0);
			}
			
			float floatswitch263_g3276( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				int m_switch2453_g3274 = _WindMode;
				float3 m_Off2453_g3274 = float3(0,0,0);
				int m_switch2527_g3274 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2966_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				int _WIND_MODE2462_g3274 = _WindMode;
				int m_switch2328_g3274 = _WIND_MODE2462_g3274;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3274 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 m_Off2328_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int _Global_Wind_Billboard_Enabled2614_g3274 = _Global_Wind_Billboard_Enabled;
				int m_switch2465_g3274 = _Global_Wind_Billboard_Enabled2614_g3274;
				float3 m_Off2465_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2265_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				int m_switch2460_g3274 = _WIND_MODE2462_g3274;
				float m_Off2460_g3274 = 1.0;
				float _Global_Wind_Billboard_Intensity2372_g3274 = _Global_Wind_Billboard_Intensity;
				float _Global_Wind_Main_Intensity2403_g3274 = _Global_Wind_Main_Intensity;
				float m_Global2460_g3274 = ( ( _GlobalWindInfluenceBillboard * _Global_Wind_Billboard_Intensity2372_g3274 ) * _Global_Wind_Main_Intensity2403_g3274 );
				float m_Local2460_g3274 = _LocalWindStrength;
				float localfloatswitch2460_g3274 = floatswitch2460_g3274( m_switch2460_g3274 , m_Off2460_g3274 , m_Global2460_g3274 , m_Local2460_g3274 );
				float VAR_WindStrength2400_g3274 = localfloatswitch2460_g3274;
				int m_switch2468_g3274 = _WIND_MODE2462_g3274;
				float m_Off2468_g3274 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3274 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3274 = _Global_Wind_Main_RandomOffset2378_g3274;
				float m_Local2468_g3274 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3274 = floatswitch2468_g3274( m_switch2468_g3274 , m_Off2468_g3274 , m_Global2468_g3274 , m_Local2468_g3274 );
				float VAR_WindOffset2419_g3274 = localfloatswitch2468_g3274;
				float4 transform2423_g3274 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3274 = (float2(transform2423_g3274.x , transform2423_g3274.z));
				float dotResult2341_g3274 = dot( appendResult2307_g3274 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3274 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3274 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3274 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3274 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3274 );
				float FUNC_Turbulence2274_g3274 = ( sin( ( ( VAR_RandomTime2244_g3274 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3274 = _WIND_MODE2462_g3274;
				float m_Off2312_g3274 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3274 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3274 = _Global_Wind_Main_Pulse2302_g3274;
				float m_Local2312_g3274 = _LocalWindPulse;
				float localfloatswitch2312_g3274 = floatswitch2312_g3274( m_switch2312_g3274 , m_Off2312_g3274 , m_Global2312_g3274 , m_Local2312_g3274 );
				float VAR_WindPulse2421_g3274 = localfloatswitch2312_g3274;
				float FUNC_Angle2470_g3274 = ( VAR_WindStrength2400_g3274 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3274 * 2.0 ) + FUNC_Turbulence2274_g3274 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3274.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3274 );
				float VAR_SinA2424_g3274 = sin( FUNC_Angle2470_g3274 );
				float VAR_CosA2362_g3274 = cos( FUNC_Angle2470_g3274 );
				int m_switch2456_g3274 = _WIND_MODE2462_g3274;
				float m_Off2456_g3274 = 1.0;
				float _Global_Wind_Main_Direction2350_g3274 = _Global_Wind_Main_Direction;
				float m_Global2456_g3274 = _Global_Wind_Main_Direction2350_g3274;
				float m_Local2456_g3274 = _LocalWindDirection;
				float localfloatswitch2456_g3274 = floatswitch2456_g3274( m_switch2456_g3274 , m_Off2456_g3274 , m_Global2456_g3274 , m_Local2456_g3274 );
				float _WindDirection2249_g3274 = localfloatswitch2456_g3274;
				float2 localDirectionalEquation2249_g3274 = DirectionalEquation( _WindDirection2249_g3274 );
				float2 break2469_g3274 = localDirectionalEquation2249_g3274;
				float VAR_xLerp2418_g3274 = break2469_g3274.x;
				float lerpResult2258_g3274 = lerp( break2265_g3274.x , ( ( break2265_g3274.y * VAR_SinA2424_g3274 ) + ( break2265_g3274.x * VAR_CosA2362_g3274 ) ) , VAR_xLerp2418_g3274);
				float3 break2340_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float3 break2233_g3274 = VAR_VERTEXPOSITION_MATRIX2352_g3274;
				float VAR_zLerp2416_g3274 = break2469_g3274.y;
				float lerpResult2275_g3274 = lerp( break2233_g3274.z , ( ( break2233_g3274.y * VAR_SinA2424_g3274 ) + ( break2233_g3274.z * VAR_CosA2362_g3274 ) ) , VAR_zLerp2416_g3274);
				float3 appendResult2235_g3274 = (float3(lerpResult2258_g3274 , ( ( break2340_g3274.y * VAR_CosA2362_g3274 ) - ( break2340_g3274.z * VAR_SinA2424_g3274 ) ) , lerpResult2275_g3274));
				float3 VAR_VERTEXPOSITION2354_g3274 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3274 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3274 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3274 );
				float3 m_On2465_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2465_g3274 = float3switch2465_g3274( m_switch2465_g3274 , m_Off2465_g3274 , m_On2465_g3274 );
				float3 m_Global2328_g3274 = localfloat3switch2465_g3274;
				float3 m_Local2328_g3274 = FUNC_vertexPos2282_g3274;
				float3 localfloat3switch2328_g3274 = float3switch2328_g3274( m_switch2328_g3274 , m_Off2328_g3274 , m_Global2328_g3274 , m_Local2328_g3274 );
				float3 WIND_FINAL2753_g3274 = localfloat3switch2328_g3274;
				float3 m_Off2966_g3274 = WIND_FINAL2753_g3274;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( ase_worldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( ase_worldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_4 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( ase_worldNormal ) - temp_cast_4 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float3 lerpResult2917_g3274 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3274 , appendResult2916_g3274);
				float3 m_TopDown2966_g3274 = lerpResult2917_g3274;
				float3 m_BottomUp2966_g3274 = lerpResult2917_g3274;
				float3 m_SideWall2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical2966_g3274 = lerpResult2917_g3274;
				float3 m_Spherical_Inverted2966_g3274 = lerpResult2917_g3274;
				float3 localfloat3switch2966_g3274 = float3switch2966_g3274( m_switch2966_g3274 , m_Off2966_g3274 , m_TopDown2966_g3274 , m_BottomUp2966_g3274 , m_SideWall2966_g3274 , m_Spherical2966_g3274 , m_Spherical_Inverted2966_g3274 );
				float3 m_Off2527_g3274 = localfloat3switch2966_g3274;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3274 = ( localfloat3switch2966_g3274 * temp_output_2910_0_g3274 );
				float3 localfloat3switch2527_g3274 = float3switch2527_g3274( m_switch2527_g3274 , m_Off2527_g3274 , m_Active2527_g3274 );
				float3 WIND_MASK2748_g3274 = localfloat3switch2527_g3274;
				float3 m_Global2453_g3274 = WIND_MASK2748_g3274;
				float3 m_Local2453_g3274 = WIND_MASK2748_g3274;
				float3 localfloat3switch2453_g3274 = float3switch2453_g3274( m_switch2453_g3274 , m_Off2453_g3274 , m_Global2453_g3274 , m_Local2453_g3274 );
				
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = localfloat3switch2453_g3274;
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
				float4 ase_color : COLOR;
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
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
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

				float2 appendResult83_g3276 = (float2(_TilingX , _TilingY));
				float2 appendResult71_g3276 = (float2(_OffsetX , _OffsetY));
				float2 texCoord13_g3276 = IN.ase_texcoord2.xy * appendResult83_g3276 + appendResult71_g3276;
				float4 tex2DNode150_g3276 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, texCoord13_g3276 );
				float3 temp_output_55_0_g3276 = ( (_Color).rgb * (tex2DNode150_g3276).rgb * _Brightness );
				int _MASK_MODE_TEXTURE2980_g3274 = _WindMask_Texture;
				int m_switch2982_g3274 = _MASK_MODE_TEXTURE2980_g3274;
				float4 _Vector3 = float4(0,0,0,0);
				float4 m_Off2982_g3274 = _Vector3;
				int m_switch2972_g3274 = (int)_WindMask_TextureVisualize;
				float4 m_Off2972_g3274 = _Vector3;
				float4 color2979_g3274 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
				float4 _Visualize_Color2992_g3274 = color2979_g3274;
				float2 uv_WindMask_Map = IN.ase_texcoord2.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3274 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
				float3 appendResult2744_g3274 = (float3(tex2DNode2742_g3274.r , tex2DNode2742_g3274.r , tex2DNode2742_g3274.r));
				float3 temp_output_2910_0_g3274 = ( appendResult2744_g3274 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float4 appendResult2974_g3274 = (float4(temp_output_2910_0_g3274 , temp_output_2910_0_g3274.x));
				float4 lerpResult2967_g3274 = lerp( _Visualize_Color2992_g3274 , float4( 0,0,0,0 ) , appendResult2974_g3274);
				float4 m_Active2972_g3274 = lerpResult2967_g3274;
				float4 localfloat4switch2972_g3274 = float4switch2972_g3274( m_switch2972_g3274 , m_Off2972_g3274 , m_Active2972_g3274 );
				float4 m_Active2982_g3274 = localfloat4switch2972_g3274;
				float4 localfloat4switch2982_g3274 = float4switch2982_g3274( m_switch2982_g3274 , m_Off2982_g3274 , m_Active2982_g3274 );
				int _MASK_MODE_PROCEDRAL2677_g3274 = _WindMask_Procedural;
				int m_switch2991_g3274 = _MASK_MODE_PROCEDRAL2677_g3274;
				float4 m_Off2991_g3274 = _Vector3;
				int m_switch2986_g3274 = (int)_WindMask_ProceduralVisualize;
				float4 m_Off2986_g3274 = _Vector3;
				int m_switch2655_g3274 = _WindMask_Procedural;
				float m_Off2655_g3274 = 0.0;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float MASK_OFFSET2670_g3274 = _WindMask_Offset1;
				float temp_output_2957_0_g3274 = ( 1.0 - MASK_OFFSET2670_g3274 );
				float m_TopDown2655_g3274 = ( ( ase_worldNormal.y - temp_output_2957_0_g3274 ) - 0.05 );
				float m_BottomUp2655_g3274 = ( -( ase_worldNormal.y + temp_output_2957_0_g3274 ) - 0.05 );
				float3 temp_cast_6 = (0.5).xxx;
				float3 break2635_g3274 = ( abs( ase_worldNormal ) - temp_cast_6 );
				float dotResult2928_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3274 ) + -0.5 ) - break2635_g3274.y ) );
				float m_SideWall2655_g3274 = dotResult2928_g3274;
				float dotResult2921_g3274 = dot( ( MASK_OFFSET2670_g3274 + break2635_g3274.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3274 ) + break2635_g3274.z + -0.75 ) );
				float m_Spherical2655_g3274 = dotResult2921_g3274;
				float m_Spherical_Inverted2655_g3274 = -dotResult2921_g3274;
				float localfloatswitch2655_g3274 = floatswitch2655_g3274( m_switch2655_g3274 , m_Off2655_g3274 , m_TopDown2655_g3274 , m_BottomUp2655_g3274 , m_SideWall2655_g3274 , m_Spherical2655_g3274 , m_Spherical_Inverted2655_g3274 );
				float temp_output_2915_0_g3274 = ( localfloatswitch2655_g3274 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3274 = (float3(temp_output_2915_0_g3274 , temp_output_2915_0_g3274 , temp_output_2915_0_g3274));
				float4 appendResult2977_g3274 = (float4(appendResult2916_g3274 , appendResult2916_g3274.x));
				float4 lerpResult2976_g3274 = lerp( _Visualize_Color2992_g3274 , float4( 0,0,0,0 ) , appendResult2977_g3274);
				float4 m_Active2986_g3274 = lerpResult2976_g3274;
				float4 localfloat4switch2986_g3274 = float4switch2986_g3274( m_switch2986_g3274 , m_Off2986_g3274 , m_Active2986_g3274 );
				float4 m_TopDown2991_g3274 = localfloat4switch2986_g3274;
				float4 m_BottomUp2991_g3274 = localfloat4switch2986_g3274;
				float4 m_SideWall2991_g3274 = localfloat4switch2986_g3274;
				float4 m_Spherical2991_g3274 = localfloat4switch2986_g3274;
				float4 m_Spherical_Inverted2991_g3274 = localfloat4switch2986_g3274;
				float4 localfloat4switch2991_g3274 = float4switch2991_g3274( m_switch2991_g3274 , m_Off2991_g3274 , m_TopDown2991_g3274 , m_BottomUp2991_g3274 , m_SideWall2991_g3274 , m_Spherical2991_g3274 , m_Spherical_Inverted2991_g3274 );
				
				float ALBEDO_A366_g3276 = tex2DNode150_g3276.a;
				clip( ALBEDO_A366_g3276 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_377_0_g3276 = saturate( ( ( ALBEDO_A366_g3276 / max( fwidth( ALBEDO_A366_g3276 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch263_g3276 = _GlancingClipMode;
				float m_Off263_g3276 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult332_g3276 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult317_g3276 = dot( ase_worldViewDir , normalizeResult332_g3276 );
				float temp_output_319_0_g3276 = ( 1.0 - abs( dotResult317_g3276 ) );
				float m_Active263_g3276 = ( temp_output_319_0_g3276 * 1.45 );
				float localfloatswitch263_g3276 = floatswitch263_g3276( m_switch263_g3276 , m_Off263_g3276 , m_Active263_g3276 );
				
				
				float3 Albedo = ( float4( temp_output_55_0_g3276 , 0.0 ) + ( localfloat4switch2982_g3274 + localfloat4switch2991_g3274 ) ).xyz;
				float Alpha = temp_output_377_0_g3276;
				float AlphaClipThreshold = localfloatswitch263_g3276;

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
2068;279.3333;1602;805;1273.06;141.7708;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;444;66.0663,-72.71701;Inherit;False;329;129;;1;187;;0.3926398,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;411;61.82877,80.87488;Inherit;False;341.5028;250.4201;;2;188;51;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;410;66.65128,-199.5294;Inherit;False;323;119;;1;438;GLOBAL SETTINGS ;0.2434797,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;440;-809.062,358.8395;Inherit;False;DECSF Module Wind;20;;3274;a1f35481f1717b54dbd93d220457588d;8,2454,2,2433,2,2371,2,2457,2,2432,2,2434,2,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.RangedFloatNode;51;71.57893,193.4035;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;19;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;188;67.08816,117.2121;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;438;84.83203,-161.5986;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;False;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;443;-515.2404,342.3311;Inherit;False;DECSF Master Map Billboard;3;;3276;bd32d91e2d401734bbb5bafd06e38be2;2,218,4,275,1;2;395;FLOAT3;0,0,0;False;393;FLOAT4;0,0,0,0;False;9;FLOAT4;192;FLOAT3;194;FLOAT;207;FLOAT;205;COLOR;213;FLOAT;193;FLOAT;277;FLOAT;223;FLOAT3;397
Node;AmplifyShaderEditor.IntNode;187;87.0663,-31.717;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 URP 7_5_2;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;432;63.95,341.8214;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;433;63.95,341.8214;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;11;DEC/URP Billboard/Billboard Wind Simple;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;2;True;438;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;188;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;187;True;3;False;283;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;6;Include;;False;;Native;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom; ;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;1;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;1;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;1;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;434;63.95,341.8214;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;435;63.95,341.8214;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;436;63.95,341.8214;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;437;63.95,341.8214;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;188;False;False;False;False;True;1;True;187;True;3;False;283;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;443;395;440;2190
WireConnection;443;393;440;2970
WireConnection;433;0;443;192
WireConnection;433;1;443;194
WireConnection;433;3;443;207
WireConnection;433;4;443;205
WireConnection;433;5;443;213
WireConnection;433;6;443;193
WireConnection;433;7;443;277
WireConnection;433;16;443;223
WireConnection;433;8;443;397
ASEEND*/
//CHKSM=1FD030662565BAC56655E9E988A0F343E72CC05D