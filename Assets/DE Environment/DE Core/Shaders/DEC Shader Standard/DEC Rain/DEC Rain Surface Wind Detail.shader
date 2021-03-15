// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Rain/Rain Surface Wind Detail"
{
	Properties
	{
		[Header(VERSION 1.4.0 STANDARD)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
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
		_Static_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		[Enum(Standard,0,Stochastic,1)]_Static_ModeUV("Mode UV", Int) = 0
		_Static_TilingX("Tiling X", Float) = 1
		_Static_TilingY("Tiling Y", Float) = 1
		_Static_OffsetX("Offset X", Float) = 0
		_Static_OffsetY("Offset Y", Float) = 0
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Wind Strength", Float) = 1
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
		_WindMask_Procedural_Intensity("Mask Intensity", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
		[Header(Forward Rendering Options)]
		[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry-10" "IgnoreProjector" = "True" "NatureRendererInstancing"="True" }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		ColorMask [_ColorMask]
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
		#pragma target 3.5
		#pragma shader_feature _SPECULARHIGHLIGHTS_OFF
		#pragma shader_feature _GLOSSYREFLECTIONS_OFF
		#pragma multi_compile_instancing
		#pragma instancing_options procedural:SetupNatureRenderer forwardadd
		#pragma multi_compile GPU_FRUSTUM_ON __
		#include "Nature Renderer.cginc"
		#pragma multi_compile_local _ NATURE_RENDERER
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
		#endif//ASE Sampling Macros

		#pragma surface surf Standard keepalpha addshadow fullforwardshadows dithercrossfade vertex:vertexDataFunc 
		struct Input
		{
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float3 worldPos;
			float4 screenPos;
		};

		uniform int _ColorMask;
		uniform float _Horizontal_Intensity;
		uniform float _Vertical_Intensity;
		uniform int _CullMode;
		uniform int _ZWriteMode;
		uniform int _WindMode;
		uniform int _WindMask_Texture;
		uniform int _WindMask_Procedural;
		uniform float _GlobalWindInfluenceOther;
		uniform float _Global_Wind_Main_Intensity;
		uniform float _LocalWindStrength;
		uniform float _Global_Wind_Main_RandomOffset;
		uniform float _LocalRandomWindOffset;
		uniform float _Global_Wind_Main_Pulse;
		uniform float _LocalWindPulse;
		uniform float _Global_Wind_Main_Direction;
		uniform float _LocalWindDirection;
		uniform float _WindMask_Offset1;
		uniform float _WindMask_Procedural_Intensity;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_WindMask_Map);
		uniform float4 _WindMask_Map_ST;
		SamplerState sampler_trilinear_repeat;
		uniform float _WindMask_Texture_Intensity;
		uniform int _Vertical_RainMode;
		uniform int _EnableDetailMap;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform int _TillingMode;
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		uniform half _NormalStrength;
		uniform int _EnableDetailMask;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailNormalMap);
		uniform int _TillingModeDetail;
		uniform float _DetailTilingXDetail;
		uniform float _DetailTilingYDetail;
		uniform half _DetailOffsetXDetail;
		uniform half _DetailOffsetYDetail;
		uniform half _DetailNormalMapScale;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailMaskMap);
		uniform float _DetailTilingXDetailMask;
		uniform float _DetailTilingYDetailMask;
		uniform half _DetailOffsetXDetailMask;
		uniform half _DetailOffsetYDetailMask;
		uniform float4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _Brightness;
		uniform half _DetailBlendInfluence;
		uniform half _DetailBlendHeight;
		uniform half _DetailBlendSmooth;
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
		uniform float _SmoothnessStrength;
		uniform int _SmoothnessType;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
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
		uniform half4 _ColorDetail;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailAlbedoMap);
		uniform half _DetailBrightness;
		uniform float _WindMask_TextureVisualize;
		uniform float _WindMask_ProceduralVisualize;
		uniform float _Rain_WetnessDarken;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Metal);
		uniform half _Global_Rain_Wetness;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;


		float floatswitch2458_g3243( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2468_g3243( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2312_g3243( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2456_g3243( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2655_g3243( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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


		float3 float3switch2966_g3243( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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


		float3 float3switch2527_g3243( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch2453_g3243( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		float2 float2switch214_g3248( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float2 float2switch393_g3248( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float3 float3switch467_g3248( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch502_g3248( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 floatswitch1190_g3413( int m_switch, float m_Off, float m_Active )
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


		float3 float3switch914_g3413( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float4 float4switch547_g3248( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float3 float3switch103_g3413( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 floatswitch1179_g3413( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		float3 float3switch793_g3413( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float3 float3switch1009_g3413( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 floatswitch1186_g3413( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		float3 float3switch992_g3413( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float3 float3switch1010_g3413( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float4 float4switch476_g3248( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch506_g3248( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2972_g3243( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2982_g3243( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2986_g3243( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2991_g3243( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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


		float3 floatswitch1437_g3413( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			int m_switch2453_g3243 = _WindMode;
			float3 m_Off2453_g3243 = float3(0,0,0);
			int m_switch2527_g3243 = _WindMask_Texture;
			int _MASK_MODE_PROCEDRAL2677_g3243 = _WindMask_Procedural;
			int m_switch2966_g3243 = _MASK_MODE_PROCEDRAL2677_g3243;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VAR_VERTEXPOSITION_MATRIX2352_g3243 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 break2265_g3243 = VAR_VERTEXPOSITION_MATRIX2352_g3243;
			int _WIND_MODE2462_g3243 = _WindMode;
			int m_switch2458_g3243 = _WIND_MODE2462_g3243;
			float m_Off2458_g3243 = 1.0;
			float _Global_Wind_Main_Intensity2403_g3243 = _Global_Wind_Main_Intensity;
			float m_Global2458_g3243 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3243 );
			float m_Local2458_g3243 = _LocalWindStrength;
			float localfloatswitch2458_g3243 = floatswitch2458_g3243( m_switch2458_g3243 , m_Off2458_g3243 , m_Global2458_g3243 , m_Local2458_g3243 );
			float VAR_WindStrength2400_g3243 = localfloatswitch2458_g3243;
			int m_switch2468_g3243 = _WIND_MODE2462_g3243;
			float m_Off2468_g3243 = 1.0;
			float _Global_Wind_Main_RandomOffset2378_g3243 = _Global_Wind_Main_RandomOffset;
			float m_Global2468_g3243 = _Global_Wind_Main_RandomOffset2378_g3243;
			float m_Local2468_g3243 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3243 = floatswitch2468_g3243( m_switch2468_g3243 , m_Off2468_g3243 , m_Global2468_g3243 , m_Local2468_g3243 );
			float VAR_WindOffset2419_g3243 = localfloatswitch2468_g3243;
			float4 transform2423_g3243 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3243 = (float2(transform2423_g3243.x , transform2423_g3243.z));
			float dotResult2341_g3243 = dot( appendResult2307_g3243 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3243 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3243 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3243 ) * 43758.55 ) ));
			float VAR_RandomTime2244_g3243 = ( _Time.x * lerpResult2238_g3243 );
			float FUNC_Turbulence2274_g3243 = ( sin( ( ( VAR_RandomTime2244_g3243 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3243.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3243 = _WIND_MODE2462_g3243;
			float m_Off2312_g3243 = 1.0;
			float _Global_Wind_Main_Pulse2302_g3243 = _Global_Wind_Main_Pulse;
			float m_Global2312_g3243 = _Global_Wind_Main_Pulse2302_g3243;
			float m_Local2312_g3243 = _LocalWindPulse;
			float localfloatswitch2312_g3243 = floatswitch2312_g3243( m_switch2312_g3243 , m_Off2312_g3243 , m_Global2312_g3243 , m_Local2312_g3243 );
			float VAR_WindPulse2421_g3243 = localfloatswitch2312_g3243;
			float FUNC_Angle2470_g3243 = ( VAR_WindStrength2400_g3243 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3243 * 2.0 ) + FUNC_Turbulence2274_g3243 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3243.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * VAR_WindPulse2421_g3243 );
			float VAR_SinA2424_g3243 = sin( FUNC_Angle2470_g3243 );
			float VAR_CosA2362_g3243 = cos( FUNC_Angle2470_g3243 );
			int m_switch2456_g3243 = _WIND_MODE2462_g3243;
			float m_Off2456_g3243 = 1.0;
			float _Global_Wind_Main_Direction2350_g3243 = _Global_Wind_Main_Direction;
			float m_Global2456_g3243 = _Global_Wind_Main_Direction2350_g3243;
			float m_Local2456_g3243 = _LocalWindDirection;
			float localfloatswitch2456_g3243 = floatswitch2456_g3243( m_switch2456_g3243 , m_Off2456_g3243 , m_Global2456_g3243 , m_Local2456_g3243 );
			float _WindDirection2249_g3243 = localfloatswitch2456_g3243;
			float2 localDirectionalEquation2249_g3243 = DirectionalEquation( _WindDirection2249_g3243 );
			float2 break2469_g3243 = localDirectionalEquation2249_g3243;
			float VAR_xLerp2418_g3243 = break2469_g3243.x;
			float lerpResult2258_g3243 = lerp( break2265_g3243.x , ( ( break2265_g3243.y * VAR_SinA2424_g3243 ) + ( break2265_g3243.x * VAR_CosA2362_g3243 ) ) , VAR_xLerp2418_g3243);
			float3 break2340_g3243 = VAR_VERTEXPOSITION_MATRIX2352_g3243;
			float3 break2233_g3243 = VAR_VERTEXPOSITION_MATRIX2352_g3243;
			float VAR_zLerp2416_g3243 = break2469_g3243.y;
			float lerpResult2275_g3243 = lerp( break2233_g3243.z , ( ( break2233_g3243.y * VAR_SinA2424_g3243 ) + ( break2233_g3243.z * VAR_CosA2362_g3243 ) ) , VAR_zLerp2416_g3243);
			float3 appendResult2235_g3243 = (float3(lerpResult2258_g3243 , ( ( break2340_g3243.y * VAR_CosA2362_g3243 ) - ( break2340_g3243.z * VAR_SinA2424_g3243 ) ) , lerpResult2275_g3243));
			float3 VAR_VERTEXPOSITION2354_g3243 = ase_vertex3Pos;
			float3 FUNC_vertexPos2282_g3243 = ( mul( unity_WorldToObject, float4( appendResult2235_g3243 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3243 );
			float3 WIND_FINAL2753_g3243 = FUNC_vertexPos2282_g3243;
			float3 m_Off2966_g3243 = WIND_FINAL2753_g3243;
			int m_switch2655_g3243 = _WindMask_Procedural;
			float m_Off2655_g3243 = 0.0;
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float MASK_OFFSET2670_g3243 = _WindMask_Offset1;
			float temp_output_2957_0_g3243 = ( 1.0 - MASK_OFFSET2670_g3243 );
			float m_TopDown2655_g3243 = ( ( ase_worldNormal.y - temp_output_2957_0_g3243 ) - 0.05 );
			float m_BottomUp2655_g3243 = ( -( ase_worldNormal.y + temp_output_2957_0_g3243 ) - 0.05 );
			float3 temp_cast_4 = (0.5).xxx;
			float3 break2635_g3243 = ( abs( ase_worldNormal ) - temp_cast_4 );
			float dotResult2928_g3243 = dot( ( MASK_OFFSET2670_g3243 + break2635_g3243.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3243 ) + -0.5 ) - break2635_g3243.y ) );
			float m_SideWall2655_g3243 = dotResult2928_g3243;
			float dotResult2921_g3243 = dot( ( MASK_OFFSET2670_g3243 + break2635_g3243.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3243 ) + break2635_g3243.z + -0.75 ) );
			float m_Spherical2655_g3243 = dotResult2921_g3243;
			float m_Spherical_Inverted2655_g3243 = -dotResult2921_g3243;
			float localfloatswitch2655_g3243 = floatswitch2655_g3243( m_switch2655_g3243 , m_Off2655_g3243 , m_TopDown2655_g3243 , m_BottomUp2655_g3243 , m_SideWall2655_g3243 , m_Spherical2655_g3243 , m_Spherical_Inverted2655_g3243 );
			float temp_output_2915_0_g3243 = ( localfloatswitch2655_g3243 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3243 = (float3(temp_output_2915_0_g3243 , temp_output_2915_0_g3243 , temp_output_2915_0_g3243));
			float3 lerpResult2917_g3243 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3243 , appendResult2916_g3243);
			float3 m_TopDown2966_g3243 = lerpResult2917_g3243;
			float3 m_BottomUp2966_g3243 = lerpResult2917_g3243;
			float3 m_SideWall2966_g3243 = lerpResult2917_g3243;
			float3 m_Spherical2966_g3243 = lerpResult2917_g3243;
			float3 m_Spherical_Inverted2966_g3243 = lerpResult2917_g3243;
			float3 localfloat3switch2966_g3243 = float3switch2966_g3243( m_switch2966_g3243 , m_Off2966_g3243 , m_TopDown2966_g3243 , m_BottomUp2966_g3243 , m_SideWall2966_g3243 , m_Spherical2966_g3243 , m_Spherical_Inverted2966_g3243 );
			float3 m_Off2527_g3243 = localfloat3switch2966_g3243;
			float2 uv_WindMask_Map = v.texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3243 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
			float3 appendResult2744_g3243 = (float3(tex2DNode2742_g3243.r , tex2DNode2742_g3243.r , tex2DNode2742_g3243.r));
			float3 temp_output_2910_0_g3243 = ( appendResult2744_g3243 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float3 m_Active2527_g3243 = ( localfloat3switch2966_g3243 * temp_output_2910_0_g3243 );
			float3 localfloat3switch2527_g3243 = float3switch2527_g3243( m_switch2527_g3243 , m_Off2527_g3243 , m_Active2527_g3243 );
			float3 WIND_MASK2748_g3243 = localfloat3switch2527_g3243;
			float3 m_Global2453_g3243 = WIND_MASK2748_g3243;
			float3 m_Local2453_g3243 = WIND_MASK2748_g3243;
			float3 localfloat3switch2453_g3243 = float3switch2453_g3243( m_switch2453_g3243 , m_Off2453_g3243 , m_Global2453_g3243 , m_Local2453_g3243 );
			float3 temp_output_538_0_g3248 = localfloat3switch2453_g3243;
			v.vertex.xyz += temp_output_538_0_g3248;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch103_g3413 = _Vertical_RainMode;
			int SURFACE_MAP_MODE456_g3248 = _EnableDetailMap;
			int m_switch502_g3248 = SURFACE_MAP_MODE456_g3248;
			int TILLING_MODE190_g3248 = _TillingMode;
			int m_switch214_g3248 = TILLING_MODE190_g3248;
			float2 appendResult192_g3248 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3248 = appendResult192_g3248;
			float2 m_Standard214_g3248 = TEXTURE_TILLING200_g3248;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3248 = ase_parentObjectScale;
			float2 appendResult205_g3248 = (float2(break206_g3248.z , break206_g3248.y));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 normalizeResult194_g3248 = normalize( ase_vertexNormal );
			float3 break201_g3248 = normalizeResult194_g3248;
			float2 appendResult204_g3248 = (float2(break206_g3248.x , break206_g3248.z));
			float2 appendResult193_g3248 = (float2(break206_g3248.x , break206_g3248.y));
			float2 TEXTURE_TILLING_SCALE210_g3248 = ( ( ( appendResult205_g3248 * break201_g3248.x ) + ( break201_g3248.y * appendResult204_g3248 ) + ( break201_g3248.z * appendResult193_g3248 ) ) * TEXTURE_TILLING200_g3248 );
			float2 m_Scale214_g3248 = TEXTURE_TILLING_SCALE210_g3248;
			float2 localfloat2switch214_g3248 = float2switch214_g3248( m_switch214_g3248 , m_Standard214_g3248 , m_Scale214_g3248 );
			float2 appendResult166_g3248 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3248 = i.uv_texcoord * localfloat2switch214_g3248 + appendResult166_g3248;
			float3 NORMAL_OUT23_g3248 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, uv_TexCoord165_g3248 ), _NormalStrength );
			float3 m_Off502_g3248 = NORMAL_OUT23_g3248;
			int EnableDetailMask428_g3248 = _EnableDetailMask;
			int m_switch467_g3248 = EnableDetailMask428_g3248;
			int TILLING_MODE_DETAIL435_g3248 = _TillingModeDetail;
			int m_switch393_g3248 = TILLING_MODE_DETAIL435_g3248;
			float2 appendResult432_g3248 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
			float2 TEXTURE_TILLING_DETAIL425_g3248 = appendResult432_g3248;
			float2 m_Standard393_g3248 = TEXTURE_TILLING_DETAIL425_g3248;
			float3 break420_g3248 = ase_parentObjectScale;
			float2 appendResult448_g3248 = (float2(break420_g3248.z , break420_g3248.y));
			float3 normalizeResult480_g3248 = normalize( ase_vertexNormal );
			float3 break431_g3248 = normalizeResult480_g3248;
			float2 appendResult426_g3248 = (float2(break420_g3248.x , break420_g3248.z));
			float2 appendResult433_g3248 = (float2(break420_g3248.x , break420_g3248.y));
			float2 TEXTURE_TILLING_SCALE_DETAIL427_g3248 = ( ( ( appendResult448_g3248 * break431_g3248.x ) + ( break431_g3248.y * appendResult426_g3248 ) + ( break431_g3248.z * appendResult433_g3248 ) ) * TEXTURE_TILLING_DETAIL425_g3248 );
			float2 m_Scale393_g3248 = TEXTURE_TILLING_SCALE_DETAIL427_g3248;
			float2 localfloat2switch393_g3248 = float2switch393_g3248( m_switch393_g3248 , m_Standard393_g3248 , m_Scale393_g3248 );
			float2 appendResult394_g3248 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
			float2 uv_TexCoord414_g3248 = i.uv_texcoord * localfloat2switch393_g3248 + appendResult394_g3248;
			float3 NORMAL_OUT_DETAIL491_g3248 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, uv_TexCoord414_g3248 ), _DetailNormalMapScale );
			float3 m_Off467_g3248 = NORMAL_OUT_DETAIL491_g3248;
			float2 appendResult445_g3248 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
			float2 appendResult417_g3248 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
			float2 uv_TexCoord415_g3248 = i.uv_texcoord * appendResult445_g3248 + appendResult417_g3248;
			float4 tex2DNode418_g3248 = SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, uv_TexCoord415_g3248 );
			float3 lerpResult470_g3248 = lerp( NORMAL_OUT23_g3248 , NORMAL_OUT_DETAIL491_g3248 , tex2DNode418_g3248.r);
			float3 m_Active467_g3248 = saturate( lerpResult470_g3248 );
			float3 localfloat3switch467_g3248 = float3switch467_g3248( m_switch467_g3248 , m_Off467_g3248 , m_Active467_g3248 );
			float3 MASK_NORMAL_OUT469_g3248 = localfloat3switch467_g3248;
			float4 tex2DNode35_g3248 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, uv_TexCoord165_g3248 );
			float4 temp_output_159_0_g3248 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3248 * _Brightness );
			float4 ALBEDO_OUT91_g3248 = temp_output_159_0_g3248;
			float4 break462_g3248 = ALBEDO_OUT91_g3248;
			float ALBEDO_IN_XYZ464_g3248 = ( break462_g3248.r + break462_g3248.g + break462_g3248.b );
			float clampResult486_g3248 = clamp( ( ( ( ( ALBEDO_IN_XYZ464_g3248 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( i.vertexColor.r - ( _DetailBlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
			float DETAIL_BLEND396_g3248 = clampResult486_g3248;
			float3 lerpResult498_g3248 = lerp( MASK_NORMAL_OUT469_g3248 , NORMAL_OUT23_g3248 , DETAIL_BLEND396_g3248);
			float3 m_Active502_g3248 = ( NORMAL_OUT23_g3248 + saturate( lerpResult498_g3248 ) );
			float3 localfloat3switch502_g3248 = float3switch502_g3248( m_switch502_g3248 , m_Off502_g3248 , m_Active502_g3248 );
			float3 temp_output_19_0_g3413 = localfloat3switch502_g3248;
			float3 NORMAL_IN105_g3413 = temp_output_19_0_g3413;
			float3 m_Off103_g3413 = NORMAL_IN105_g3413;
			int m_switch914_g3413 = _Vertical__ModeUV;
			float2 appendResult259_g3413 = (float2(_Vertical_TilingX , _Vertical_TilingY));
			float2 VERTICAL_UV_TILING377_g3413 = appendResult259_g3413;
			float2 UV_TILING88_g3414 = VERTICAL_UV_TILING377_g3413;
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 transform125_g3414 = mul(unity_ObjectToWorld,float4( ase_vertex3Pos , 0.0 ));
			float2 appendResult129_g3414 = (float2(-transform125_g3414.x , transform125_g3414.y));
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float temp_output_52_0_g3414 = _Vertical_Columns;
			float temp_output_53_0_g3414 = _Vertical_Rows;
			float2 appendResult1_g3414 = (float2(temp_output_52_0_g3414 , temp_output_53_0_g3414));
			float VERTICAL_FRAMES15_g3414 = ( temp_output_52_0_g3414 * temp_output_53_0_g3414 );
			float2 appendResult49_g3414 = (float2(VERTICAL_FRAMES15_g3414 , temp_output_53_0_g3414));
			float clampResult37_g3414 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g3414 - 1.0 ) );
			float temp_output_36_0_g3414 = frac( ( ( ( _Time.y * _Vertical_Speed ) + clampResult37_g3414 ) / VERTICAL_FRAMES15_g3414 ) );
			float2 appendResult31_g3414 = (float2(temp_output_36_0_g3414 , ( 1.0 - temp_output_36_0_g3414 )));
			float2 _UV_VERTICAL_X_DOWN863_g3413 = ( ( ( ( UV_TILING88_g3414 * appendResult129_g3414 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g3414 ) + ( floor( ( appendResult49_g3414 * appendResult31_g3414 ) ) / appendResult1_g3414 ) );
			int _Global_Rain_Enabled1178_g3413 = _Global_Rain_Enabled;
			int m_switch1190_g3413 = _Global_Rain_Enabled1178_g3413;
			float m_Off1190_g3413 = _Vertical_Intensity;
			float _Global_Rain_Intensity1174_g3413 = _Global_Rain_Intensity;
			float m_Active1190_g3413 = ( _Vertical_Intensity * _Global_Rain_Intensity1174_g3413 );
			float3 localfloatswitch1190_g3413 = floatswitch1190_g3413( m_switch1190_g3413 , m_Off1190_g3413 , m_Active1190_g3413 );
			float3 _VERTICAL_INTENSITY861_g3413 = localfloatswitch1190_g3413;
			float3 temp_cast_5 = (0.5).xxx;
			float3 break149_g3413 = ( abs( ase_worldNormal ) - temp_cast_5 );
			float _MASK_VERTICAL_Z1241_g3413 = ( break149_g3413.z + 0.5 );
			float3 lerpResult1138_g3413 = lerp( float3( 1,1,1 ) , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_X_DOWN863_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) , _MASK_VERTICAL_Z1241_g3413);
			float2 UV_TILING88_g3416 = VERTICAL_UV_TILING377_g3413;
			float4 transform125_g3416 = mul(unity_ObjectToWorld,float4( ase_vertex3Pos , 0.0 ));
			float2 appendResult115_g3416 = (float2(transform125_g3416.z , transform125_g3416.y));
			float temp_output_52_0_g3416 = _Vertical_Columns;
			float temp_output_53_0_g3416 = _Vertical_Rows;
			float2 appendResult1_g3416 = (float2(temp_output_52_0_g3416 , temp_output_53_0_g3416));
			float VERTICAL_FRAMES15_g3416 = ( temp_output_52_0_g3416 * temp_output_53_0_g3416 );
			float2 appendResult49_g3416 = (float2(VERTICAL_FRAMES15_g3416 , temp_output_53_0_g3416));
			float clampResult37_g3416 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g3416 - 1.0 ) );
			float temp_output_36_0_g3416 = frac( ( ( ( _Time.y * _Vertical_Speed ) + clampResult37_g3416 ) / VERTICAL_FRAMES15_g3416 ) );
			float2 appendResult31_g3416 = (float2(temp_output_36_0_g3416 , ( 1.0 - temp_output_36_0_g3416 )));
			float2 _UV_VERTICAL_Y_DOWN870_g3413 = ( ( ( ( UV_TILING88_g3416 * appendResult115_g3416 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g3416 ) + ( floor( ( appendResult49_g3416 * appendResult31_g3416 ) ) / appendResult1_g3416 ) );
			float _MASK_VERTICAL_X151_g3413 = ( break149_g3413.x + 0.45 );
			float3 lerpResult1261_g3413 = lerp( float3( 1,1,1 ) , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_Y_DOWN870_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) , _MASK_VERTICAL_X151_g3413);
			float _MASK_VERTICAL_Y1216_g3413 = ( -break149_g3413.y + 0.45 );
			float3 lerpResult1390_g3413 = lerp( lerpResult1138_g3413 , BlendNormals( lerpResult1138_g3413 , lerpResult1261_g3413 ) , _MASK_VERTICAL_Y1216_g3413);
			float3 m_Standard914_g3413 = lerpResult1390_g3413;
			float localStochasticTiling895_g3413 = ( 0.0 );
			float2 UV895_g3413 = _UV_VERTICAL_X_DOWN863_g3413;
			float2 UV1895_g3413 = float2( 0,0 );
			float2 UV2895_g3413 = float2( 0,0 );
			float2 UV3895_g3413 = float2( 0,0 );
			float W1895_g3413 = 0.0;
			float W2895_g3413 = 0.0;
			float W3895_g3413 = 0.0;
			StochasticTiling( UV895_g3413 , UV1895_g3413 , UV2895_g3413 , UV3895_g3413 , W1895_g3413 , W2895_g3413 , W3895_g3413 );
			float2 temp_output_906_0_g3413 = ddx( _UV_VERTICAL_X_DOWN863_g3413 );
			float2 temp_output_886_0_g3413 = ddy( _UV_VERTICAL_X_DOWN863_g3413 );
			float UV1_V1_W1887_g3413 = W1895_g3413;
			float UV1_V1_W2897_g3413 = W2895_g3413;
			float UV1_V1_W3926_g3413 = W3895_g3413;
			float3 lerpResult950_g3413 = lerp( float3( 1,1,1 ) , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1895_g3413, temp_output_906_0_g3413, temp_output_886_0_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) * UV1_V1_W1887_g3413 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2895_g3413, temp_output_906_0_g3413, temp_output_886_0_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) * UV1_V1_W2897_g3413 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3895_g3413, temp_output_906_0_g3413, temp_output_886_0_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) * UV1_V1_W3926_g3413 ) ) ) , _MASK_VERTICAL_Z1241_g3413);
			float localStochasticTiling865_g3413 = ( 0.0 );
			float2 UV865_g3413 = _UV_VERTICAL_Y_DOWN870_g3413;
			float2 UV1865_g3413 = float2( 0,0 );
			float2 UV2865_g3413 = float2( 0,0 );
			float2 UV3865_g3413 = float2( 0,0 );
			float W1865_g3413 = 0.0;
			float W2865_g3413 = 0.0;
			float W3865_g3413 = 0.0;
			StochasticTiling( UV865_g3413 , UV1865_g3413 , UV2865_g3413 , UV3865_g3413 , W1865_g3413 , W2865_g3413 , W3865_g3413 );
			float2 temp_output_883_0_g3413 = ddx( _UV_VERTICAL_Y_DOWN870_g3413 );
			float2 temp_output_894_0_g3413 = ddy( _UV_VERTICAL_Y_DOWN870_g3413 );
			float UV1_V2_W1866_g3413 = W1865_g3413;
			float UV1_V2_W2884_g3413 = W2865_g3413;
			float UV1_V2_W3871_g3413 = W3865_g3413;
			float3 lerpResult946_g3413 = lerp( float3( 1,1,1 ) , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1865_g3413, temp_output_883_0_g3413, temp_output_894_0_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) * UV1_V2_W1866_g3413 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2865_g3413, temp_output_883_0_g3413, temp_output_894_0_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) * UV1_V2_W2884_g3413 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3865_g3413, temp_output_883_0_g3413, temp_output_894_0_g3413 ), _VERTICAL_INTENSITY861_g3413.x ) * UV1_V2_W3871_g3413 ) ) ) , _MASK_VERTICAL_X151_g3413);
			float3 lerpResult1400_g3413 = lerp( lerpResult950_g3413 , BlendNormals( lerpResult950_g3413 , lerpResult946_g3413 ) , _MASK_VERTICAL_Y1216_g3413);
			float3 m_Stochastic914_g3413 = lerpResult1400_g3413;
			float3 localfloat3switch914_g3413 = float3switch914_g3413( m_switch914_g3413 , m_Standard914_g3413 , m_Stochastic914_g3413 );
			float3 RAIN_VERTICAL127_g3413 = localfloat3switch914_g3413;
			int m_switch547_g3248 = _SmoothnessType;
			float2 CUSTOM_UV1179_g3248 = uv_TexCoord165_g3248;
			float4 tex2DNode126_g3248 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3248 );
			float4 m_Smoothness547_g3248 = tex2DNode126_g3248;
			float4 m_Roughness547_g3248 = ( 1.0 - tex2DNode126_g3248 );
			float4 localfloat4switch547_g3248 = float4switch547_g3248( m_switch547_g3248 , m_Smoothness547_g3248 , m_Roughness547_g3248 );
			float4 temp_output_23_0_g3413 = ( _SmoothnessStrength * localfloat4switch547_g3248 );
			float4 lerpResult144_g3413 = lerp( temp_output_23_0_g3413 , ( temp_output_23_0_g3413 * 0.05 ) , i.vertexColor.r);
			float4 temp_cast_16 = (0.7).xxxx;
			float4 SMOOTHNESS94_g3413 = step( step( lerpResult144_g3413 , temp_cast_16 ) , float4( 0,0,0,0 ) );
			float3 lerpResult42_g3413 = lerp( RAIN_VERTICAL127_g3413 , float3( 0,0,0 ) , SMOOTHNESS94_g3413.xyz);
			float3 m_Active103_g3413 = BlendNormals( temp_output_19_0_g3413 , saturate( lerpResult42_g3413 ) );
			float3 localfloat3switch103_g3413 = float3switch103_g3413( m_switch103_g3413 , m_Off103_g3413 , m_Active103_g3413 );
			int m_switch1009_g3413 = _Horizontal_RainMode;
			float3 m_Off1009_g3413 = NORMAL_IN105_g3413;
			int m_switch793_g3413 = _Horizontal_ModeUV;
			float2 appendResult269_g3413 = (float2(_Horizontal_TilingX , _Horizontal_TilingY));
			float2 HORIZONTAL_UV_TILING158_g3413 = appendResult269_g3413;
			float2 UV_TILING88_g3415 = HORIZONTAL_UV_TILING158_g3413;
			float2 appendResult271_g3413 = (float2(_Horizontal_OffsetX , _Horizontal_OffsetY));
			float2 HORIZONTAL_UV_OFFSET159_g3413 = appendResult271_g3413;
			float2 UV_OFFSET94_g3415 = HORIZONTAL_UV_OFFSET159_g3413;
			float2 uv_TexCoord87_g3415 = i.uv_texcoord * UV_TILING88_g3415 + UV_OFFSET94_g3415;
			float2 appendResult86_g3415 = (float2(frac( uv_TexCoord87_g3415.x ) , frac( uv_TexCoord87_g3415.y )));
			float temp_output_52_0_g3415 = _Horizontal_Columns;
			float temp_output_53_0_g3415 = _Horizontal_Rows;
			float2 appendResult1_g3415 = (float2(temp_output_52_0_g3415 , temp_output_53_0_g3415));
			float VERTICAL_FRAMES15_g3415 = ( temp_output_52_0_g3415 * temp_output_53_0_g3415 );
			float2 appendResult49_g3415 = (float2(VERTICAL_FRAMES15_g3415 , temp_output_53_0_g3415));
			float clampResult37_g3415 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g3415 - 1.0 ) );
			float temp_output_36_0_g3415 = frac( ( ( ( _Time.y * _Horizontal_Speed ) + clampResult37_g3415 ) / VERTICAL_FRAMES15_g3415 ) );
			float2 appendResult31_g3415 = (float2(temp_output_36_0_g3415 , ( 1.0 - temp_output_36_0_g3415 )));
			float2 UV_HORIZONTAL_DEFAULT_01817_g3413 = ( ( ( appendResult86_g3415 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g3415 ) + ( floor( ( appendResult49_g3415 * appendResult31_g3415 ) ) / appendResult1_g3415 ) );
			int m_switch1179_g3413 = _Global_Rain_Enabled1178_g3413;
			float m_Off1179_g3413 = _Horizontal_Intensity;
			float m_Active1179_g3413 = ( _Horizontal_Intensity * _Global_Rain_Intensity1174_g3413 );
			float3 localfloatswitch1179_g3413 = floatswitch1179_g3413( m_switch1179_g3413 , m_Off1179_g3413 , m_Active1179_g3413 );
			float3 _HORIZONTAL_INTENSITY814_g3413 = localfloatswitch1179_g3413;
			float2 UV_TILING88_g3417 = ( HORIZONTAL_UV_TILING158_g3413 / float2( 0.6,0.6 ) );
			float2 UV_OFFSET94_g3417 = ( HORIZONTAL_UV_OFFSET159_g3413 + float2( 0.3,0.3 ) );
			float2 uv_TexCoord87_g3417 = i.uv_texcoord * UV_TILING88_g3417 + UV_OFFSET94_g3417;
			float2 appendResult86_g3417 = (float2(frac( uv_TexCoord87_g3417.x ) , frac( uv_TexCoord87_g3417.y )));
			float temp_output_52_0_g3417 = _Horizontal_Columns;
			float temp_output_53_0_g3417 = _Horizontal_Rows;
			float2 appendResult1_g3417 = (float2(temp_output_52_0_g3417 , temp_output_53_0_g3417));
			float VERTICAL_FRAMES15_g3417 = ( temp_output_52_0_g3417 * temp_output_53_0_g3417 );
			float2 appendResult49_g3417 = (float2(VERTICAL_FRAMES15_g3417 , temp_output_53_0_g3417));
			float clampResult37_g3417 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g3417 - 1.0 ) );
			float temp_output_36_0_g3417 = frac( ( ( ( _Time.y * _Horizontal_Speed ) + clampResult37_g3417 ) / VERTICAL_FRAMES15_g3417 ) );
			float2 appendResult31_g3417 = (float2(temp_output_36_0_g3417 , ( 1.0 - temp_output_36_0_g3417 )));
			float2 UV_HORIZONTAL_DEFAULT_02818_g3413 = ( ( ( appendResult86_g3417 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g3417 ) + ( floor( ( appendResult49_g3417 * appendResult31_g3417 ) ) / appendResult1_g3417 ) );
			float3 m_Standard793_g3413 = BlendNormals( UnpackScaleNormal( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_01817_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_02818_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) );
			float localStochasticTiling800_g3413 = ( 0.0 );
			float2 UV800_g3413 = UV_HORIZONTAL_DEFAULT_01817_g3413;
			float2 UV1800_g3413 = float2( 0,0 );
			float2 UV2800_g3413 = float2( 0,0 );
			float2 UV3800_g3413 = float2( 0,0 );
			float W1800_g3413 = 0.0;
			float W2800_g3413 = 0.0;
			float W3800_g3413 = 0.0;
			StochasticTiling( UV800_g3413 , UV1800_g3413 , UV2800_g3413 , UV3800_g3413 , W1800_g3413 , W2800_g3413 , W3800_g3413 );
			float2 temp_output_804_0_g3413 = ddx( UV_HORIZONTAL_DEFAULT_01817_g3413 );
			float2 temp_output_797_0_g3413 = ddy( UV_HORIZONTAL_DEFAULT_01817_g3413 );
			float UV1_H1_W1805_g3413 = W1800_g3413;
			float UV1_H1_W2803_g3413 = W2800_g3413;
			float UV1_H1_W3812_g3413 = W3800_g3413;
			float localStochasticTiling781_g3413 = ( 0.0 );
			float2 UV781_g3413 = UV_HORIZONTAL_DEFAULT_02818_g3413;
			float2 UV1781_g3413 = float2( 0,0 );
			float2 UV2781_g3413 = float2( 0,0 );
			float2 UV3781_g3413 = float2( 0,0 );
			float W1781_g3413 = 0.0;
			float W2781_g3413 = 0.0;
			float W3781_g3413 = 0.0;
			StochasticTiling( UV781_g3413 , UV1781_g3413 , UV2781_g3413 , UV3781_g3413 , W1781_g3413 , W2781_g3413 , W3781_g3413 );
			float2 temp_output_788_0_g3413 = ddx( UV_HORIZONTAL_DEFAULT_02818_g3413 );
			float2 temp_output_777_0_g3413 = ddy( UV_HORIZONTAL_DEFAULT_02818_g3413 );
			float UV1_H2_W1789_g3413 = W1781_g3413;
			float UV1_H2_W2787_g3413 = W2781_g3413;
			float UV1_H2_W3785_g3413 = W3781_g3413;
			float3 m_Stochastic793_g3413 = BlendNormals( ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1800_g3413, temp_output_804_0_g3413, temp_output_797_0_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) * UV1_H1_W1805_g3413 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2800_g3413, temp_output_804_0_g3413, temp_output_797_0_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) * UV1_H1_W2803_g3413 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3800_g3413, temp_output_804_0_g3413, temp_output_797_0_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) * UV1_H1_W3812_g3413 ) ) ) , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1781_g3413, temp_output_788_0_g3413, temp_output_777_0_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) * UV1_H2_W1789_g3413 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2781_g3413, temp_output_788_0_g3413, temp_output_777_0_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) * UV1_H2_W2787_g3413 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3781_g3413, temp_output_788_0_g3413, temp_output_777_0_g3413 ), _HORIZONTAL_INTENSITY814_g3413.x ) * UV1_H2_W3785_g3413 ) ) ) );
			float3 localfloat3switch793_g3413 = float3switch793_g3413( m_switch793_g3413 , m_Standard793_g3413 , m_Stochastic793_g3413 );
			float _MASK_HORIZONTAL152_g3413 = ( ase_worldNormal.y + 0.02 );
			float3 lerpResult279_g3413 = lerp( float3( 1,1,1 ) , localfloat3switch793_g3413 , _MASK_HORIZONTAL152_g3413);
			float3 RAIN_HORIZONTAL123_g3413 = lerpResult279_g3413;
			float3 lerpResult1002_g3413 = lerp( RAIN_HORIZONTAL123_g3413 , float3( 0,0,0 ) , SMOOTHNESS94_g3413.xyz);
			float3 m_Active1009_g3413 = BlendNormals( temp_output_19_0_g3413 , saturate( lerpResult1002_g3413 ) );
			float3 localfloat3switch1009_g3413 = float3switch1009_g3413( m_switch1009_g3413 , m_Off1009_g3413 , m_Active1009_g3413 );
			int m_switch1010_g3413 = _Static_RainMode;
			float3 m_Off1010_g3413 = NORMAL_IN105_g3413;
			int m_switch992_g3413 = _Static_ModeUV;
			float2 appendResult737_g3413 = (float2(_Static_TilingX , _Static_TilingY));
			float2 appendResult738_g3413 = (float2(_Static_OffsetX , _Static_OffsetY));
			float2 uv_TexCoord736_g3413 = i.uv_texcoord * appendResult737_g3413 + appendResult738_g3413;
			float2 appendResult731_g3413 = (float2(frac( uv_TexCoord736_g3413.x ) , frac( uv_TexCoord736_g3413.y )));
			float2 _STATIC_UV01_OUT990_g3413 = ( appendResult731_g3413 + ( (ase_screenPosNorm).xy * _Static_ScreenContribution ) );
			int m_switch1186_g3413 = _Global_Rain_Enabled1178_g3413;
			float m_Off1186_g3413 = _Static_Intensity;
			float m_Active1186_g3413 = ( _Static_Intensity * _Global_Rain_Intensity1174_g3413 );
			float3 localfloatswitch1186_g3413 = floatswitch1186_g3413( m_switch1186_g3413 , m_Off1186_g3413 , m_Active1186_g3413 );
			float3 _STATIC_INTENSITY991_g3413 = localfloatswitch1186_g3413;
			float3 m_Standard992_g3413 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _Static_RainMap, sampler_trilinear_repeat, _STATIC_UV01_OUT990_g3413 ), _STATIC_INTENSITY991_g3413.x );
			float localStochasticTiling973_g3413 = ( 0.0 );
			float2 UV973_g3413 = _STATIC_UV01_OUT990_g3413;
			float2 UV1973_g3413 = float2( 0,0 );
			float2 UV2973_g3413 = float2( 0,0 );
			float2 UV3973_g3413 = float2( 0,0 );
			float W1973_g3413 = 0.0;
			float W2973_g3413 = 0.0;
			float W3973_g3413 = 0.0;
			StochasticTiling( UV973_g3413 , UV1973_g3413 , UV2973_g3413 , UV3973_g3413 , W1973_g3413 , W2973_g3413 , W3973_g3413 );
			float2 temp_output_977_0_g3413 = ddx( _STATIC_UV01_OUT990_g3413 );
			float2 temp_output_978_0_g3413 = ddy( _STATIC_UV01_OUT990_g3413 );
			float UV1_S1_W1975_g3413 = W1973_g3413;
			float UV1_S1_W2972_g3413 = W2973_g3413;
			float UV1_S1_W3976_g3413 = W3973_g3413;
			float3 m_Stochastic992_g3413 = ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV1973_g3413, temp_output_977_0_g3413, temp_output_978_0_g3413 ), _STATIC_INTENSITY991_g3413.x ) * UV1_S1_W1975_g3413 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV2973_g3413, temp_output_977_0_g3413, temp_output_978_0_g3413 ), _STATIC_INTENSITY991_g3413.x ) * UV1_S1_W2972_g3413 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV3973_g3413, temp_output_977_0_g3413, temp_output_978_0_g3413 ), _STATIC_INTENSITY991_g3413.x ) * UV1_S1_W3976_g3413 ) ) );
			float3 localfloat3switch992_g3413 = float3switch992_g3413( m_switch992_g3413 , m_Standard992_g3413 , m_Stochastic992_g3413 );
			float3 RAIN_STATIC743_g3413 = localfloat3switch992_g3413;
			float3 lerpResult1005_g3413 = lerp( RAIN_STATIC743_g3413 , float3( 0,0,0 ) , SMOOTHNESS94_g3413.xyz);
			float3 m_Active1010_g3413 = BlendNormals( temp_output_19_0_g3413 , lerpResult1005_g3413 );
			float3 localfloat3switch1010_g3413 = float3switch1010_g3413( m_switch1010_g3413 , m_Off1010_g3413 , m_Active1010_g3413 );
			o.Normal = ( localfloat3switch103_g3413 + localfloat3switch1009_g3413 + localfloat3switch1010_g3413 );
			int m_switch506_g3248 = SURFACE_MAP_MODE456_g3248;
			float4 m_Off506_g3248 = ALBEDO_OUT91_g3248;
			int m_switch476_g3248 = EnableDetailMask428_g3248;
			float4 tex2DNode449_g3248 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, uv_TexCoord414_g3248 );
			float4 ALBEDO_OUT_DETAIL493_g3248 = ( _ColorDetail * tex2DNode449_g3248 * _DetailBrightness );
			float4 m_Off476_g3248 = ALBEDO_OUT_DETAIL493_g3248;
			float4 lerpResult477_g3248 = lerp( ALBEDO_OUT91_g3248 , ALBEDO_OUT_DETAIL493_g3248 , tex2DNode418_g3248.r);
			float4 m_Active476_g3248 = lerpResult477_g3248;
			float4 localfloat4switch476_g3248 = float4switch476_g3248( m_switch476_g3248 , m_Off476_g3248 , m_Active476_g3248 );
			float4 MASK_ALBEDO_OUT473_g3248 = localfloat4switch476_g3248;
			float4 lerpResult503_g3248 = lerp( MASK_ALBEDO_OUT473_g3248 , ALBEDO_OUT91_g3248 , DETAIL_BLEND396_g3248);
			float4 m_Active506_g3248 = lerpResult503_g3248;
			float4 localfloat4switch506_g3248 = float4switch506_g3248( m_switch506_g3248 , m_Off506_g3248 , m_Active506_g3248 );
			int _MASK_MODE_TEXTURE2980_g3243 = _WindMask_Texture;
			int m_switch2982_g3243 = _MASK_MODE_TEXTURE2980_g3243;
			float4 _Vector3 = float4(0,0,0,0);
			float4 m_Off2982_g3243 = _Vector3;
			int m_switch2972_g3243 = (int)_WindMask_TextureVisualize;
			float4 m_Off2972_g3243 = _Vector3;
			float4 color2979_g3243 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
			float4 _Visualize_Color2992_g3243 = color2979_g3243;
			float2 uv_WindMask_Map = i.uv_texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3243 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
			float3 appendResult2744_g3243 = (float3(tex2DNode2742_g3243.r , tex2DNode2742_g3243.r , tex2DNode2742_g3243.r));
			float3 temp_output_2910_0_g3243 = ( appendResult2744_g3243 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float4 appendResult2974_g3243 = (float4(temp_output_2910_0_g3243 , temp_output_2910_0_g3243.x));
			float4 lerpResult2967_g3243 = lerp( _Visualize_Color2992_g3243 , float4( 0,0,0,0 ) , appendResult2974_g3243);
			float4 m_Active2972_g3243 = lerpResult2967_g3243;
			float4 localfloat4switch2972_g3243 = float4switch2972_g3243( m_switch2972_g3243 , m_Off2972_g3243 , m_Active2972_g3243 );
			float4 m_Active2982_g3243 = localfloat4switch2972_g3243;
			float4 localfloat4switch2982_g3243 = float4switch2982_g3243( m_switch2982_g3243 , m_Off2982_g3243 , m_Active2982_g3243 );
			int _MASK_MODE_PROCEDRAL2677_g3243 = _WindMask_Procedural;
			int m_switch2991_g3243 = _MASK_MODE_PROCEDRAL2677_g3243;
			float4 m_Off2991_g3243 = _Vector3;
			int m_switch2986_g3243 = (int)_WindMask_ProceduralVisualize;
			float4 m_Off2986_g3243 = _Vector3;
			int m_switch2655_g3243 = _WindMask_Procedural;
			float m_Off2655_g3243 = 0.0;
			float MASK_OFFSET2670_g3243 = _WindMask_Offset1;
			float temp_output_2957_0_g3243 = ( 1.0 - MASK_OFFSET2670_g3243 );
			float m_TopDown2655_g3243 = ( ( ase_worldNormal.y - temp_output_2957_0_g3243 ) - 0.05 );
			float m_BottomUp2655_g3243 = ( -( ase_worldNormal.y + temp_output_2957_0_g3243 ) - 0.05 );
			float3 temp_cast_42 = (0.5).xxx;
			float3 break2635_g3243 = ( abs( ase_worldNormal ) - temp_cast_42 );
			float dotResult2928_g3243 = dot( ( MASK_OFFSET2670_g3243 + break2635_g3243.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3243 ) + -0.5 ) - break2635_g3243.y ) );
			float m_SideWall2655_g3243 = dotResult2928_g3243;
			float dotResult2921_g3243 = dot( ( MASK_OFFSET2670_g3243 + break2635_g3243.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3243 ) + break2635_g3243.z + -0.75 ) );
			float m_Spherical2655_g3243 = dotResult2921_g3243;
			float m_Spherical_Inverted2655_g3243 = -dotResult2921_g3243;
			float localfloatswitch2655_g3243 = floatswitch2655_g3243( m_switch2655_g3243 , m_Off2655_g3243 , m_TopDown2655_g3243 , m_BottomUp2655_g3243 , m_SideWall2655_g3243 , m_Spherical2655_g3243 , m_Spherical_Inverted2655_g3243 );
			float temp_output_2915_0_g3243 = ( localfloatswitch2655_g3243 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3243 = (float3(temp_output_2915_0_g3243 , temp_output_2915_0_g3243 , temp_output_2915_0_g3243));
			float4 appendResult2977_g3243 = (float4(appendResult2916_g3243 , appendResult2916_g3243.x));
			float4 lerpResult2976_g3243 = lerp( _Visualize_Color2992_g3243 , float4( 0,0,0,0 ) , appendResult2977_g3243);
			float4 m_Active2986_g3243 = lerpResult2976_g3243;
			float4 localfloat4switch2986_g3243 = float4switch2986_g3243( m_switch2986_g3243 , m_Off2986_g3243 , m_Active2986_g3243 );
			float4 m_TopDown2991_g3243 = localfloat4switch2986_g3243;
			float4 m_BottomUp2991_g3243 = localfloat4switch2986_g3243;
			float4 m_SideWall2991_g3243 = localfloat4switch2986_g3243;
			float4 m_Spherical2991_g3243 = localfloat4switch2986_g3243;
			float4 m_Spherical_Inverted2991_g3243 = localfloat4switch2986_g3243;
			float4 localfloat4switch2991_g3243 = float4switch2991_g3243( m_switch2991_g3243 , m_Off2991_g3243 , m_TopDown2991_g3243 , m_BottomUp2991_g3243 , m_SideWall2991_g3243 , m_Spherical2991_g3243 , m_Spherical_Inverted2991_g3243 );
			float4 temp_output_746_0_g3413 = ( localfloat4switch506_g3248 + ( localfloat4switch2982_g3243 + localfloat4switch2991_g3243 ) );
			o.Albedo = ( temp_output_746_0_g3413 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
			o.Metallic = ( _MetallicStrength * SAMPLE_TEXTURE2D( _Metal, sampler_trilinear_repeat, CUSTOM_UV1179_g3248 ) ).r;
			int m_switch1437_g3413 = _Global_Rain_Enabled1178_g3413;
			float m_Off1437_g3413 = temp_output_23_0_g3413.x;
			float _Global_Rain_Wetness1431_g3413 = _Global_Rain_Wetness;
			float m_Active1437_g3413 = saturate( ( temp_output_23_0_g3413 + _Global_Rain_Wetness1431_g3413 ) ).x;
			float3 localfloatswitch1437_g3413 = floatswitch1437_g3413( m_switch1437_g3413 , m_Off1437_g3413 , m_Active1437_g3413 );
			o.Smoothness = localfloatswitch1437_g3413.x;
			float4 color525_g3248 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float lerpResult134_g3248 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3248 ).r , i.vertexColor.a , (float)_OcclusionSourceMode);
			float4 temp_cast_52 = (lerpResult134_g3248).xxxx;
			float4 lerpResult135_g3248 = lerp( color525_g3248 , temp_cast_52 , _OcclusionStrengthAO);
			o.Occlusion = lerpResult135_g3248.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;607.9447;1377.53;1.6;True;False
