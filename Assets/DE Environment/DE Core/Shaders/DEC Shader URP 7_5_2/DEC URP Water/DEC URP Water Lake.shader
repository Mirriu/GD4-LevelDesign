// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/URP Water/Water Lake"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(VERSION 1.4.0 URP 7_5_2)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[HDR][Header (COLOR TINT WATER LAYERS)]_ShorelineTint("Shoreline Tint", Color) = (0.2784314,0.4235294,0.4431373,1)
		_ShorelineDepth("Shoreline Depth", Range( 0 , 100)) = 40
		_ShorelineOffset("Shoreline Offset", Range( -1 , 1)) = 0.1
		[HDR]_MidwaterTint("Midwater Tint", Color) = (0.1490196,0.4235294,0.4705882,1)
		[HDR]_DepthTint("Depth Tint", Color) = (0.1960784,0.4313726,0.509804,1)
		_DepthOffset("Depth Offset", Range( 0 , 10)) = 2
		[Header (OPACITY)]_Opacity("Opacity", Range( 0.001 , 1)) = 0.05
		_OpacityShoreline("Opacity Shoreline", Range( 0 , 25)) = 2
		[Enum(Standard,0,Geometric,1)][Header (SMOOTHNESS)]_SmoothnessModeWater("Smoothness Mode", Int) = 0
		[Enum(Standard,0,Cull Front,1,Cull Back,2)]_SmoothnessCullModeWater("Smoothness Cull Mode", Int) = 2
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_SmoothnessThreshold("Smoothness Threshold", Range( 0 , 0.5)) = 0
		_SmoothnessVariance("Smoothness Variance", Range( 0 , 1)) = 0.2
		_SmoothnessFresnel("Smoothness Fresnel", Range( 0 , 1)) = 1
		_SmoothnessBias("Smoothness Bias", Range( 0 , 1)) = 0
		_SmoothnessScale("Smoothness Scale", Range( 0 , 1)) = 1
		_SmoothnessPower("Smoothness Power", Range( 0 , 10)) = 5
		[Header (REFRACTION)]_RefractionScale("Refraction Scale", Range( 0 , 1)) = 0.2
		[Enum(Off,0,Swirling,1)][Header (NORMAL MAP)]_WaterNormal_FlowDirection("Flow Direction Mode", Int) = 1
		[NoScaleOffset][Normal][SingleLineTexture]_WaterNormal_NormalMap("Normal Map", 2D) = "bump" {}
		[Enum(Standard,0,Scale Independent,1)]_WaterNormal_TillingMode("Tilling Mode", Int) = 0
		_WaterNormal_TilingX("Tiling X", Float) = 4
		_WaterNormal_TilingY("Tiling Y", Float) = 4
		_WaterNormal_NormalMapStrength("Strength", Range( 0 , 1)) = 0.9
		_WaterNormal_NormalMapSpeed("Speed", Range( 0 , 250)) = 2
		_WaterNormal_Timescale("Timescale", Range( 0 , 1)) = 0.6
		[Enum(Off,0,Swirling,1)][Header (FOAM SHORELINE)]_ShorelineFoam_FlowDirectionMode("Flow Direction Mode", Int) = 1
		[HDR]_ShorelineFoam_Tint("Foam Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_ShorelineFoam_Map("Foam Map", 2D) = "white" {}
		[Enum(Standard,0,Scale Independent,1)]_ShorelineFoam_TillingMode("Tilling Mode", Int) = 0
		_ShorelineFoam_TilingX("Tiling X", Float) = 10
		_ShorelineFoam_TilingY("Tiling Y", Float) = 10
		_ShorelineFoam_FoamStrength("Foam Strength", Range( 0 , 1)) = 1
		_FoamNormalStrength_Shoreline("Foam Normal Strength", Range( 0 , 5)) = 1
		_ShorelineFoam_Distance("Foam Distance", Range( 0.3 , 100)) = 0.3
		_ShorelineFoam_Speed("Foam Speed", Range( 0 , 250)) = 80
		_ShorelineFoam_Timescale("Foam Timescale", Range( 0 , 1)) = 0.6
		[Enum(Off,0,Swirling,1)][Header (FOAM OFFSHORE)]_OffshoreFoam_FlowDirectionMode("Flow Direction Mode", Int) = 1
		[HDR]_OffshoreFoam_Tint("Foam Tint ", Color) = (1,1,1,0)
		[SingleLineTexture]_OffshoreFoam_Map("Foam Map ", 2D) = "white" {}
		[Enum(Standard,0,Scale Independent,1)]_OffshoreFoam_TillingMode("Tilling Mode", Int) = 0
		_OffshoreFoam_TilingX("Tiling X", Float) = 10
		_OffshoreFoam_TilingY("Tiling Y", Float) = 10
		[Gamma]_OffshoreFoam_FoamStrength("Foam Strength", Range( 0 , 1)) = 1
		_FoamNormalStrength_Offshore("Foam Normal Strength", Range( 0 , 5)) = 1
		_OffshoreFoam_Distance("Foam Distance", Range( 0.1 , 100)) = 0.3
		_OffshoreFoam_Speed("Foam Speed", Range( 0 , 250)) = 80
		_OffshoreFoam_Timescale("Foam Timescale", Range( 0 , 1)) = 0.6
		[Enum(Off,0,Active,1)][Header(REFLECTION)]_Reflection_Mode("Reflection Mode", Int) = 0
		[HDR][SingleLineTexture]_Reflection_Cubemap("Reflection Cubemap", CUBE) = "white" {}
		_Reflection_Cloud("Reflection Cloud", Range( 0 , 1)) = 1
		_Reflection_Wobble("Reflection Wobble", Range( 0 , 0.1)) = 0
		_Reflection_Smoothness("Reflection Smoothness", Range( 0 , 2)) = 2
		_Reflection_BumpScale("Reflection Bump Scale", Range( 0 , 1)) = 0.5
		_Reflection_BumpClamp("Reflection Bump Clamp", Range( 0 , 0.15)) = 0.15
		[Enum(Off,0,Active,1)]_Reflection_FresnelMode("Fresnel Mode", Int) = 1
		_Reflection_FresnelStrength("Fresnel Strength", Range( 0.001 , 1)) = 0.5
		_Reflection_FresnelBias("Fresnel Bias", Range( 0 , 1)) = 1
		[ASEEnd]_Reflection_FresnelScale("Fresnel Scale", Range( 0 , 1)) = 0.5
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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Transparent" }
		Cull [_CullMode]
		AlphaToMask [_AlphatoCoverage]
		HLSLINCLUDE
		#pragma target 4.5

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
			Tags { "LightMode"="UniversalForward" }
			
			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
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
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1

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

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShorelineFoam_Tint;
			float4 _MidwaterTint;
			float4 _ShorelineTint;
			float4 _OffshoreFoam_Tint;
			float4 _DepthTint;
			float _WaterNormal_TilingY;
			float _WaterNormal_NormalMapStrength;
			float _RefractionScale;
			float _OpacityShoreline;
			float _Opacity;
			int _Reflection_FresnelMode;
			float _Reflection_BumpScale;
			float _Reflection_BumpClamp;
			float _Reflection_Wobble;
			float _Reflection_Smoothness;
			int _ColorMask;
			float _Reflection_Cloud;
			float _Reflection_FresnelStrength;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelScale;
			float _FoamNormalStrength_Offshore;
			float _FoamNormalStrength_Shoreline;
			int _SmoothnessCullModeWater;
			int _SmoothnessModeWater;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			float _SmoothnessBias;
			float _SmoothnessScale;
			float _WaterNormal_TilingX;
			int _WaterNormal_TillingMode;
			int _WaterNormal_FlowDirection;
			float _WaterNormal_Timescale;
			float _AlphatoCoverage;
			int _CullMode;
			int _ZWriteMode;
			int _Reflection_Mode;
			int _OffshoreFoam_FlowDirectionMode;
			float _OffshoreFoam_Timescale;
			float _OffshoreFoam_Speed;
			int _OffshoreFoam_TillingMode;
			float _OffshoreFoam_TilingX;
			float _OffshoreFoam_TilingY;
			float _OffshoreFoam_Distance;
			float _WaterNormal_NormalMapSpeed;
			float _OffshoreFoam_FoamStrength;
			float _ShorelineFoam_Timescale;
			float _ShorelineFoam_Speed;
			int _ShorelineFoam_TillingMode;
			float _ShorelineFoam_TilingX;
			float _ShorelineFoam_TilingY;
			float _ShorelineFoam_Distance;
			float _ShorelineFoam_FoamStrength;
			float _ShorelineDepth;
			float _ShorelineOffset;
			float _DepthOffset;
			float _SmoothnessPower;
			int _ShorelineFoam_FlowDirectionMode;
			float _SmoothnessFresnel;
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
			TEXTURE2D(_OffshoreFoam_Map);
			SAMPLER(sampler_trilinear_repeat);
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_ShorelineFoam_Map);
			TEXTURE2D(_WaterNormal_NormalMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float2 float2switch1015_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch936_g733( int m_switch, float4 m_Off, float4 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch989_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch934_g733( int m_switch, float4 m_Off, float4 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch963_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float3 float3switch932_g733( int m_switch, float3 m_Off, float3 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch95_g742( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch92_g742( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch1051_g733( int m_switch, float4 m_Standard, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			
			float3 float3switch1041_g733( int m_switch, float3 m_Standard, float3 m_Cullfront, float3 m_Cullback )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Cullfront;
				else if(m_switch ==2)
					return m_Cullback;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord7.w = eyeDepth;
				
				o.ase_texcoord7.xyz = v.texcoord.xyz;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord8 = v.vertex;
				o.ase_texcoord9.xy = v.ase_texcoord3.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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

			half4 frag ( VertexOutput IN , half ase_vface : VFACE ) : SV_Target
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

				int REFLECTION_MODE65_g742 = _Reflection_Mode;
				int m_switch92_g742 = REFLECTION_MODE65_g742;
				int m_switch936_g733 = _OffshoreFoam_FlowDirectionMode;
				float4 m_Off936_g733 = float4( 0,0,0,0 );
				float mulTime920_g733 = _TimeParameters.x * _OffshoreFoam_Timescale;
				float temp_output_908_0_g733 = ( _OffshoreFoam_Speed * 0.0006 );
				float2 temp_cast_1 = (temp_output_908_0_g733).xx;
				int m_switch1015_g733 = _OffshoreFoam_TillingMode;
				float2 appendResult991_g733 = (float2(_OffshoreFoam_TilingX , _OffshoreFoam_TilingY));
				float2 TEXTURE_TILLING_Offshore996_g733 = appendResult991_g733;
				float2 m_Standard1015_g733 = TEXTURE_TILLING_Offshore996_g733;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break1001_g733 = ase_parentObjectScale;
				float2 appendResult1002_g733 = (float2(break1001_g733.z , break1001_g733.y));
				float3 normalizeResult1008_g733 = normalize( IN.ase_normal );
				float3 break1007_g733 = normalizeResult1008_g733;
				float2 appendResult1000_g733 = (float2(break1001_g733.x , break1001_g733.z));
				float2 appendResult1005_g733 = (float2(break1001_g733.x , break1001_g733.y));
				float2 TEXTURE_TILLING_SCALE_Offshore1011_g733 = ( ( ( appendResult1002_g733 * break1007_g733.x ) + ( break1007_g733.y * appendResult1000_g733 ) + ( break1007_g733.z * appendResult1005_g733 ) ) * TEXTURE_TILLING_Offshore996_g733 );
				float2 m_Scale1015_g733 = TEXTURE_TILLING_SCALE_Offshore1011_g733;
				float2 localfloat2switch1015_g733 = float2switch1015_g733( m_switch1015_g733 , m_Standard1015_g733 , m_Scale1015_g733 );
				float2 texCoord912_g733 = IN.ase_texcoord7.xyz.xy * ( localfloat2switch1015_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling4 = float2(2,4);
				float cos911_g733 = cos( _G_FlowSwirling4.x );
				float sin911_g733 = sin( _G_FlowSwirling4.x );
				float2 rotator911_g733 = mul( texCoord912_g733 - float2( 0,0 ) , float2x2( cos911_g733 , -sin911_g733 , sin911_g733 , cos911_g733 )) + float2( 0,0 );
				float2 panner914_g733 = ( mulTime920_g733 * temp_cast_1 + rotator911_g733);
				float2 temp_cast_2 = (temp_output_908_0_g733).xx;
				float cos913_g733 = cos( _G_FlowSwirling4.y );
				float sin913_g733 = sin( _G_FlowSwirling4.y );
				float2 rotator913_g733 = mul( texCoord912_g733 - float2( 0,0 ) , float2x2( cos913_g733 , -sin913_g733 , sin913_g733 , cos913_g733 )) + float2( 0,0 );
				float2 panner910_g733 = ( mulTime920_g733 * temp_cast_2 + rotator913_g733);
				float2 temp_cast_3 = (temp_output_908_0_g733).xx;
				float2 panner915_g733 = ( mulTime920_g733 * temp_cast_3 + texCoord912_g733);
				float4 m_Swirling936_g733 = ( float4( (_OffshoreFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner914_g733 ) + ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner910_g733 ) + SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner915_g733 ) ) ) );
				float4 localfloat4switch936_g733 = float4switch936_g733( m_switch936_g733 , m_Off936_g733 , m_Swirling936_g733 );
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float clampDepth47_g733 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z46_g733 = clampDepth47_g733;
				float4 localCalculateObliqueFrustumCorrection63_g733 = CalculateObliqueFrustumCorrection();
				float dotResult59_g733 = dot( float4( IN.ase_texcoord8.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection63_g733 );
				float correctionFactor46_g733 = dotResult59_g733;
				float localCorrectedLinearEyeDepth46_g733 = CorrectedLinearEyeDepth( z46_g733 , correctionFactor46_g733 );
				float eyeDepth53_g733 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_56_0_g733 = ( eyeDepth53_g733 - ScreenPos.w );
				float temp_output_48_0_g733 = ( localCorrectedLinearEyeDepth46_g733 - abs( temp_output_56_0_g733 ) );
				float temp_output_49_0_g733 = saturate( temp_output_48_0_g733 );
				float GRAB_SCREEN_DEPTH_BEHIND80_g733 = temp_output_49_0_g733;
				float3 unityObjectToViewPos531_g733 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord8.xyz) );
				float GRAB_SCREEN_DEPTH73_g733 = localCorrectedLinearEyeDepth46_g733;
				float temp_output_548_0_g733 = ( unityObjectToViewPos531_g733.z + GRAB_SCREEN_DEPTH73_g733 );
				float temp_output_55_0_g733 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float GRAB_SCREEN_CLOSENESS83_g733 = temp_output_55_0_g733;
				float4 lerpResult537_g733 = lerp( float4( 0,0,0,0 ) , ( ( localfloat4switch936_g733 * GRAB_SCREEN_DEPTH_BEHIND80_g733 ) / 3.0 ) , saturate( ( ( ( temp_output_548_0_g733 - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g733 ) / ( ( _OffshoreFoam_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g733 ) ) ));
				float4 lerpResult578_g733 = lerp( float4( 0,0,0,0 ) , lerpResult537_g733 , _OffshoreFoam_FoamStrength);
				float4 FOAM_OFFSHORE655_g733 = lerpResult578_g733;
				int m_switch934_g733 = _ShorelineFoam_FlowDirectionMode;
				float4 m_Off934_g733 = float4( 0,0,0,0 );
				float mulTime877_g733 = _TimeParameters.x * _ShorelineFoam_Timescale;
				float temp_output_888_0_g733 = ( _ShorelineFoam_Speed * 0.0006 );
				float2 temp_cast_7 = (temp_output_888_0_g733).xx;
				int m_switch989_g733 = _ShorelineFoam_TillingMode;
				float2 appendResult981_g733 = (float2(_ShorelineFoam_TilingX , _ShorelineFoam_TilingY));
				float2 TEXTURE_TILLING_Shoreline982_g733 = appendResult981_g733;
				float2 m_Standard989_g733 = TEXTURE_TILLING_Shoreline982_g733;
				float3 break971_g733 = ase_parentObjectScale;
				float2 appendResult972_g733 = (float2(break971_g733.z , break971_g733.y));
				float3 normalizeResult978_g733 = normalize( IN.ase_normal );
				float3 break977_g733 = normalizeResult978_g733;
				float2 appendResult970_g733 = (float2(break971_g733.x , break971_g733.z));
				float2 appendResult975_g733 = (float2(break971_g733.x , break971_g733.y));
				float2 TEXTURE_TILLING_SCALE_Shoreline980_g733 = ( ( ( appendResult972_g733 * break977_g733.x ) + ( break977_g733.y * appendResult970_g733 ) + ( break977_g733.z * appendResult975_g733 ) ) * TEXTURE_TILLING_Shoreline982_g733 );
				float2 m_Scale989_g733 = TEXTURE_TILLING_SCALE_Shoreline980_g733;
				float2 localfloat2switch989_g733 = float2switch989_g733( m_switch989_g733 , m_Standard989_g733 , m_Scale989_g733 );
				float2 texCoord893_g733 = IN.ase_texcoord7.xyz.xy * ( localfloat2switch989_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling3 = float2(2,4);
				float cos892_g733 = cos( _G_FlowSwirling3.x );
				float sin892_g733 = sin( _G_FlowSwirling3.x );
				float2 rotator892_g733 = mul( texCoord893_g733 - float2( 0,0 ) , float2x2( cos892_g733 , -sin892_g733 , sin892_g733 , cos892_g733 )) + float2( 0,0 );
				float2 panner897_g733 = ( mulTime877_g733 * temp_cast_7 + rotator892_g733);
				float2 temp_cast_8 = (temp_output_888_0_g733).xx;
				float cos895_g733 = cos( _G_FlowSwirling3.y );
				float sin895_g733 = sin( _G_FlowSwirling3.y );
				float2 rotator895_g733 = mul( texCoord893_g733 - float2( 0,0 ) , float2x2( cos895_g733 , -sin895_g733 , sin895_g733 , cos895_g733 )) + float2( 0,0 );
				float2 panner891_g733 = ( mulTime877_g733 * temp_cast_8 + rotator895_g733);
				float2 temp_cast_9 = (temp_output_888_0_g733).xx;
				float2 panner898_g733 = ( mulTime877_g733 * temp_cast_9 + texCoord893_g733);
				float4 m_Swirling934_g733 = ( float4( (_ShorelineFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner897_g733 ) + ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner891_g733 ) + SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner898_g733 ) ) ) );
				float4 localfloat4switch934_g733 = float4switch934_g733( m_switch934_g733 , m_Off934_g733 , m_Swirling934_g733 );
				float3 unityObjectToViewPos561_g733 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord8.xyz) );
				float temp_output_565_0_g733 = ( unityObjectToViewPos561_g733.z + GRAB_SCREEN_DEPTH73_g733 );
				float4 lerpResult511_g733 = lerp( ( localfloat4switch934_g733 * GRAB_SCREEN_DEPTH_BEHIND80_g733 ) , float4( 0,0,0,0 ) , saturate( ( ( ( temp_output_565_0_g733 - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g733 ) / ( ( _ShorelineFoam_Distance - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g733 ) ) ));
				float4 lerpResult552_g733 = lerp( float4( 0,0,0,0 ) , lerpResult511_g733 , _ShorelineFoam_FoamStrength);
				float4 FOAM_SHORELINE654_g733 = lerpResult552_g733;
				float screenDepth1198_g733 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1198_g733 = abs( ( screenDepth1198_g733 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g733 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth1198_g733*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g733 = lerp( _DepthTint , lerpResult25_g733 , saturate( (distanceDepth1198_g733*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g733 = lerpResult27_g733;
				int m_switch932_g733 = _WaterNormal_FlowDirection;
				float3 m_Off932_g733 = float3( 0,0,0 );
				float mulTime863_g733 = _TimeParameters.x * _WaterNormal_Timescale;
				float temp_output_849_0_g733 = ( _WaterNormal_NormalMapSpeed * 0.0006 );
				float2 temp_cast_11 = (temp_output_849_0_g733).xx;
				int m_switch963_g733 = _WaterNormal_TillingMode;
				float2 appendResult947_g733 = (float2(_WaterNormal_TilingX , _WaterNormal_TilingY));
				float2 TEXTURE_TILLING_Normal959_g733 = appendResult947_g733;
				float2 m_Standard963_g733 = TEXTURE_TILLING_Normal959_g733;
				float3 break939_g733 = ase_parentObjectScale;
				float2 appendResult941_g733 = (float2(break939_g733.z , break939_g733.y));
				float3 normalizeResult957_g733 = normalize( IN.ase_normal );
				float3 break948_g733 = normalizeResult957_g733;
				float2 appendResult940_g733 = (float2(break939_g733.x , break939_g733.z));
				float2 appendResult953_g733 = (float2(break939_g733.x , break939_g733.y));
				float2 TEXTURE_TILLING_SCALE_Normal942_g733 = ( ( ( appendResult941_g733 * break948_g733.x ) + ( break948_g733.y * appendResult940_g733 ) + ( break948_g733.z * appendResult953_g733 ) ) * TEXTURE_TILLING_Normal959_g733 );
				float2 m_Scale963_g733 = TEXTURE_TILLING_SCALE_Normal942_g733;
				float2 localfloat2switch963_g733 = float2switch963_g733( m_switch963_g733 , m_Standard963_g733 , m_Scale963_g733 );
				float2 texCoord844_g733 = IN.ase_texcoord9.xy * ( localfloat2switch963_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling2 = float2(2,4);
				float cos843_g733 = cos( _G_FlowSwirling2.x );
				float sin843_g733 = sin( _G_FlowSwirling2.x );
				float2 rotator843_g733 = mul( texCoord844_g733 - float2( 0,0 ) , float2x2( cos843_g733 , -sin843_g733 , sin843_g733 , cos843_g733 )) + float2( 0,0 );
				float2 panner845_g733 = ( mulTime863_g733 * temp_cast_11 + rotator843_g733);
				float3 normalizedWorldNormal = normalize( WorldNormal );
				float lerpResult1191_g733 = lerp( 0.0 , _WaterNormal_NormalMapStrength , normalizedWorldNormal.y);
				float3 unpack842_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner845_g733 ), lerpResult1191_g733 );
				unpack842_g733.z = lerp( 1, unpack842_g733.z, saturate(lerpResult1191_g733) );
				float2 temp_cast_12 = (temp_output_849_0_g733).xx;
				float cos847_g733 = cos( _G_FlowSwirling2.y );
				float sin847_g733 = sin( _G_FlowSwirling2.y );
				float2 rotator847_g733 = mul( texCoord844_g733 - float2( 0,0 ) , float2x2( cos847_g733 , -sin847_g733 , sin847_g733 , cos847_g733 )) + float2( 0,0 );
				float2 panner839_g733 = ( mulTime863_g733 * temp_cast_12 + rotator847_g733);
				float3 unpack838_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner839_g733 ), lerpResult1191_g733 );
				unpack838_g733.z = lerp( 1, unpack838_g733.z, saturate(lerpResult1191_g733) );
				float2 temp_cast_13 = (temp_output_849_0_g733).xx;
				float2 panner850_g733 = ( mulTime863_g733 * temp_cast_13 + texCoord844_g733);
				float3 unpack840_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner850_g733 ), lerpResult1191_g733 );
				unpack840_g733.z = lerp( 1, unpack840_g733.z, saturate(lerpResult1191_g733) );
				float3 m_Swirling932_g733 = BlendNormal( unpack842_g733 , ( unpack838_g733 + unpack840_g733 ) );
				float3 localfloat3switch932_g733 = float3switch932_g733( m_switch932_g733 , m_Off932_g733 , m_Swirling932_g733 );
				float3 NORMAL_OUT_Z505_g733 = localfloat3switch932_g733;
				float3 NORMAL_IN84_g741 = NORMAL_OUT_Z505_g733;
				float REFACTED_SCALE_FLOAT78_g741 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord7.w;
				float eyeDepth7_g741 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g741 = ( (NORMAL_IN84_g741).xy * ( REFACTED_SCALE_FLOAT78_g741 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g741 - eyeDepth ) ) );
				float eyeDepth27_g741 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g741, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g741 = (( float4( ( temp_output_21_0_g741 * saturate( ( eyeDepth27_g741 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g741 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g741 ), 1.0 );
				float4 REFRACTED_DEPTH144_g733 = fetchOpaqueVal89_g741;
				float temp_output_20_0_g733 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g733 = 0.0;
				#else
				float staticSwitch37_g733 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth1198_g733*-5.0 + 1.0) ) ) ) * temp_output_20_0_g733 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g733 = staticSwitch37_g733;
				float4 lerpResult105_g733 = lerp( COLOR_TINT161_g733 , REFRACTED_DEPTH144_g733 , DEPTH_TINT_ALPHA93_g733);
				float4 temp_output_1194_0_g733 = ( ( FOAM_OFFSHORE655_g733 + FOAM_SHORELINE654_g733 ) + lerpResult105_g733 );
				float4 ALBEDO_IN60_g742 = temp_output_1194_0_g733;
				float4 m_Off92_g742 = ALBEDO_IN60_g742;
				int m_switch95_g742 = _Reflection_FresnelMode;
				float3 NORMAL_IN54_g742 = NORMAL_OUT_Z505_g733;
				float2 temp_cast_17 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_18 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g742 = clamp( ( (NORMAL_IN54_g742).xy * _Reflection_BumpScale ) , temp_cast_17 , temp_cast_18 );
				float2 REFLECTION_BUMP9_g742 = clampResult29_g742;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 worldRefl24_g742 = reflect( -WorldViewDirection, float3( dot( tanToWorld0, NORMAL_IN54_g742 ), dot( tanToWorld1, NORMAL_IN54_g742 ), dot( tanToWorld2, NORMAL_IN54_g742 ) ) );
				float4 texCUBENode31_g742 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g742 ,  0.0 ) + worldRefl24_g742 + _Reflection_Wobble ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_20 = (texCUBENode31_g742.r).xxxx;
				float REFLECTION_CLOUD12_g742 = _Reflection_Cloud;
				float4 lerpResult49_g742 = lerp( texCUBENode31_g742 , temp_cast_20 , REFLECTION_CLOUD12_g742);
				float4 m_Off95_g742 = lerpResult49_g742;
				float fresnelNdotV23_g742 = dot( WorldNormal, WorldViewDirection );
				float fresnelNode23_g742 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g742 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g742 = ( _Reflection_FresnelStrength * fresnelNode23_g742 );
				float4 lerpResult73_g742 = lerp( float4( 0,0,0,0 ) , lerpResult49_g742 , REFLECTION_FRESNEL11_g742);
				float4 m_Active95_g742 = lerpResult73_g742;
				float4 localfloat4switch95_g742 = float4switch95_g742( m_switch95_g742 , m_Off95_g742 , m_Active95_g742 );
				float4 switchResult100_g742 = (((ase_vface>0)?(localfloat4switch95_g742):(float4( 0,0,0,0 ))));
				float4 m_Active92_g742 = ( ( ( 1.0 - 0.5 ) * switchResult100_g742 ) + ( ALBEDO_IN60_g742 * 0.5 ) );
				float4 localfloat4switch92_g742 = float4switch92_g742( m_switch92_g742 , m_Off92_g742 , m_Active92_g742 );
				float4 temp_cast_23 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch105_g742 = temp_cast_23;
				#else
				float4 staticSwitch105_g742 = localfloat4switch92_g742;
				#endif
				
				float4 appendResult486_g733 = (float4(1.0 , 0.0 , 1.0 , localfloat3switch932_g733.x));
				float3 unpack449_g733 = UnpackNormalScale( appendResult486_g733, 0.15 );
				unpack449_g733.z = lerp( 1, unpack449_g733.z, saturate(0.15) );
				float3 temp_output_1248_0_g733 = ( IN.ase_texcoord8.xyz * 100.0 );
				float3 temp_output_1252_0_g733 = cross( WorldNormal , ddy( temp_output_1248_0_g733 ) );
				float3 temp_output_1267_0_g733 = ddx( temp_output_1248_0_g733 );
				float dotResult1221_g733 = dot( temp_output_1252_0_g733 , temp_output_1267_0_g733 );
				float temp_output_1256_0_g733 = abs( dotResult1221_g733 );
				float4 temp_output_1228_0_g733 = ( _FoamNormalStrength_Offshore * FOAM_OFFSHORE655_g733 );
				float4 break1250_g733 = ( sign( temp_output_1256_0_g733 ) * ( ( ddx( temp_output_1228_0_g733 ) * float4( temp_output_1252_0_g733 , 0.0 ) ) + ( ddy( temp_output_1228_0_g733 ) * float4( cross( WorldNormal , temp_output_1267_0_g733 ) , 0.0 ) ) ) );
				float3 appendResult1223_g733 = (float3(break1250_g733.x , -break1250_g733.y , break1250_g733.z));
				float3 normalizeResult1226_g733 = normalize( ( ( temp_output_1256_0_g733 * WorldNormal ) - appendResult1223_g733 ) );
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				float3 worldToTangentDir1219_g733 = mul( ase_worldToTangent, normalizeResult1226_g733);
				float3 _FoamNormalStrength_Offshore1218_g733 = worldToTangentDir1219_g733;
				float3 temp_output_1242_0_g733 = ( IN.ase_texcoord8.xyz * 100.0 );
				float3 temp_output_1216_0_g733 = cross( WorldNormal , ddy( temp_output_1242_0_g733 ) );
				float3 temp_output_1243_0_g733 = ddx( temp_output_1242_0_g733 );
				float dotResult1239_g733 = dot( temp_output_1216_0_g733 , temp_output_1243_0_g733 );
				float temp_output_1238_0_g733 = abs( dotResult1239_g733 );
				float4 temp_output_1237_0_g733 = ( _FoamNormalStrength_Shoreline * FOAM_SHORELINE654_g733 );
				float3 appendResult1212_g733 = (float3(( sign( temp_output_1238_0_g733 ) * ( ( ddx( temp_output_1237_0_g733 ) * float4( temp_output_1216_0_g733 , 0.0 ) ) + ( ddy( temp_output_1237_0_g733 ) * float4( cross( WorldNormal , temp_output_1243_0_g733 ) , 0.0 ) ) ) ).x , -0.0 , 0.0));
				float3 normalizeResult1240_g733 = normalize( ( ( temp_output_1238_0_g733 * WorldNormal ) - appendResult1212_g733 ) );
				float3 worldToTangentDir1236_g733 = mul( ase_worldToTangent, normalizeResult1240_g733);
				float3 _FoamNormalStrength_Shoreline1235_g733 = worldToTangentDir1236_g733;
				float3 NORMAL_OUT504_g733 = BlendNormal( unpack449_g733 , BlendNormal( _FoamNormalStrength_Offshore1218_g733 , _FoamNormalStrength_Shoreline1235_g733 ) );
				
				int m_switch1041_g733 = _SmoothnessCullModeWater;
				int m_switch1051_g733 = _SmoothnessModeWater;
				float2 uv_WaterNormal_NormalMap870_g733 = IN.ase_texcoord7.xyz.xy;
				float3 unpack870_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, uv_WaterNormal_NormalMap870_g733 ), lerpResult1191_g733 );
				unpack870_g733.z = lerp( 1, unpack870_g733.z, saturate(lerpResult1191_g733) );
				float3 tanNormal871_g733 = unpack870_g733;
				float3 worldNormal871_g733 = normalize( float3(dot(tanToWorld0,tanNormal871_g733), dot(tanToWorld1,tanNormal871_g733), dot(tanToWorld2,tanNormal871_g733)) );
				float3 NORMAL_WORLD_OUT506_g733 = worldNormal871_g733;
				float3 temp_output_1106_0_g733 = ddx( NORMAL_WORLD_OUT506_g733 );
				float dotResult1088_g733 = dot( temp_output_1106_0_g733 , temp_output_1106_0_g733 );
				float3 temp_output_1087_0_g733 = ddy( NORMAL_WORLD_OUT506_g733 );
				float dotResult1114_g733 = dot( temp_output_1087_0_g733 , temp_output_1087_0_g733 );
				float temp_output_1102_0_g733 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult1088_g733 + dotResult1114_g733 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
				float4 m_Standard1051_g733 = float4( ( min( temp_output_1102_0_g733 , 0.5 ) * ( 1.0 - ( NORMAL_OUT504_g733 * float3( 0.79,0.79,0.79 ) ) ) ) , 0.0 );
				float4 m_Geometric1051_g733 = float4( ( temp_output_1102_0_g733 * ( 1.0 - NORMAL_OUT504_g733 ) ) , 0.0 );
				float4 localfloat4switch1051_g733 = float4switch1051_g733( m_switch1051_g733 , m_Standard1051_g733 , m_Geometric1051_g733 );
				float3 m_Standard1041_g733 = localfloat4switch1051_g733.xyz;
				float4 switchResult1059_g733 = (((ase_vface>0)?(localfloat4switch1051_g733):(float4( 0,0,0,0 ))));
				float3 m_Cullfront1041_g733 = switchResult1059_g733.xyz;
				float4 switchResult1037_g733 = (((ase_vface>0)?(float4( 1,0,0,0 )):(localfloat4switch1051_g733)));
				float3 m_Cullback1041_g733 = switchResult1037_g733.xyz;
				float3 localfloat3switch1041_g733 = float3switch1041_g733( m_switch1041_g733 , m_Standard1041_g733 , m_Cullfront1041_g733 , m_Cullback1041_g733 );
				float fresnelNdotV1036_g733 = dot( NORMAL_WORLD_OUT506_g733, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode1036_g733 = ( _SmoothnessBias + _SmoothnessScale * pow( max( 1.0 - fresnelNdotV1036_g733 , 0.0001 ), _SmoothnessPower ) );
				float clampResult1060_g733 = clamp( fresnelNode1036_g733 , 0.0 , 1.0 );
				float3 lerpResult1043_g733 = lerp( localfloat3switch1041_g733 , float3( 0,0,0 ) , ( clampResult1060_g733 * ( 1.0 - _SmoothnessFresnel ) ));
				
				float3 Albedo = staticSwitch105_g742.xyz;
				float3 Normal = NORMAL_OUT504_g733;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = lerpResult1043_g733.x;
				float Occlusion = 1;
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

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
			float4 _ShorelineFoam_Tint;
			float4 _MidwaterTint;
			float4 _ShorelineTint;
			float4 _OffshoreFoam_Tint;
			float4 _DepthTint;
			float _WaterNormal_TilingY;
			float _WaterNormal_NormalMapStrength;
			float _RefractionScale;
			float _OpacityShoreline;
			float _Opacity;
			int _Reflection_FresnelMode;
			float _Reflection_BumpScale;
			float _Reflection_BumpClamp;
			float _Reflection_Wobble;
			float _Reflection_Smoothness;
			int _ColorMask;
			float _Reflection_Cloud;
			float _Reflection_FresnelStrength;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelScale;
			float _FoamNormalStrength_Offshore;
			float _FoamNormalStrength_Shoreline;
			int _SmoothnessCullModeWater;
			int _SmoothnessModeWater;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			float _SmoothnessBias;
			float _SmoothnessScale;
			float _WaterNormal_TilingX;
			int _WaterNormal_TillingMode;
			int _WaterNormal_FlowDirection;
			float _WaterNormal_Timescale;
			float _AlphatoCoverage;
			int _CullMode;
			int _ZWriteMode;
			int _Reflection_Mode;
			int _OffshoreFoam_FlowDirectionMode;
			float _OffshoreFoam_Timescale;
			float _OffshoreFoam_Speed;
			int _OffshoreFoam_TillingMode;
			float _OffshoreFoam_TilingX;
			float _OffshoreFoam_TilingY;
			float _OffshoreFoam_Distance;
			float _WaterNormal_NormalMapSpeed;
			float _OffshoreFoam_FoamStrength;
			float _ShorelineFoam_Timescale;
			float _ShorelineFoam_Speed;
			int _ShorelineFoam_TillingMode;
			float _ShorelineFoam_TilingX;
			float _ShorelineFoam_TilingY;
			float _ShorelineFoam_Distance;
			float _ShorelineFoam_FoamStrength;
			float _ShorelineDepth;
			float _ShorelineOffset;
			float _DepthOffset;
			float _SmoothnessPower;
			int _ShorelineFoam_FlowDirectionMode;
			float _SmoothnessFresnel;
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
			

			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShorelineFoam_Tint;
			float4 _MidwaterTint;
			float4 _ShorelineTint;
			float4 _OffshoreFoam_Tint;
			float4 _DepthTint;
			float _WaterNormal_TilingY;
			float _WaterNormal_NormalMapStrength;
			float _RefractionScale;
			float _OpacityShoreline;
			float _Opacity;
			int _Reflection_FresnelMode;
			float _Reflection_BumpScale;
			float _Reflection_BumpClamp;
			float _Reflection_Wobble;
			float _Reflection_Smoothness;
			int _ColorMask;
			float _Reflection_Cloud;
			float _Reflection_FresnelStrength;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelScale;
			float _FoamNormalStrength_Offshore;
			float _FoamNormalStrength_Shoreline;
			int _SmoothnessCullModeWater;
			int _SmoothnessModeWater;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			float _SmoothnessBias;
			float _SmoothnessScale;
			float _WaterNormal_TilingX;
			int _WaterNormal_TillingMode;
			int _WaterNormal_FlowDirection;
			float _WaterNormal_Timescale;
			float _AlphatoCoverage;
			int _CullMode;
			int _ZWriteMode;
			int _Reflection_Mode;
			int _OffshoreFoam_FlowDirectionMode;
			float _OffshoreFoam_Timescale;
			float _OffshoreFoam_Speed;
			int _OffshoreFoam_TillingMode;
			float _OffshoreFoam_TilingX;
			float _OffshoreFoam_TilingY;
			float _OffshoreFoam_Distance;
			float _WaterNormal_NormalMapSpeed;
			float _OffshoreFoam_FoamStrength;
			float _ShorelineFoam_Timescale;
			float _ShorelineFoam_Speed;
			int _ShorelineFoam_TillingMode;
			float _ShorelineFoam_TilingX;
			float _ShorelineFoam_TilingY;
			float _ShorelineFoam_Distance;
			float _ShorelineFoam_FoamStrength;
			float _ShorelineDepth;
			float _ShorelineOffset;
			float _DepthOffset;
			float _SmoothnessPower;
			int _ShorelineFoam_FlowDirectionMode;
			float _SmoothnessFresnel;
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
			TEXTURE2D(_OffshoreFoam_Map);
			SAMPLER(sampler_trilinear_repeat);
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_ShorelineFoam_Map);
			TEXTURE2D(_WaterNormal_NormalMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float2 float2switch1015_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch936_g733( int m_switch, float4 m_Off, float4 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch989_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch934_g733( int m_switch, float4 m_Off, float4 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch963_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float3 float3switch932_g733( int m_switch, float3 m_Off, float3 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch95_g742( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch92_g742( int m_switch, float4 m_Off, float4 m_Active )
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

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord2.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xyz = v.ase_texcoord.xyz;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord4 = v.vertex;
				o.ase_texcoord5.xy = v.ase_texcoord3.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

			half4 frag(VertexOutput IN , half ase_vface : VFACE ) : SV_TARGET
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

				int REFLECTION_MODE65_g742 = _Reflection_Mode;
				int m_switch92_g742 = REFLECTION_MODE65_g742;
				int m_switch936_g733 = _OffshoreFoam_FlowDirectionMode;
				float4 m_Off936_g733 = float4( 0,0,0,0 );
				float mulTime920_g733 = _TimeParameters.x * _OffshoreFoam_Timescale;
				float temp_output_908_0_g733 = ( _OffshoreFoam_Speed * 0.0006 );
				float2 temp_cast_1 = (temp_output_908_0_g733).xx;
				int m_switch1015_g733 = _OffshoreFoam_TillingMode;
				float2 appendResult991_g733 = (float2(_OffshoreFoam_TilingX , _OffshoreFoam_TilingY));
				float2 TEXTURE_TILLING_Offshore996_g733 = appendResult991_g733;
				float2 m_Standard1015_g733 = TEXTURE_TILLING_Offshore996_g733;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break1001_g733 = ase_parentObjectScale;
				float2 appendResult1002_g733 = (float2(break1001_g733.z , break1001_g733.y));
				float3 normalizeResult1008_g733 = normalize( IN.ase_normal );
				float3 break1007_g733 = normalizeResult1008_g733;
				float2 appendResult1000_g733 = (float2(break1001_g733.x , break1001_g733.z));
				float2 appendResult1005_g733 = (float2(break1001_g733.x , break1001_g733.y));
				float2 TEXTURE_TILLING_SCALE_Offshore1011_g733 = ( ( ( appendResult1002_g733 * break1007_g733.x ) + ( break1007_g733.y * appendResult1000_g733 ) + ( break1007_g733.z * appendResult1005_g733 ) ) * TEXTURE_TILLING_Offshore996_g733 );
				float2 m_Scale1015_g733 = TEXTURE_TILLING_SCALE_Offshore1011_g733;
				float2 localfloat2switch1015_g733 = float2switch1015_g733( m_switch1015_g733 , m_Standard1015_g733 , m_Scale1015_g733 );
				float2 texCoord912_g733 = IN.ase_texcoord2.xyz.xy * ( localfloat2switch1015_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling4 = float2(2,4);
				float cos911_g733 = cos( _G_FlowSwirling4.x );
				float sin911_g733 = sin( _G_FlowSwirling4.x );
				float2 rotator911_g733 = mul( texCoord912_g733 - float2( 0,0 ) , float2x2( cos911_g733 , -sin911_g733 , sin911_g733 , cos911_g733 )) + float2( 0,0 );
				float2 panner914_g733 = ( mulTime920_g733 * temp_cast_1 + rotator911_g733);
				float2 temp_cast_2 = (temp_output_908_0_g733).xx;
				float cos913_g733 = cos( _G_FlowSwirling4.y );
				float sin913_g733 = sin( _G_FlowSwirling4.y );
				float2 rotator913_g733 = mul( texCoord912_g733 - float2( 0,0 ) , float2x2( cos913_g733 , -sin913_g733 , sin913_g733 , cos913_g733 )) + float2( 0,0 );
				float2 panner910_g733 = ( mulTime920_g733 * temp_cast_2 + rotator913_g733);
				float2 temp_cast_3 = (temp_output_908_0_g733).xx;
				float2 panner915_g733 = ( mulTime920_g733 * temp_cast_3 + texCoord912_g733);
				float4 m_Swirling936_g733 = ( float4( (_OffshoreFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner914_g733 ) + ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner910_g733 ) + SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner915_g733 ) ) ) );
				float4 localfloat4switch936_g733 = float4switch936_g733( m_switch936_g733 , m_Off936_g733 , m_Swirling936_g733 );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float clampDepth47_g733 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z46_g733 = clampDepth47_g733;
				float4 localCalculateObliqueFrustumCorrection63_g733 = CalculateObliqueFrustumCorrection();
				float dotResult59_g733 = dot( float4( IN.ase_texcoord4.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection63_g733 );
				float correctionFactor46_g733 = dotResult59_g733;
				float localCorrectedLinearEyeDepth46_g733 = CorrectedLinearEyeDepth( z46_g733 , correctionFactor46_g733 );
				float eyeDepth53_g733 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_56_0_g733 = ( eyeDepth53_g733 - screenPos.w );
				float temp_output_48_0_g733 = ( localCorrectedLinearEyeDepth46_g733 - abs( temp_output_56_0_g733 ) );
				float temp_output_49_0_g733 = saturate( temp_output_48_0_g733 );
				float GRAB_SCREEN_DEPTH_BEHIND80_g733 = temp_output_49_0_g733;
				float3 unityObjectToViewPos531_g733 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord4.xyz) );
				float GRAB_SCREEN_DEPTH73_g733 = localCorrectedLinearEyeDepth46_g733;
				float temp_output_548_0_g733 = ( unityObjectToViewPos531_g733.z + GRAB_SCREEN_DEPTH73_g733 );
				float temp_output_55_0_g733 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float GRAB_SCREEN_CLOSENESS83_g733 = temp_output_55_0_g733;
				float4 lerpResult537_g733 = lerp( float4( 0,0,0,0 ) , ( ( localfloat4switch936_g733 * GRAB_SCREEN_DEPTH_BEHIND80_g733 ) / 3.0 ) , saturate( ( ( ( temp_output_548_0_g733 - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g733 ) / ( ( _OffshoreFoam_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g733 ) ) ));
				float4 lerpResult578_g733 = lerp( float4( 0,0,0,0 ) , lerpResult537_g733 , _OffshoreFoam_FoamStrength);
				float4 FOAM_OFFSHORE655_g733 = lerpResult578_g733;
				int m_switch934_g733 = _ShorelineFoam_FlowDirectionMode;
				float4 m_Off934_g733 = float4( 0,0,0,0 );
				float mulTime877_g733 = _TimeParameters.x * _ShorelineFoam_Timescale;
				float temp_output_888_0_g733 = ( _ShorelineFoam_Speed * 0.0006 );
				float2 temp_cast_7 = (temp_output_888_0_g733).xx;
				int m_switch989_g733 = _ShorelineFoam_TillingMode;
				float2 appendResult981_g733 = (float2(_ShorelineFoam_TilingX , _ShorelineFoam_TilingY));
				float2 TEXTURE_TILLING_Shoreline982_g733 = appendResult981_g733;
				float2 m_Standard989_g733 = TEXTURE_TILLING_Shoreline982_g733;
				float3 break971_g733 = ase_parentObjectScale;
				float2 appendResult972_g733 = (float2(break971_g733.z , break971_g733.y));
				float3 normalizeResult978_g733 = normalize( IN.ase_normal );
				float3 break977_g733 = normalizeResult978_g733;
				float2 appendResult970_g733 = (float2(break971_g733.x , break971_g733.z));
				float2 appendResult975_g733 = (float2(break971_g733.x , break971_g733.y));
				float2 TEXTURE_TILLING_SCALE_Shoreline980_g733 = ( ( ( appendResult972_g733 * break977_g733.x ) + ( break977_g733.y * appendResult970_g733 ) + ( break977_g733.z * appendResult975_g733 ) ) * TEXTURE_TILLING_Shoreline982_g733 );
				float2 m_Scale989_g733 = TEXTURE_TILLING_SCALE_Shoreline980_g733;
				float2 localfloat2switch989_g733 = float2switch989_g733( m_switch989_g733 , m_Standard989_g733 , m_Scale989_g733 );
				float2 texCoord893_g733 = IN.ase_texcoord2.xyz.xy * ( localfloat2switch989_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling3 = float2(2,4);
				float cos892_g733 = cos( _G_FlowSwirling3.x );
				float sin892_g733 = sin( _G_FlowSwirling3.x );
				float2 rotator892_g733 = mul( texCoord893_g733 - float2( 0,0 ) , float2x2( cos892_g733 , -sin892_g733 , sin892_g733 , cos892_g733 )) + float2( 0,0 );
				float2 panner897_g733 = ( mulTime877_g733 * temp_cast_7 + rotator892_g733);
				float2 temp_cast_8 = (temp_output_888_0_g733).xx;
				float cos895_g733 = cos( _G_FlowSwirling3.y );
				float sin895_g733 = sin( _G_FlowSwirling3.y );
				float2 rotator895_g733 = mul( texCoord893_g733 - float2( 0,0 ) , float2x2( cos895_g733 , -sin895_g733 , sin895_g733 , cos895_g733 )) + float2( 0,0 );
				float2 panner891_g733 = ( mulTime877_g733 * temp_cast_8 + rotator895_g733);
				float2 temp_cast_9 = (temp_output_888_0_g733).xx;
				float2 panner898_g733 = ( mulTime877_g733 * temp_cast_9 + texCoord893_g733);
				float4 m_Swirling934_g733 = ( float4( (_ShorelineFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner897_g733 ) + ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner891_g733 ) + SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner898_g733 ) ) ) );
				float4 localfloat4switch934_g733 = float4switch934_g733( m_switch934_g733 , m_Off934_g733 , m_Swirling934_g733 );
				float3 unityObjectToViewPos561_g733 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord4.xyz) );
				float temp_output_565_0_g733 = ( unityObjectToViewPos561_g733.z + GRAB_SCREEN_DEPTH73_g733 );
				float4 lerpResult511_g733 = lerp( ( localfloat4switch934_g733 * GRAB_SCREEN_DEPTH_BEHIND80_g733 ) , float4( 0,0,0,0 ) , saturate( ( ( ( temp_output_565_0_g733 - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g733 ) / ( ( _ShorelineFoam_Distance - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g733 ) ) ));
				float4 lerpResult552_g733 = lerp( float4( 0,0,0,0 ) , lerpResult511_g733 , _ShorelineFoam_FoamStrength);
				float4 FOAM_SHORELINE654_g733 = lerpResult552_g733;
				float screenDepth1198_g733 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1198_g733 = abs( ( screenDepth1198_g733 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g733 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth1198_g733*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g733 = lerp( _DepthTint , lerpResult25_g733 , saturate( (distanceDepth1198_g733*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g733 = lerpResult27_g733;
				int m_switch932_g733 = _WaterNormal_FlowDirection;
				float3 m_Off932_g733 = float3( 0,0,0 );
				float mulTime863_g733 = _TimeParameters.x * _WaterNormal_Timescale;
				float temp_output_849_0_g733 = ( _WaterNormal_NormalMapSpeed * 0.0006 );
				float2 temp_cast_11 = (temp_output_849_0_g733).xx;
				int m_switch963_g733 = _WaterNormal_TillingMode;
				float2 appendResult947_g733 = (float2(_WaterNormal_TilingX , _WaterNormal_TilingY));
				float2 TEXTURE_TILLING_Normal959_g733 = appendResult947_g733;
				float2 m_Standard963_g733 = TEXTURE_TILLING_Normal959_g733;
				float3 break939_g733 = ase_parentObjectScale;
				float2 appendResult941_g733 = (float2(break939_g733.z , break939_g733.y));
				float3 normalizeResult957_g733 = normalize( IN.ase_normal );
				float3 break948_g733 = normalizeResult957_g733;
				float2 appendResult940_g733 = (float2(break939_g733.x , break939_g733.z));
				float2 appendResult953_g733 = (float2(break939_g733.x , break939_g733.y));
				float2 TEXTURE_TILLING_SCALE_Normal942_g733 = ( ( ( appendResult941_g733 * break948_g733.x ) + ( break948_g733.y * appendResult940_g733 ) + ( break948_g733.z * appendResult953_g733 ) ) * TEXTURE_TILLING_Normal959_g733 );
				float2 m_Scale963_g733 = TEXTURE_TILLING_SCALE_Normal942_g733;
				float2 localfloat2switch963_g733 = float2switch963_g733( m_switch963_g733 , m_Standard963_g733 , m_Scale963_g733 );
				float2 texCoord844_g733 = IN.ase_texcoord5.xy * ( localfloat2switch963_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling2 = float2(2,4);
				float cos843_g733 = cos( _G_FlowSwirling2.x );
				float sin843_g733 = sin( _G_FlowSwirling2.x );
				float2 rotator843_g733 = mul( texCoord844_g733 - float2( 0,0 ) , float2x2( cos843_g733 , -sin843_g733 , sin843_g733 , cos843_g733 )) + float2( 0,0 );
				float2 panner845_g733 = ( mulTime863_g733 * temp_cast_11 + rotator843_g733);
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float lerpResult1191_g733 = lerp( 0.0 , _WaterNormal_NormalMapStrength , normalizedWorldNormal.y);
				float3 unpack842_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner845_g733 ), lerpResult1191_g733 );
				unpack842_g733.z = lerp( 1, unpack842_g733.z, saturate(lerpResult1191_g733) );
				float2 temp_cast_12 = (temp_output_849_0_g733).xx;
				float cos847_g733 = cos( _G_FlowSwirling2.y );
				float sin847_g733 = sin( _G_FlowSwirling2.y );
				float2 rotator847_g733 = mul( texCoord844_g733 - float2( 0,0 ) , float2x2( cos847_g733 , -sin847_g733 , sin847_g733 , cos847_g733 )) + float2( 0,0 );
				float2 panner839_g733 = ( mulTime863_g733 * temp_cast_12 + rotator847_g733);
				float3 unpack838_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner839_g733 ), lerpResult1191_g733 );
				unpack838_g733.z = lerp( 1, unpack838_g733.z, saturate(lerpResult1191_g733) );
				float2 temp_cast_13 = (temp_output_849_0_g733).xx;
				float2 panner850_g733 = ( mulTime863_g733 * temp_cast_13 + texCoord844_g733);
				float3 unpack840_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner850_g733 ), lerpResult1191_g733 );
				unpack840_g733.z = lerp( 1, unpack840_g733.z, saturate(lerpResult1191_g733) );
				float3 m_Swirling932_g733 = BlendNormal( unpack842_g733 , ( unpack838_g733 + unpack840_g733 ) );
				float3 localfloat3switch932_g733 = float3switch932_g733( m_switch932_g733 , m_Off932_g733 , m_Swirling932_g733 );
				float3 NORMAL_OUT_Z505_g733 = localfloat3switch932_g733;
				float3 NORMAL_IN84_g741 = NORMAL_OUT_Z505_g733;
				float REFACTED_SCALE_FLOAT78_g741 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord2.w;
				float eyeDepth7_g741 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g741 = ( (NORMAL_IN84_g741).xy * ( REFACTED_SCALE_FLOAT78_g741 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g741 - eyeDepth ) ) );
				float eyeDepth27_g741 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g741, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g741 = (( float4( ( temp_output_21_0_g741 * saturate( ( eyeDepth27_g741 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g741 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g741 ), 1.0 );
				float4 REFRACTED_DEPTH144_g733 = fetchOpaqueVal89_g741;
				float temp_output_20_0_g733 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g733 = 0.0;
				#else
				float staticSwitch37_g733 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth1198_g733*-5.0 + 1.0) ) ) ) * temp_output_20_0_g733 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g733 = staticSwitch37_g733;
				float4 lerpResult105_g733 = lerp( COLOR_TINT161_g733 , REFRACTED_DEPTH144_g733 , DEPTH_TINT_ALPHA93_g733);
				float4 temp_output_1194_0_g733 = ( ( FOAM_OFFSHORE655_g733 + FOAM_SHORELINE654_g733 ) + lerpResult105_g733 );
				float4 ALBEDO_IN60_g742 = temp_output_1194_0_g733;
				float4 m_Off92_g742 = ALBEDO_IN60_g742;
				int m_switch95_g742 = _Reflection_FresnelMode;
				float3 NORMAL_IN54_g742 = NORMAL_OUT_Z505_g733;
				float2 temp_cast_17 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_18 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g742 = clamp( ( (NORMAL_IN54_g742).xy * _Reflection_BumpScale ) , temp_cast_17 , temp_cast_18 );
				float2 REFLECTION_BUMP9_g742 = clampResult29_g742;
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl24_g742 = reflect( -ase_worldViewDir, float3( dot( tanToWorld0, NORMAL_IN54_g742 ), dot( tanToWorld1, NORMAL_IN54_g742 ), dot( tanToWorld2, NORMAL_IN54_g742 ) ) );
				float4 texCUBENode31_g742 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g742 ,  0.0 ) + worldRefl24_g742 + _Reflection_Wobble ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_20 = (texCUBENode31_g742.r).xxxx;
				float REFLECTION_CLOUD12_g742 = _Reflection_Cloud;
				float4 lerpResult49_g742 = lerp( texCUBENode31_g742 , temp_cast_20 , REFLECTION_CLOUD12_g742);
				float4 m_Off95_g742 = lerpResult49_g742;
				float fresnelNdotV23_g742 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode23_g742 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g742 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g742 = ( _Reflection_FresnelStrength * fresnelNode23_g742 );
				float4 lerpResult73_g742 = lerp( float4( 0,0,0,0 ) , lerpResult49_g742 , REFLECTION_FRESNEL11_g742);
				float4 m_Active95_g742 = lerpResult73_g742;
				float4 localfloat4switch95_g742 = float4switch95_g742( m_switch95_g742 , m_Off95_g742 , m_Active95_g742 );
				float4 switchResult100_g742 = (((ase_vface>0)?(localfloat4switch95_g742):(float4( 0,0,0,0 ))));
				float4 m_Active92_g742 = ( ( ( 1.0 - 0.5 ) * switchResult100_g742 ) + ( ALBEDO_IN60_g742 * 0.5 ) );
				float4 localfloat4switch92_g742 = float4switch92_g742( m_switch92_g742 , m_Off92_g742 , m_Active92_g742 );
				float4 temp_cast_23 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch105_g742 = temp_cast_23;
				#else
				float4 staticSwitch105_g742 = localfloat4switch92_g742;
				#endif
				
				
				float3 Albedo = staticSwitch105_g742.xyz;
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

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
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
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1

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
			
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ShorelineFoam_Tint;
			float4 _MidwaterTint;
			float4 _ShorelineTint;
			float4 _OffshoreFoam_Tint;
			float4 _DepthTint;
			float _WaterNormal_TilingY;
			float _WaterNormal_NormalMapStrength;
			float _RefractionScale;
			float _OpacityShoreline;
			float _Opacity;
			int _Reflection_FresnelMode;
			float _Reflection_BumpScale;
			float _Reflection_BumpClamp;
			float _Reflection_Wobble;
			float _Reflection_Smoothness;
			int _ColorMask;
			float _Reflection_Cloud;
			float _Reflection_FresnelStrength;
			float _Reflection_FresnelBias;
			float _Reflection_FresnelScale;
			float _FoamNormalStrength_Offshore;
			float _FoamNormalStrength_Shoreline;
			int _SmoothnessCullModeWater;
			int _SmoothnessModeWater;
			float _SmoothnessStrength;
			float _SmoothnessVariance;
			float _SmoothnessThreshold;
			float _SmoothnessBias;
			float _SmoothnessScale;
			float _WaterNormal_TilingX;
			int _WaterNormal_TillingMode;
			int _WaterNormal_FlowDirection;
			float _WaterNormal_Timescale;
			float _AlphatoCoverage;
			int _CullMode;
			int _ZWriteMode;
			int _Reflection_Mode;
			int _OffshoreFoam_FlowDirectionMode;
			float _OffshoreFoam_Timescale;
			float _OffshoreFoam_Speed;
			int _OffshoreFoam_TillingMode;
			float _OffshoreFoam_TilingX;
			float _OffshoreFoam_TilingY;
			float _OffshoreFoam_Distance;
			float _WaterNormal_NormalMapSpeed;
			float _OffshoreFoam_FoamStrength;
			float _ShorelineFoam_Timescale;
			float _ShorelineFoam_Speed;
			int _ShorelineFoam_TillingMode;
			float _ShorelineFoam_TilingX;
			float _ShorelineFoam_TilingY;
			float _ShorelineFoam_Distance;
			float _ShorelineFoam_FoamStrength;
			float _ShorelineDepth;
			float _ShorelineOffset;
			float _DepthOffset;
			float _SmoothnessPower;
			int _ShorelineFoam_FlowDirectionMode;
			float _SmoothnessFresnel;
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
			TEXTURE2D(_OffshoreFoam_Map);
			SAMPLER(sampler_trilinear_repeat);
			uniform float4 _CameraDepthTexture_TexelSize;
			TEXTURE2D(_ShorelineFoam_Map);
			TEXTURE2D(_WaterNormal_NormalMap);
			TEXTURECUBE(_Reflection_Cubemap);


			float CorrectedLinearEyeDepth( float z, float correctionFactor )
			{
				return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
			}
			
			float4 CalculateObliqueFrustumCorrection(  )
			{
				float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
				float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
				return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
			}
			
			float2 float2switch1015_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch936_g733( int m_switch, float4 m_Off, float4 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch989_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float4 float4switch934_g733( int m_switch, float4 m_Off, float4 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float4(0,0,0,0);
			}
			
			float2 float2switch963_g733( int m_switch, float2 m_Standard, float2 m_Scale )
			{
				if(m_switch ==0)
					return m_Standard;
				else if(m_switch ==1)
					return m_Scale;
				else
				return float2(0,0);
			}
			
			float3 float3switch932_g733( int m_switch, float3 m_Off, float3 m_Swirling )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Swirling;
				else
				return float3(0,0,0);
			}
			
			float4 float4switch95_g742( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch92_g742( int m_switch, float4 m_Off, float4 m_Active )
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

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord2.w = eyeDepth;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord7.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xyz = v.ase_texcoord.xyz;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord4 = v.vertex;
				o.ase_texcoord5.xy = v.ase_texcoord3.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

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
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

			half4 frag(VertexOutput IN , half ase_vface : VFACE ) : SV_TARGET
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

				int REFLECTION_MODE65_g742 = _Reflection_Mode;
				int m_switch92_g742 = REFLECTION_MODE65_g742;
				int m_switch936_g733 = _OffshoreFoam_FlowDirectionMode;
				float4 m_Off936_g733 = float4( 0,0,0,0 );
				float mulTime920_g733 = _TimeParameters.x * _OffshoreFoam_Timescale;
				float temp_output_908_0_g733 = ( _OffshoreFoam_Speed * 0.0006 );
				float2 temp_cast_1 = (temp_output_908_0_g733).xx;
				int m_switch1015_g733 = _OffshoreFoam_TillingMode;
				float2 appendResult991_g733 = (float2(_OffshoreFoam_TilingX , _OffshoreFoam_TilingY));
				float2 TEXTURE_TILLING_Offshore996_g733 = appendResult991_g733;
				float2 m_Standard1015_g733 = TEXTURE_TILLING_Offshore996_g733;
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				float3 break1001_g733 = ase_parentObjectScale;
				float2 appendResult1002_g733 = (float2(break1001_g733.z , break1001_g733.y));
				float3 normalizeResult1008_g733 = normalize( IN.ase_normal );
				float3 break1007_g733 = normalizeResult1008_g733;
				float2 appendResult1000_g733 = (float2(break1001_g733.x , break1001_g733.z));
				float2 appendResult1005_g733 = (float2(break1001_g733.x , break1001_g733.y));
				float2 TEXTURE_TILLING_SCALE_Offshore1011_g733 = ( ( ( appendResult1002_g733 * break1007_g733.x ) + ( break1007_g733.y * appendResult1000_g733 ) + ( break1007_g733.z * appendResult1005_g733 ) ) * TEXTURE_TILLING_Offshore996_g733 );
				float2 m_Scale1015_g733 = TEXTURE_TILLING_SCALE_Offshore1011_g733;
				float2 localfloat2switch1015_g733 = float2switch1015_g733( m_switch1015_g733 , m_Standard1015_g733 , m_Scale1015_g733 );
				float2 texCoord912_g733 = IN.ase_texcoord2.xyz.xy * ( localfloat2switch1015_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling4 = float2(2,4);
				float cos911_g733 = cos( _G_FlowSwirling4.x );
				float sin911_g733 = sin( _G_FlowSwirling4.x );
				float2 rotator911_g733 = mul( texCoord912_g733 - float2( 0,0 ) , float2x2( cos911_g733 , -sin911_g733 , sin911_g733 , cos911_g733 )) + float2( 0,0 );
				float2 panner914_g733 = ( mulTime920_g733 * temp_cast_1 + rotator911_g733);
				float2 temp_cast_2 = (temp_output_908_0_g733).xx;
				float cos913_g733 = cos( _G_FlowSwirling4.y );
				float sin913_g733 = sin( _G_FlowSwirling4.y );
				float2 rotator913_g733 = mul( texCoord912_g733 - float2( 0,0 ) , float2x2( cos913_g733 , -sin913_g733 , sin913_g733 , cos913_g733 )) + float2( 0,0 );
				float2 panner910_g733 = ( mulTime920_g733 * temp_cast_2 + rotator913_g733);
				float2 temp_cast_3 = (temp_output_908_0_g733).xx;
				float2 panner915_g733 = ( mulTime920_g733 * temp_cast_3 + texCoord912_g733);
				float4 m_Swirling936_g733 = ( float4( (_OffshoreFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner914_g733 ) + ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner910_g733 ) + SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner915_g733 ) ) ) );
				float4 localfloat4switch936_g733 = float4switch936_g733( m_switch936_g733 , m_Off936_g733 , m_Swirling936_g733 );
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float clampDepth47_g733 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy );
				float z46_g733 = clampDepth47_g733;
				float4 localCalculateObliqueFrustumCorrection63_g733 = CalculateObliqueFrustumCorrection();
				float dotResult59_g733 = dot( float4( IN.ase_texcoord4.xyz , 0.0 ) , localCalculateObliqueFrustumCorrection63_g733 );
				float correctionFactor46_g733 = dotResult59_g733;
				float localCorrectedLinearEyeDepth46_g733 = CorrectedLinearEyeDepth( z46_g733 , correctionFactor46_g733 );
				float eyeDepth53_g733 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_56_0_g733 = ( eyeDepth53_g733 - screenPos.w );
				float temp_output_48_0_g733 = ( localCorrectedLinearEyeDepth46_g733 - abs( temp_output_56_0_g733 ) );
				float temp_output_49_0_g733 = saturate( temp_output_48_0_g733 );
				float GRAB_SCREEN_DEPTH_BEHIND80_g733 = temp_output_49_0_g733;
				float3 unityObjectToViewPos531_g733 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord4.xyz) );
				float GRAB_SCREEN_DEPTH73_g733 = localCorrectedLinearEyeDepth46_g733;
				float temp_output_548_0_g733 = ( unityObjectToViewPos531_g733.z + GRAB_SCREEN_DEPTH73_g733 );
				float temp_output_55_0_g733 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , WorldPosition ) ) );
				float GRAB_SCREEN_CLOSENESS83_g733 = temp_output_55_0_g733;
				float4 lerpResult537_g733 = lerp( float4( 0,0,0,0 ) , ( ( localfloat4switch936_g733 * GRAB_SCREEN_DEPTH_BEHIND80_g733 ) / 3.0 ) , saturate( ( ( ( temp_output_548_0_g733 - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g733 ) / ( ( _OffshoreFoam_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g733 ) ) ));
				float4 lerpResult578_g733 = lerp( float4( 0,0,0,0 ) , lerpResult537_g733 , _OffshoreFoam_FoamStrength);
				float4 FOAM_OFFSHORE655_g733 = lerpResult578_g733;
				int m_switch934_g733 = _ShorelineFoam_FlowDirectionMode;
				float4 m_Off934_g733 = float4( 0,0,0,0 );
				float mulTime877_g733 = _TimeParameters.x * _ShorelineFoam_Timescale;
				float temp_output_888_0_g733 = ( _ShorelineFoam_Speed * 0.0006 );
				float2 temp_cast_7 = (temp_output_888_0_g733).xx;
				int m_switch989_g733 = _ShorelineFoam_TillingMode;
				float2 appendResult981_g733 = (float2(_ShorelineFoam_TilingX , _ShorelineFoam_TilingY));
				float2 TEXTURE_TILLING_Shoreline982_g733 = appendResult981_g733;
				float2 m_Standard989_g733 = TEXTURE_TILLING_Shoreline982_g733;
				float3 break971_g733 = ase_parentObjectScale;
				float2 appendResult972_g733 = (float2(break971_g733.z , break971_g733.y));
				float3 normalizeResult978_g733 = normalize( IN.ase_normal );
				float3 break977_g733 = normalizeResult978_g733;
				float2 appendResult970_g733 = (float2(break971_g733.x , break971_g733.z));
				float2 appendResult975_g733 = (float2(break971_g733.x , break971_g733.y));
				float2 TEXTURE_TILLING_SCALE_Shoreline980_g733 = ( ( ( appendResult972_g733 * break977_g733.x ) + ( break977_g733.y * appendResult970_g733 ) + ( break977_g733.z * appendResult975_g733 ) ) * TEXTURE_TILLING_Shoreline982_g733 );
				float2 m_Scale989_g733 = TEXTURE_TILLING_SCALE_Shoreline980_g733;
				float2 localfloat2switch989_g733 = float2switch989_g733( m_switch989_g733 , m_Standard989_g733 , m_Scale989_g733 );
				float2 texCoord893_g733 = IN.ase_texcoord2.xyz.xy * ( localfloat2switch989_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling3 = float2(2,4);
				float cos892_g733 = cos( _G_FlowSwirling3.x );
				float sin892_g733 = sin( _G_FlowSwirling3.x );
				float2 rotator892_g733 = mul( texCoord893_g733 - float2( 0,0 ) , float2x2( cos892_g733 , -sin892_g733 , sin892_g733 , cos892_g733 )) + float2( 0,0 );
				float2 panner897_g733 = ( mulTime877_g733 * temp_cast_7 + rotator892_g733);
				float2 temp_cast_8 = (temp_output_888_0_g733).xx;
				float cos895_g733 = cos( _G_FlowSwirling3.y );
				float sin895_g733 = sin( _G_FlowSwirling3.y );
				float2 rotator895_g733 = mul( texCoord893_g733 - float2( 0,0 ) , float2x2( cos895_g733 , -sin895_g733 , sin895_g733 , cos895_g733 )) + float2( 0,0 );
				float2 panner891_g733 = ( mulTime877_g733 * temp_cast_8 + rotator895_g733);
				float2 temp_cast_9 = (temp_output_888_0_g733).xx;
				float2 panner898_g733 = ( mulTime877_g733 * temp_cast_9 + texCoord893_g733);
				float4 m_Swirling934_g733 = ( float4( (_ShorelineFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner897_g733 ) + ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner891_g733 ) + SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner898_g733 ) ) ) );
				float4 localfloat4switch934_g733 = float4switch934_g733( m_switch934_g733 , m_Off934_g733 , m_Swirling934_g733 );
				float3 unityObjectToViewPos561_g733 = TransformWorldToView( TransformObjectToWorld( IN.ase_texcoord4.xyz) );
				float temp_output_565_0_g733 = ( unityObjectToViewPos561_g733.z + GRAB_SCREEN_DEPTH73_g733 );
				float4 lerpResult511_g733 = lerp( ( localfloat4switch934_g733 * GRAB_SCREEN_DEPTH_BEHIND80_g733 ) , float4( 0,0,0,0 ) , saturate( ( ( ( temp_output_565_0_g733 - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g733 ) / ( ( _ShorelineFoam_Distance - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g733 ) ) ));
				float4 lerpResult552_g733 = lerp( float4( 0,0,0,0 ) , lerpResult511_g733 , _ShorelineFoam_FoamStrength);
				float4 FOAM_SHORELINE654_g733 = lerpResult552_g733;
				float screenDepth1198_g733 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth1198_g733 = abs( ( screenDepth1198_g733 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _ShorelineDepth ) );
				float4 lerpResult25_g733 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth1198_g733*1.0 + _ShorelineOffset) ));
				float4 lerpResult27_g733 = lerp( _DepthTint , lerpResult25_g733 , saturate( (distanceDepth1198_g733*-1.0 + _DepthOffset) ));
				float4 COLOR_TINT161_g733 = lerpResult27_g733;
				int m_switch932_g733 = _WaterNormal_FlowDirection;
				float3 m_Off932_g733 = float3( 0,0,0 );
				float mulTime863_g733 = _TimeParameters.x * _WaterNormal_Timescale;
				float temp_output_849_0_g733 = ( _WaterNormal_NormalMapSpeed * 0.0006 );
				float2 temp_cast_11 = (temp_output_849_0_g733).xx;
				int m_switch963_g733 = _WaterNormal_TillingMode;
				float2 appendResult947_g733 = (float2(_WaterNormal_TilingX , _WaterNormal_TilingY));
				float2 TEXTURE_TILLING_Normal959_g733 = appendResult947_g733;
				float2 m_Standard963_g733 = TEXTURE_TILLING_Normal959_g733;
				float3 break939_g733 = ase_parentObjectScale;
				float2 appendResult941_g733 = (float2(break939_g733.z , break939_g733.y));
				float3 normalizeResult957_g733 = normalize( IN.ase_normal );
				float3 break948_g733 = normalizeResult957_g733;
				float2 appendResult940_g733 = (float2(break939_g733.x , break939_g733.z));
				float2 appendResult953_g733 = (float2(break939_g733.x , break939_g733.y));
				float2 TEXTURE_TILLING_SCALE_Normal942_g733 = ( ( ( appendResult941_g733 * break948_g733.x ) + ( break948_g733.y * appendResult940_g733 ) + ( break948_g733.z * appendResult953_g733 ) ) * TEXTURE_TILLING_Normal959_g733 );
				float2 m_Scale963_g733 = TEXTURE_TILLING_SCALE_Normal942_g733;
				float2 localfloat2switch963_g733 = float2switch963_g733( m_switch963_g733 , m_Standard963_g733 , m_Scale963_g733 );
				float2 texCoord844_g733 = IN.ase_texcoord5.xy * ( localfloat2switch963_g733 * float2( 2,2 ) ) + float2( 0,0 );
				float2 _G_FlowSwirling2 = float2(2,4);
				float cos843_g733 = cos( _G_FlowSwirling2.x );
				float sin843_g733 = sin( _G_FlowSwirling2.x );
				float2 rotator843_g733 = mul( texCoord844_g733 - float2( 0,0 ) , float2x2( cos843_g733 , -sin843_g733 , sin843_g733 , cos843_g733 )) + float2( 0,0 );
				float2 panner845_g733 = ( mulTime863_g733 * temp_cast_11 + rotator843_g733);
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float lerpResult1191_g733 = lerp( 0.0 , _WaterNormal_NormalMapStrength , normalizedWorldNormal.y);
				float3 unpack842_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner845_g733 ), lerpResult1191_g733 );
				unpack842_g733.z = lerp( 1, unpack842_g733.z, saturate(lerpResult1191_g733) );
				float2 temp_cast_12 = (temp_output_849_0_g733).xx;
				float cos847_g733 = cos( _G_FlowSwirling2.y );
				float sin847_g733 = sin( _G_FlowSwirling2.y );
				float2 rotator847_g733 = mul( texCoord844_g733 - float2( 0,0 ) , float2x2( cos847_g733 , -sin847_g733 , sin847_g733 , cos847_g733 )) + float2( 0,0 );
				float2 panner839_g733 = ( mulTime863_g733 * temp_cast_12 + rotator847_g733);
				float3 unpack838_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner839_g733 ), lerpResult1191_g733 );
				unpack838_g733.z = lerp( 1, unpack838_g733.z, saturate(lerpResult1191_g733) );
				float2 temp_cast_13 = (temp_output_849_0_g733).xx;
				float2 panner850_g733 = ( mulTime863_g733 * temp_cast_13 + texCoord844_g733);
				float3 unpack840_g733 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner850_g733 ), lerpResult1191_g733 );
				unpack840_g733.z = lerp( 1, unpack840_g733.z, saturate(lerpResult1191_g733) );
				float3 m_Swirling932_g733 = BlendNormal( unpack842_g733 , ( unpack838_g733 + unpack840_g733 ) );
				float3 localfloat3switch932_g733 = float3switch932_g733( m_switch932_g733 , m_Off932_g733 , m_Swirling932_g733 );
				float3 NORMAL_OUT_Z505_g733 = localfloat3switch932_g733;
				float3 NORMAL_IN84_g741 = NORMAL_OUT_Z505_g733;
				float REFACTED_SCALE_FLOAT78_g741 = _RefractionScale;
				float eyeDepth = IN.ase_texcoord2.w;
				float eyeDepth7_g741 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float2 temp_output_21_0_g741 = ( (NORMAL_IN84_g741).xy * ( REFACTED_SCALE_FLOAT78_g741 / max( eyeDepth , 0.1 ) ) * saturate( ( eyeDepth7_g741 - eyeDepth ) ) );
				float eyeDepth27_g741 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ( float4( temp_output_21_0_g741, 0.0 , 0.0 ) + ase_screenPosNorm ).xy ),_ZBufferParams);
				float2 temp_output_15_0_g741 = (( float4( ( temp_output_21_0_g741 * saturate( ( eyeDepth27_g741 - eyeDepth ) ) ), 0.0 , 0.0 ) + ase_screenPosNorm )).xy;
				float4 fetchOpaqueVal89_g741 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_15_0_g741 ), 1.0 );
				float4 REFRACTED_DEPTH144_g733 = fetchOpaqueVal89_g741;
				float temp_output_20_0_g733 = ( IN.ase_color.a * ( 1.0 - _Opacity ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g733 = 0.0;
				#else
				float staticSwitch37_g733 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth1198_g733*-5.0 + 1.0) ) ) ) * temp_output_20_0_g733 ) );
				#endif
				float DEPTH_TINT_ALPHA93_g733 = staticSwitch37_g733;
				float4 lerpResult105_g733 = lerp( COLOR_TINT161_g733 , REFRACTED_DEPTH144_g733 , DEPTH_TINT_ALPHA93_g733);
				float4 temp_output_1194_0_g733 = ( ( FOAM_OFFSHORE655_g733 + FOAM_SHORELINE654_g733 ) + lerpResult105_g733 );
				float4 ALBEDO_IN60_g742 = temp_output_1194_0_g733;
				float4 m_Off92_g742 = ALBEDO_IN60_g742;
				int m_switch95_g742 = _Reflection_FresnelMode;
				float3 NORMAL_IN54_g742 = NORMAL_OUT_Z505_g733;
				float2 temp_cast_17 = (-_Reflection_BumpClamp).xx;
				float2 temp_cast_18 = (_Reflection_BumpClamp).xx;
				float2 clampResult29_g742 = clamp( ( (NORMAL_IN54_g742).xy * _Reflection_BumpScale ) , temp_cast_17 , temp_cast_18 );
				float2 REFLECTION_BUMP9_g742 = clampResult29_g742;
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldRefl24_g742 = reflect( -ase_worldViewDir, float3( dot( tanToWorld0, NORMAL_IN54_g742 ), dot( tanToWorld1, NORMAL_IN54_g742 ), dot( tanToWorld2, NORMAL_IN54_g742 ) ) );
				float4 texCUBENode31_g742 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g742 ,  0.0 ) + worldRefl24_g742 + _Reflection_Wobble ), ( 1.0 - _Reflection_Smoothness ) );
				float4 temp_cast_20 = (texCUBENode31_g742.r).xxxx;
				float REFLECTION_CLOUD12_g742 = _Reflection_Cloud;
				float4 lerpResult49_g742 = lerp( texCUBENode31_g742 , temp_cast_20 , REFLECTION_CLOUD12_g742);
				float4 m_Off95_g742 = lerpResult49_g742;
				float fresnelNdotV23_g742 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode23_g742 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g742 , 0.0001 ), 5.0 ) );
				float REFLECTION_FRESNEL11_g742 = ( _Reflection_FresnelStrength * fresnelNode23_g742 );
				float4 lerpResult73_g742 = lerp( float4( 0,0,0,0 ) , lerpResult49_g742 , REFLECTION_FRESNEL11_g742);
				float4 m_Active95_g742 = lerpResult73_g742;
				float4 localfloat4switch95_g742 = float4switch95_g742( m_switch95_g742 , m_Off95_g742 , m_Active95_g742 );
				float4 switchResult100_g742 = (((ase_vface>0)?(localfloat4switch95_g742):(float4( 0,0,0,0 ))));
				float4 m_Active92_g742 = ( ( ( 1.0 - 0.5 ) * switchResult100_g742 ) + ( ALBEDO_IN60_g742 * 0.5 ) );
				float4 localfloat4switch92_g742 = float4switch92_g742( m_switch92_g742 , m_Off92_g742 , m_Active92_g742 );
				float4 temp_cast_23 = (0.0).xxxx;
				#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch105_g742 = temp_cast_23;
				#else
				float4 staticSwitch105_g742 = localfloat4switch92_g742;
				#endif
				
				
				float3 Albedo = staticSwitch105_g742.xyz;
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
2068;279.3333;1602;805;881.1922;3303.654;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;967;201.1788,-3215.381;Inherit;False;342;126;;1;700;;0.2265538,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;844;199.208,-3064.666;Inherit;False;347.5028;191.4201;;2;698;964;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;843;201.0305,-3346.07;Inherit;False;339;124;;1;207;GLOBAL SETTINGS ;0.3021291,1,0,1;0;0
Node;AmplifyShaderEditor.IntNode;698;205.3818,-3024.394;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;964;209.8078,-2953.154;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;966;-135.1922,-2870.154;Inherit;False;DECSF Master Map Water SRP;4;;733;7b2f06cd2324cf4448356e320ec19fa2;1,1202,1;0;3;FLOAT4;0;FLOAT3;123;FLOAT3;122
Node;AmplifyShaderEditor.IntNode;207;223.0131,-3305.746;Float;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;700;221.1788,-3172.381;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 URP 7_5_2;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;900;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;901;198.1309,-2867.459;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;11;DEC/URP Water/Water Lake;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;1;True;964;True;2;True;207;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;5;0;True;1;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;True;700;True;3;False;697;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0; ;0;0;Standard;36;Workflow;1;Surface;1;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;0;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;1;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;6;False;True;False;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;902;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;903;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;904;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;905;198.1309,-2867.459;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;698;False;False;False;False;True;2;True;700;True;3;False;697;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;901;0;966;0
WireConnection;901;1;966;123
WireConnection;901;4;966;122
ASEEND*/
//CHKSM=2472B38BA8587F11DD416299825189DB528ED23C