// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Custom Lighting/Custom Lighting Surface Detail"
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
		[SingleLineTexture]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Smoothness,0,Roughness,1)]_SmoothnessType("Smoothness Type", Int) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[Enum(Texture,0,Baked,1)]_OcclusionSourceMode("Occlusion Source Mode", Int) = 1
		[SingleLineTexture]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		[Enum(Off,0,Ramp,1,MatCap,2)][Header(TOON TEXTURE MAP)]_ToonMode("Toon Mode", Int) = 0
		[NoScaleOffset][SingleLineTexture]_ToonMap("Toon Map", 2D) = "white" {}
		_Saturation("Saturation", Range( 0 , 2)) = 1
		[HDR][Header(OUTLINE)]_OutlineTint("Outline Tint", Color) = (0.05098039,0.03137255,0.02352941,1)
		_OutlineThickness("Outline Thickness", Range( 0 , 0.5)) = 0.01
		_OutlineDistance("Outline Distance", Float) = 5
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
		[Header (LIGHTING)]_IndirectStrengthDiffuse("Indirect Strength Diffuse", Range( 0 , 1)) = 0.07647059
		_IndirectStrengthSpecular("Indirect Strength Specular", Range( 0 , 1)) = 0.3147325
		_IndirectOcclusion("Indirect Occlusion", Range( 0 , 1)) = 0
		_IndirectSmoothness("Indirect Smoothness", Range( 0 , 1)) = 0
		[HDR]_SpecularColor("Specular Tint", Color) = (1,1,1,0.2117647)
		_Shininess("Specular Glossiness", Range( 0 , 1)) = 0
		_ShadowStrength("Shadow Strength", Range( 0 , 1)) = 0.3005241
		_ShadowSharpness("Shadow Sharpness", Range( 0.01 , 1)) = 0.7903529
		_ShadowOffset("Shadow Offset", Range( 0 , 1)) = 0.5176473
		[Enum(Off,0,Active,1)][Header(HIGHLIGHT)]_EnableHighlight("Enable Highlight", Int) = 0
		[HDR]_HighlightTint("Highlight Tint", Color) = (0.4941176,0.3372549,0.2509804,0.3529412)
		_HighlightStrength("Highlight Strength", Range( 0 , 1)) = 0.25
		_Speed("Speed", Range( 0 , 200)) = 60
		_SpeedMinLevel("Speed Min Level", Range( 0 , 1)) = 0.8
		_SpeedMaxLevel("Speed Max Level", Range( 0 , 1)) = 0.9
		[Enum(Off,0,Active,1)][Header (EMISSION)]_EmissionMode("Emission Mode", Int) = 0
		[HDR]_EmissionTint_01("Emission Tint", Color) = (0,0,0,1)
		_EmissionTintStrength_01("Emission Tint Strength", Range( 0 , 100)) = 1
		[HDR]_EmissionTint_02("Emission Tint", Color) = (0,0,0,1)
		_EmissionTintStrength_02("Emission Tint Strength", Range( 0 , 100)) = 1
		[HDR]_EmissionTintGlow("Emission Tint Glow", Color) = (0,0,0,1)
		_EmissionTintGlowStrength("Emission Tint Glow Strength", Range( 0 , 2)) = 0.3063261
		[SingleLineTexture]_EmissionMapMask("Emission Map Mask", 2D) = "white" {}
		[Enum(Standard,0,Scale Independent,1)]_EmissionMask_TillingMode("Tilling Mode", Int) = 0
		_EmissionMask_TilingX("Tiling X", Float) = 1
		_EmissionMask_TilingY("Tiling Y", Float) = 1
		_EmissionMask_OffsetX("Offset X", Float) = 1
		_EmissionMask_OffsetY("Offset Y", Float) = 1
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Wind Strength", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
		[HideInInspector] __dirty( "", Int ) = 1
		[Header(Forward Rendering Options)]
		[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		Tags{ }
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		
		
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
		
		#pragma multi_compile_instancing
		#pragma instancing_options procedural:SetupNatureRenderer forwardadd
		#pragma multi_compile GPU_FRUSTUM_ON __
		#include "Nature Renderer.cginc"
		#pragma multi_compile_local _ NATURE_RENDERER
		
		struct Input
		{
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv_texcoord;
		};
		uniform float4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform int _TillingMode;
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		SamplerState sampler_trilinear_repeat;
		uniform half _Brightness;
		uniform float4 _OutlineTint;
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
		uniform float _WindMask_Texture_Intensity;
		uniform float _OutlineThickness;
		uniform float _OutlineDistance;
		
		float2 float2switch214_g3387( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float floatswitch2458_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2468_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2312_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2456_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2655_g3385( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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


		float3 float3switch2966_g3385( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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


		float3 float3switch2527_g3385( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch2453_g3385( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			int m_switch2453_g3385 = _WindMode;
			float3 m_Off2453_g3385 = float3(0,0,0);
			int m_switch2527_g3385 = _WindMask_Texture;
			int _MASK_MODE_PROCEDRAL2677_g3385 = _WindMask_Procedural;
			int m_switch2966_g3385 = _MASK_MODE_PROCEDRAL2677_g3385;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VAR_VERTEXPOSITION_MATRIX2352_g3385 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 break2265_g3385 = VAR_VERTEXPOSITION_MATRIX2352_g3385;
			int _WIND_MODE2462_g3385 = _WindMode;
			int m_switch2458_g3385 = _WIND_MODE2462_g3385;
			float m_Off2458_g3385 = 1.0;
			float _Global_Wind_Main_Intensity2403_g3385 = _Global_Wind_Main_Intensity;
			float m_Global2458_g3385 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3385 );
			float m_Local2458_g3385 = _LocalWindStrength;
			float localfloatswitch2458_g3385 = floatswitch2458_g3385( m_switch2458_g3385 , m_Off2458_g3385 , m_Global2458_g3385 , m_Local2458_g3385 );
			float VAR_WindStrength2400_g3385 = localfloatswitch2458_g3385;
			int m_switch2468_g3385 = _WIND_MODE2462_g3385;
			float m_Off2468_g3385 = 1.0;
			float _Global_Wind_Main_RandomOffset2378_g3385 = _Global_Wind_Main_RandomOffset;
			float m_Global2468_g3385 = _Global_Wind_Main_RandomOffset2378_g3385;
			float m_Local2468_g3385 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3385 = floatswitch2468_g3385( m_switch2468_g3385 , m_Off2468_g3385 , m_Global2468_g3385 , m_Local2468_g3385 );
			float VAR_WindOffset2419_g3385 = localfloatswitch2468_g3385;
			float4 transform2423_g3385 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3385 = (float2(transform2423_g3385.x , transform2423_g3385.z));
			float dotResult2341_g3385 = dot( appendResult2307_g3385 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3385 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3385 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3385 ) * 43758.55 ) ));
			float VAR_RandomTime2244_g3385 = ( _Time.x * lerpResult2238_g3385 );
			float FUNC_Turbulence2274_g3385 = ( sin( ( ( VAR_RandomTime2244_g3385 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3385.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3385 = _WIND_MODE2462_g3385;
			float m_Off2312_g3385 = 1.0;
			float _Global_Wind_Main_Pulse2302_g3385 = _Global_Wind_Main_Pulse;
			float m_Global2312_g3385 = _Global_Wind_Main_Pulse2302_g3385;
			float m_Local2312_g3385 = _LocalWindPulse;
			float localfloatswitch2312_g3385 = floatswitch2312_g3385( m_switch2312_g3385 , m_Off2312_g3385 , m_Global2312_g3385 , m_Local2312_g3385 );
			float VAR_WindPulse2421_g3385 = localfloatswitch2312_g3385;
			float FUNC_Angle2470_g3385 = ( VAR_WindStrength2400_g3385 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3385 * 2.0 ) + FUNC_Turbulence2274_g3385 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3385.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * VAR_WindPulse2421_g3385 );
			float VAR_SinA2424_g3385 = sin( FUNC_Angle2470_g3385 );
			float VAR_CosA2362_g3385 = cos( FUNC_Angle2470_g3385 );
			int m_switch2456_g3385 = _WIND_MODE2462_g3385;
			float m_Off2456_g3385 = 1.0;
			float _Global_Wind_Main_Direction2350_g3385 = _Global_Wind_Main_Direction;
			float m_Global2456_g3385 = _Global_Wind_Main_Direction2350_g3385;
			float m_Local2456_g3385 = _LocalWindDirection;
			float localfloatswitch2456_g3385 = floatswitch2456_g3385( m_switch2456_g3385 , m_Off2456_g3385 , m_Global2456_g3385 , m_Local2456_g3385 );
			float _WindDirection2249_g3385 = localfloatswitch2456_g3385;
			float2 localDirectionalEquation2249_g3385 = DirectionalEquation( _WindDirection2249_g3385 );
			float2 break2469_g3385 = localDirectionalEquation2249_g3385;
			float VAR_xLerp2418_g3385 = break2469_g3385.x;
			float lerpResult2258_g3385 = lerp( break2265_g3385.x , ( ( break2265_g3385.y * VAR_SinA2424_g3385 ) + ( break2265_g3385.x * VAR_CosA2362_g3385 ) ) , VAR_xLerp2418_g3385);
			float3 break2340_g3385 = VAR_VERTEXPOSITION_MATRIX2352_g3385;
			float3 break2233_g3385 = VAR_VERTEXPOSITION_MATRIX2352_g3385;
			float VAR_zLerp2416_g3385 = break2469_g3385.y;
			float lerpResult2275_g3385 = lerp( break2233_g3385.z , ( ( break2233_g3385.y * VAR_SinA2424_g3385 ) + ( break2233_g3385.z * VAR_CosA2362_g3385 ) ) , VAR_zLerp2416_g3385);
			float3 appendResult2235_g3385 = (float3(lerpResult2258_g3385 , ( ( break2340_g3385.y * VAR_CosA2362_g3385 ) - ( break2340_g3385.z * VAR_SinA2424_g3385 ) ) , lerpResult2275_g3385));
			float3 VAR_VERTEXPOSITION2354_g3385 = ase_vertex3Pos;
			float3 FUNC_vertexPos2282_g3385 = ( mul( unity_WorldToObject, float4( appendResult2235_g3385 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3385 );
			float3 WIND_FINAL2753_g3385 = FUNC_vertexPos2282_g3385;
			float3 m_Off2966_g3385 = WIND_FINAL2753_g3385;
			int m_switch2655_g3385 = _WindMask_Procedural;
			float m_Off2655_g3385 = 0.0;
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float MASK_OFFSET2670_g3385 = _WindMask_Offset1;
			float temp_output_2957_0_g3385 = ( 1.0 - MASK_OFFSET2670_g3385 );
			float m_TopDown2655_g3385 = ( ( ase_worldNormal.y - temp_output_2957_0_g3385 ) - 0.05 );
			float m_BottomUp2655_g3385 = ( -( ase_worldNormal.y + temp_output_2957_0_g3385 ) - 0.05 );
			float3 temp_cast_4 = (0.5).xxx;
			float3 break2635_g3385 = ( abs( ase_worldNormal ) - temp_cast_4 );
			float dotResult2928_g3385 = dot( ( MASK_OFFSET2670_g3385 + break2635_g3385.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3385 ) + -0.5 ) - break2635_g3385.y ) );
			float m_SideWall2655_g3385 = dotResult2928_g3385;
			float dotResult2921_g3385 = dot( ( MASK_OFFSET2670_g3385 + break2635_g3385.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3385 ) + break2635_g3385.z + -0.75 ) );
			float m_Spherical2655_g3385 = dotResult2921_g3385;
			float m_Spherical_Inverted2655_g3385 = -dotResult2921_g3385;
			float localfloatswitch2655_g3385 = floatswitch2655_g3385( m_switch2655_g3385 , m_Off2655_g3385 , m_TopDown2655_g3385 , m_BottomUp2655_g3385 , m_SideWall2655_g3385 , m_Spherical2655_g3385 , m_Spherical_Inverted2655_g3385 );
			float temp_output_2915_0_g3385 = ( localfloatswitch2655_g3385 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3385 = (float3(temp_output_2915_0_g3385 , temp_output_2915_0_g3385 , temp_output_2915_0_g3385));
			float3 lerpResult2917_g3385 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3385 , appendResult2916_g3385);
			float3 m_TopDown2966_g3385 = lerpResult2917_g3385;
			float3 m_BottomUp2966_g3385 = lerpResult2917_g3385;
			float3 m_SideWall2966_g3385 = lerpResult2917_g3385;
			float3 m_Spherical2966_g3385 = lerpResult2917_g3385;
			float3 m_Spherical_Inverted2966_g3385 = lerpResult2917_g3385;
			float3 localfloat3switch2966_g3385 = float3switch2966_g3385( m_switch2966_g3385 , m_Off2966_g3385 , m_TopDown2966_g3385 , m_BottomUp2966_g3385 , m_SideWall2966_g3385 , m_Spherical2966_g3385 , m_Spherical_Inverted2966_g3385 );
			float3 m_Off2527_g3385 = localfloat3switch2966_g3385;
			float2 uv_WindMask_Map = v.texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3385 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
			float3 appendResult2744_g3385 = (float3(tex2DNode2742_g3385.r , tex2DNode2742_g3385.r , tex2DNode2742_g3385.r));
			float3 temp_output_2910_0_g3385 = ( appendResult2744_g3385 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float3 m_Active2527_g3385 = ( localfloat3switch2966_g3385 * temp_output_2910_0_g3385 );
			float3 localfloat3switch2527_g3385 = float3switch2527_g3385( m_switch2527_g3385 , m_Off2527_g3385 , m_Active2527_g3385 );
			float3 WIND_MASK2748_g3385 = localfloat3switch2527_g3385;
			float3 m_Global2453_g3385 = WIND_MASK2748_g3385;
			float3 m_Local2453_g3385 = WIND_MASK2748_g3385;
			float3 localfloat3switch2453_g3385 = float3switch2453_g3385( m_switch2453_g3385 , m_Off2453_g3385 , m_Global2453_g3385 , m_Local2453_g3385 );
			float3 temp_output_538_0_g3387 = localfloat3switch2453_g3385;
			float3 temp_output_39_0_g3409 = temp_output_538_0_g3387;
			float3 ase_vertexNormal = v.normal.xyz;
			float4 unityObjectToClipPos25_g3409 = UnityObjectToClipPos( ase_vertex3Pos );
			float3 temp_output_33_0_g3409 = ( temp_output_39_0_g3409 + ( ase_vertexNormal * _OutlineThickness * min( unityObjectToClipPos25_g3409.w , _OutlineDistance ) ) );
			float3 outlineVar = temp_output_33_0_g3409;
			v.vertex.xyz += outlineVar;
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			int TILLING_MODE190_g3387 = _TillingMode;
			int m_switch214_g3387 = TILLING_MODE190_g3387;
			float2 appendResult192_g3387 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3387 = appendResult192_g3387;
			float2 m_Standard214_g3387 = TEXTURE_TILLING200_g3387;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3387 = ase_parentObjectScale;
			float2 appendResult205_g3387 = (float2(break206_g3387.z , break206_g3387.y));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 normalizeResult194_g3387 = normalize( ase_vertexNormal );
			float3 break201_g3387 = normalizeResult194_g3387;
			float2 appendResult204_g3387 = (float2(break206_g3387.x , break206_g3387.z));
			float2 appendResult193_g3387 = (float2(break206_g3387.x , break206_g3387.y));
			float2 TEXTURE_TILLING_SCALE210_g3387 = ( ( ( appendResult205_g3387 * break201_g3387.x ) + ( break201_g3387.y * appendResult204_g3387 ) + ( break201_g3387.z * appendResult193_g3387 ) ) * TEXTURE_TILLING200_g3387 );
			float2 m_Scale214_g3387 = TEXTURE_TILLING_SCALE210_g3387;
			float2 localfloat2switch214_g3387 = float2switch214_g3387( m_switch214_g3387 , m_Standard214_g3387 , m_Scale214_g3387 );
			float2 appendResult166_g3387 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3387 = i.uv_texcoord * localfloat2switch214_g3387 + appendResult166_g3387;
			float4 tex2DNode35_g3387 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, uv_TexCoord165_g3387 );
			float4 temp_output_159_0_g3387 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3387 * _Brightness );
			float4 temp_output_21_0_g3409 = ( temp_output_159_0_g3387 * _OutlineTint );
			o.Emission = temp_output_21_0_g3409.xyz;
			o.Normal = float3(0,0,-1);
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry-10" "IgnoreProjector" = "True" "NatureRendererInstancing"="True" }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		ColorMask [_ColorMask]
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
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

		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows exclude_path:deferred dithercrossfade vertex:vertexDataFunc 
		struct Input
		{
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv_texcoord;
			float3 worldPos;
			float2 vertexToFrag30_g3410;
			float3 worldRefl;
			float4 vertexColor : COLOR;
			float3 viewDir;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
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
		uniform int _ToonMode;
		uniform float4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform int _TillingMode;
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		uniform half _Brightness;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_ToonMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform half _NormalStrength;
		uniform float _Saturation;
		uniform int _EnableDetailMask;
		uniform half4 _ColorDetail;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailAlbedoMap);
		uniform int _TillingModeDetail;
		uniform float _DetailTilingXDetail;
		uniform float _DetailTilingYDetail;
		uniform half _DetailOffsetXDetail;
		uniform half _DetailOffsetYDetail;
		uniform half _DetailBrightness;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailMaskMap);
		uniform float _DetailTilingXDetailMask;
		uniform float _DetailTilingYDetailMask;
		uniform half _DetailOffsetXDetailMask;
		uniform half _DetailOffsetYDetailMask;
		uniform half _DetailBlendInfluence;
		uniform half _DetailBlendHeight;
		uniform half _DetailBlendSmooth;
		uniform float _WindMask_TextureVisualize;
		uniform float _WindMask_ProceduralVisualize;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailNormalMap);
		uniform half _DetailNormalMapScale;
		uniform float _IndirectSmoothness;
		uniform float _IndirectOcclusion;
		uniform float _IndirectStrengthSpecular;
		uniform float _ShadowOffset;
		uniform float _ShadowSharpness;
		uniform float _ShadowStrength;
		uniform float _IndirectStrengthDiffuse;
		uniform int _EnableHighlight;
		uniform int _EmissionMode;
		uniform float4 _EmissionTint_01;
		uniform float _EmissionTintStrength_01;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissionMapMask);
		uniform int _EmissionMask_TillingMode;
		uniform float _EmissionMask_TilingX;
		uniform float _EmissionMask_TilingY;
		uniform float _EmissionMask_OffsetX;
		uniform float _EmissionMask_OffsetY;
		uniform float4 _EmissionTint_02;
		uniform float _EmissionTintStrength_02;
		uniform float4 _EmissionTintGlow;
		uniform float _EmissionTintGlowStrength;
		uniform float _Speed;
		uniform float _SpeedMinLevel;
		uniform float _SpeedMaxLevel;
		uniform float4 _HighlightTint;
		uniform float _HighlightStrength;
		uniform half _Shininess;
		uniform half4 _SpecularColor;
		uniform float _SmoothnessStrength;
		uniform int _SmoothnessType;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;


		float floatswitch2458_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2468_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2312_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2456_g3385( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2655_g3385( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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


		float3 float3switch2966_g3385( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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


		float3 float3switch2527_g3385( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch2453_g3385( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		float2 float2switch214_g3387( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float2 float2switch( int m_switch, float2 m_Off, float2 m_Ramp, float2 m_MatCap )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Ramp;
			else if(m_switch ==2)
				return m_MatCap;
			else
			return float2(0,0);
		}


		float4 float4switch49_g3410( int m_switch, float4 m_Off, float4 m_Ramp, float4 m_MatCap )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Ramp;
			else if(m_switch ==2)
				return m_MatCap;
			else
			return float4(0,0,0,0);
		}


		float2 float2switch393_g3387( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch476_g3387( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch506_g3387( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2972_g3385( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2982_g3385( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2986_g3385( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2991_g3385( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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


		float3 float3switch467_g3387( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch502_g3387( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float2 float2switch58_g3413( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch131_g3413( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch547_g3387( int m_switch, float4 m_Smoothness, float4 m_Roughness )
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
			float3 localOutlineOutput35_g3409 = ( 0 );
			int m_switch2453_g3385 = _WindMode;
			float3 m_Off2453_g3385 = float3(0,0,0);
			int m_switch2527_g3385 = _WindMask_Texture;
			int _MASK_MODE_PROCEDRAL2677_g3385 = _WindMask_Procedural;
			int m_switch2966_g3385 = _MASK_MODE_PROCEDRAL2677_g3385;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VAR_VERTEXPOSITION_MATRIX2352_g3385 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 break2265_g3385 = VAR_VERTEXPOSITION_MATRIX2352_g3385;
			int _WIND_MODE2462_g3385 = _WindMode;
			int m_switch2458_g3385 = _WIND_MODE2462_g3385;
			float m_Off2458_g3385 = 1.0;
			float _Global_Wind_Main_Intensity2403_g3385 = _Global_Wind_Main_Intensity;
			float m_Global2458_g3385 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3385 );
			float m_Local2458_g3385 = _LocalWindStrength;
			float localfloatswitch2458_g3385 = floatswitch2458_g3385( m_switch2458_g3385 , m_Off2458_g3385 , m_Global2458_g3385 , m_Local2458_g3385 );
			float VAR_WindStrength2400_g3385 = localfloatswitch2458_g3385;
			int m_switch2468_g3385 = _WIND_MODE2462_g3385;
			float m_Off2468_g3385 = 1.0;
			float _Global_Wind_Main_RandomOffset2378_g3385 = _Global_Wind_Main_RandomOffset;
			float m_Global2468_g3385 = _Global_Wind_Main_RandomOffset2378_g3385;
			float m_Local2468_g3385 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3385 = floatswitch2468_g3385( m_switch2468_g3385 , m_Off2468_g3385 , m_Global2468_g3385 , m_Local2468_g3385 );
			float VAR_WindOffset2419_g3385 = localfloatswitch2468_g3385;
			float4 transform2423_g3385 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3385 = (float2(transform2423_g3385.x , transform2423_g3385.z));
			float dotResult2341_g3385 = dot( appendResult2307_g3385 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3385 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3385 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3385 ) * 43758.55 ) ));
			float VAR_RandomTime2244_g3385 = ( _Time.x * lerpResult2238_g3385 );
			float FUNC_Turbulence2274_g3385 = ( sin( ( ( VAR_RandomTime2244_g3385 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3385.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3385 = _WIND_MODE2462_g3385;
			float m_Off2312_g3385 = 1.0;
			float _Global_Wind_Main_Pulse2302_g3385 = _Global_Wind_Main_Pulse;
			float m_Global2312_g3385 = _Global_Wind_Main_Pulse2302_g3385;
			float m_Local2312_g3385 = _LocalWindPulse;
			float localfloatswitch2312_g3385 = floatswitch2312_g3385( m_switch2312_g3385 , m_Off2312_g3385 , m_Global2312_g3385 , m_Local2312_g3385 );
			float VAR_WindPulse2421_g3385 = localfloatswitch2312_g3385;
			float FUNC_Angle2470_g3385 = ( VAR_WindStrength2400_g3385 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3385 * 2.0 ) + FUNC_Turbulence2274_g3385 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3385.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * VAR_WindPulse2421_g3385 );
			float VAR_SinA2424_g3385 = sin( FUNC_Angle2470_g3385 );
			float VAR_CosA2362_g3385 = cos( FUNC_Angle2470_g3385 );
			int m_switch2456_g3385 = _WIND_MODE2462_g3385;
			float m_Off2456_g3385 = 1.0;
			float _Global_Wind_Main_Direction2350_g3385 = _Global_Wind_Main_Direction;
			float m_Global2456_g3385 = _Global_Wind_Main_Direction2350_g3385;
			float m_Local2456_g3385 = _LocalWindDirection;
			float localfloatswitch2456_g3385 = floatswitch2456_g3385( m_switch2456_g3385 , m_Off2456_g3385 , m_Global2456_g3385 , m_Local2456_g3385 );
			float _WindDirection2249_g3385 = localfloatswitch2456_g3385;
			float2 localDirectionalEquation2249_g3385 = DirectionalEquation( _WindDirection2249_g3385 );
			float2 break2469_g3385 = localDirectionalEquation2249_g3385;
			float VAR_xLerp2418_g3385 = break2469_g3385.x;
			float lerpResult2258_g3385 = lerp( break2265_g3385.x , ( ( break2265_g3385.y * VAR_SinA2424_g3385 ) + ( break2265_g3385.x * VAR_CosA2362_g3385 ) ) , VAR_xLerp2418_g3385);
			float3 break2340_g3385 = VAR_VERTEXPOSITION_MATRIX2352_g3385;
			float3 break2233_g3385 = VAR_VERTEXPOSITION_MATRIX2352_g3385;
			float VAR_zLerp2416_g3385 = break2469_g3385.y;
			float lerpResult2275_g3385 = lerp( break2233_g3385.z , ( ( break2233_g3385.y * VAR_SinA2424_g3385 ) + ( break2233_g3385.z * VAR_CosA2362_g3385 ) ) , VAR_zLerp2416_g3385);
			float3 appendResult2235_g3385 = (float3(lerpResult2258_g3385 , ( ( break2340_g3385.y * VAR_CosA2362_g3385 ) - ( break2340_g3385.z * VAR_SinA2424_g3385 ) ) , lerpResult2275_g3385));
			float3 VAR_VERTEXPOSITION2354_g3385 = ase_vertex3Pos;
			float3 FUNC_vertexPos2282_g3385 = ( mul( unity_WorldToObject, float4( appendResult2235_g3385 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3385 );
			float3 WIND_FINAL2753_g3385 = FUNC_vertexPos2282_g3385;
			float3 m_Off2966_g3385 = WIND_FINAL2753_g3385;
			int m_switch2655_g3385 = _WindMask_Procedural;
			float m_Off2655_g3385 = 0.0;
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float MASK_OFFSET2670_g3385 = _WindMask_Offset1;
			float temp_output_2957_0_g3385 = ( 1.0 - MASK_OFFSET2670_g3385 );
			float m_TopDown2655_g3385 = ( ( ase_worldNormal.y - temp_output_2957_0_g3385 ) - 0.05 );
			float m_BottomUp2655_g3385 = ( -( ase_worldNormal.y + temp_output_2957_0_g3385 ) - 0.05 );
			float3 temp_cast_4 = (0.5).xxx;
			float3 break2635_g3385 = ( abs( ase_worldNormal ) - temp_cast_4 );
			float dotResult2928_g3385 = dot( ( MASK_OFFSET2670_g3385 + break2635_g3385.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3385 ) + -0.5 ) - break2635_g3385.y ) );
			float m_SideWall2655_g3385 = dotResult2928_g3385;
			float dotResult2921_g3385 = dot( ( MASK_OFFSET2670_g3385 + break2635_g3385.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3385 ) + break2635_g3385.z + -0.75 ) );
			float m_Spherical2655_g3385 = dotResult2921_g3385;
			float m_Spherical_Inverted2655_g3385 = -dotResult2921_g3385;
			float localfloatswitch2655_g3385 = floatswitch2655_g3385( m_switch2655_g3385 , m_Off2655_g3385 , m_TopDown2655_g3385 , m_BottomUp2655_g3385 , m_SideWall2655_g3385 , m_Spherical2655_g3385 , m_Spherical_Inverted2655_g3385 );
			float temp_output_2915_0_g3385 = ( localfloatswitch2655_g3385 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3385 = (float3(temp_output_2915_0_g3385 , temp_output_2915_0_g3385 , temp_output_2915_0_g3385));
			float3 lerpResult2917_g3385 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3385 , appendResult2916_g3385);
			float3 m_TopDown2966_g3385 = lerpResult2917_g3385;
			float3 m_BottomUp2966_g3385 = lerpResult2917_g3385;
			float3 m_SideWall2966_g3385 = lerpResult2917_g3385;
			float3 m_Spherical2966_g3385 = lerpResult2917_g3385;
			float3 m_Spherical_Inverted2966_g3385 = lerpResult2917_g3385;
			float3 localfloat3switch2966_g3385 = float3switch2966_g3385( m_switch2966_g3385 , m_Off2966_g3385 , m_TopDown2966_g3385 , m_BottomUp2966_g3385 , m_SideWall2966_g3385 , m_Spherical2966_g3385 , m_Spherical_Inverted2966_g3385 );
			float3 m_Off2527_g3385 = localfloat3switch2966_g3385;
			float2 uv_WindMask_Map = v.texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3385 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
			float3 appendResult2744_g3385 = (float3(tex2DNode2742_g3385.r , tex2DNode2742_g3385.r , tex2DNode2742_g3385.r));
			float3 temp_output_2910_0_g3385 = ( appendResult2744_g3385 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float3 m_Active2527_g3385 = ( localfloat3switch2966_g3385 * temp_output_2910_0_g3385 );
			float3 localfloat3switch2527_g3385 = float3switch2527_g3385( m_switch2527_g3385 , m_Off2527_g3385 , m_Active2527_g3385 );
			float3 WIND_MASK2748_g3385 = localfloat3switch2527_g3385;
			float3 m_Global2453_g3385 = WIND_MASK2748_g3385;
			float3 m_Local2453_g3385 = WIND_MASK2748_g3385;
			float3 localfloat3switch2453_g3385 = float3switch2453_g3385( m_switch2453_g3385 , m_Off2453_g3385 , m_Global2453_g3385 , m_Local2453_g3385 );
			float3 temp_output_538_0_g3387 = localfloat3switch2453_g3385;
			float3 temp_output_39_0_g3409 = temp_output_538_0_g3387;
			float3 vertexoffset35_g3409 = temp_output_39_0_g3409;
			{
			v.vertex.xyz += vertexoffset35_g3409;
			}
			v.vertex.xyz += localOutlineOutput35_g3409;
			v.vertex.w = 1;
			int TILLING_MODE190_g3387 = _TillingMode;
			int m_switch214_g3387 = TILLING_MODE190_g3387;
			float2 appendResult192_g3387 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3387 = appendResult192_g3387;
			float2 m_Standard214_g3387 = TEXTURE_TILLING200_g3387;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3387 = ase_parentObjectScale;
			float2 appendResult205_g3387 = (float2(break206_g3387.z , break206_g3387.y));
			float3 ase_vertexNormal = v.normal.xyz;
			float3 normalizeResult194_g3387 = normalize( ase_vertexNormal );
			float3 break201_g3387 = normalizeResult194_g3387;
			float2 appendResult204_g3387 = (float2(break206_g3387.x , break206_g3387.z));
			float2 appendResult193_g3387 = (float2(break206_g3387.x , break206_g3387.y));
			float2 TEXTURE_TILLING_SCALE210_g3387 = ( ( ( appendResult205_g3387 * break201_g3387.x ) + ( break201_g3387.y * appendResult204_g3387 ) + ( break201_g3387.z * appendResult193_g3387 ) ) * TEXTURE_TILLING200_g3387 );
			float2 m_Scale214_g3387 = TEXTURE_TILLING_SCALE210_g3387;
			float2 localfloat2switch214_g3387 = float2switch214_g3387( m_switch214_g3387 , m_Standard214_g3387 , m_Scale214_g3387 );
			float2 appendResult166_g3387 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3387 = v.texcoord.xy * localfloat2switch214_g3387 + appendResult166_g3387;
			float3 NORMAL_OUT23_g3387 = UnpackScaleNormal( SAMPLE_TEXTURE2D_LOD( _BumpMap, sampler_trilinear_repeat, uv_TexCoord165_g3387, 0.0 ), _NormalStrength );
			float3 temp_output_56_0_g3410 = NORMAL_OUT23_g3387;
			float3 ase_worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
			float3x3 tangentToWorld = CreateTangentToWorldPerVertex( ase_worldNormal, ase_worldTangent, v.tangent.w );
			float3 tangentNormal19_g3410 = temp_output_56_0_g3410;
			float3 modWorldNormal19_g3410 = (tangentToWorld[0] * tangentNormal19_g3410.x + tangentToWorld[1] * tangentNormal19_g3410.y + tangentToWorld[2] * tangentNormal19_g3410.z);
			float3 break12_g3410 = modWorldNormal19_g3410;
			float3 normalizeResult11_g3410 = normalize( ( ( (unity_WorldToObject[0]).xyz * break12_g3410.x ) + ( (unity_WorldToObject[1]).xyz * break12_g3410.y ) + ( (unity_WorldToObject[2]).xyz * break12_g3410.z ) ) );
			o.vertexToFrag30_g3410 = ((mul( UNITY_MATRIX_V, float4( normalizeResult11_g3410 , 0.0 ) ).xyz).xy*0.5 + 0.5);
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			#ifdef UNITY_PASS_FORWARDBASE
			float ase_lightAtten = data.atten;
			if( _LightColor0.a == 0)
			ase_lightAtten = 0;
			#else
			float3 ase_lightAttenRGB = gi.light.color / ( ( _LightColor0.rgb ) + 0.000001 );
			float ase_lightAtten = max( max( ase_lightAttenRGB.r, ase_lightAttenRGB.g ), ase_lightAttenRGB.b );
			#endif
			#if defined(HANDLE_SHADOWS_BLENDING_IN_GI)
			half bakedAtten = UnitySampleBakedOcclusion(data.lightmapUV.xy, data.worldPos);
			float zDist = dot(_WorldSpaceCameraPos - data.worldPos, UNITY_MATRIX_V[2].xyz);
			float fadeDist = UnityComputeShadowFadeDistance(data.worldPos, zDist);
			ase_lightAtten = UnityMixRealtimeAndBakedShadows(data.atten, bakedAtten, UnityComputeShadowFade(fadeDist));
			#endif
			SurfaceOutputStandardSpecular s111_g3416 = (SurfaceOutputStandardSpecular ) 0;
			int SURFACE_MAP_MODE456_g3387 = _EnableDetailMap;
			int m_switch506_g3387 = SURFACE_MAP_MODE456_g3387;
			int TOON_MODE50_g3410 = _ToonMode;
			int m_switch49_g3410 = TOON_MODE50_g3410;
			int TILLING_MODE190_g3387 = _TillingMode;
			int m_switch214_g3387 = TILLING_MODE190_g3387;
			float2 appendResult192_g3387 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3387 = appendResult192_g3387;
			float2 m_Standard214_g3387 = TEXTURE_TILLING200_g3387;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3387 = ase_parentObjectScale;
			float2 appendResult205_g3387 = (float2(break206_g3387.z , break206_g3387.y));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 normalizeResult194_g3387 = normalize( ase_vertexNormal );
			float3 break201_g3387 = normalizeResult194_g3387;
			float2 appendResult204_g3387 = (float2(break206_g3387.x , break206_g3387.z));
			float2 appendResult193_g3387 = (float2(break206_g3387.x , break206_g3387.y));
			float2 TEXTURE_TILLING_SCALE210_g3387 = ( ( ( appendResult205_g3387 * break201_g3387.x ) + ( break201_g3387.y * appendResult204_g3387 ) + ( break201_g3387.z * appendResult193_g3387 ) ) * TEXTURE_TILLING200_g3387 );
			float2 m_Scale214_g3387 = TEXTURE_TILLING_SCALE210_g3387;
			float2 localfloat2switch214_g3387 = float2switch214_g3387( m_switch214_g3387 , m_Standard214_g3387 , m_Scale214_g3387 );
			float2 appendResult166_g3387 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3387 = i.uv_texcoord * localfloat2switch214_g3387 + appendResult166_g3387;
			float4 tex2DNode35_g3387 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, uv_TexCoord165_g3387 );
			float4 temp_output_159_0_g3387 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3387 * _Brightness );
			float4 temp_output_14_0_g3410 = temp_output_159_0_g3387;
			float4 m_Off49_g3410 = temp_output_14_0_g3410;
			int m_switch5_g3410 = _ToonMode;
			float2 m_Off5_g3410 = float2( 1,1 );
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 NORMAL_OUT23_g3387 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, uv_TexCoord165_g3387 ), _NormalStrength );
			float3 temp_output_56_0_g3410 = NORMAL_OUT23_g3387;
			float3 NORMAL_IN78_g3410 = temp_output_56_0_g3410;
			float dotResult16_g3410 = dot( ase_worldlightDir , (WorldNormalVector( i , NORMAL_IN78_g3410 )) );
			float UV_RAMP42_g3410 = saturate( (dotResult16_g3410*0.5 + 0.5) );
			float2 temp_cast_3 = (( UV_RAMP42_g3410 * ase_lightAtten )).xx;
			float2 m_Ramp5_g3410 = temp_cast_3;
			float2 UV_MATCAP43_g3410 = i.vertexToFrag30_g3410;
			float2 m_MatCap5_g3410 = ( UV_MATCAP43_g3410 * ase_lightAtten );
			float2 localfloat2switch5_g3410 = float2switch( m_switch5_g3410 , m_Off5_g3410 , m_Ramp5_g3410 , m_MatCap5_g3410 );
			float4 tex2DNode37_g3410 = SAMPLE_TEXTURE2D( _ToonMap, sampler_trilinear_repeat, localfloat2switch5_g3410 );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 ase_worldReflection = WorldReflectionVector( i, float3( 0, 0, 1 ) );
			float dotResult132_g3410 = dot( ase_worldReflection , ase_worldlightDir );
			float4 temp_output_84_0_g3410 = saturate( ( temp_output_14_0_g3410 + ( ( tex2DNode37_g3410 * tex2DNode37_g3410.a * _Saturation ) * float4( ( ( ase_lightColor.rgb * ase_lightColor.a ) * dotResult132_g3410 ) , 0.0 ) ) ) );
			float4 m_Ramp49_g3410 = temp_output_84_0_g3410;
			float4 m_MatCap49_g3410 = temp_output_84_0_g3410;
			float4 localfloat4switch49_g3410 = float4switch49_g3410( m_switch49_g3410 , m_Off49_g3410 , m_Ramp49_g3410 , m_MatCap49_g3410 );
			float4 ALBEDO_OUT91_g3387 = localfloat4switch49_g3410;
			float4 m_Off506_g3387 = ALBEDO_OUT91_g3387;
			int EnableDetailMask428_g3387 = _EnableDetailMask;
			int m_switch476_g3387 = EnableDetailMask428_g3387;
			int TILLING_MODE_DETAIL435_g3387 = _TillingModeDetail;
			int m_switch393_g3387 = TILLING_MODE_DETAIL435_g3387;
			float2 appendResult432_g3387 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
			float2 TEXTURE_TILLING_DETAIL425_g3387 = appendResult432_g3387;
			float2 m_Standard393_g3387 = TEXTURE_TILLING_DETAIL425_g3387;
			float3 break420_g3387 = ase_parentObjectScale;
			float2 appendResult448_g3387 = (float2(break420_g3387.z , break420_g3387.y));
			float3 normalizeResult480_g3387 = normalize( ase_vertexNormal );
			float3 break431_g3387 = normalizeResult480_g3387;
			float2 appendResult426_g3387 = (float2(break420_g3387.x , break420_g3387.z));
			float2 appendResult433_g3387 = (float2(break420_g3387.x , break420_g3387.y));
			float2 TEXTURE_TILLING_SCALE_DETAIL427_g3387 = ( ( ( appendResult448_g3387 * break431_g3387.x ) + ( break431_g3387.y * appendResult426_g3387 ) + ( break431_g3387.z * appendResult433_g3387 ) ) * TEXTURE_TILLING_DETAIL425_g3387 );
			float2 m_Scale393_g3387 = TEXTURE_TILLING_SCALE_DETAIL427_g3387;
			float2 localfloat2switch393_g3387 = float2switch393_g3387( m_switch393_g3387 , m_Standard393_g3387 , m_Scale393_g3387 );
			float2 appendResult394_g3387 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
			float2 uv_TexCoord414_g3387 = i.uv_texcoord * localfloat2switch393_g3387 + appendResult394_g3387;
			float4 tex2DNode449_g3387 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, uv_TexCoord414_g3387 );
			float4 ALBEDO_OUT_DETAIL493_g3387 = ( _ColorDetail * tex2DNode449_g3387 * _DetailBrightness );
			float4 m_Off476_g3387 = ALBEDO_OUT_DETAIL493_g3387;
			float2 appendResult445_g3387 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
			float2 appendResult417_g3387 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
			float2 uv_TexCoord415_g3387 = i.uv_texcoord * appendResult445_g3387 + appendResult417_g3387;
			float4 tex2DNode418_g3387 = SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, uv_TexCoord415_g3387 );
			float4 lerpResult477_g3387 = lerp( ALBEDO_OUT91_g3387 , ALBEDO_OUT_DETAIL493_g3387 , tex2DNode418_g3387.r);
			float4 m_Active476_g3387 = lerpResult477_g3387;
			float4 localfloat4switch476_g3387 = float4switch476_g3387( m_switch476_g3387 , m_Off476_g3387 , m_Active476_g3387 );
			float4 MASK_ALBEDO_OUT473_g3387 = localfloat4switch476_g3387;
			float4 break462_g3387 = ALBEDO_OUT91_g3387;
			float ALBEDO_IN_XYZ464_g3387 = ( break462_g3387.x + break462_g3387.y + break462_g3387.z );
			float clampResult486_g3387 = clamp( ( ( ( ( ALBEDO_IN_XYZ464_g3387 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( i.vertexColor.r - ( _DetailBlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
			float DETAIL_BLEND396_g3387 = clampResult486_g3387;
			float4 lerpResult503_g3387 = lerp( MASK_ALBEDO_OUT473_g3387 , ALBEDO_OUT91_g3387 , DETAIL_BLEND396_g3387);
			float4 m_Active506_g3387 = lerpResult503_g3387;
			float4 localfloat4switch506_g3387 = float4switch506_g3387( m_switch506_g3387 , m_Off506_g3387 , m_Active506_g3387 );
			int _MASK_MODE_TEXTURE2980_g3385 = _WindMask_Texture;
			int m_switch2982_g3385 = _MASK_MODE_TEXTURE2980_g3385;
			float4 _Vector3 = float4(0,0,0,0);
			float4 m_Off2982_g3385 = _Vector3;
			int m_switch2972_g3385 = (int)_WindMask_TextureVisualize;
			float4 m_Off2972_g3385 = _Vector3;
			float4 color2979_g3385 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
			float4 _Visualize_Color2992_g3385 = color2979_g3385;
			float2 uv_WindMask_Map = i.uv_texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3385 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
			float3 appendResult2744_g3385 = (float3(tex2DNode2742_g3385.r , tex2DNode2742_g3385.r , tex2DNode2742_g3385.r));
			float3 temp_output_2910_0_g3385 = ( appendResult2744_g3385 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float4 appendResult2974_g3385 = (float4(temp_output_2910_0_g3385 , temp_output_2910_0_g3385.x));
			float4 lerpResult2967_g3385 = lerp( _Visualize_Color2992_g3385 , float4( 0,0,0,0 ) , appendResult2974_g3385);
			float4 m_Active2972_g3385 = lerpResult2967_g3385;
			float4 localfloat4switch2972_g3385 = float4switch2972_g3385( m_switch2972_g3385 , m_Off2972_g3385 , m_Active2972_g3385 );
			float4 m_Active2982_g3385 = localfloat4switch2972_g3385;
			float4 localfloat4switch2982_g3385 = float4switch2982_g3385( m_switch2982_g3385 , m_Off2982_g3385 , m_Active2982_g3385 );
			int _MASK_MODE_PROCEDRAL2677_g3385 = _WindMask_Procedural;
			int m_switch2991_g3385 = _MASK_MODE_PROCEDRAL2677_g3385;
			float4 m_Off2991_g3385 = _Vector3;
			int m_switch2986_g3385 = (int)_WindMask_ProceduralVisualize;
			float4 m_Off2986_g3385 = _Vector3;
			int m_switch2655_g3385 = _WindMask_Procedural;
			float m_Off2655_g3385 = 0.0;
			float MASK_OFFSET2670_g3385 = _WindMask_Offset1;
			float temp_output_2957_0_g3385 = ( 1.0 - MASK_OFFSET2670_g3385 );
			float m_TopDown2655_g3385 = ( ( ase_worldNormal.y - temp_output_2957_0_g3385 ) - 0.05 );
			float m_BottomUp2655_g3385 = ( -( ase_worldNormal.y + temp_output_2957_0_g3385 ) - 0.05 );
			float3 temp_cast_14 = (0.5).xxx;
			float3 break2635_g3385 = ( abs( ase_worldNormal ) - temp_cast_14 );
			float dotResult2928_g3385 = dot( ( MASK_OFFSET2670_g3385 + break2635_g3385.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3385 ) + -0.5 ) - break2635_g3385.y ) );
			float m_SideWall2655_g3385 = dotResult2928_g3385;
			float dotResult2921_g3385 = dot( ( MASK_OFFSET2670_g3385 + break2635_g3385.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3385 ) + break2635_g3385.z + -0.75 ) );
			float m_Spherical2655_g3385 = dotResult2921_g3385;
			float m_Spherical_Inverted2655_g3385 = -dotResult2921_g3385;
			float localfloatswitch2655_g3385 = floatswitch2655_g3385( m_switch2655_g3385 , m_Off2655_g3385 , m_TopDown2655_g3385 , m_BottomUp2655_g3385 , m_SideWall2655_g3385 , m_Spherical2655_g3385 , m_Spherical_Inverted2655_g3385 );
			float temp_output_2915_0_g3385 = ( localfloatswitch2655_g3385 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3385 = (float3(temp_output_2915_0_g3385 , temp_output_2915_0_g3385 , temp_output_2915_0_g3385));
			float4 appendResult2977_g3385 = (float4(appendResult2916_g3385 , appendResult2916_g3385.x));
			float4 lerpResult2976_g3385 = lerp( _Visualize_Color2992_g3385 , float4( 0,0,0,0 ) , appendResult2977_g3385);
			float4 m_Active2986_g3385 = lerpResult2976_g3385;
			float4 localfloat4switch2986_g3385 = float4switch2986_g3385( m_switch2986_g3385 , m_Off2986_g3385 , m_Active2986_g3385 );
			float4 m_TopDown2991_g3385 = localfloat4switch2986_g3385;
			float4 m_BottomUp2991_g3385 = localfloat4switch2986_g3385;
			float4 m_SideWall2991_g3385 = localfloat4switch2986_g3385;
			float4 m_Spherical2991_g3385 = localfloat4switch2986_g3385;
			float4 m_Spherical_Inverted2991_g3385 = localfloat4switch2986_g3385;
			float4 localfloat4switch2991_g3385 = float4switch2991_g3385( m_switch2991_g3385 , m_Off2991_g3385 , m_TopDown2991_g3385 , m_BottomUp2991_g3385 , m_SideWall2991_g3385 , m_Spherical2991_g3385 , m_Spherical_Inverted2991_g3385 );
			float3 temp_cast_18 = (1.0).xxx;
			int m_switch502_g3387 = SURFACE_MAP_MODE456_g3387;
			float3 m_Off502_g3387 = NORMAL_OUT23_g3387;
			int m_switch467_g3387 = EnableDetailMask428_g3387;
			float3 NORMAL_OUT_DETAIL491_g3387 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, uv_TexCoord414_g3387 ), _DetailNormalMapScale );
			float3 m_Off467_g3387 = NORMAL_OUT_DETAIL491_g3387;
			float3 lerpResult470_g3387 = lerp( NORMAL_OUT23_g3387 , NORMAL_OUT_DETAIL491_g3387 , tex2DNode418_g3387.r);
			float3 m_Active467_g3387 = saturate( lerpResult470_g3387 );
			float3 localfloat3switch467_g3387 = float3switch467_g3387( m_switch467_g3387 , m_Off467_g3387 , m_Active467_g3387 );
			float3 MASK_NORMAL_OUT469_g3387 = localfloat3switch467_g3387;
			float3 lerpResult498_g3387 = lerp( MASK_NORMAL_OUT469_g3387 , NORMAL_OUT23_g3387 , DETAIL_BLEND396_g3387);
			float3 m_Active502_g3387 = ( NORMAL_OUT23_g3387 + saturate( lerpResult498_g3387 ) );
			float3 localfloat3switch502_g3387 = float3switch502_g3387( m_switch502_g3387 , m_Off502_g3387 , m_Active502_g3387 );
			float3 temp_output_466_88 = localfloat3switch502_g3387;
			float3 NORMAL_IN26_g3416 = temp_output_466_88;
			float3 indirectNormal112_g3416 = WorldNormalVector( i , NORMAL_IN26_g3416 );
			Unity_GlossyEnvironmentData g112_g3416 = UnityGlossyEnvironmentSetup( _IndirectSmoothness, data.worldViewDir, indirectNormal112_g3416, float3(0,0,0));
			float3 indirectSpecular112_g3416 = UnityGI_IndirectSpecular( data, _IndirectOcclusion, indirectNormal112_g3416, g112_g3416 );
			float3 lerpResult31_g3416 = lerp( temp_cast_18 , indirectSpecular112_g3416 , ( 1.0 - _IndirectStrengthSpecular ));
			float temp_output_40_0_g3416 = ( 1.0 - ( ( 1.0 - ase_lightAtten ) * _WorldSpaceLightPos0.w ) );
			float dotResult33_g3416 = dot( (WorldNormalVector( i , NORMAL_IN26_g3416 )) , ase_worldlightDir );
			float clampResult93_g3416 = clamp( ( dotResult33_g3416 * dotResult33_g3416 * dotResult33_g3416 ) , 0.0 , 1.0 );
			float lerpResult51_g3416 = lerp( temp_output_40_0_g3416 , ( saturate( ( ( clampResult93_g3416 + _ShadowOffset ) / _ShadowSharpness ) ) * ase_lightAtten ) , _ShadowStrength);
			float3 temp_cast_20 = (1.0).xxx;
			UnityGI gi113_g3416 = gi;
			float3 diffNorm113_g3416 = WorldNormalVector( i , NORMAL_IN26_g3416 );
			gi113_g3416 = UnityGI_Base( data, 1, diffNorm113_g3416 );
			float3 indirectDiffuse113_g3416 = gi113_g3416.indirect.diffuse + diffNorm113_g3416 * 0.0001;
			float3 lerpResult12_g3416 = lerp( temp_cast_20 , indirectDiffuse113_g3416 , ( 1.0 - _IndirectStrengthDiffuse ));
			float3 temp_output_20_0_g3416 = ( ( ase_lightColor.rgb * lerpResult51_g3416 ) + ( lerpResult12_g3416 * ase_lightColor.a * temp_output_40_0_g3416 ) );
			float3 temp_output_83_0_g3416 = ( lerpResult31_g3416 * saturate( temp_output_20_0_g3416 ) );
			float3 LIGHTING66_g3416 = temp_output_83_0_g3416;
			float4 temp_output_71_0_g3416 = ( ( localfloat4switch506_g3387 + ( localfloat4switch2982_g3385 + localfloat4switch2991_g3385 ) ) * float4( LIGHTING66_g3416 , 0.0 ) );
			float4 ALBEDO_IN65_g3416 = temp_output_71_0_g3416;
			s111_g3416.Albedo = ALBEDO_IN65_g3416.xyz;
			s111_g3416.Normal = WorldNormalVector( i , NORMAL_IN26_g3416 );
			int m_switch72_g3415 = _EnableHighlight;
			float4 color79_g3415 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 m_Off72_g3415 = color79_g3415;
			int m_switch131_g3413 = _EmissionMode;
			float4 color46_g3413 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 COLOR_000079_g3413 = color46_g3413;
			float4 m_Off131_g3413 = COLOR_000079_g3413;
			float4 EMISSION_TINT_01_RGBA75_g3413 = _EmissionTint_01;
			float EMISSION_TINT_01_A62_g3413 = _EmissionTint_01.a;
			float EMISSION_TINT_01_STRENGHT73_g3413 = _EmissionTintStrength_01;
			int m_switch58_g3413 = _EmissionMask_TillingMode;
			float2 appendResult57_g3413 = (float2(_EmissionMask_TilingX , _EmissionMask_TilingY));
			float2 m_Standard58_g3413 = appendResult57_g3413;
			float3 break35_g3413 = ase_parentObjectScale;
			float2 appendResult13_g3413 = (float2(break35_g3413.z , break35_g3413.y));
			float3 normalizeResult60_g3413 = normalize( ase_vertexNormal );
			float3 break44_g3413 = normalizeResult60_g3413;
			float2 appendResult28_g3413 = (float2(break35_g3413.x , break35_g3413.z));
			float2 appendResult9_g3413 = (float2(break35_g3413.x , break35_g3413.y));
			float2 m_Scale58_g3413 = ( ( ( appendResult13_g3413 * break44_g3413.x ) + ( break44_g3413.y * appendResult28_g3413 ) + ( break44_g3413.z * appendResult9_g3413 ) ) * appendResult57_g3413 );
			float2 localfloat2switch58_g3413 = float2switch58_g3413( m_switch58_g3413 , m_Standard58_g3413 , m_Scale58_g3413 );
			float2 appendResult27_g3413 = (float2(_EmissionMask_OffsetX , _EmissionMask_OffsetY));
			float2 uv_TexCoord74_g3413 = i.uv_texcoord * localfloat2switch58_g3413 + appendResult27_g3413;
			float4 tex2DNode82_g3413 = SAMPLE_TEXTURE2D( _EmissionMapMask, sampler_trilinear_repeat, uv_TexCoord74_g3413 );
			float4 EMISSION_MAP_MASK_RGBA91_g3413 = tex2DNode82_g3413;
			float4 lerpResult117_g3413 = lerp( COLOR_000079_g3413 , ( EMISSION_TINT_01_RGBA75_g3413 * EMISSION_TINT_01_A62_g3413 * EMISSION_TINT_01_STRENGHT73_g3413 ) , EMISSION_MAP_MASK_RGBA91_g3413);
			float4 EMISSION_TINT_02_RGBA69_g3413 = _EmissionTint_02;
			float EMISSION_TINT_02_A92_g3413 = _EmissionTint_02.a;
			float EMISSION_TINT_02_STRENGHT70_g3413 = _EmissionTintStrength_02;
			float4 lerpResult124_g3413 = lerp( lerpResult117_g3413 , ( EMISSION_TINT_02_RGBA69_g3413 * EMISSION_TINT_02_A92_g3413 * EMISSION_TINT_02_STRENGHT70_g3413 ) , EMISSION_MAP_MASK_RGBA91_g3413);
			float4 EMISSION_TINTGLOW_RGBA90_g3413 = _EmissionTintGlow;
			float EMISSION_TINTGLOW_A78_g3413 = _EmissionTintGlow.a;
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 NORMAL470 = temp_output_466_88;
			float3 NORMAL_IN77_g3413 = NORMAL470;
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
			float fresnelNdotV123_g3413 = dot( mul(ase_tangentToWorldFast,NORMAL_IN77_g3413), ase_worldViewDir );
			float fresnelNode123_g3413 = ( 0.0 + 1.0 * pow( max( 1.0 - fresnelNdotV123_g3413 , 0.0001 ), 10.0 ) );
			float4 lerpResult121_g3413 = lerp( COLOR_000079_g3413 , ( EMISSION_TINTGLOW_RGBA90_g3413 * EMISSION_TINTGLOW_A78_g3413 ) , fresnelNode123_g3413);
			float EMISSION_TINTGLOW_STRENGHT93_g3413 = _EmissionTintGlowStrength;
			float4 EMISSION_TYPE_HIGHLIGHT109_g3413 = saturate( ( lerpResult124_g3413 + ( lerpResult121_g3413 * EMISSION_TINTGLOW_STRENGHT93_g3413 ) ) );
			float4 m_Active131_g3413 = EMISSION_TYPE_HIGHLIGHT109_g3413;
			float4 localfloat4switch131_g3413 = float4switch131_g3413( m_switch131_g3413 , m_Off131_g3413 , m_Active131_g3413 );
			float3 temp_output_104_0_g3415 = NORMAL470;
			float3 normalizeResult113_g3415 = normalize( temp_output_104_0_g3415 );
			float3 normalizeResult110_g3415 = normalize( i.viewDir );
			float dotResult107_g3415 = dot( normalizeResult113_g3415 , normalizeResult110_g3415 );
			float mulTime97_g3415 = _Time.y * 0.05;
			float4 temp_output_74_0_g3415 = ( ( pow( ( 1.0 - saturate( dotResult107_g3415 ) ) , (10.0 + ((_SpeedMinLevel + (sin( ( mulTime97_g3415 * _Speed ) ) - -1.0) * (_SpeedMaxLevel - _SpeedMinLevel) / (1.0 - -1.0)) - 0.0) * (0.0 - 10.0) / (1.0 - 0.0)) ) * _HighlightTint * _HighlightTint.a ) * _HighlightStrength );
			float4 m_Active72_g3415 = ( localfloat4switch131_g3413 + temp_output_74_0_g3415 );
			float4 localfloat4switch72_g3415 = float4switch( m_switch72_g3415 , m_Off72_g3415 , m_Active72_g3415 );
			float4 EMISSION_IN7_g3416 = localfloat4switch72_g3415;
			s111_g3416.Emission = EMISSION_IN7_g3416.xyz;
			float3 normalizeResult126_g3416 = normalize( (WorldNormalVector( i , NORMAL_IN26_g3416 )) );
			float3 normalizeResult133_g3416 = normalize( ( ase_worldViewDir + ase_worldlightDir ) );
			float dotResult128_g3416 = dot( normalizeResult126_g3416 , normalizeResult133_g3416 );
			float clampResult124_g3416 = clamp( ( dotResult128_g3416 * dotResult128_g3416 * dotResult128_g3416 ) , 0.0 , 1.0 );
			float4 SPECULAR101_g3416 = saturate( ( pow( clampResult124_g3416 , max( _Shininess , 110.0 ) ) * _SpecularColor * _SpecularColor.a ) );
			s111_g3416.Specular = SPECULAR101_g3416.rgb;
			int m_switch547_g3387 = _SmoothnessType;
			float2 CUSTOM_UV1179_g3387 = uv_TexCoord165_g3387;
			float4 tex2DNode126_g3387 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3387 );
			float4 m_Smoothness547_g3387 = tex2DNode126_g3387;
			float4 m_Roughness547_g3387 = ( 1.0 - tex2DNode126_g3387 );
			float4 localfloat4switch547_g3387 = float4switch547_g3387( m_switch547_g3387 , m_Smoothness547_g3387 , m_Roughness547_g3387 );
			float4 temp_output_21_0_g3416 = ( _SmoothnessStrength * localfloat4switch547_g3387 );
			float4 SMOOTHNESS_IN60_g3416 = temp_output_21_0_g3416;
			s111_g3416.Smoothness = SMOOTHNESS_IN60_g3416.x;
			float4 color525_g3387 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float lerpResult134_g3387 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3387 ).r , i.vertexColor.a , (float)_OcclusionSourceMode);
			float4 temp_cast_33 = (lerpResult134_g3387).xxxx;
			float4 lerpResult135_g3387 = lerp( color525_g3387 , temp_cast_33 , _OcclusionStrengthAO);
			float4 temp_output_74_0_g3416 = lerpResult135_g3387;
			float4 temp_cast_35 = (1.0).xxxx;
			float NdotL166_g3416 = dotResult33_g3416;
			float4 lerpResult167_g3416 = lerp( temp_output_74_0_g3416 , temp_cast_35 , NdotL166_g3416);
			float4 lerpResult170_g3416 = lerp( lerpResult167_g3416 , temp_output_74_0_g3416 , ( 1.0 - temp_output_21_0_g3416 ));
			float4 OCCLUSION_IN53_g3416 = lerpResult170_g3416;
			s111_g3416.Occlusion = OCCLUSION_IN53_g3416.x;

			data.light = gi.light;

			UnityGI gi111_g3416 = gi;
			#ifdef UNITY_PASS_FORWARDBASE
			Unity_GlossyEnvironmentData g111_g3416 = UnityGlossyEnvironmentSetup( s111_g3416.Smoothness, data.worldViewDir, s111_g3416.Normal, float3(0,0,0));
			gi111_g3416 = UnityGlobalIllumination( data, s111_g3416.Occlusion, s111_g3416.Normal, g111_g3416 );
			#endif

			float3 surfResult111_g3416 = LightingStandardSpecular ( s111_g3416, viewDir, gi111_g3416 ).rgb;
			surfResult111_g3416 += s111_g3416.Emission;

			#ifdef UNITY_PASS_FORWARDADD//111_g3416
			surfResult111_g3416 -= s111_g3416.Emission;
			#endif//111_g3416
			c.rgb = surfResult111_g3416;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;259.3741;1011.424;1;True;False
Node;AmplifyShaderEditor.FunctionNode;370;-307.6684,-554.2856;Inherit;False;DECSF Module Wind;94;;3385;a1f35481f1717b54dbd93d220457588d;8,2454,0,2433,0,2371,0,2457,0,2432,0,2434,0,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.FunctionNode;466;26.83244,-593.2863;Inherit;False;DECSF Master Map Surface;3;;3387;6c26b12be02413b47bab527585da6bf6;6,185,0,508,1,520,1,533,1,534,1,542,0;2;538;FLOAT3;0,0,0;False;550;FLOAT4;0,0,0,0;False;9;FLOAT4;106;FLOAT3;88;COLOR;115;FLOAT4;129;COLOR;116;FLOAT;181;FLOAT;144;FLOAT;318;FLOAT3;535
Node;AmplifyShaderEditor.RegisterLocalVarNode;470;641.094,-697.2231;Inherit;False;NORMAL;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;471;-275.0695,-675.4097;Inherit;False;470;NORMAL;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;460;-88.53142,-727.6637;Inherit;False;DECSF Module Emission;79;;3413;58d2647a47347ee4891854495f246dd8;0;1;72;FLOAT3;0,0,1;False;1;FLOAT4;2
Node;AmplifyShaderEditor.CommentaryNode;475;1081.395,-1088.618;Inherit;False;363.9333;128.6;Header;1;293;;0.4207596,0.990566,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;290;1099.66,-874.6608;Inherit;False;346.5028;193.4201;;2;291;353;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1079.083,-1228.865;Inherit;False;370;124;Header;1;294;GLOBAL SETTINGS ;0.1191993,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;462;240.799,-694.1728;Inherit;False;DECSF Module Highlight;70;;3415;0d70e226ee2a0634ba3a01f211d91aae;1,73,1;2;77;FLOAT4;0,0,0,0;False;104;FLOAT3;1,1,1;False;1;FLOAT4;80
Node;AmplifyShaderEditor.IntNode;291;1108.889,-832.9455;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1113.131,-761.5532;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;474;639.4709,-591.0547;Inherit;False;DECSF Module Custom Lighting;55;;3416;17e43a223603563419b42df41ff5e7c3;9,91,0,39,0,23,0,38,0,105,0,4,0,72,1,73,0,172,1;10;5;FLOAT4;0,0,0,0;False;62;FLOAT4;0,0,0,0;False;22;FLOAT3;1,1,1;False;48;FLOAT4;0,0,0,0;False;21;FLOAT4;0,0,0,0;False;74;FLOAT4;0,0,0,0;False;9;FLOAT4;0,0,0,0;False;47;FLOAT4;0,0,0,0;False;49;FLOAT3;0,0,0;False;46;FLOAT3;0,0,0;False;3;FLOAT4;109;FLOAT4;108;FLOAT3;107
Node;AmplifyShaderEditor.IntNode;294;1091.696,-1180.653;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;293;1097.595,-1045.118;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1099.596,-656.6111;Float;False;True;-1;3;;200;0;CustomLighting;DEC/Custom Lighting/Custom Lighting Surface Detail;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;466;538;370;2190
WireConnection;466;550;370;2970
WireConnection;470;0;466;88
WireConnection;460;72;471;0
WireConnection;462;77;460;2
WireConnection;462;104;471;0
WireConnection;474;5;462;80
WireConnection;474;62;466;106
WireConnection;474;22;466;88
WireConnection;474;21;466;129
WireConnection;474;74;466;116
WireConnection;194;13;474;107
WireConnection;194;11;466;535
ASEEND*/
//CHKSM=333E772E2C2D7BD2E6430717B432781288F918D0