// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Surface Wind/Surface Wind Detail"
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
		};

		uniform int _ColorMask;
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
		uniform half4 _ColorDetail;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailAlbedoMap);
		uniform half _DetailBrightness;
		uniform float _WindMask_TextureVisualize;
		uniform float _WindMask_ProceduralVisualize;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Metal);
		uniform float _SmoothnessStrength;
		uniform int _SmoothnessType;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
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


		float4 float4switch547_g3248( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
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
			o.Normal = localfloat3switch502_g3248;
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
			float3 temp_cast_13 = (0.5).xxx;
			float3 break2635_g3243 = ( abs( ase_worldNormal ) - temp_cast_13 );
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
			o.Albedo = ( localfloat4switch506_g3248 + ( localfloat4switch2982_g3243 + localfloat4switch2991_g3243 ) ).xyz;
			float2 CUSTOM_UV1179_g3248 = uv_TexCoord165_g3248;
			o.Metallic = ( _MetallicStrength * SAMPLE_TEXTURE2D( _Metal, sampler_trilinear_repeat, CUSTOM_UV1179_g3248 ) ).r;
			int m_switch547_g3248 = _SmoothnessType;
			float4 tex2DNode126_g3248 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3248 );
			float4 m_Smoothness547_g3248 = tex2DNode126_g3248;
			float4 m_Roughness547_g3248 = ( 1.0 - tex2DNode126_g3248 );
			float4 localfloat4switch547_g3248 = float4switch547_g3248( m_switch547_g3248 , m_Smoothness547_g3248 , m_Roughness547_g3248 );
			o.Smoothness = ( _SmoothnessStrength * localfloat4switch547_g3248 ).x;
			float4 color525_g3248 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float lerpResult134_g3248 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3248 ).r , i.vertexColor.a , (float)_OcclusionSourceMode);
			float4 temp_cast_23 = (lerpResult134_g3248).xxxx;
			float4 lerpResult135_g3248 = lerp( color525_g3248 , temp_cast_23 , _OcclusionStrengthAO);
			o.Occlusion = lerpResult135_g3248.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;46.005;1118.674;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;469;1387.352,-1060.33;Inherit;False;361.0526;132.4606;Header;1;293;;0.2234502,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;290;1386.96,-890.2607;Inherit;False;346.5028;193.4201;;2;291;353;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1384.918,-1202.328;Inherit;False;370;124;Header;1;294;GLOBAL SETTINGS ;0.2704486,0.990566,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;375;422.631,-642.3534;Inherit;False;DECSF Module Wind;55;;3243;a1f35481f1717b54dbd93d220457588d;8,2454,0,2433,0,2371,0,2457,0,2432,0,2434,0,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.IntNode;291;1396.189,-848.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1400.431,-777.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;468;750.7002,-685.8051;Inherit;False;DECSF Master Map Surface;3;;3248;6c26b12be02413b47bab527585da6bf6;6,185,0,508,1,520,1,533,0,534,0,542,0;2;538;FLOAT3;0,0,0;False;550;FLOAT4;0,0,0,0;False;9;FLOAT4;106;FLOAT3;88;COLOR;115;FLOAT4;129;COLOR;116;FLOAT;181;FLOAT;144;FLOAT;318;FLOAT3;535
Node;AmplifyShaderEditor.IntNode;294;1402.731,-1161.465;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;293;1400.729,-1016.431;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;3;;200;0;Standard;DEC/Surface Wind/Surface Wind Detail;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;14;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;468;538;375;2190
WireConnection;468;550;375;2970
WireConnection;194;0;468;106
WireConnection;194;1;468;88
WireConnection;194;3;468;115
WireConnection;194;4;468;129
WireConnection;194;5;468;116
WireConnection;194;11;468;535
ASEEND*/
//CHKSM=6DC9167847F09D4AB0500412787D81BF9E8BE6F4