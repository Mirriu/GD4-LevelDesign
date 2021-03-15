// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Billboard/Billboard Wind"
{
	Properties
	{
		[Header(VERSION 1.4.0 STANDARD)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Off,0,Active,1)]_GlancingClipMode("Clip Glancing Angle Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1.5
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.49
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[NoScaleOffset][Normal][SingleLineTexture]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[HideInInspector]_MaskClipValue("Mask Clip Value", Float) = 0.5
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
		_WindMask_Procedural_Intensity("Mask Intensity", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
		[Header(Forward Rendering Options)]
		[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry-10" "NatureRendererInstancing"="True" }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		AlphaToMask [_AlphatoCoverage]
		ColorMask [_ColorMask]
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
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
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
			float4 vertexColor : COLOR;
		};

		uniform int _ColorMask;
		uniform float _AlphatoCoverage;
		uniform int _CullMode;
		uniform int _ZWriteMode;
		uniform int _WindMode;
		uniform int _WindMask_Texture;
		uniform int _WindMask_Procedural;
		uniform int _Global_Wind_Billboard_Enabled;
		uniform float _GlobalWindInfluenceBillboard;
		uniform float _Global_Wind_Billboard_Intensity;
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
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		uniform half _NormalStrength;
		uniform float4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _Brightness;
		uniform float _WindMask_TextureVisualize;
		uniform float _WindMask_ProceduralVisualize;
		uniform float _MetallicStrength;
		uniform float _SmoothnessStrength;
		uniform float _OcclusionStrengthAO;
		uniform half _AlphaCutoffBias;
		uniform int _GlancingClipMode;
		uniform float _MaskClipValue;


		float floatswitch2460_g3272( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2468_g3272( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2312_g3272( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2456_g3272( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float3 float3switch2465_g3272( int m_switch, float3 m_Off, float3 m_On )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_On;
			else
			return float3(0,0,0);
		}


		float3 float3switch2328_g3272( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		float floatswitch2655_g3272( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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


		float3 float3switch2966_g3272( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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


		float3 float3switch2527_g3272( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch2453_g3272( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		float4 float4switch2972_g3272( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2982_g3272( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2986_g3272( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2991_g3272( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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


		float floatswitch263_g3274( int m_switch, float m_Off, float m_Active )
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
			int m_switch2453_g3272 = _WindMode;
			float3 m_Off2453_g3272 = float3(0,0,0);
			int m_switch2527_g3272 = _WindMask_Texture;
			int _MASK_MODE_PROCEDRAL2677_g3272 = _WindMask_Procedural;
			int m_switch2966_g3272 = _MASK_MODE_PROCEDRAL2677_g3272;
			int _WIND_MODE2462_g3272 = _WindMode;
			int m_switch2328_g3272 = _WIND_MODE2462_g3272;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VAR_VERTEXPOSITION_MATRIX2352_g3272 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 m_Off2328_g3272 = VAR_VERTEXPOSITION_MATRIX2352_g3272;
			int _Global_Wind_Billboard_Enabled2614_g3272 = _Global_Wind_Billboard_Enabled;
			int m_switch2465_g3272 = _Global_Wind_Billboard_Enabled2614_g3272;
			float3 m_Off2465_g3272 = VAR_VERTEXPOSITION_MATRIX2352_g3272;
			float3 break2265_g3272 = VAR_VERTEXPOSITION_MATRIX2352_g3272;
			int m_switch2460_g3272 = _WIND_MODE2462_g3272;
			float m_Off2460_g3272 = 1.0;
			float _Global_Wind_Billboard_Intensity2372_g3272 = _Global_Wind_Billboard_Intensity;
			float _Global_Wind_Main_Intensity2403_g3272 = _Global_Wind_Main_Intensity;
			float m_Global2460_g3272 = ( ( _GlobalWindInfluenceBillboard * _Global_Wind_Billboard_Intensity2372_g3272 ) * _Global_Wind_Main_Intensity2403_g3272 );
			float m_Local2460_g3272 = _LocalWindStrength;
			float localfloatswitch2460_g3272 = floatswitch2460_g3272( m_switch2460_g3272 , m_Off2460_g3272 , m_Global2460_g3272 , m_Local2460_g3272 );
			float VAR_WindStrength2400_g3272 = localfloatswitch2460_g3272;
			int m_switch2468_g3272 = _WIND_MODE2462_g3272;
			float m_Off2468_g3272 = 1.0;
			float _Global_Wind_Main_RandomOffset2378_g3272 = _Global_Wind_Main_RandomOffset;
			float m_Global2468_g3272 = _Global_Wind_Main_RandomOffset2378_g3272;
			float m_Local2468_g3272 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3272 = floatswitch2468_g3272( m_switch2468_g3272 , m_Off2468_g3272 , m_Global2468_g3272 , m_Local2468_g3272 );
			float VAR_WindOffset2419_g3272 = localfloatswitch2468_g3272;
			float4 transform2423_g3272 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3272 = (float2(transform2423_g3272.x , transform2423_g3272.z));
			float dotResult2341_g3272 = dot( appendResult2307_g3272 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3272 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3272 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3272 ) * 43758.55 ) ));
			float VAR_RandomTime2244_g3272 = ( _Time.x * lerpResult2238_g3272 );
			float FUNC_Turbulence2274_g3272 = ( sin( ( ( VAR_RandomTime2244_g3272 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3272.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3272 = _WIND_MODE2462_g3272;
			float m_Off2312_g3272 = 1.0;
			float _Global_Wind_Main_Pulse2302_g3272 = _Global_Wind_Main_Pulse;
			float m_Global2312_g3272 = _Global_Wind_Main_Pulse2302_g3272;
			float m_Local2312_g3272 = _LocalWindPulse;
			float localfloatswitch2312_g3272 = floatswitch2312_g3272( m_switch2312_g3272 , m_Off2312_g3272 , m_Global2312_g3272 , m_Local2312_g3272 );
			float VAR_WindPulse2421_g3272 = localfloatswitch2312_g3272;
			float FUNC_Angle2470_g3272 = ( VAR_WindStrength2400_g3272 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3272 * 2.0 ) + FUNC_Turbulence2274_g3272 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3272.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * VAR_WindPulse2421_g3272 );
			float VAR_SinA2424_g3272 = sin( FUNC_Angle2470_g3272 );
			float VAR_CosA2362_g3272 = cos( FUNC_Angle2470_g3272 );
			int m_switch2456_g3272 = _WIND_MODE2462_g3272;
			float m_Off2456_g3272 = 1.0;
			float _Global_Wind_Main_Direction2350_g3272 = _Global_Wind_Main_Direction;
			float m_Global2456_g3272 = _Global_Wind_Main_Direction2350_g3272;
			float m_Local2456_g3272 = _LocalWindDirection;
			float localfloatswitch2456_g3272 = floatswitch2456_g3272( m_switch2456_g3272 , m_Off2456_g3272 , m_Global2456_g3272 , m_Local2456_g3272 );
			float _WindDirection2249_g3272 = localfloatswitch2456_g3272;
			float2 localDirectionalEquation2249_g3272 = DirectionalEquation( _WindDirection2249_g3272 );
			float2 break2469_g3272 = localDirectionalEquation2249_g3272;
			float VAR_xLerp2418_g3272 = break2469_g3272.x;
			float lerpResult2258_g3272 = lerp( break2265_g3272.x , ( ( break2265_g3272.y * VAR_SinA2424_g3272 ) + ( break2265_g3272.x * VAR_CosA2362_g3272 ) ) , VAR_xLerp2418_g3272);
			float3 break2340_g3272 = VAR_VERTEXPOSITION_MATRIX2352_g3272;
			float3 break2233_g3272 = VAR_VERTEXPOSITION_MATRIX2352_g3272;
			float VAR_zLerp2416_g3272 = break2469_g3272.y;
			float lerpResult2275_g3272 = lerp( break2233_g3272.z , ( ( break2233_g3272.y * VAR_SinA2424_g3272 ) + ( break2233_g3272.z * VAR_CosA2362_g3272 ) ) , VAR_zLerp2416_g3272);
			float3 appendResult2235_g3272 = (float3(lerpResult2258_g3272 , ( ( break2340_g3272.y * VAR_CosA2362_g3272 ) - ( break2340_g3272.z * VAR_SinA2424_g3272 ) ) , lerpResult2275_g3272));
			float3 VAR_VERTEXPOSITION2354_g3272 = ase_vertex3Pos;
			float3 FUNC_vertexPos2282_g3272 = ( mul( unity_WorldToObject, float4( appendResult2235_g3272 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3272 );
			float3 m_On2465_g3272 = FUNC_vertexPos2282_g3272;
			float3 localfloat3switch2465_g3272 = float3switch2465_g3272( m_switch2465_g3272 , m_Off2465_g3272 , m_On2465_g3272 );
			float3 m_Global2328_g3272 = localfloat3switch2465_g3272;
			float3 m_Local2328_g3272 = FUNC_vertexPos2282_g3272;
			float3 localfloat3switch2328_g3272 = float3switch2328_g3272( m_switch2328_g3272 , m_Off2328_g3272 , m_Global2328_g3272 , m_Local2328_g3272 );
			float3 WIND_FINAL2753_g3272 = localfloat3switch2328_g3272;
			float3 m_Off2966_g3272 = WIND_FINAL2753_g3272;
			int m_switch2655_g3272 = _WindMask_Procedural;
			float m_Off2655_g3272 = 0.0;
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float MASK_OFFSET2670_g3272 = _WindMask_Offset1;
			float temp_output_2957_0_g3272 = ( 1.0 - MASK_OFFSET2670_g3272 );
			float m_TopDown2655_g3272 = ( ( ase_worldNormal.y - temp_output_2957_0_g3272 ) - 0.05 );
			float m_BottomUp2655_g3272 = ( -( ase_worldNormal.y + temp_output_2957_0_g3272 ) - 0.05 );
			float3 temp_cast_4 = (0.5).xxx;
			float3 break2635_g3272 = ( abs( ase_worldNormal ) - temp_cast_4 );
			float dotResult2928_g3272 = dot( ( MASK_OFFSET2670_g3272 + break2635_g3272.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3272 ) + -0.5 ) - break2635_g3272.y ) );
			float m_SideWall2655_g3272 = dotResult2928_g3272;
			float dotResult2921_g3272 = dot( ( MASK_OFFSET2670_g3272 + break2635_g3272.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3272 ) + break2635_g3272.z + -0.75 ) );
			float m_Spherical2655_g3272 = dotResult2921_g3272;
			float m_Spherical_Inverted2655_g3272 = -dotResult2921_g3272;
			float localfloatswitch2655_g3272 = floatswitch2655_g3272( m_switch2655_g3272 , m_Off2655_g3272 , m_TopDown2655_g3272 , m_BottomUp2655_g3272 , m_SideWall2655_g3272 , m_Spherical2655_g3272 , m_Spherical_Inverted2655_g3272 );
			float temp_output_2915_0_g3272 = ( localfloatswitch2655_g3272 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3272 = (float3(temp_output_2915_0_g3272 , temp_output_2915_0_g3272 , temp_output_2915_0_g3272));
			float3 lerpResult2917_g3272 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3272 , appendResult2916_g3272);
			float3 m_TopDown2966_g3272 = lerpResult2917_g3272;
			float3 m_BottomUp2966_g3272 = lerpResult2917_g3272;
			float3 m_SideWall2966_g3272 = lerpResult2917_g3272;
			float3 m_Spherical2966_g3272 = lerpResult2917_g3272;
			float3 m_Spherical_Inverted2966_g3272 = lerpResult2917_g3272;
			float3 localfloat3switch2966_g3272 = float3switch2966_g3272( m_switch2966_g3272 , m_Off2966_g3272 , m_TopDown2966_g3272 , m_BottomUp2966_g3272 , m_SideWall2966_g3272 , m_Spherical2966_g3272 , m_Spherical_Inverted2966_g3272 );
			float3 m_Off2527_g3272 = localfloat3switch2966_g3272;
			float2 uv_WindMask_Map = v.texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3272 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
			float3 appendResult2744_g3272 = (float3(tex2DNode2742_g3272.r , tex2DNode2742_g3272.r , tex2DNode2742_g3272.r));
			float3 temp_output_2910_0_g3272 = ( appendResult2744_g3272 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float3 m_Active2527_g3272 = ( localfloat3switch2966_g3272 * temp_output_2910_0_g3272 );
			float3 localfloat3switch2527_g3272 = float3switch2527_g3272( m_switch2527_g3272 , m_Off2527_g3272 , m_Active2527_g3272 );
			float3 WIND_MASK2748_g3272 = localfloat3switch2527_g3272;
			float3 m_Global2453_g3272 = WIND_MASK2748_g3272;
			float3 m_Local2453_g3272 = WIND_MASK2748_g3272;
			float3 localfloat3switch2453_g3272 = float3switch2453_g3272( m_switch2453_g3272 , m_Off2453_g3272 , m_Global2453_g3272 , m_Local2453_g3272 );
			v.vertex.xyz += localfloat3switch2453_g3272;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 appendResult83_g3274 = (float2(_TilingX , _TilingY));
			float2 appendResult71_g3274 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord13_g3274 = i.uv_texcoord * appendResult83_g3274 + appendResult71_g3274;
			float3 NORMAL_OUT_01292_g3274 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, uv_TexCoord13_g3274 ), _NormalStrength );
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 worldToViewDir283_g3274 = normalize( mul( UNITY_MATRIX_V, float4( ase_worldlightDir, 0 ) ).xyz );
			float dotResult280_g3274 = dot( NORMAL_OUT_01292_g3274 , worldToViewDir283_g3274 );
			float3 appendResult279_g3274 = (float3(dotResult280_g3274 , dotResult280_g3274 , dotResult280_g3274));
			o.Normal = ( UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, uv_TexCoord13_g3274 ), _NormalStrength ) + saturate( appendResult279_g3274 ) );
			float4 tex2DNode150_g3274 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, uv_TexCoord13_g3274 );
			float3 temp_output_55_0_g3274 = ( (_Color).rgb * (tex2DNode150_g3274).rgb * _Brightness );
			int _MASK_MODE_TEXTURE2980_g3272 = _WindMask_Texture;
			int m_switch2982_g3272 = _MASK_MODE_TEXTURE2980_g3272;
			float4 _Vector3 = float4(0,0,0,0);
			float4 m_Off2982_g3272 = _Vector3;
			int m_switch2972_g3272 = (int)_WindMask_TextureVisualize;
			float4 m_Off2972_g3272 = _Vector3;
			float4 color2979_g3272 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
			float4 _Visualize_Color2992_g3272 = color2979_g3272;
			float2 uv_WindMask_Map = i.uv_texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3272 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
			float3 appendResult2744_g3272 = (float3(tex2DNode2742_g3272.r , tex2DNode2742_g3272.r , tex2DNode2742_g3272.r));
			float3 temp_output_2910_0_g3272 = ( appendResult2744_g3272 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float4 appendResult2974_g3272 = (float4(temp_output_2910_0_g3272 , temp_output_2910_0_g3272.x));
			float4 lerpResult2967_g3272 = lerp( _Visualize_Color2992_g3272 , float4( 0,0,0,0 ) , appendResult2974_g3272);
			float4 m_Active2972_g3272 = lerpResult2967_g3272;
			float4 localfloat4switch2972_g3272 = float4switch2972_g3272( m_switch2972_g3272 , m_Off2972_g3272 , m_Active2972_g3272 );
			float4 m_Active2982_g3272 = localfloat4switch2972_g3272;
			float4 localfloat4switch2982_g3272 = float4switch2982_g3272( m_switch2982_g3272 , m_Off2982_g3272 , m_Active2982_g3272 );
			int _MASK_MODE_PROCEDRAL2677_g3272 = _WindMask_Procedural;
			int m_switch2991_g3272 = _MASK_MODE_PROCEDRAL2677_g3272;
			float4 m_Off2991_g3272 = _Vector3;
			int m_switch2986_g3272 = (int)_WindMask_ProceduralVisualize;
			float4 m_Off2986_g3272 = _Vector3;
			int m_switch2655_g3272 = _WindMask_Procedural;
			float m_Off2655_g3272 = 0.0;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float MASK_OFFSET2670_g3272 = _WindMask_Offset1;
			float temp_output_2957_0_g3272 = ( 1.0 - MASK_OFFSET2670_g3272 );
			float m_TopDown2655_g3272 = ( ( ase_worldNormal.y - temp_output_2957_0_g3272 ) - 0.05 );
			float m_BottomUp2655_g3272 = ( -( ase_worldNormal.y + temp_output_2957_0_g3272 ) - 0.05 );
			float3 temp_cast_8 = (0.5).xxx;
			float3 break2635_g3272 = ( abs( ase_worldNormal ) - temp_cast_8 );
			float dotResult2928_g3272 = dot( ( MASK_OFFSET2670_g3272 + break2635_g3272.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3272 ) + -0.5 ) - break2635_g3272.y ) );
			float m_SideWall2655_g3272 = dotResult2928_g3272;
			float dotResult2921_g3272 = dot( ( MASK_OFFSET2670_g3272 + break2635_g3272.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3272 ) + break2635_g3272.z + -0.75 ) );
			float m_Spherical2655_g3272 = dotResult2921_g3272;
			float m_Spherical_Inverted2655_g3272 = -dotResult2921_g3272;
			float localfloatswitch2655_g3272 = floatswitch2655_g3272( m_switch2655_g3272 , m_Off2655_g3272 , m_TopDown2655_g3272 , m_BottomUp2655_g3272 , m_SideWall2655_g3272 , m_Spherical2655_g3272 , m_Spherical_Inverted2655_g3272 );
			float temp_output_2915_0_g3272 = ( localfloatswitch2655_g3272 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3272 = (float3(temp_output_2915_0_g3272 , temp_output_2915_0_g3272 , temp_output_2915_0_g3272));
			float4 appendResult2977_g3272 = (float4(appendResult2916_g3272 , appendResult2916_g3272.x));
			float4 lerpResult2976_g3272 = lerp( _Visualize_Color2992_g3272 , float4( 0,0,0,0 ) , appendResult2977_g3272);
			float4 m_Active2986_g3272 = lerpResult2976_g3272;
			float4 localfloat4switch2986_g3272 = float4switch2986_g3272( m_switch2986_g3272 , m_Off2986_g3272 , m_Active2986_g3272 );
			float4 m_TopDown2991_g3272 = localfloat4switch2986_g3272;
			float4 m_BottomUp2991_g3272 = localfloat4switch2986_g3272;
			float4 m_SideWall2991_g3272 = localfloat4switch2986_g3272;
			float4 m_Spherical2991_g3272 = localfloat4switch2986_g3272;
			float4 m_Spherical_Inverted2991_g3272 = localfloat4switch2986_g3272;
			float4 localfloat4switch2991_g3272 = float4switch2991_g3272( m_switch2991_g3272 , m_Off2991_g3272 , m_TopDown2991_g3272 , m_BottomUp2991_g3272 , m_SideWall2991_g3272 , m_Spherical2991_g3272 , m_Spherical_Inverted2991_g3272 );
			o.Albedo = ( float4( temp_output_55_0_g3274 , 0.0 ) + ( localfloat4switch2982_g3272 + localfloat4switch2991_g3272 ) ).xyz;
			o.Metallic = _MetallicStrength;
			o.Smoothness = _SmoothnessStrength;
			float4 color391_g3274 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_cast_13 = (i.vertexColor.a).xxxx;
			float4 lerpResult389_g3274 = lerp( color391_g3274 , temp_cast_13 , _OcclusionStrengthAO);
			o.Occlusion = lerpResult389_g3274.r;
			float ALBEDO_A366_g3274 = tex2DNode150_g3274.a;
			clip( ALBEDO_A366_g3274 - ( 1.0 - _AlphaCutoffBias ));
			float temp_output_377_0_g3274 = saturate( ( ( ALBEDO_A366_g3274 / max( fwidth( ALBEDO_A366_g3274 ) , 0.0001 ) ) + 0.5 ) );
			o.Alpha = temp_output_377_0_g3274;
			int m_switch263_g3274 = _GlancingClipMode;
			float m_Off263_g3274 = 1.0;
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult332_g3274 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
			float dotResult317_g3274 = dot( ase_worldViewDir , normalizeResult332_g3274 );
			float temp_output_319_0_g3274 = ( 1.0 - abs( dotResult317_g3274 ) );
			float temp_output_321_0_g3274 = ( 1.0 - ( temp_output_319_0_g3274 * temp_output_319_0_g3274 ) );
			float m_Active263_g3274 = temp_output_321_0_g3274;
			float localfloatswitch263_g3274 = floatswitch263_g3274( m_switch263_g3274 , m_Off263_g3274 , m_Active263_g3274 );
			clip( localfloatswitch263_g3274 - _MaskClipValue );
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;1130.683;129.3006;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;502;43.62961,-111.8036;Inherit;False;279.3333;117;Header;1;187;;0.004857063,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;411;49.82877,34.87488;Inherit;False;255.5028;292.4201;;3;51;388;188;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;410;38.65128,-245.5294;Inherit;False;276;117;Header;1;52;GLOBAL SETTINGS ;0.126734,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;503;-850.5219,341.1339;Inherit;False;DECSF Module Wind;21;;3272;a1f35481f1717b54dbd93d220457588d;8,2454,2,2433,2,2371,2,2457,2,2432,2,2434,2,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.IntNode;188;56.08816,71.2121;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;388;58.96429,210.2158;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;True;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;52;53.11699,-205.1921;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;False;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;58.57893,139.4035;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;19;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;501;-537.5703,337.3111;Inherit;False;DECSF Master Map Billboard;4;;3274;bd32d91e2d401734bbb5bafd06e38be2;2,218,0,275,1;2;395;FLOAT3;0,0,0;False;393;FLOAT4;0,0,0,0;False;9;FLOAT4;192;FLOAT3;194;FLOAT;207;FLOAT;205;COLOR;213;FLOAT;193;FLOAT;277;FLOAT;223;FLOAT3;397
Node;AmplifyShaderEditor.IntNode;187;52.62961,-69.50359;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;39;63.95,341.8214;Float;False;True;-1;2;;200;0;Standard;DEC/Billboard/Billboard Wind;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;True;True;True;Back;0;True;187;3;False;283;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;14;all;True;True;True;True;0;True;188;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;True;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;52;-1;0;True;51;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;8ccd508f733f5f0418220eaf14ecdf81;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;True;388;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;501;395;503;2190
WireConnection;501;393;503;2970
WireConnection;39;0;501;192
WireConnection;39;1;501;194
WireConnection;39;3;501;207
WireConnection;39;4;501;205
WireConnection;39;5;501;213
WireConnection;39;9;501;193
WireConnection;39;10;501;277
WireConnection;39;11;501;397
ASEEND*/
//CHKSM=F80AA0CFCC6AA80D736C9DE4DEC9EF998588DA35