Node;AmplifyShaderEditor.FunctionNode;375;34.74988,-633.4547;Inherit;False;DECSF Module Wind;94;;3243;a1f35481f1717b54dbd93d220457588d;8,2454,0,2433,0,2371,0,2457,0,2432,0,2434,0,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.CommentaryNode;470;1387.695,-1047.718;Inherit;False;364.3334;119;Header;1;293;;0.2565373,0.990566,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;290;1386.96,-890.2607;Inherit;False;346.5028;193.4201;;2;291;353;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1390.783,-1182.665;Inherit;False;370;124;Header;1;294;GLOBAL SETTINGS ;0.1237161,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;468;366.9902,-668.2634;Inherit;False;DECSF Master Map Surface;3;;3248;6c26b12be02413b47bab527585da6bf6;6,185,0,508,1,520,1,533,0,534,0,542,0;2;538;FLOAT3;0,0,0;False;550;FLOAT4;0,0,0,0;False;9;FLOAT4;106;FLOAT3;88;COLOR;115;FLOAT4;129;COLOR;116;FLOAT;181;FLOAT;144;FLOAT;318;FLOAT3;535
Node;AmplifyShaderEditor.IntNode;291;1396.189,-848.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1400.431,-777.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;469;934.8431,-685.7129;Inherit;False;DECSF Module Rain;55;;3413;794acd4ff0c67c64dae9e89693bd5acf;0;3;746;FLOAT4;0,0,0,0;False;19;FLOAT3;0,0,1;False;23;FLOAT4;1,0,0,0;False;3;FLOAT4;747;FLOAT3;0;FLOAT3;229
Node;AmplifyShaderEditor.IntNode;294;1408.596,-1144.853;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;293;1399.695,-1006.718;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;3;;200;0;Standard;DEC/Rain/Rain Surface Wind Detail;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;14;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;468;538;375;2190
WireConnection;468;550;375;2970
WireConnection;469;746;468;106
WireConnection;469;19;468;88
WireConnection;469;23;468;129
WireConnection;194;0;469;747
WireConnection;194;1;469;0
WireConnection;194;3;468;115
WireConnection;194;4;469;229
WireConnection;194;5;468;116
WireConnection;194;11;468;535
ASEEND*/
//CHKSM=86476B780AA5951CA0915BC7E54788934EE4D05D