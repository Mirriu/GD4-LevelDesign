// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Rain/Rain Water Lake"
{
	Properties
	{
		[Header(VERSION 1.4.0 STANDARD)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
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
		_ShorelineFoam_TilingX("Tiling X", Float) = 4
		_ShorelineFoam_TilingY("Tiling Y", Float) = 4
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
		_FoamNormalStrength_Offshore("Foam Normal Strength", Range( 0 , 5)) = 2.707503
		_OffshoreFoam_Distance("Foam Distance", Range( 0.1 , 100)) = 0.2
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
		_Reflection_FresnelScale("Fresnel Scale", Range( 0 , 1)) = 0.5
		[Header (RAIN)]_Rain_WetnessDarken("Rain Wetness Darken", Range( 0 , 1)) = 0.025
		[Enum(Off,0,Active,1)][Header (RAIN HORIZONTAL)]_Horizontal_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Horizontal_RainMap("Rain Map Horizontal", 2D) = "bump" {}
		_Horizontal_Intensity("Intensity", Range( 0 , 10)) = 9
		_Horizontal_Speed("Speed", Range( 0 , 50)) = 15
		_Horizontal_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		_Horizontal_Columns("Columns", Float) = 8
		_Horizontal_Rows("Rows", Float) = 8
		[Enum(Standard,0,Stochastic,1)]_Horizontal_ModeUV("Mode UV", Int) = 1
		_Horizontal_TilingX("Tiling X", Float) = 5
		_Horizontal_TilingY("Tiling Y", Float) = 5
		_Horizontal_OffsetX("Offset X", Float) = 0
		_Horizontal_OffsetY("Offset Y", Float) = 0
		[Enum(Off,0,Active,1)][Header (RAIN VERTICAL)]_Vertical_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Vertical_RainMap("Rain Map Vertical", 2D) = "bump" {}
		_Vertical_Intensity("Intensity", Range( 0 , 10)) = 6
		_Vertical_Speed("Speed", Range( 0 , 50)) = 22
		_Vertical_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		_Vertical_Columns("Columns", Float) = 5
		_Vertical_Rows("Rows", Float) = 5
		[Enum(Standard,0,Stochastic,1)]_Vertical__ModeUV("Mode UV", Int) = 1
		_Vertical_TilingX("Tiling X", Float) = 9
		_Vertical_TilingY("Tiling Y", Float) = 9
		[Enum(Off,0,Active,1)][Header (RAIN STATIC)]_Static_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Static_RainMap("Rain Map Static", 2D) = "bump" {}
		_Static_Intensity("Intensity", Range( 0 , 10)) = 9
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		_Static_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		[Enum(Standard,0,Stochastic,1)]_Static_ModeUV("Mode UV", Int) = 0
		_Static_TilingX("Tiling X", Float) = 1
		_Static_TilingY("Tiling Y", Float) = 1
		_Static_OffsetX("Offset X", Float) = 0
		_Static_OffsetY("Offset Y", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
		[Header(Forward Rendering Options)]
		[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Transparent-20" "IgnoreProjector" = "True" "ForceNoShadowCasting" = "True" }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		Blend SrcAlpha OneMinusSrcAlpha
		
		AlphaToMask [_AlphatoCoverage]
		ColorMask [_ColorMask]
		GrabPass{ }
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 4.6
		#pragma shader_feature _SPECULARHIGHLIGHTS_OFF
		#pragma shader_feature _GLOSSYREFLECTIONS_OFF
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
		#define SAMPLE_TEXTURECUBE_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
		#define SAMPLE_TEXTURECUBE_LOD(tex,samplertex,coord,lod) texCUBElod (tex,half4(coord,lod))
		#endif//ASE Sampling Macros

		#pragma surface surf Standard keepalpha noinstancing  
		struct Input
		{
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv4_texcoord4;
			float3 worldPos;
			float2 uv_texcoord;
			float4 screenPos;
			half ASEVFace : VFACE;
			float4 vertexColor : COLOR;
			float3 worldRefl;
		};

		uniform float4 _CameraDepthTexture_TexelSize;
		uniform int _ColorMask;
		uniform float _AlphatoCoverage;
		uniform float _Horizontal_Intensity;
		uniform float _Vertical_Intensity;
		uniform int _CullMode;
		uniform int _ZWriteMode;
		uniform int _Vertical_RainMode;
		uniform int _WaterNormal_FlowDirection;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_WaterNormal_NormalMap);
		uniform float _WaterNormal_Timescale;
		uniform float _WaterNormal_NormalMapSpeed;
		uniform int _WaterNormal_TillingMode;
		uniform float _WaterNormal_TilingX;
		uniform float _WaterNormal_TilingY;
		SamplerState sampler_trilinear_repeat;
		uniform float _WaterNormal_NormalMapStrength;
		uniform float _FoamNormalStrength_Offshore;
		uniform int _OffshoreFoam_FlowDirectionMode;
		uniform float4 _OffshoreFoam_Tint;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OffshoreFoam_Map);
		uniform float _OffshoreFoam_Timescale;
		uniform float _OffshoreFoam_Speed;
		uniform int _OffshoreFoam_TillingMode;
		uniform float _OffshoreFoam_TilingX;
		uniform float _OffshoreFoam_TilingY;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float _OffshoreFoam_Distance;
		uniform float _OffshoreFoam_FoamStrength;
		uniform float _FoamNormalStrength_Shoreline;
		uniform int _ShorelineFoam_FlowDirectionMode;
		uniform float4 _ShorelineFoam_Tint;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_ShorelineFoam_Map);
		uniform float _ShorelineFoam_Timescale;
		uniform float _ShorelineFoam_Speed;
		uniform int _ShorelineFoam_TillingMode;
		uniform float _ShorelineFoam_TilingX;
		uniform float _ShorelineFoam_TilingY;
		uniform float _ShorelineFoam_Distance;
		uniform float _ShorelineFoam_FoamStrength;
		uniform int _Vertical__ModeUV;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Vertical_RainMap);
		uniform float _Vertical_TilingX;
		uniform float _Vertical_TilingY;
		uniform float _Vertical_ScreenContribution;
		uniform float _Vertical_Columns;
		uniform float _Vertical_Rows;
		uniform float _Vertical_Speed;
		uniform int _Global_Rain_Enabled;
		uniform half _Global_Rain_Intensity;
		uniform int _SmoothnessCullModeWater;
		uniform int _SmoothnessModeWater;
		uniform float _SmoothnessStrength;
		uniform float _SmoothnessVariance;
		uniform float _SmoothnessThreshold;
		uniform float _SmoothnessBias;
		uniform float _SmoothnessScale;
		uniform float _SmoothnessPower;
		uniform float _SmoothnessFresnel;
		uniform int _Horizontal_RainMode;
		uniform int _Horizontal_ModeUV;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Horizontal_RainMap);
		uniform float _Horizontal_TilingX;
		uniform float _Horizontal_TilingY;
		uniform float _Horizontal_OffsetX;
		uniform float _Horizontal_OffsetY;
		uniform float _Horizontal_ScreenContribution;
		uniform float _Horizontal_Columns;
		uniform float _Horizontal_Rows;
		uniform float _Horizontal_Speed;
		uniform int _Static_RainMode;
		uniform int _Static_ModeUV;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Static_RainMap);
		uniform float _Static_TilingX;
		uniform float _Static_TilingY;
		uniform float _Static_OffsetX;
		uniform float _Static_OffsetY;
		uniform float _Static_ScreenContribution;
		uniform float _Static_Intensity;
		uniform int _Reflection_Mode;
		uniform float4 _DepthTint;
		uniform float4 _ShorelineTint;
		uniform float4 _MidwaterTint;
		uniform float _ShorelineDepth;
		uniform float _ShorelineOffset;
		uniform float _DepthOffset;
		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform float _RefractionScale;
		uniform float _OpacityShoreline;
		uniform float _Opacity;
		uniform int _Reflection_FresnelMode;
		UNITY_DECLARE_TEXCUBE_NOSAMPLER(_Reflection_Cubemap);
		uniform float _Reflection_BumpScale;
		uniform float _Reflection_BumpClamp;
		uniform float _Reflection_Wobble;
		uniform float _Reflection_Smoothness;
		uniform float _Reflection_Cloud;
		uniform float _Reflection_FresnelStrength;
		uniform float _Reflection_FresnelBias;
		uniform float _Reflection_FresnelScale;
		uniform float _Rain_WetnessDarken;
		uniform half _Global_Rain_Wetness;


		float4 CalculateObliqueFrustumCorrection(  )
		{
			float x1 = -UNITY_MATRIX_P._31 / (UNITY_MATRIX_P._11 * UNITY_MATRIX_P._34);
			float x2 = -UNITY_MATRIX_P._32 / (UNITY_MATRIX_P._22 * UNITY_MATRIX_P._34);
			return float4(x1, x2, 0, UNITY_MATRIX_P._33 / UNITY_MATRIX_P._34 + x1 * UNITY_MATRIX_P._13 + x2 * UNITY_MATRIX_P._23);
		}


		float CorrectedLinearEyeDepth( float z, float correctionFactor )
		{
			return 1.f / (z / UNITY_MATRIX_P._34 + correctionFactor);
		}


		float2 AlignWithGrabTexel( float2 uv )
		{
			#if UNITY_UV_STARTS_AT_TOP
			if (_CameraDepthTexture_TexelSize.y < 0) {
				uv.y = 1 - uv.y;
			}
			#endif
			return (floor(uv * _CameraDepthTexture_TexelSize.zw) + 0.5) * abs(_CameraDepthTexture_TexelSize.xy);
		}


		void ResetAlpha( Input SurfaceIn, SurfaceOutputStandard SurfaceOut, inout fixed4 FinalColor )
		{
			FinalColor.a = 1;
		}


		float2 float2switch963_g741( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float3 float3switch932_g741( int m_switch, float3 m_Off, float3 m_Swirling )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Swirling;
			else
			return float3(0,0,0);
		}


		float2 float2switch1015_g741( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch936_g741( int m_switch, float4 m_Off, float4 m_Swirling )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Swirling;
			else
			return float4(0,0,0,0);
		}


		float2 float2switch989_g741( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch934_g741( int m_switch, float4 m_Off, float4 m_Swirling )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Swirling;
			else
			return float4(0,0,0,0);
		}


		float3 floatswitch1190_g782( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
		{
			float2 vertex1, vertex2, vertex3;
			// Scaling of the input
			float2 uv = UV * 3.464; // 2 * sqrt (3)
			// Skew input space into simplex triangle grid
			const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
			float2 skewedCoord = mul( gridToSkewedGrid, uv );
			// Compute local triangle vertex IDs and local barycentric coordinates
			int2 baseId = int2( floor( skewedCoord ) );
			float3 temp = float3( frac( skewedCoord ), 0 );
			temp.z = 1.0 - temp.x - temp.y;
			if ( temp.z > 0.0 )
			{
				W1 = temp.z;
				W2 = temp.y;
				W3 = temp.x;
				vertex1 = baseId;
				vertex2 = baseId + int2( 0, 1 );
				vertex3 = baseId + int2( 1, 0 );
			}
			else
			{
				W1 = -temp.z;
				W2 = 1.0 - temp.y;
				W3 = 1.0 - temp.x;
				vertex1 = baseId + int2( 1, 1 );
				vertex2 = baseId + int2( 1, 0 );
				vertex3 = baseId + int2( 0, 1 );
			}
			UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
			UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
			UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
			return;
		}


		float3 float3switch914_g782( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float4 float4switch1051_g741( int m_switch, float4 m_Standard, float4 m_Geometric )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Geometric;
			else
			return float4(0,0,0,0);
		}


		float3 float3switch1041_g741( int m_switch, float3 m_Standard, float3 m_Cullfront, float3 m_Cullback )
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


		float3 float3switch103_g782( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 floatswitch1179_g782( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		float3 float3switch793_g782( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float3 float3switch1009_g782( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 floatswitch1186_g782( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		float3 float3switch992_g782( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float3 float3switch1010_g782( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float GetRefractedDepth55_g750( float3 tangentSpaceNormal, float4 screenPos, inout float2 uv )
		{
			float2 uvOffset = tangentSpaceNormal.xy;
			uvOffset.y *= _CameraDepthTexture_TexelSize.z * abs(_CameraDepthTexture_TexelSize.y);
			uv = AlignWithGrabTexel((screenPos.xy + uvOffset) / screenPos.w);
			float backgroundDepth = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv));
			float surfaceDepth = UNITY_Z_0_FAR_FROM_CLIPSPACE(screenPos.z);
			float depthDifference = backgroundDepth - surfaceDepth;
			uvOffset *= saturate(depthDifference);
			uv = AlignWithGrabTexel((screenPos.xy + uvOffset) / screenPos.w);
			backgroundDepth = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv));
			return depthDifference = backgroundDepth - surfaceDepth;
		}


		float4 float4switch95_g748( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch92_g748( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float3 floatswitch1437_g782( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch103_g782 = _Vertical_RainMode;
			int m_switch932_g741 = _WaterNormal_FlowDirection;
			float3 m_Off932_g741 = float3( 0,0,0 );
			float mulTime863_g741 = _Time.y * _WaterNormal_Timescale;
			float temp_output_849_0_g741 = ( _WaterNormal_NormalMapSpeed * 0.0006 );
			float2 temp_cast_0 = (temp_output_849_0_g741).xx;
			int m_switch963_g741 = _WaterNormal_TillingMode;
			float2 appendResult947_g741 = (float2(_WaterNormal_TilingX , _WaterNormal_TilingY));
			float2 TEXTURE_TILLING_Normal959_g741 = appendResult947_g741;
			float2 m_Standard963_g741 = TEXTURE_TILLING_Normal959_g741;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break939_g741 = ase_parentObjectScale;
			float2 appendResult941_g741 = (float2(break939_g741.z , break939_g741.y));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 normalizeResult957_g741 = normalize( ase_vertexNormal );
			float3 break948_g741 = normalizeResult957_g741;
			float2 appendResult940_g741 = (float2(break939_g741.x , break939_g741.z));
			float2 appendResult953_g741 = (float2(break939_g741.x , break939_g741.y));
			float2 TEXTURE_TILLING_SCALE_Normal942_g741 = ( ( ( appendResult941_g741 * break948_g741.x ) + ( break948_g741.y * appendResult940_g741 ) + ( break948_g741.z * appendResult953_g741 ) ) * TEXTURE_TILLING_Normal959_g741 );
			float2 m_Scale963_g741 = TEXTURE_TILLING_SCALE_Normal942_g741;
			float2 localfloat2switch963_g741 = float2switch963_g741( m_switch963_g741 , m_Standard963_g741 , m_Scale963_g741 );
			float2 uv4_TexCoord844_g741 = i.uv4_texcoord4 * ( localfloat2switch963_g741 * float2( 2,2 ) );
			float2 _G_FlowSwirling = float2(2,4);
			float cos843_g741 = cos( _G_FlowSwirling.x );
			float sin843_g741 = sin( _G_FlowSwirling.x );
			float2 rotator843_g741 = mul( uv4_TexCoord844_g741 - float2( 0,0 ) , float2x2( cos843_g741 , -sin843_g741 , sin843_g741 , cos843_g741 )) + float2( 0,0 );
			float2 panner845_g741 = ( mulTime863_g741 * temp_cast_0 + rotator843_g741);
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float lerpResult1191_g741 = lerp( 0.0 , _WaterNormal_NormalMapStrength , ase_normWorldNormal.y);
			float cos847_g741 = cos( _G_FlowSwirling.y );
			float sin847_g741 = sin( _G_FlowSwirling.y );
			float2 rotator847_g741 = mul( uv4_TexCoord844_g741 - float2( 0,0 ) , float2x2( cos847_g741 , -sin847_g741 , sin847_g741 , cos847_g741 )) + float2( 0,0 );
			float2 panner839_g741 = ( temp_output_849_0_g741 * float2( 0,0 ) + rotator847_g741);
			float2 temp_cast_1 = (temp_output_849_0_g741).xx;
			float2 panner850_g741 = ( mulTime863_g741 * temp_cast_1 + uv4_TexCoord844_g741);
			float3 m_Swirling932_g741 = BlendNormals( UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner845_g741 ), lerpResult1191_g741 ) , ( UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner839_g741 ), lerpResult1191_g741 ) + UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner850_g741 ), lerpResult1191_g741 ) ) );
			float3 localfloat3switch932_g741 = float3switch932_g741( m_switch932_g741 , m_Off932_g741 , m_Swirling932_g741 );
			float4 appendResult486_g741 = (float4(1.0 , 0.0 , 1.0 , localfloat3switch932_g741.x));
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 temp_output_1230_0_g741 = ( ase_vertex3Pos * 100.0 );
			float3 temp_output_1225_0_g741 = cross( ase_worldNormal , ddy( temp_output_1230_0_g741 ) );
			float3 temp_output_1210_0_g741 = ddx( temp_output_1230_0_g741 );
			float dotResult1248_g741 = dot( temp_output_1225_0_g741 , temp_output_1210_0_g741 );
			float temp_output_1221_0_g741 = abs( dotResult1248_g741 );
			int m_switch936_g741 = _OffshoreFoam_FlowDirectionMode;
			float4 m_Off936_g741 = float4( 0,0,0,0 );
			float mulTime920_g741 = _Time.y * _OffshoreFoam_Timescale;
			float temp_output_908_0_g741 = ( _OffshoreFoam_Speed * 0.0006 );
			float2 temp_cast_3 = (temp_output_908_0_g741).xx;
			int m_switch1015_g741 = _OffshoreFoam_TillingMode;
			float2 appendResult991_g741 = (float2(_OffshoreFoam_TilingX , _OffshoreFoam_TilingY));
			float2 TEXTURE_TILLING_Offshore996_g741 = appendResult991_g741;
			float2 m_Standard1015_g741 = TEXTURE_TILLING_Offshore996_g741;
			float3 break1001_g741 = ase_parentObjectScale;
			float2 appendResult1002_g741 = (float2(break1001_g741.z , break1001_g741.y));
			float3 normalizeResult1008_g741 = normalize( ase_vertexNormal );
			float3 break1007_g741 = normalizeResult1008_g741;
			float2 appendResult1000_g741 = (float2(break1001_g741.x , break1001_g741.z));
			float2 appendResult1005_g741 = (float2(break1001_g741.x , break1001_g741.y));
			float2 TEXTURE_TILLING_SCALE_Offshore1011_g741 = ( ( ( appendResult1002_g741 * break1007_g741.x ) + ( break1007_g741.y * appendResult1000_g741 ) + ( break1007_g741.z * appendResult1005_g741 ) ) * TEXTURE_TILLING_Offshore996_g741 );
			float2 m_Scale1015_g741 = TEXTURE_TILLING_SCALE_Offshore1011_g741;
			float2 localfloat2switch1015_g741 = float2switch1015_g741( m_switch1015_g741 , m_Standard1015_g741 , m_Scale1015_g741 );
			float2 uv_TexCoord912_g741 = i.uv_texcoord * ( localfloat2switch1015_g741 * float2( 2,2 ) );
			float2 _Vector1 = float2(2,4);
			float cos911_g741 = cos( _Vector1.x );
			float sin911_g741 = sin( _Vector1.x );
			float2 rotator911_g741 = mul( uv_TexCoord912_g741 - float2( 0,0 ) , float2x2( cos911_g741 , -sin911_g741 , sin911_g741 , cos911_g741 )) + float2( 0,0 );
			float2 panner914_g741 = ( mulTime920_g741 * temp_cast_3 + rotator911_g741);
			float2 temp_cast_4 = (temp_output_908_0_g741).xx;
			float cos913_g741 = cos( _Vector1.y );
			float sin913_g741 = sin( _Vector1.y );
			float2 rotator913_g741 = mul( uv_TexCoord912_g741 - float2( 0,0 ) , float2x2( cos913_g741 , -sin913_g741 , sin913_g741 , cos913_g741 )) + float2( 0,0 );
			float2 panner910_g741 = ( mulTime920_g741 * temp_cast_4 + rotator913_g741);
			float2 temp_cast_5 = (temp_output_908_0_g741).xx;
			float2 panner915_g741 = ( mulTime920_g741 * temp_cast_5 + uv_TexCoord912_g741);
			float4 m_Swirling936_g741 = ( float4( (_OffshoreFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner914_g741 ) + ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner910_g741 ) + SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner915_g741 ) ) ) );
			float4 localfloat4switch936_g741 = float4switch936_g741( m_switch936_g741 , m_Off936_g741 , m_Swirling936_g741 );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float clampDepth47_g741 = SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy );
			float z46_g741 = clampDepth47_g741;
			float4 localCalculateObliqueFrustumCorrection63_g741 = CalculateObliqueFrustumCorrection();
			float dotResult59_g741 = dot( float4( ase_vertex3Pos , 0.0 ) , localCalculateObliqueFrustumCorrection63_g741 );
			float correctionFactor46_g741 = dotResult59_g741;
			float localCorrectedLinearEyeDepth46_g741 = CorrectedLinearEyeDepth( z46_g741 , correctionFactor46_g741 );
			float eyeDepth53_g741 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float temp_output_56_0_g741 = ( eyeDepth53_g741 - ase_screenPos.w );
			float temp_output_48_0_g741 = ( localCorrectedLinearEyeDepth46_g741 - abs( temp_output_56_0_g741 ) );
			float temp_output_49_0_g741 = saturate( temp_output_48_0_g741 );
			float GRAB_SCREEN_DEPTH_BEHIND80_g741 = temp_output_49_0_g741;
			float3 unityObjectToViewPos531_g741 = UnityObjectToViewPos( ase_vertex3Pos );
			float GRAB_SCREEN_DEPTH73_g741 = localCorrectedLinearEyeDepth46_g741;
			float temp_output_548_0_g741 = ( unityObjectToViewPos531_g741.z + GRAB_SCREEN_DEPTH73_g741 );
			float3 ase_worldPos = i.worldPos;
			float temp_output_55_0_g741 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , ase_worldPos ) ) );
			float GRAB_SCREEN_CLOSENESS83_g741 = temp_output_55_0_g741;
			float4 lerpResult537_g741 = lerp( float4( 0,0,0,0 ) , ( ( localfloat4switch936_g741 * GRAB_SCREEN_DEPTH_BEHIND80_g741 ) / 3.0 ) , saturate( ( ( ( temp_output_548_0_g741 - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g741 ) / ( ( _OffshoreFoam_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g741 ) ) ));
			float4 lerpResult578_g741 = lerp( float4( 0,0,0,0 ) , lerpResult537_g741 , _OffshoreFoam_FoamStrength);
			float4 FOAM_OFFSHORE655_g741 = lerpResult578_g741;
			float4 temp_output_1235_0_g741 = ( _FoamNormalStrength_Offshore * FOAM_OFFSHORE655_g741 );
			float4 break1228_g741 = ( sign( temp_output_1221_0_g741 ) * ( ( ddx( temp_output_1235_0_g741 ) * float4( temp_output_1225_0_g741 , 0.0 ) ) + ( ddy( temp_output_1235_0_g741 ) * float4( cross( ase_worldNormal , temp_output_1210_0_g741 ) , 0.0 ) ) ) );
			float3 appendResult1245_g741 = (float3(break1228_g741.x , -break1228_g741.y , break1228_g741.z));
			float3 normalizeResult1236_g741 = normalize( ( ( temp_output_1221_0_g741 * ase_worldNormal ) - appendResult1245_g741 ) );
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_worldToTangent = float3x3( ase_worldTangent, ase_worldBitangent, ase_worldNormal );
			float3 worldToTangentDir1243_g741 = mul( ase_worldToTangent, normalizeResult1236_g741);
			float3 _FoamNormalStrength_Offshore1254_g741 = worldToTangentDir1243_g741;
			float3 temp_output_1292_0_g741 = ( ase_vertex3Pos * 100.0 );
			float3 temp_output_1273_0_g741 = cross( ase_worldNormal , ddy( temp_output_1292_0_g741 ) );
			float3 temp_output_1291_0_g741 = ddx( temp_output_1292_0_g741 );
			float dotResult1295_g741 = dot( temp_output_1273_0_g741 , temp_output_1291_0_g741 );
			float temp_output_1297_0_g741 = abs( dotResult1295_g741 );
			int m_switch934_g741 = _ShorelineFoam_FlowDirectionMode;
			float4 m_Off934_g741 = float4( 0,0,0,0 );
			float mulTime877_g741 = _Time.y * _ShorelineFoam_Timescale;
			float temp_output_888_0_g741 = ( _ShorelineFoam_Speed * 0.0006 );
			float2 temp_cast_11 = (temp_output_888_0_g741).xx;
			int m_switch989_g741 = _ShorelineFoam_TillingMode;
			float2 appendResult981_g741 = (float2(_ShorelineFoam_TilingX , _ShorelineFoam_TilingY));
			float2 TEXTURE_TILLING_Shoreline982_g741 = appendResult981_g741;
			float2 m_Standard989_g741 = TEXTURE_TILLING_Shoreline982_g741;
			float3 break971_g741 = ase_parentObjectScale;
			float2 appendResult972_g741 = (float2(break971_g741.z , break971_g741.y));
			float3 normalizeResult978_g741 = normalize( ase_vertexNormal );
			float3 break977_g741 = normalizeResult978_g741;
			float2 appendResult970_g741 = (float2(break971_g741.x , break971_g741.z));
			float2 appendResult975_g741 = (float2(break971_g741.x , break971_g741.y));
			float2 TEXTURE_TILLING_SCALE_Shoreline980_g741 = ( ( ( appendResult972_g741 * break977_g741.x ) + ( break977_g741.y * appendResult970_g741 ) + ( break977_g741.z * appendResult975_g741 ) ) * TEXTURE_TILLING_Shoreline982_g741 );
			float2 m_Scale989_g741 = TEXTURE_TILLING_SCALE_Shoreline980_g741;
			float2 localfloat2switch989_g741 = float2switch989_g741( m_switch989_g741 , m_Standard989_g741 , m_Scale989_g741 );
			float2 uv_TexCoord893_g741 = i.uv_texcoord * ( localfloat2switch989_g741 * float2( 2,2 ) );
			float2 _Vector0 = float2(2,4);
			float cos892_g741 = cos( _Vector0.x );
			float sin892_g741 = sin( _Vector0.x );
			float2 rotator892_g741 = mul( uv_TexCoord893_g741 - float2( 0,0 ) , float2x2( cos892_g741 , -sin892_g741 , sin892_g741 , cos892_g741 )) + float2( 0,0 );
			float2 panner897_g741 = ( mulTime877_g741 * temp_cast_11 + rotator892_g741);
			float2 temp_cast_12 = (temp_output_888_0_g741).xx;
			float cos895_g741 = cos( _Vector0.y );
			float sin895_g741 = sin( _Vector0.y );
			float2 rotator895_g741 = mul( uv_TexCoord893_g741 - float2( 0,0 ) , float2x2( cos895_g741 , -sin895_g741 , sin895_g741 , cos895_g741 )) + float2( 0,0 );
			float2 panner891_g741 = ( mulTime877_g741 * temp_cast_12 + rotator895_g741);
			float2 temp_cast_13 = (temp_output_888_0_g741).xx;
			float2 panner898_g741 = ( mulTime877_g741 * temp_cast_13 + uv_TexCoord893_g741);
			float4 m_Swirling934_g741 = ( float4( (_ShorelineFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner897_g741 ) + ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner891_g741 ) + SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner898_g741 ) ) ) );
			float4 localfloat4switch934_g741 = float4switch934_g741( m_switch934_g741 , m_Off934_g741 , m_Swirling934_g741 );
			float3 unityObjectToViewPos561_g741 = UnityObjectToViewPos( ase_vertex3Pos );
			float temp_output_565_0_g741 = ( unityObjectToViewPos561_g741.z + GRAB_SCREEN_DEPTH73_g741 );
			float4 lerpResult511_g741 = lerp( ( localfloat4switch934_g741 * GRAB_SCREEN_DEPTH_BEHIND80_g741 ) , float4( 0,0,0,0 ) , saturate( ( ( ( temp_output_565_0_g741 - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g741 ) / ( ( _ShorelineFoam_Distance - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g741 ) ) ));
			float4 lerpResult552_g741 = lerp( float4( 0,0,0,0 ) , lerpResult511_g741 , _ShorelineFoam_FoamStrength);
			float4 FOAM_SHORELINE654_g741 = lerpResult552_g741;
			float4 temp_output_1298_0_g741 = ( _FoamNormalStrength_Shoreline * FOAM_SHORELINE654_g741 );
			float4 break1278_g741 = ( sign( temp_output_1297_0_g741 ) * ( ( ddx( temp_output_1298_0_g741 ) * float4( temp_output_1273_0_g741 , 0.0 ) ) + ( ddy( temp_output_1298_0_g741 ) * float4( cross( ase_worldNormal , temp_output_1291_0_g741 ) , 0.0 ) ) ) );
			float3 appendResult1277_g741 = (float3(break1278_g741.x , -break1278_g741.y , break1278_g741.z));
			float3 normalizeResult1294_g741 = normalize( ( ( temp_output_1297_0_g741 * ase_worldNormal ) - appendResult1277_g741 ) );
			float3 worldToTangentDir1257_g741 = mul( ase_worldToTangent, normalizeResult1294_g741);
			float3 _FoamNormalStrength_Shoreline1286_g741 = worldToTangentDir1257_g741;
			float3 NORMAL_OUT504_g741 = BlendNormals( UnpackScaleNormal( appendResult486_g741, 0.15 ) , BlendNormals( _FoamNormalStrength_Offshore1254_g741 , _FoamNormalStrength_Shoreline1286_g741 ) );
			float3 temp_output_19_0_g782 = NORMAL_OUT504_g741;
			float3 NORMAL_IN105_g782 = temp_output_19_0_g782;
			float3 m_Off103_g782 = NORMAL_IN105_g782;
			int m_switch914_g782 = _Vertical__ModeUV;
			float2 appendResult259_g782 = (float2(_Vertical_TilingX , _Vertical_TilingY));
			float2 VERTICAL_UV_TILING377_g782 = appendResult259_g782;
			float2 UV_TILING88_g783 = VERTICAL_UV_TILING377_g782;
			float4 transform125_g783 = mul(unity_ObjectToWorld,float4( ase_vertex3Pos , 0.0 ));
			float2 appendResult129_g783 = (float2(-transform125_g783.x , transform125_g783.y));
			float temp_output_52_0_g783 = _Vertical_Columns;
			float temp_output_53_0_g783 = _Vertical_Rows;
			float2 appendResult1_g783 = (float2(temp_output_52_0_g783 , temp_output_53_0_g783));
			float VERTICAL_FRAMES15_g783 = ( temp_output_52_0_g783 * temp_output_53_0_g783 );
			float2 appendResult49_g783 = (float2(VERTICAL_FRAMES15_g783 , temp_output_53_0_g783));
			float clampResult37_g783 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g783 - 1.0 ) );
			float temp_output_36_0_g783 = frac( ( ( ( _Time.y * _Vertical_Speed ) + clampResult37_g783 ) / VERTICAL_FRAMES15_g783 ) );
			float2 appendResult31_g783 = (float2(temp_output_36_0_g783 , ( 1.0 - temp_output_36_0_g783 )));
			float2 _UV_VERTICAL_X_DOWN863_g782 = ( ( ( ( UV_TILING88_g783 * appendResult129_g783 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g783 ) + ( floor( ( appendResult49_g783 * appendResult31_g783 ) ) / appendResult1_g783 ) );
			int _Global_Rain_Enabled1178_g782 = _Global_Rain_Enabled;
			int m_switch1190_g782 = _Global_Rain_Enabled1178_g782;
			float m_Off1190_g782 = _Vertical_Intensity;
			float _Global_Rain_Intensity1174_g782 = _Global_Rain_Intensity;
			float m_Active1190_g782 = ( _Vertical_Intensity * _Global_Rain_Intensity1174_g782 );
			float3 localfloatswitch1190_g782 = floatswitch1190_g782( m_switch1190_g782 , m_Off1190_g782 , m_Active1190_g782 );
			float3 _VERTICAL_INTENSITY861_g782 = localfloatswitch1190_g782;
			float3 temp_cast_19 = (0.5).xxx;
			float3 break149_g782 = ( abs( ase_worldNormal ) - temp_cast_19 );
			float _MASK_VERTICAL_Z1241_g782 = ( break149_g782.z + 0.5 );
			float3 lerpResult1138_g782 = lerp( float3( 1,1,1 ) , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_X_DOWN863_g782 ), _VERTICAL_INTENSITY861_g782.x ) , _MASK_VERTICAL_Z1241_g782);
			float2 UV_TILING88_g785 = VERTICAL_UV_TILING377_g782;
			float4 transform125_g785 = mul(unity_ObjectToWorld,float4( ase_vertex3Pos , 0.0 ));
			float2 appendResult115_g785 = (float2(transform125_g785.z , transform125_g785.y));
			float temp_output_52_0_g785 = _Vertical_Columns;
			float temp_output_53_0_g785 = _Vertical_Rows;
			float2 appendResult1_g785 = (float2(temp_output_52_0_g785 , temp_output_53_0_g785));
			float VERTICAL_FRAMES15_g785 = ( temp_output_52_0_g785 * temp_output_53_0_g785 );
			float2 appendResult49_g785 = (float2(VERTICAL_FRAMES15_g785 , temp_output_53_0_g785));
			float clampResult37_g785 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g785 - 1.0 ) );
			float temp_output_36_0_g785 = frac( ( ( ( _Time.y * _Vertical_Speed ) + clampResult37_g785 ) / VERTICAL_FRAMES15_g785 ) );
			float2 appendResult31_g785 = (float2(temp_output_36_0_g785 , ( 1.0 - temp_output_36_0_g785 )));
			float2 _UV_VERTICAL_Y_DOWN870_g782 = ( ( ( ( UV_TILING88_g785 * appendResult115_g785 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g785 ) + ( floor( ( appendResult49_g785 * appendResult31_g785 ) ) / appendResult1_g785 ) );
			float _MASK_VERTICAL_X151_g782 = ( break149_g782.x + 0.45 );
			float3 lerpResult1261_g782 = lerp( float3( 1,1,1 ) , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_Y_DOWN870_g782 ), _VERTICAL_INTENSITY861_g782.x ) , _MASK_VERTICAL_X151_g782);
			float _MASK_VERTICAL_Y1216_g782 = ( -break149_g782.y + 0.45 );
			float3 lerpResult1390_g782 = lerp( lerpResult1138_g782 , BlendNormals( lerpResult1138_g782 , lerpResult1261_g782 ) , _MASK_VERTICAL_Y1216_g782);
			float3 m_Standard914_g782 = lerpResult1390_g782;
			float localStochasticTiling895_g782 = ( 0.0 );
			float2 UV895_g782 = _UV_VERTICAL_X_DOWN863_g782;
			float2 UV1895_g782 = float2( 0,0 );
			float2 UV2895_g782 = float2( 0,0 );
			float2 UV3895_g782 = float2( 0,0 );
			float W1895_g782 = 0.0;
			float W2895_g782 = 0.0;
			float W3895_g782 = 0.0;
			StochasticTiling( UV895_g782 , UV1895_g782 , UV2895_g782 , UV3895_g782 , W1895_g782 , W2895_g782 , W3895_g782 );
			float2 temp_output_906_0_g782 = ddx( _UV_VERTICAL_X_DOWN863_g782 );
			float2 temp_output_886_0_g782 = ddy( _UV_VERTICAL_X_DOWN863_g782 );
			float UV1_V1_W1887_g782 = W1895_g782;
			float UV1_V1_W2897_g782 = W2895_g782;
			float UV1_V1_W3926_g782 = W3895_g782;
			float3 lerpResult950_g782 = lerp( float3( 1,1,1 ) , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1895_g782, temp_output_906_0_g782, temp_output_886_0_g782 ), _VERTICAL_INTENSITY861_g782.x ) * UV1_V1_W1887_g782 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2895_g782, temp_output_906_0_g782, temp_output_886_0_g782 ), _VERTICAL_INTENSITY861_g782.x ) * UV1_V1_W2897_g782 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3895_g782, temp_output_906_0_g782, temp_output_886_0_g782 ), _VERTICAL_INTENSITY861_g782.x ) * UV1_V1_W3926_g782 ) ) ) , _MASK_VERTICAL_Z1241_g782);
			float localStochasticTiling865_g782 = ( 0.0 );
			float2 UV865_g782 = _UV_VERTICAL_Y_DOWN870_g782;
			float2 UV1865_g782 = float2( 0,0 );
			float2 UV2865_g782 = float2( 0,0 );
			float2 UV3865_g782 = float2( 0,0 );
			float W1865_g782 = 0.0;
			float W2865_g782 = 0.0;
			float W3865_g782 = 0.0;
			StochasticTiling( UV865_g782 , UV1865_g782 , UV2865_g782 , UV3865_g782 , W1865_g782 , W2865_g782 , W3865_g782 );
			float2 temp_output_883_0_g782 = ddx( _UV_VERTICAL_Y_DOWN870_g782 );
			float2 temp_output_894_0_g782 = ddy( _UV_VERTICAL_Y_DOWN870_g782 );
			float UV1_V2_W1866_g782 = W1865_g782;
			float UV1_V2_W2884_g782 = W2865_g782;
			float UV1_V2_W3871_g782 = W3865_g782;
			float3 lerpResult946_g782 = lerp( float3( 1,1,1 ) , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1865_g782, temp_output_883_0_g782, temp_output_894_0_g782 ), _VERTICAL_INTENSITY861_g782.x ) * UV1_V2_W1866_g782 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2865_g782, temp_output_883_0_g782, temp_output_894_0_g782 ), _VERTICAL_INTENSITY861_g782.x ) * UV1_V2_W2884_g782 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3865_g782, temp_output_883_0_g782, temp_output_894_0_g782 ), _VERTICAL_INTENSITY861_g782.x ) * UV1_V2_W3871_g782 ) ) ) , _MASK_VERTICAL_X151_g782);
			float3 lerpResult1400_g782 = lerp( lerpResult950_g782 , BlendNormals( lerpResult950_g782 , lerpResult946_g782 ) , _MASK_VERTICAL_Y1216_g782);
			float3 m_Stochastic914_g782 = lerpResult1400_g782;
			float3 localfloat3switch914_g782 = float3switch914_g782( m_switch914_g782 , m_Standard914_g782 , m_Stochastic914_g782 );
			float3 RAIN_VERTICAL127_g782 = localfloat3switch914_g782;
			int m_switch1041_g741 = _SmoothnessCullModeWater;
			int m_switch1051_g741 = _SmoothnessModeWater;
			float2 uv_WaterNormal_NormalMap870_g741 = i.uv_texcoord;
			float3 NORMAL_WORLD_OUT506_g741 = normalize( (WorldNormalVector( i , UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, uv_WaterNormal_NormalMap870_g741 ), lerpResult1191_g741 ) )) );
			float3 temp_output_1106_0_g741 = ddx( NORMAL_WORLD_OUT506_g741 );
			float dotResult1088_g741 = dot( temp_output_1106_0_g741 , temp_output_1106_0_g741 );
			float3 temp_output_1087_0_g741 = ddy( NORMAL_WORLD_OUT506_g741 );
			float dotResult1114_g741 = dot( temp_output_1087_0_g741 , temp_output_1087_0_g741 );
			float temp_output_1102_0_g741 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult1088_g741 + dotResult1114_g741 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
			float4 m_Standard1051_g741 = float4( ( min( temp_output_1102_0_g741 , 0.5 ) * ( 1.0 - ( NORMAL_OUT504_g741 * float3( 0.79,0.79,0.79 ) ) ) ) , 0.0 );
			float4 m_Geometric1051_g741 = float4( ( temp_output_1102_0_g741 * ( 1.0 - NORMAL_OUT504_g741 ) ) , 0.0 );
			float4 localfloat4switch1051_g741 = float4switch1051_g741( m_switch1051_g741 , m_Standard1051_g741 , m_Geometric1051_g741 );
			float3 m_Standard1041_g741 = localfloat4switch1051_g741.xyz;
			float4 switchResult1059_g741 = (((i.ASEVFace>0)?(localfloat4switch1051_g741):(float4( 0,0,0,0 ))));
			float3 m_Cullfront1041_g741 = switchResult1059_g741.xyz;
			float4 switchResult1037_g741 = (((i.ASEVFace>0)?(float4( 1,0,0,0 )):(localfloat4switch1051_g741)));
			float3 m_Cullback1041_g741 = switchResult1037_g741.xyz;
			float3 localfloat3switch1041_g741 = float3switch1041_g741( m_switch1041_g741 , m_Standard1041_g741 , m_Cullfront1041_g741 , m_Cullback1041_g741 );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float fresnelNdotV1036_g741 = dot( NORMAL_WORLD_OUT506_g741, ase_worldlightDir );
			float fresnelNode1036_g741 = ( _SmoothnessBias + _SmoothnessScale * pow( max( 1.0 - fresnelNdotV1036_g741 , 0.0001 ), _SmoothnessPower ) );
			float clampResult1060_g741 = clamp( fresnelNode1036_g741 , 0.0 , 1.0 );
			float3 lerpResult1043_g741 = lerp( localfloat3switch1041_g741 , float3( 0,0,0 ) , ( clampResult1060_g741 * ( 1.0 - _SmoothnessFresnel ) ));
			float4 temp_output_23_0_g782 = float4( lerpResult1043_g741 , 0.0 );
			float4 lerpResult144_g782 = lerp( temp_output_23_0_g782 , ( temp_output_23_0_g782 * 0.05 ) , i.vertexColor.r);
			float4 temp_cast_34 = (0.7).xxxx;
			float4 SMOOTHNESS94_g782 = step( step( lerpResult144_g782 , temp_cast_34 ) , float4( 0,0,0,0 ) );
			float3 lerpResult42_g782 = lerp( RAIN_VERTICAL127_g782 , float3( 0,0,0 ) , SMOOTHNESS94_g782.xyz);
			float3 m_Active103_g782 = BlendNormals( temp_output_19_0_g782 , saturate( lerpResult42_g782 ) );
			float3 localfloat3switch103_g782 = float3switch103_g782( m_switch103_g782 , m_Off103_g782 , m_Active103_g782 );
			int m_switch1009_g782 = _Horizontal_RainMode;
			float3 m_Off1009_g782 = NORMAL_IN105_g782;
			int m_switch793_g782 = _Horizontal_ModeUV;
			float2 appendResult269_g782 = (float2(_Horizontal_TilingX , _Horizontal_TilingY));
			float2 HORIZONTAL_UV_TILING158_g782 = appendResult269_g782;
			float2 UV_TILING88_g784 = HORIZONTAL_UV_TILING158_g782;
			float2 appendResult271_g782 = (float2(_Horizontal_OffsetX , _Horizontal_OffsetY));
			float2 HORIZONTAL_UV_OFFSET159_g782 = appendResult271_g782;
			float2 UV_OFFSET94_g784 = HORIZONTAL_UV_OFFSET159_g782;
			float2 uv_TexCoord87_g784 = i.uv_texcoord * UV_TILING88_g784 + UV_OFFSET94_g784;
			float2 appendResult86_g784 = (float2(frac( uv_TexCoord87_g784.x ) , frac( uv_TexCoord87_g784.y )));
			float temp_output_52_0_g784 = _Horizontal_Columns;
			float temp_output_53_0_g784 = _Horizontal_Rows;
			float2 appendResult1_g784 = (float2(temp_output_52_0_g784 , temp_output_53_0_g784));
			float VERTICAL_FRAMES15_g784 = ( temp_output_52_0_g784 * temp_output_53_0_g784 );
			float2 appendResult49_g784 = (float2(VERTICAL_FRAMES15_g784 , temp_output_53_0_g784));
			float clampResult37_g784 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g784 - 1.0 ) );
			float temp_output_36_0_g784 = frac( ( ( ( _Time.y * _Horizontal_Speed ) + clampResult37_g784 ) / VERTICAL_FRAMES15_g784 ) );
			float2 appendResult31_g784 = (float2(temp_output_36_0_g784 , ( 1.0 - temp_output_36_0_g784 )));
			float2 UV_HORIZONTAL_DEFAULT_01817_g782 = ( ( ( appendResult86_g784 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g784 ) + ( floor( ( appendResult49_g784 * appendResult31_g784 ) ) / appendResult1_g784 ) );
			int m_switch1179_g782 = _Global_Rain_Enabled1178_g782;
			float m_Off1179_g782 = _Horizontal_Intensity;
			float m_Active1179_g782 = ( _Horizontal_Intensity * _Global_Rain_Intensity1174_g782 );
			float3 localfloatswitch1179_g782 = floatswitch1179_g782( m_switch1179_g782 , m_Off1179_g782 , m_Active1179_g782 );
			float3 _HORIZONTAL_INTENSITY814_g782 = localfloatswitch1179_g782;
			float2 UV_TILING88_g786 = ( HORIZONTAL_UV_TILING158_g782 / float2( 0.6,0.6 ) );
			float2 UV_OFFSET94_g786 = ( HORIZONTAL_UV_OFFSET159_g782 + float2( 0.3,0.3 ) );
			float2 uv_TexCoord87_g786 = i.uv_texcoord * UV_TILING88_g786 + UV_OFFSET94_g786;
			float2 appendResult86_g786 = (float2(frac( uv_TexCoord87_g786.x ) , frac( uv_TexCoord87_g786.y )));
			float temp_output_52_0_g786 = _Horizontal_Columns;
			float temp_output_53_0_g786 = _Horizontal_Rows;
			float2 appendResult1_g786 = (float2(temp_output_52_0_g786 , temp_output_53_0_g786));
			float VERTICAL_FRAMES15_g786 = ( temp_output_52_0_g786 * temp_output_53_0_g786 );
			float2 appendResult49_g786 = (float2(VERTICAL_FRAMES15_g786 , temp_output_53_0_g786));
			float clampResult37_g786 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g786 - 1.0 ) );
			float temp_output_36_0_g786 = frac( ( ( ( _Time.y * _Horizontal_Speed ) + clampResult37_g786 ) / VERTICAL_FRAMES15_g786 ) );
			float2 appendResult31_g786 = (float2(temp_output_36_0_g786 , ( 1.0 - temp_output_36_0_g786 )));
			float2 UV_HORIZONTAL_DEFAULT_02818_g782 = ( ( ( appendResult86_g786 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g786 ) + ( floor( ( appendResult49_g786 * appendResult31_g786 ) ) / appendResult1_g786 ) );
			float3 m_Standard793_g782 = BlendNormals( UnpackScaleNormal( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_01817_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_02818_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) );
			float localStochasticTiling800_g782 = ( 0.0 );
			float2 UV800_g782 = UV_HORIZONTAL_DEFAULT_01817_g782;
			float2 UV1800_g782 = float2( 0,0 );
			float2 UV2800_g782 = float2( 0,0 );
			float2 UV3800_g782 = float2( 0,0 );
			float W1800_g782 = 0.0;
			float W2800_g782 = 0.0;
			float W3800_g782 = 0.0;
			StochasticTiling( UV800_g782 , UV1800_g782 , UV2800_g782 , UV3800_g782 , W1800_g782 , W2800_g782 , W3800_g782 );
			float2 temp_output_804_0_g782 = ddx( UV_HORIZONTAL_DEFAULT_01817_g782 );
			float2 temp_output_797_0_g782 = ddy( UV_HORIZONTAL_DEFAULT_01817_g782 );
			float UV1_H1_W1805_g782 = W1800_g782;
			float UV1_H1_W2803_g782 = W2800_g782;
			float UV1_H1_W3812_g782 = W3800_g782;
			float localStochasticTiling781_g782 = ( 0.0 );
			float2 UV781_g782 = UV_HORIZONTAL_DEFAULT_02818_g782;
			float2 UV1781_g782 = float2( 0,0 );
			float2 UV2781_g782 = float2( 0,0 );
			float2 UV3781_g782 = float2( 0,0 );
			float W1781_g782 = 0.0;
			float W2781_g782 = 0.0;
			float W3781_g782 = 0.0;
			StochasticTiling( UV781_g782 , UV1781_g782 , UV2781_g782 , UV3781_g782 , W1781_g782 , W2781_g782 , W3781_g782 );
			float2 temp_output_788_0_g782 = ddx( UV_HORIZONTAL_DEFAULT_02818_g782 );
			float2 temp_output_777_0_g782 = ddy( UV_HORIZONTAL_DEFAULT_02818_g782 );
			float UV1_H2_W1789_g782 = W1781_g782;
			float UV1_H2_W2787_g782 = W2781_g782;
			float UV1_H2_W3785_g782 = W3781_g782;
			float3 m_Stochastic793_g782 = BlendNormals( ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1800_g782, temp_output_804_0_g782, temp_output_797_0_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) * UV1_H1_W1805_g782 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2800_g782, temp_output_804_0_g782, temp_output_797_0_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) * UV1_H1_W2803_g782 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3800_g782, temp_output_804_0_g782, temp_output_797_0_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) * UV1_H1_W3812_g782 ) ) ) , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1781_g782, temp_output_788_0_g782, temp_output_777_0_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) * UV1_H2_W1789_g782 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2781_g782, temp_output_788_0_g782, temp_output_777_0_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) * UV1_H2_W2787_g782 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3781_g782, temp_output_788_0_g782, temp_output_777_0_g782 ), _HORIZONTAL_INTENSITY814_g782.x ) * UV1_H2_W3785_g782 ) ) ) );
			float3 localfloat3switch793_g782 = float3switch793_g782( m_switch793_g782 , m_Standard793_g782 , m_Stochastic793_g782 );
			float _MASK_HORIZONTAL152_g782 = ( ase_worldNormal.y + 0.02 );
			float3 lerpResult279_g782 = lerp( float3( 1,1,1 ) , localfloat3switch793_g782 , _MASK_HORIZONTAL152_g782);
			float3 RAIN_HORIZONTAL123_g782 = lerpResult279_g782;
			float3 lerpResult1002_g782 = lerp( RAIN_HORIZONTAL123_g782 , float3( 0,0,0 ) , SMOOTHNESS94_g782.xyz);
			float3 m_Active1009_g782 = BlendNormals( temp_output_19_0_g782 , saturate( lerpResult1002_g782 ) );
			float3 localfloat3switch1009_g782 = float3switch1009_g782( m_switch1009_g782 , m_Off1009_g782 , m_Active1009_g782 );
			int m_switch1010_g782 = _Static_RainMode;
			float3 m_Off1010_g782 = NORMAL_IN105_g782;
			int m_switch992_g782 = _Static_ModeUV;
			float2 appendResult737_g782 = (float2(_Static_TilingX , _Static_TilingY));
			float2 appendResult738_g782 = (float2(_Static_OffsetX , _Static_OffsetY));
			float2 uv_TexCoord736_g782 = i.uv_texcoord * appendResult737_g782 + appendResult738_g782;
			float2 appendResult731_g782 = (float2(frac( uv_TexCoord736_g782.x ) , frac( uv_TexCoord736_g782.y )));
			float2 _STATIC_UV01_OUT990_g782 = ( appendResult731_g782 + ( (ase_screenPosNorm).xy * _Static_ScreenContribution ) );
			int m_switch1186_g782 = _Global_Rain_Enabled1178_g782;
			float m_Off1186_g782 = _Static_Intensity;
			float m_Active1186_g782 = ( _Static_Intensity * _Global_Rain_Intensity1174_g782 );
			float3 localfloatswitch1186_g782 = floatswitch1186_g782( m_switch1186_g782 , m_Off1186_g782 , m_Active1186_g782 );
			float3 _STATIC_INTENSITY991_g782 = localfloatswitch1186_g782;
			float3 m_Standard992_g782 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _Static_RainMap, sampler_trilinear_repeat, _STATIC_UV01_OUT990_g782 ), _STATIC_INTENSITY991_g782.x );
			float localStochasticTiling973_g782 = ( 0.0 );
			float2 UV973_g782 = _STATIC_UV01_OUT990_g782;
			float2 UV1973_g782 = float2( 0,0 );
			float2 UV2973_g782 = float2( 0,0 );
			float2 UV3973_g782 = float2( 0,0 );
			float W1973_g782 = 0.0;
			float W2973_g782 = 0.0;
			float W3973_g782 = 0.0;
			StochasticTiling( UV973_g782 , UV1973_g782 , UV2973_g782 , UV3973_g782 , W1973_g782 , W2973_g782 , W3973_g782 );
			float2 temp_output_977_0_g782 = ddx( _STATIC_UV01_OUT990_g782 );
			float2 temp_output_978_0_g782 = ddy( _STATIC_UV01_OUT990_g782 );
			float UV1_S1_W1975_g782 = W1973_g782;
			float UV1_S1_W2972_g782 = W2973_g782;
			float UV1_S1_W3976_g782 = W3973_g782;
			float3 m_Stochastic992_g782 = ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV1973_g782, temp_output_977_0_g782, temp_output_978_0_g782 ), _STATIC_INTENSITY991_g782.x ) * UV1_S1_W1975_g782 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV2973_g782, temp_output_977_0_g782, temp_output_978_0_g782 ), _STATIC_INTENSITY991_g782.x ) * UV1_S1_W2972_g782 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV3973_g782, temp_output_977_0_g782, temp_output_978_0_g782 ), _STATIC_INTENSITY991_g782.x ) * UV1_S1_W3976_g782 ) ) );
			float3 localfloat3switch992_g782 = float3switch992_g782( m_switch992_g782 , m_Standard992_g782 , m_Stochastic992_g782 );
			float3 RAIN_STATIC743_g782 = localfloat3switch992_g782;
			float3 lerpResult1005_g782 = lerp( RAIN_STATIC743_g782 , float3( 0,0,0 ) , SMOOTHNESS94_g782.xyz);
			float3 m_Active1010_g782 = BlendNormals( temp_output_19_0_g782 , lerpResult1005_g782 );
			float3 localfloat3switch1010_g782 = float3switch1010_g782( m_switch1010_g782 , m_Off1010_g782 , m_Active1010_g782 );
			o.Normal = ( localfloat3switch103_g782 + localfloat3switch1009_g782 + localfloat3switch1010_g782 );
			int REFLECTION_MODE65_g748 = _Reflection_Mode;
			int m_switch92_g748 = REFLECTION_MODE65_g748;
			float screenDepth1198_g741 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth1198_g741 = abs( ( screenDepth1198_g741 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _ShorelineDepth ) );
			float4 lerpResult25_g741 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth1198_g741*1.0 + _ShorelineOffset) ));
			float4 lerpResult27_g741 = lerp( _DepthTint , lerpResult25_g741 , saturate( (distanceDepth1198_g741*-1.0 + _DepthOffset) ));
			float4 COLOR_TINT161_g741 = lerpResult27_g741;
			float REFACTED_SCALE_FLOAT78_g750 = _RefractionScale;
			float3 NORMAL_OUT_Z505_g741 = localfloat3switch932_g741;
			float3 NORMAL_IN84_g750 = NORMAL_OUT_Z505_g741;
			float3 tangentSpaceNormal55_g750 = ( REFACTED_SCALE_FLOAT78_g750 * NORMAL_IN84_g750 );
			float4 screenPos55_g750 = ase_screenPos;
			float2 uv55_g750 = _CameraDepthTexture_TexelSize.xy;
			float localGetRefractedDepth55_g750 = GetRefractedDepth55_g750( tangentSpaceNormal55_g750 , screenPos55_g750 , uv55_g750 );
			float2 uv61_g750 = uv55_g750;
			float2 localAlignWithGrabTexel61_g750 = AlignWithGrabTexel( uv61_g750 );
			float4 screenColor53_g750 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,localAlignWithGrabTexel61_g750);
			float4 REFRACTED_DEPTH144_g741 = screenColor53_g750;
			float temp_output_20_0_g741 = ( i.vertexColor.a * ( 1.0 - _Opacity ) );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g741 = 0.0;
			#else
				float staticSwitch37_g741 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth1198_g741*-5.0 + 1.0) ) ) ) * temp_output_20_0_g741 ) );
			#endif
			float DEPTH_TINT_ALPHA93_g741 = staticSwitch37_g741;
			float4 lerpResult105_g741 = lerp( COLOR_TINT161_g741 , REFRACTED_DEPTH144_g741 , DEPTH_TINT_ALPHA93_g741);
			float4 temp_output_1194_0_g741 = ( ( FOAM_OFFSHORE655_g741 + FOAM_SHORELINE654_g741 ) + lerpResult105_g741 );
			float4 ALBEDO_IN60_g748 = temp_output_1194_0_g741;
			float4 m_Off92_g748 = ALBEDO_IN60_g748;
			int m_switch95_g748 = _Reflection_FresnelMode;
			float3 NORMAL_IN54_g748 = NORMAL_OUT_Z505_g741;
			float2 temp_cast_52 = (-_Reflection_BumpClamp).xx;
			float2 temp_cast_53 = (_Reflection_BumpClamp).xx;
			float2 clampResult29_g748 = clamp( ( (NORMAL_IN54_g748).xy * _Reflection_BumpScale ) , temp_cast_52 , temp_cast_53 );
			float2 REFLECTION_BUMP9_g748 = clampResult29_g748;
			float4 texCUBENode31_g748 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g748 ,  0.0 ) + WorldReflectionVector( i , NORMAL_IN54_g748 ) + _Reflection_Wobble ), ( 1.0 - _Reflection_Smoothness ) );
			float4 temp_cast_55 = (texCUBENode31_g748.r).xxxx;
			float REFLECTION_CLOUD12_g748 = _Reflection_Cloud;
			float4 lerpResult49_g748 = lerp( texCUBENode31_g748 , temp_cast_55 , REFLECTION_CLOUD12_g748);
			float4 m_Off95_g748 = lerpResult49_g748;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float fresnelNdotV23_g748 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode23_g748 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g748 , 0.0001 ), 5.0 ) );
			float REFLECTION_FRESNEL11_g748 = ( _Reflection_FresnelStrength * fresnelNode23_g748 );
			float4 lerpResult73_g748 = lerp( float4( 0,0,0,0 ) , lerpResult49_g748 , REFLECTION_FRESNEL11_g748);
			float4 m_Active95_g748 = lerpResult73_g748;
			float4 localfloat4switch95_g748 = float4switch95_g748( m_switch95_g748 , m_Off95_g748 , m_Active95_g748 );
			float4 switchResult100_g748 = (((i.ASEVFace>0)?(localfloat4switch95_g748):(float4( 0,0,0,0 ))));
			float4 m_Active92_g748 = ( ( ( 1.0 - 0.5 ) * switchResult100_g748 ) + ( ALBEDO_IN60_g748 * 0.5 ) );
			float4 localfloat4switch92_g748 = float4switch92_g748( m_switch92_g748 , m_Off92_g748 , m_Active92_g748 );
			float4 temp_cast_58 = (0.0).xxxx;
			#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch105_g748 = temp_cast_58;
			#else
				float4 staticSwitch105_g748 = localfloat4switch92_g748;
			#endif
			float4 temp_output_746_0_g782 = staticSwitch105_g748;
			o.Albedo = ( temp_output_746_0_g782 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
			int m_switch1437_g782 = _Global_Rain_Enabled1178_g782;
			float m_Off1437_g782 = temp_output_23_0_g782.x;
			float _Global_Rain_Wetness1431_g782 = _Global_Rain_Wetness;
			float m_Active1437_g782 = saturate( ( temp_output_23_0_g782 + _Global_Rain_Wetness1431_g782 ) ).x;
			float3 localfloatswitch1437_g782 = floatswitch1437_g782( m_switch1437_g782 , m_Off1437_g782 , m_Active1437_g782 );
			o.Smoothness = localfloatswitch1437_g782.x;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;1197.745;3212.922;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;907;203.1788,-3221.381;Inherit;False;346.3333;120;Header;1;700;;0.2565255,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;844;199.208,-3064.666;Inherit;False;347.5028;191.4201;;2;698;894;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;843;204.0305,-3348.07;Inherit;False;352;119;Header;1;207;GLOBAL SETTINGS ;0.1597269,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;899;-657.8823,-2873.492;Inherit;False;DECSF Master Map Water Standard;4;;741;e9180da13cd3dd44380a8c2f4a746da6;1,1202,1;0;3;FLOAT4;0;FLOAT3;123;FLOAT3;122
Node;AmplifyShaderEditor.IntNode;698;205.3818,-3024.394;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;209.2546,-2952.422;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;906;-263.245,-2867.922;Inherit;False;DECSF Module Rain;67;;782;794acd4ff0c67c64dae9e89693bd5acf;0;3;746;FLOAT4;0,0,0,0;False;19;FLOAT3;0,0,1;False;23;FLOAT4;1,0,0,0;False;3;FLOAT4;747;FLOAT3;0;FLOAT3;229
Node;AmplifyShaderEditor.IntNode;207;217.0131,-3310.746;Float;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;700;215.1788,-3179.381;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;198.1309,-2867.459;Float;False;True;-1;6;;200;0;Standard;DEC/Rain/Rain Water Lake;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;False;True;True;True;False;Back;0;True;700;3;False;697;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;-20;True;Opaque;;Transparent;All;14;all;True;True;True;True;0;True;698;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;18;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;106;-1;-1;-1;0;True;0;0;True;207;-1;0;False;-1;0;1;;0;False;0.1;False;-1;0;True;894;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;906;746;899;0
WireConnection;906;19;899;123
WireConnection;906;23;899;122
WireConnection;0;0;906;747
WireConnection;0;1;906;0
WireConnection;0;4;906;229
ASEEND*/
//CHKSM=9E4ADC4275B48F0DE1DC138B1312D6DEE2802B04