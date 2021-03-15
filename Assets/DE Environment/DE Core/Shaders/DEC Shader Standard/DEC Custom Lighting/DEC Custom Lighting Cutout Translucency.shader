// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Custom Lighting/Custom Lighting Cutout Translucency"
{
	Properties
	{
		[Header(VERSION 1.4.0 STANDARD)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Default,0,Flip,1,Mirror,2)]_NormalMode("Normal Mode", Int) = 0
		[Enum(Off,0,Active,1)]_GlancingClipMode("Clip Glancing Angle Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.49
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
		[Enum(Off,0,Color Shift Vertex Normal,1,Color Shift Vertex Color,2)][Header(COLOR SHIFT MODE)]_ColorMode("Color Mode", Int) = 0
		_ColorShift_ShiftVariation("Shift Variation", Range( 0 , 1)) = 0.145
		_ColorShift_RGBBrightness("Color Shift RGB Brightness ", Range( 0.25 , 3)) = 1
		_ColorShift_RGBHue("Color Shift RGB Hue", Range( -0.5 , 0.5)) = -0.2
		_ColorShift_RGBSaturation("Color Shift RGB Saturation", Range( 0 , 0.95)) = 0.95
		[Enum(Off,0,Active,1)][Header(TRANSLUCENCY)]_EnableTranslucency("Enable Translucency", Int) = 0
		[Enum(Default,0,Cull Front Face,1,Cull Back Face,2)]_TranslucencyCullForward("Translucency Cull", Int) = 0
		[Enum(Texture,0,Baked UV4,1)]_TranslucencySource("Translucency Source", Int) = 0
		[HDR]_TranslucencyTint("Translucency Tint", Color) = (0.575,0.75,0,1)
		[HDR]_TransmissionTint("Transmission Tint", Color) = (0.3833333,0.5,0,1)
		[NoScaleOffset][SingleLineTexture]_TranslucencyMap("Translucency Map", 2D) = "white" {}
		[Enum(Default,0,Inverted,1)]_MapInverted("Map Inverted", Int) = 0
		_TranslucencyThickness("Translucency Thickness", Range( 0 , 1.5)) = 1.5
		[Header (LIGHTING)]_IndirectStrengthDiffuse("Indirect Strength Diffuse", Range( 0 , 1)) = 0.07647059
		[HideInInspector]_MaskClipValue("Mask Clip Value", Float) = 0.5
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
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		_EmissionMask_OffsetX("Offset X", Float) = 1
		_EmissionMask_OffsetY("Offset Y", Float) = 1
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Enum(Leaf,0,Palm,1,Grass,2,Simple,3,Ivy,4)]_WindType("Wind Type", Int) = 0
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Wind Strength", Float) = 1
		_GlobalTurbulenceInfluence("Wind Turbulence", Float) = 0.35
		[Header(WIND MODE LOCAL)]_LocalWindStrength("Wind Strength", Float) = 1
		_LocalWindPulse("Wind Pulse", Float) = 0.1
		_LocalWindTurbulence("Wind Turbulence", Float) = 0.35
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
		Tags{ "RenderType" = "Opaque"  "Queue" = "Transparent-10" "NatureRendererInstancing"="True" }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		Stencil
		{
			Ref 0
			Comp Always
			Pass Keep
			Fail Keep
			ZFail Keep
		}
		AlphaToMask [_AlphatoCoverage]
		ColorMask [_ColorMask]
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "UnityStandardUtils.cginc"
		#include "Lighting.cginc"
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

		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			float3 worldNormal;
			INTERNAL_DATA
			float4 vertexColor : COLOR;
			float2 vertexToFrag30_g3435;
			float3 worldRefl;
			half ASEVFace : VFACE;
			float2 uv4_texcoord4;
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
		uniform float _AlphatoCoverage;
		uniform int _CullMode;
		uniform int _ZWriteMode;
		uniform int _WindMode;
		uniform int _WindMask_Texture;
		uniform int _WindMask_Procedural;
		uniform int _WindType;
		uniform float _GlobalWindInfluenceOther;
		uniform float _Global_Wind_Main_Intensity;
		uniform float _LocalWindStrength;
		uniform float _Global_Wind_Main_RandomOffset;
		uniform float _LocalRandomWindOffset;
		uniform float _Global_Wind_Main_Pulse;
		uniform float _LocalWindPulse;
		uniform float _Global_Wind_Main_Direction;
		uniform float _LocalWindDirection;
		uniform float _GlobalTurbulenceInfluence;
		uniform float _Global_Wind_Main_Turbulence;
		uniform float _LocalWindTurbulence;
		uniform float _WindMask_Offset1;
		uniform float _WindMask_Procedural_Intensity;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_WindMask_Map);
		uniform float4 _WindMask_Map_ST;
		SamplerState sampler_trilinear_repeat;
		uniform float _WindMask_Texture_Intensity;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		uniform half _AlphaCutoffBias;
		uniform int _GlancingClipMode;
		uniform int _ToonMode;
		uniform int _ColorMode;
		uniform float4 _Color;
		uniform half _Brightness;
		uniform float _ColorShift_ShiftVariation;
		uniform float _ColorShift_RGBHue;
		uniform float _ColorShift_RGBSaturation;
		uniform float _ColorShift_RGBBrightness;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_ToonMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform half _NormalStrength;
		uniform float _Saturation;
		uniform float _WindMask_TextureVisualize;
		uniform float _WindMask_ProceduralVisualize;
		uniform int _NormalMode;
		uniform float _IndirectSmoothness;
		uniform float _IndirectOcclusion;
		uniform float _IndirectStrengthSpecular;
		uniform float _ShadowOffset;
		uniform float _ShadowSharpness;
		uniform float _ShadowStrength;
		uniform float _IndirectStrengthDiffuse;
		uniform int _TranslucencyCullForward;
		uniform int _EnableTranslucency;
		uniform float4 _TranslucencyTint;
		uniform int _MapInverted;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_TranslucencyMap);
		uniform float _TranslucencyThickness;
		uniform int _TranslucencySource;
		uniform half4 _TransmissionTint;
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
		uniform float _MaskClipValue;


		float floatswitch2458_g3419( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2468_g3419( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2312_g3419( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2456_g3419( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2326_g3419( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float3 float3switch2439_g3419( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
		{
			if(m_switch ==0)
				return m_Leaf;
			else if(m_switch ==1)
				return m_Palm;
			else if(m_switch ==2)
				return m_Grass;
			else if(m_switch ==3)
				return m_Simple;
			else if(m_switch ==4)
				return m_Ivy;
			else
			return float3(0,0,0);
		}


		float floatswitch2655_g3419( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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


		float3 float3switch2966_g3419( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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


		float3 float3switch2527_g3419( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch2453_g3419( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		float floatswitch599_g3431( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		float floatswitch836_g3431( int m_switch, float m_Off, float m_ColorShiftVertexNormal, float m_ColorShiftVertexColor )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_ColorShiftVertexNormal;
			else if(m_switch ==2)
				return m_ColorShiftVertexColor;
			else
			return float(0);
		}


		float3 RGBToHSV(float3 c)
		{
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
			float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
			float d = q.x - min( q.w, q.y );
			float e = 1.0e-10;
			return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}

		float3 float3switch420_g3431( int m_switch, float3 m_Off, float3 m_ColorShiftVertexNormal, float3 m_ColorShiftVertexColor )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_ColorShiftVertexNormal;
			else if(m_switch ==2)
				return m_ColorShiftVertexColor;
			else
			return float3(0,0,0);
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


		float4 float4switch49_g3435( int m_switch, float4 m_Off, float4 m_Ramp, float4 m_MatCap )
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


		float4 float4switch2972_g3419( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2982_g3419( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2986_g3419( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2991_g3419( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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


		float3 float3switch9_g3434( int m_switch, float3 m_Default, float3 m_Flip, float3 m_Mirror )
		{
			if(m_switch ==0)
				return m_Default;
			else if(m_switch ==1)
				return m_Flip;
			else if(m_switch ==2)
				return m_Mirror;
			else
			return float3(0,0,0);
		}


		float4 float4switch( int m_switch, float4 m_Default, float4 m_Inverted )
		{
			if(m_switch ==0)
				return m_Default;
			else if(m_switch ==1)
				return m_Inverted;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch324_g3431( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch539_g3431( int m_switch, float4 m_Default, float4 m_CullFrontFace, float4 m_CullBackFace )
		{
			if(m_switch ==0)
				return m_Default;
			else if(m_switch ==1)
				return m_CullFrontFace;
			else if(m_switch ==2)
				return m_CullBackFace;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch332_g3431( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch537_g3431( int m_switch, float4 m_Default, float4 m_CullFrontFace, float4 m_CullBackFace )
		{
			if(m_switch ==0)
				return m_Default;
			else if(m_switch ==1)
				return m_CullFrontFace;
			else if(m_switch ==2)
				return m_CullBackFace;
			else
			return float4(0,0,0,0);
		}


		float2 float2switch58_g3438( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch131_g3438( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch845_g3431( int m_switch, float4 m_Smoothness, float4 m_Roughness )
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
			int m_switch2453_g3419 = _WindMode;
			float3 m_Off2453_g3419 = float3(0,0,0);
			int m_switch2527_g3419 = _WindMask_Texture;
			int _MASK_MODE_PROCEDRAL2677_g3419 = _WindMask_Procedural;
			int m_switch2966_g3419 = _MASK_MODE_PROCEDRAL2677_g3419;
			int m_switch2439_g3419 = _WindType;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VAR_VERTEXPOSITION_MATRIX2352_g3419 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 break2265_g3419 = VAR_VERTEXPOSITION_MATRIX2352_g3419;
			int _WIND_MODE2462_g3419 = _WindMode;
			int m_switch2458_g3419 = _WIND_MODE2462_g3419;
			float m_Off2458_g3419 = 1.0;
			float _Global_Wind_Main_Intensity2403_g3419 = _Global_Wind_Main_Intensity;
			float m_Global2458_g3419 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3419 );
			float m_Local2458_g3419 = _LocalWindStrength;
			float localfloatswitch2458_g3419 = floatswitch2458_g3419( m_switch2458_g3419 , m_Off2458_g3419 , m_Global2458_g3419 , m_Local2458_g3419 );
			float VAR_WindStrength2400_g3419 = localfloatswitch2458_g3419;
			int m_switch2468_g3419 = _WIND_MODE2462_g3419;
			float m_Off2468_g3419 = 1.0;
			float _Global_Wind_Main_RandomOffset2378_g3419 = _Global_Wind_Main_RandomOffset;
			float m_Global2468_g3419 = _Global_Wind_Main_RandomOffset2378_g3419;
			float m_Local2468_g3419 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3419 = floatswitch2468_g3419( m_switch2468_g3419 , m_Off2468_g3419 , m_Global2468_g3419 , m_Local2468_g3419 );
			float VAR_WindOffset2419_g3419 = localfloatswitch2468_g3419;
			float4 transform2423_g3419 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3419 = (float2(transform2423_g3419.x , transform2423_g3419.z));
			float dotResult2341_g3419 = dot( appendResult2307_g3419 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3419 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3419 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3419 ) * 43758.55 ) ));
			float VAR_RandomTime2244_g3419 = ( _Time.x * lerpResult2238_g3419 );
			float FUNC_Turbulence2274_g3419 = ( sin( ( ( VAR_RandomTime2244_g3419 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3419.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3419 = _WIND_MODE2462_g3419;
			float m_Off2312_g3419 = 1.0;
			float _Global_Wind_Main_Pulse2302_g3419 = _Global_Wind_Main_Pulse;
			float m_Global2312_g3419 = _Global_Wind_Main_Pulse2302_g3419;
			float m_Local2312_g3419 = _LocalWindPulse;
			float localfloatswitch2312_g3419 = floatswitch2312_g3419( m_switch2312_g3419 , m_Off2312_g3419 , m_Global2312_g3419 , m_Local2312_g3419 );
			float VAR_WindPulse2421_g3419 = localfloatswitch2312_g3419;
			float FUNC_Angle2470_g3419 = ( VAR_WindStrength2400_g3419 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3419 * 2.0 ) + FUNC_Turbulence2274_g3419 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3419.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * VAR_WindPulse2421_g3419 );
			float VAR_SinA2424_g3419 = sin( FUNC_Angle2470_g3419 );
			float VAR_CosA2362_g3419 = cos( FUNC_Angle2470_g3419 );
			int m_switch2456_g3419 = _WIND_MODE2462_g3419;
			float m_Off2456_g3419 = 1.0;
			float _Global_Wind_Main_Direction2350_g3419 = _Global_Wind_Main_Direction;
			float m_Global2456_g3419 = _Global_Wind_Main_Direction2350_g3419;
			float m_Local2456_g3419 = _LocalWindDirection;
			float localfloatswitch2456_g3419 = floatswitch2456_g3419( m_switch2456_g3419 , m_Off2456_g3419 , m_Global2456_g3419 , m_Local2456_g3419 );
			float _WindDirection2249_g3419 = localfloatswitch2456_g3419;
			float2 localDirectionalEquation2249_g3419 = DirectionalEquation( _WindDirection2249_g3419 );
			float2 break2469_g3419 = localDirectionalEquation2249_g3419;
			float VAR_xLerp2418_g3419 = break2469_g3419.x;
			float lerpResult2258_g3419 = lerp( break2265_g3419.x , ( ( break2265_g3419.y * VAR_SinA2424_g3419 ) + ( break2265_g3419.x * VAR_CosA2362_g3419 ) ) , VAR_xLerp2418_g3419);
			float3 break2340_g3419 = VAR_VERTEXPOSITION_MATRIX2352_g3419;
			float3 break2233_g3419 = VAR_VERTEXPOSITION_MATRIX2352_g3419;
			float VAR_zLerp2416_g3419 = break2469_g3419.y;
			float lerpResult2275_g3419 = lerp( break2233_g3419.z , ( ( break2233_g3419.y * VAR_SinA2424_g3419 ) + ( break2233_g3419.z * VAR_CosA2362_g3419 ) ) , VAR_zLerp2416_g3419);
			float3 appendResult2235_g3419 = (float3(lerpResult2258_g3419 , ( ( break2340_g3419.y * VAR_CosA2362_g3419 ) - ( break2340_g3419.z * VAR_SinA2424_g3419 ) ) , lerpResult2275_g3419));
			float3 VAR_VERTEXPOSITION2354_g3419 = ase_vertex3Pos;
			float3 FUNC_vertexPos2282_g3419 = ( mul( unity_WorldToObject, float4( appendResult2235_g3419 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3419 );
			float3 break2518_g3419 = FUNC_vertexPos2282_g3419;
			half FUNC_SinFunction2336_g3419 = sin( ( ( VAR_RandomTime2244_g3419 * 200.0 * ( 0.2 + v.color.g ) ) + ( v.color.g * 10.0 ) + FUNC_Turbulence2274_g3419 + ( VAR_VERTEXPOSITION_MATRIX2352_g3419.z / 2.0 ) ) );
			int m_switch2326_g3419 = _WIND_MODE2462_g3419;
			float m_Off2326_g3419 = 1.0;
			float _Global_Wind_Main_Turbulence2267_g3419 = _Global_Wind_Main_Turbulence;
			float m_Global2326_g3419 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence2267_g3419 );
			float m_Local2326_g3419 = _LocalWindTurbulence;
			float localfloatswitch2326_g3419 = floatswitch2326_g3419( m_switch2326_g3419 , m_Off2326_g3419 , m_Global2326_g3419 , m_Local2326_g3419 );
			float VAR_GlobalWindTurbulence2442_g3419 = localfloatswitch2326_g3419;
			float3 appendResult2480_g3419 = (float3(break2518_g3419.x , ( break2518_g3419.y + ( FUNC_SinFunction2336_g3419 * v.color.b * ( FUNC_Angle2470_g3419 + ( VAR_WindStrength2400_g3419 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3419 ) ) , break2518_g3419.z));
			float3 OUT_Leafs_Standalone2396_g3419 = appendResult2480_g3419;
			float3 m_Leaf2439_g3419 = OUT_Leafs_Standalone2396_g3419;
			float3 OUT_Palm_Standalone2310_g3419 = ( ( FUNC_SinFunction2336_g3419 * v.color.b * ( FUNC_Angle2470_g3419 + ( VAR_WindStrength2400_g3419 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3419 ) + FUNC_vertexPos2282_g3419 );
			float3 m_Palm2439_g3419 = OUT_Palm_Standalone2310_g3419;
			float3 break2486_g3419 = FUNC_vertexPos2282_g3419;
			float temp_output_2514_0_g3419 = ( FUNC_SinFunction2336_g3419 * v.color.b * ( FUNC_Angle2470_g3419 + ( VAR_WindStrength2400_g3419 / 200.0 ) ) );
			float lerpResult2482_g3419 = lerp( 0.0 , temp_output_2514_0_g3419 , VAR_xLerp2418_g3419);
			float lerpResult2484_g3419 = lerp( 0.0 , temp_output_2514_0_g3419 , VAR_zLerp2416_g3419);
			float3 appendResult2489_g3419 = (float3(( break2486_g3419.x + lerpResult2482_g3419 ) , break2486_g3419.y , ( break2486_g3419.z + lerpResult2484_g3419 )));
			float3 OUT_Grass_Standalone2242_g3419 = appendResult2489_g3419;
			float3 m_Grass2439_g3419 = OUT_Grass_Standalone2242_g3419;
			float3 m_Simple2439_g3419 = FUNC_vertexPos2282_g3419;
			float clampResult2884_g3419 = clamp( ( VAR_WindStrength2400_g3419 - 0.95 ) , 0.0 , 1.0 );
			float3 break2708_g3419 = FUNC_vertexPos2282_g3419;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 break2718_g3419 = ase_worldPos;
			float temp_output_2690_0_g3419 = ( VAR_RandomTime2244_g3419 * 25.0 );
			float clampResult2691_g3419 = clamp( 25.0 , 0.2 , 0.25 );
			float2 appendResult2694_g3419 = (float2(temp_output_2690_0_g3419 , ( temp_output_2690_0_g3419 / clampResult2691_g3419 )));
			float3 appendResult2706_g3419 = (float3(break2708_g3419.x , ( break2708_g3419.y + cos( ( ( ( break2718_g3419.x + break2718_g3419.y + break2718_g3419.z ) * 2.0 ) + appendResult2694_g3419 + FUNC_Angle2470_g3419 + VAR_GlobalWindTurbulence2442_g3419 ) ) ).x , break2708_g3419.z));
			float3 temp_output_2613_0_g3419 = ( clampResult2884_g3419 * appendResult2706_g3419 );
			float3 ase_vertexNormal = v.normal.xyz;
			float4 ase_vertexTangent = v.tangent;
			float3 WIND_CLOTH_VERTEX997_g3419 = ( ( ( cos( temp_output_2613_0_g3419 ) + ( -0.3193 * UNITY_PI ) ) * ase_vertexNormal * 0.2 * ( FUNC_SinFunction2336_g3419 * v.color.b ) ) + ( sin( temp_output_2613_0_g3419 ) * cross( ase_vertexNormal , ase_vertexTangent.xyz ) * 0.2 ) );
			float3 m_Ivy2439_g3419 = WIND_CLOTH_VERTEX997_g3419;
			float3 localfloat3switch2439_g3419 = float3switch2439_g3419( m_switch2439_g3419 , m_Leaf2439_g3419 , m_Palm2439_g3419 , m_Grass2439_g3419 , m_Simple2439_g3419 , m_Ivy2439_g3419 );
			float3 WIND_FINAL2753_g3419 = localfloat3switch2439_g3419;
			float3 m_Off2966_g3419 = WIND_FINAL2753_g3419;
			int m_switch2655_g3419 = _WindMask_Procedural;
			float m_Off2655_g3419 = 0.0;
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float MASK_OFFSET2670_g3419 = _WindMask_Offset1;
			float temp_output_2957_0_g3419 = ( 1.0 - MASK_OFFSET2670_g3419 );
			float m_TopDown2655_g3419 = ( ( ase_worldNormal.y - temp_output_2957_0_g3419 ) - 0.05 );
			float m_BottomUp2655_g3419 = ( -( ase_worldNormal.y + temp_output_2957_0_g3419 ) - 0.05 );
			float3 temp_cast_5 = (0.5).xxx;
			float3 break2635_g3419 = ( abs( ase_worldNormal ) - temp_cast_5 );
			float dotResult2928_g3419 = dot( ( MASK_OFFSET2670_g3419 + break2635_g3419.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3419 ) + -0.5 ) - break2635_g3419.y ) );
			float m_SideWall2655_g3419 = dotResult2928_g3419;
			float dotResult2921_g3419 = dot( ( MASK_OFFSET2670_g3419 + break2635_g3419.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3419 ) + break2635_g3419.z + -0.75 ) );
			float m_Spherical2655_g3419 = dotResult2921_g3419;
			float m_Spherical_Inverted2655_g3419 = -dotResult2921_g3419;
			float localfloatswitch2655_g3419 = floatswitch2655_g3419( m_switch2655_g3419 , m_Off2655_g3419 , m_TopDown2655_g3419 , m_BottomUp2655_g3419 , m_SideWall2655_g3419 , m_Spherical2655_g3419 , m_Spherical_Inverted2655_g3419 );
			float temp_output_2915_0_g3419 = ( localfloatswitch2655_g3419 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3419 = (float3(temp_output_2915_0_g3419 , temp_output_2915_0_g3419 , temp_output_2915_0_g3419));
			float3 lerpResult2917_g3419 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3419 , appendResult2916_g3419);
			float3 m_TopDown2966_g3419 = lerpResult2917_g3419;
			float3 m_BottomUp2966_g3419 = lerpResult2917_g3419;
			float3 m_SideWall2966_g3419 = lerpResult2917_g3419;
			float3 m_Spherical2966_g3419 = lerpResult2917_g3419;
			float3 m_Spherical_Inverted2966_g3419 = lerpResult2917_g3419;
			float3 localfloat3switch2966_g3419 = float3switch2966_g3419( m_switch2966_g3419 , m_Off2966_g3419 , m_TopDown2966_g3419 , m_BottomUp2966_g3419 , m_SideWall2966_g3419 , m_Spherical2966_g3419 , m_Spherical_Inverted2966_g3419 );
			float3 m_Off2527_g3419 = localfloat3switch2966_g3419;
			float2 uv_WindMask_Map = v.texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3419 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
			float3 appendResult2744_g3419 = (float3(tex2DNode2742_g3419.r , tex2DNode2742_g3419.r , tex2DNode2742_g3419.r));
			float3 temp_output_2910_0_g3419 = ( appendResult2744_g3419 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float3 m_Active2527_g3419 = ( localfloat3switch2966_g3419 * temp_output_2910_0_g3419 );
			float3 localfloat3switch2527_g3419 = float3switch2527_g3419( m_switch2527_g3419 , m_Off2527_g3419 , m_Active2527_g3419 );
			float3 WIND_MASK2748_g3419 = localfloat3switch2527_g3419;
			float3 m_Global2453_g3419 = WIND_MASK2748_g3419;
			float3 m_Local2453_g3419 = WIND_MASK2748_g3419;
			float3 localfloat3switch2453_g3419 = float3switch2453_g3419( m_switch2453_g3419 , m_Off2453_g3419 , m_Global2453_g3419 , m_Local2453_g3419 );
			float3 temp_output_756_0_g3431 = localfloat3switch2453_g3419;
			v.vertex.xyz += temp_output_756_0_g3431;
			v.vertex.w = 1;
			float2 appendResult77_g3431 = (float2(_TilingX , _TilingY));
			float2 appendResult82_g3431 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord73_g3431 = v.texcoord.xy * appendResult77_g3431 + appendResult82_g3431;
			float2 appendResult559_g3431 = (float2(uv_TexCoord73_g3431.x , uv_TexCoord73_g3431.y));
			float3 NORMAL_MAP761_g3431 = UnpackScaleNormal( SAMPLE_TEXTURE2D_LOD( _BumpMap, sampler_trilinear_repeat, appendResult559_g3431, 0.0 ), _NormalStrength );
			float3 temp_output_56_0_g3435 = NORMAL_MAP761_g3431;
			float3 ase_worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
			float3x3 tangentToWorld = CreateTangentToWorldPerVertex( ase_worldNormal, ase_worldTangent, v.tangent.w );
			float3 tangentNormal19_g3435 = temp_output_56_0_g3435;
			float3 modWorldNormal19_g3435 = (tangentToWorld[0] * tangentNormal19_g3435.x + tangentToWorld[1] * tangentNormal19_g3435.y + tangentToWorld[2] * tangentNormal19_g3435.z);
			float3 break12_g3435 = modWorldNormal19_g3435;
			float3 normalizeResult11_g3435 = normalize( ( ( (unity_WorldToObject[0]).xyz * break12_g3435.x ) + ( (unity_WorldToObject[1]).xyz * break12_g3435.y ) + ( (unity_WorldToObject[2]).xyz * break12_g3435.z ) ) );
			o.vertexToFrag30_g3435 = ((mul( UNITY_MATRIX_V, float4( normalizeResult11_g3435 , 0.0 ) ).xyz).xy*0.5 + 0.5);
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
			float2 appendResult77_g3431 = (float2(_TilingX , _TilingY));
			float2 appendResult82_g3431 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord73_g3431 = i.uv_texcoord * appendResult77_g3431 + appendResult82_g3431;
			float2 appendResult559_g3431 = (float2(uv_TexCoord73_g3431.x , uv_TexCoord73_g3431.y));
			float4 tex2DNode57_g3431 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, appendResult559_g3431 );
			float ALBEDO_A716_g3431 = tex2DNode57_g3431.a;
			clip( ALBEDO_A716_g3431 - ( 1.0 - _AlphaCutoffBias ));
			float temp_output_741_0_g3431 = saturate( ( ( ALBEDO_A716_g3431 / max( fwidth( ALBEDO_A716_g3431 ) , 0.0001 ) ) + 0.5 ) );
			float4 temp_cast_0 = (temp_output_741_0_g3431).xxxx;
			float4 temp_output_9_0_g3442 = temp_cast_0;
			int m_switch599_g3431 = _GlancingClipMode;
			float m_Off599_g3431 = 1.0;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult583_g3431 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
			float dotResult587_g3431 = dot( ase_worldViewDir , normalizeResult583_g3431 );
			float temp_output_585_0_g3431 = ( 1.0 - abs( dotResult587_g3431 ) );
			float temp_output_590_0_g3431 = ( 1.0 - ( temp_output_585_0_g3431 * temp_output_585_0_g3431 ) );
			float m_Active599_g3431 = temp_output_590_0_g3431;
			float localfloatswitch599_g3431 = floatswitch599_g3431( m_switch599_g3431 , m_Off599_g3431 , m_Active599_g3431 );
			float4 temp_cast_2 = (localfloatswitch599_g3431).xxxx;
			float4 temp_output_47_0_g3442 = temp_cast_2;
			SurfaceOutputStandardSpecular s111_g3442 = (SurfaceOutputStandardSpecular ) 0;
			int TOON_MODE50_g3435 = _ToonMode;
			int m_switch49_g3435 = TOON_MODE50_g3435;
			int m_switch420_g3431 = _ColorMode;
			float3 temp_output_11_0_g3431 = (_Color).rgb;
			float3 temp_output_76_0_g3431 = ( temp_output_11_0_g3431 * (tex2DNode57_g3431).rgb * _Brightness );
			float3 ALBEDO_01424_g3431 = temp_output_76_0_g3431;
			float3 m_Off420_g3431 = ALBEDO_01424_g3431;
			int _COLOR_MODE835_g3431 = _ColorMode;
			int m_switch836_g3431 = _COLOR_MODE835_g3431;
			float m_Off836_g3431 = 0.0;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float m_ColorShiftVertexNormal836_g3431 = ( ase_vertexNormal.y - 0.5 );
			float m_ColorShiftVertexColor836_g3431 = ( i.vertexColor.g - 0.5 );
			float localfloatswitch836_g3431 = floatswitch836_g3431( m_switch836_g3431 , m_Off836_g3431 , m_ColorShiftVertexNormal836_g3431 , m_ColorShiftVertexColor836_g3431 );
			float3 hsvTorgb823_g3431 = RGBToHSV( ALBEDO_01424_g3431 );
			float3 hsvTorgb816_g3431 = HSVToRGB( float3(( ( localfloatswitch836_g3431 * _ColorShift_ShiftVariation ) + _ColorShift_RGBHue + hsvTorgb823_g3431 ).x,( hsvTorgb823_g3431.y * _ColorShift_RGBSaturation ),( hsvTorgb823_g3431.z * _ColorShift_RGBBrightness )) );
			float3 m_ColorShiftVertexNormal420_g3431 = hsvTorgb816_g3431;
			float3 m_ColorShiftVertexColor420_g3431 = hsvTorgb816_g3431;
			float3 localfloat3switch420_g3431 = float3switch420_g3431( m_switch420_g3431 , m_Off420_g3431 , m_ColorShiftVertexNormal420_g3431 , m_ColorShiftVertexColor420_g3431 );
			float3 COLOR_SHIFTING426_g3431 = localfloat3switch420_g3431;
			float4 temp_output_14_0_g3435 = float4( COLOR_SHIFTING426_g3431 , 0.0 );
			float4 m_Off49_g3435 = temp_output_14_0_g3435;
			int m_switch5_g3435 = _ToonMode;
			float2 m_Off5_g3435 = float2( 1,1 );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 NORMAL_MAP761_g3431 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, appendResult559_g3431 ), _NormalStrength );
			float3 temp_output_56_0_g3435 = NORMAL_MAP761_g3431;
			float3 NORMAL_IN78_g3435 = temp_output_56_0_g3435;
			float dotResult16_g3435 = dot( ase_worldlightDir , (WorldNormalVector( i , NORMAL_IN78_g3435 )) );
			float UV_RAMP42_g3435 = saturate( (dotResult16_g3435*0.5 + 0.5) );
			float2 temp_cast_7 = (( UV_RAMP42_g3435 * ase_lightAtten )).xx;
			float2 m_Ramp5_g3435 = temp_cast_7;
			float2 UV_MATCAP43_g3435 = i.vertexToFrag30_g3435;
			float2 m_MatCap5_g3435 = ( UV_MATCAP43_g3435 * ase_lightAtten );
			float2 localfloat2switch5_g3435 = float2switch( m_switch5_g3435 , m_Off5_g3435 , m_Ramp5_g3435 , m_MatCap5_g3435 );
			float4 tex2DNode37_g3435 = SAMPLE_TEXTURE2D( _ToonMap, sampler_trilinear_repeat, localfloat2switch5_g3435 );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 ase_worldReflection = WorldReflectionVector( i, float3( 0, 0, 1 ) );
			float dotResult132_g3435 = dot( ase_worldReflection , ase_worldlightDir );
			float4 temp_output_84_0_g3435 = saturate( ( temp_output_14_0_g3435 + ( ( tex2DNode37_g3435 * tex2DNode37_g3435.a * _Saturation ) * float4( ( ( ase_lightColor.rgb * ase_lightColor.a ) * dotResult132_g3435 ) , 0.0 ) ) ) );
			float4 m_Ramp49_g3435 = temp_output_84_0_g3435;
			float4 m_MatCap49_g3435 = temp_output_84_0_g3435;
			float4 localfloat4switch49_g3435 = float4switch49_g3435( m_switch49_g3435 , m_Off49_g3435 , m_Ramp49_g3435 , m_MatCap49_g3435 );
			int _MASK_MODE_TEXTURE2980_g3419 = _WindMask_Texture;
			int m_switch2982_g3419 = _MASK_MODE_TEXTURE2980_g3419;
			float4 _Vector3 = float4(0,0,0,0);
			float4 m_Off2982_g3419 = _Vector3;
			int m_switch2972_g3419 = (int)_WindMask_TextureVisualize;
			float4 m_Off2972_g3419 = _Vector3;
			float4 color2979_g3419 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
			float4 _Visualize_Color2992_g3419 = color2979_g3419;
			float2 uv_WindMask_Map = i.uv_texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3419 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
			float3 appendResult2744_g3419 = (float3(tex2DNode2742_g3419.r , tex2DNode2742_g3419.r , tex2DNode2742_g3419.r));
			float3 temp_output_2910_0_g3419 = ( appendResult2744_g3419 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float4 appendResult2974_g3419 = (float4(temp_output_2910_0_g3419 , temp_output_2910_0_g3419.x));
			float4 lerpResult2967_g3419 = lerp( _Visualize_Color2992_g3419 , float4( 0,0,0,0 ) , appendResult2974_g3419);
			float4 m_Active2972_g3419 = lerpResult2967_g3419;
			float4 localfloat4switch2972_g3419 = float4switch2972_g3419( m_switch2972_g3419 , m_Off2972_g3419 , m_Active2972_g3419 );
			float4 m_Active2982_g3419 = localfloat4switch2972_g3419;
			float4 localfloat4switch2982_g3419 = float4switch2982_g3419( m_switch2982_g3419 , m_Off2982_g3419 , m_Active2982_g3419 );
			int _MASK_MODE_PROCEDRAL2677_g3419 = _WindMask_Procedural;
			int m_switch2991_g3419 = _MASK_MODE_PROCEDRAL2677_g3419;
			float4 m_Off2991_g3419 = _Vector3;
			int m_switch2986_g3419 = (int)_WindMask_ProceduralVisualize;
			float4 m_Off2986_g3419 = _Vector3;
			int m_switch2655_g3419 = _WindMask_Procedural;
			float m_Off2655_g3419 = 0.0;
			float MASK_OFFSET2670_g3419 = _WindMask_Offset1;
			float temp_output_2957_0_g3419 = ( 1.0 - MASK_OFFSET2670_g3419 );
			float m_TopDown2655_g3419 = ( ( ase_worldNormal.y - temp_output_2957_0_g3419 ) - 0.05 );
			float m_BottomUp2655_g3419 = ( -( ase_worldNormal.y + temp_output_2957_0_g3419 ) - 0.05 );
			float3 temp_cast_15 = (0.5).xxx;
			float3 break2635_g3419 = ( abs( ase_worldNormal ) - temp_cast_15 );
			float dotResult2928_g3419 = dot( ( MASK_OFFSET2670_g3419 + break2635_g3419.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3419 ) + -0.5 ) - break2635_g3419.y ) );
			float m_SideWall2655_g3419 = dotResult2928_g3419;
			float dotResult2921_g3419 = dot( ( MASK_OFFSET2670_g3419 + break2635_g3419.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3419 ) + break2635_g3419.z + -0.75 ) );
			float m_Spherical2655_g3419 = dotResult2921_g3419;
			float m_Spherical_Inverted2655_g3419 = -dotResult2921_g3419;
			float localfloatswitch2655_g3419 = floatswitch2655_g3419( m_switch2655_g3419 , m_Off2655_g3419 , m_TopDown2655_g3419 , m_BottomUp2655_g3419 , m_SideWall2655_g3419 , m_Spherical2655_g3419 , m_Spherical_Inverted2655_g3419 );
			float temp_output_2915_0_g3419 = ( localfloatswitch2655_g3419 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3419 = (float3(temp_output_2915_0_g3419 , temp_output_2915_0_g3419 , temp_output_2915_0_g3419));
			float4 appendResult2977_g3419 = (float4(appendResult2916_g3419 , appendResult2916_g3419.x));
			float4 lerpResult2976_g3419 = lerp( _Visualize_Color2992_g3419 , float4( 0,0,0,0 ) , appendResult2977_g3419);
			float4 m_Active2986_g3419 = lerpResult2976_g3419;
			float4 localfloat4switch2986_g3419 = float4switch2986_g3419( m_switch2986_g3419 , m_Off2986_g3419 , m_Active2986_g3419 );
			float4 m_TopDown2991_g3419 = localfloat4switch2986_g3419;
			float4 m_BottomUp2991_g3419 = localfloat4switch2986_g3419;
			float4 m_SideWall2991_g3419 = localfloat4switch2986_g3419;
			float4 m_Spherical2991_g3419 = localfloat4switch2986_g3419;
			float4 m_Spherical_Inverted2991_g3419 = localfloat4switch2986_g3419;
			float4 localfloat4switch2991_g3419 = float4switch2991_g3419( m_switch2991_g3419 , m_Off2991_g3419 , m_TopDown2991_g3419 , m_BottomUp2991_g3419 , m_SideWall2991_g3419 , m_Spherical2991_g3419 , m_Spherical_Inverted2991_g3419 );
			float3 temp_cast_19 = (1.0).xxx;
			int m_switch9_g3434 = _NormalMode;
			float3 NORMAL_IN17_g3434 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, appendResult559_g3431 ), _NormalStrength );
			float3 m_Default9_g3434 = NORMAL_IN17_g3434;
			float3 m_Flip9_g3434 = ( NORMAL_IN17_g3434 * i.ASEVFace );
			float3 break2_g3434 = NORMAL_IN17_g3434;
			float3 appendResult3_g3434 = (float3(break2_g3434.x , break2_g3434.y , ( break2_g3434.z * i.ASEVFace )));
			float3 m_Mirror9_g3434 = appendResult3_g3434;
			float3 localfloat3switch9_g3434 = float3switch9_g3434( m_switch9_g3434 , m_Default9_g3434 , m_Flip9_g3434 , m_Mirror9_g3434 );
			float3 temp_output_530_11_g3431 = localfloat3switch9_g3434;
			float3 temp_output_3057_95 = temp_output_530_11_g3431;
			float3 NORMAL_IN26_g3442 = temp_output_3057_95;
			float3 indirectNormal112_g3442 = WorldNormalVector( i , NORMAL_IN26_g3442 );
			Unity_GlossyEnvironmentData g112_g3442 = UnityGlossyEnvironmentSetup( _IndirectSmoothness, data.worldViewDir, indirectNormal112_g3442, float3(0,0,0));
			float3 indirectSpecular112_g3442 = UnityGI_IndirectSpecular( data, _IndirectOcclusion, indirectNormal112_g3442, g112_g3442 );
			float3 lerpResult31_g3442 = lerp( temp_cast_19 , indirectSpecular112_g3442 , ( 1.0 - _IndirectStrengthSpecular ));
			float temp_output_40_0_g3442 = ( 1.0 - ( ( 1.0 - ase_lightAtten ) * _WorldSpaceLightPos0.w ) );
			float dotResult33_g3442 = dot( (WorldNormalVector( i , NORMAL_IN26_g3442 )) , ase_worldlightDir );
			float clampResult93_g3442 = clamp( ( dotResult33_g3442 * dotResult33_g3442 * dotResult33_g3442 ) , 0.0 , 1.0 );
			float lerpResult51_g3442 = lerp( temp_output_40_0_g3442 , ( saturate( ( ( clampResult93_g3442 + _ShadowOffset ) / _ShadowSharpness ) ) * ase_lightAtten ) , _ShadowStrength);
			float3 temp_cast_21 = (1.0).xxx;
			UnityGI gi113_g3442 = gi;
			float3 diffNorm113_g3442 = WorldNormalVector( i , NORMAL_IN26_g3442 );
			gi113_g3442 = UnityGI_Base( data, 1, diffNorm113_g3442 );
			float3 indirectDiffuse113_g3442 = gi113_g3442.indirect.diffuse + diffNorm113_g3442 * 0.0001;
			float3 lerpResult12_g3442 = lerp( temp_cast_21 , indirectDiffuse113_g3442 , ( 1.0 - _IndirectStrengthDiffuse ));
			float3 temp_output_20_0_g3442 = ( ( ase_lightColor.rgb * lerpResult51_g3442 ) + ( lerpResult12_g3442 * ase_lightColor.a * temp_output_40_0_g3442 ) );
			float3 temp_output_83_0_g3442 = ( lerpResult31_g3442 * saturate( temp_output_20_0_g3442 ) );
			float3 LIGHTING66_g3442 = temp_output_83_0_g3442;
			float4 temp_output_71_0_g3442 = ( ( localfloat4switch49_g3435 + ( localfloat4switch2982_g3419 + localfloat4switch2991_g3419 ) ) * float4( LIGHTING66_g3442 , 0.0 ) );
			int m_switch539_g3431 = _TranslucencyCullForward;
			int TRANSLUCENCY_MODE523_g3431 = _EnableTranslucency;
			int m_switch324_g3431 = TRANSLUCENCY_MODE523_g3431;
			float4 m_Off324_g3431 = float4( 0,0,0,0 );
			int m_switch639_g3431 = _MapInverted;
			float4 color726_g3431 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 COLOR_0000727_g3431 = color726_g3431;
			float2 CUSTOM_UV1263_g3431 = appendResult559_g3431;
			float4 tex2DNode322_g3431 = SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3431 );
			float4 lerpResult326_g3431 = lerp( COLOR_0000727_g3431 , tex2DNode322_g3431 , _TranslucencyThickness);
			float4 m_Default639_g3431 = lerpResult326_g3431;
			float temp_output_620_0_g3431 = ( 0.0 - 1.0 );
			float temp_output_623_0_g3431 = ( tex2DNode322_g3431.r - 1.0 );
			float lerpResult631_g3431 = lerp( ( temp_output_620_0_g3431 / temp_output_623_0_g3431 ) , ( temp_output_623_0_g3431 / temp_output_620_0_g3431 ) , ( 0.7 + _TranslucencyThickness ));
			float4 temp_cast_24 = (saturate( lerpResult631_g3431 )).xxxx;
			float4 m_Inverted639_g3431 = temp_cast_24;
			float4 localfloat4switch639_g3431 = float4switch( m_switch639_g3431 , m_Default639_g3431 , m_Inverted639_g3431 );
			float lerpResult334_g3431 = lerp( 0.0 , ( 5.0 - i.uv4_texcoord4.x ) , _TranslucencyThickness);
			float4 temp_cast_25 = (lerpResult334_g3431).xxxx;
			float4 lerpResult369_g3431 = lerp( localfloat4switch639_g3431 , temp_cast_25 , (float)_TranslucencySource);
			float3 temp_output_371_0_g3431 = ( ase_lightColor.rgb * ase_lightColor.a );
			float3 GLOBAL_LIGHT_COLOR373_g3431 = temp_output_371_0_g3431;
			float4 m_Active324_g3431 = ( ( _TranslucencyTint * _TranslucencyTint.a * lerpResult369_g3431 ) * float4( GLOBAL_LIGHT_COLOR373_g3431 , 0.0 ) );
			float4 localfloat4switch324_g3431 = float4switch324_g3431( m_switch324_g3431 , m_Off324_g3431 , m_Active324_g3431 );
			float4 m_Default539_g3431 = localfloat4switch324_g3431;
			float4 switchResult531_g3431 = (((i.ASEVFace>0)?(_Vector3):(localfloat4switch324_g3431)));
			float4 m_CullFrontFace539_g3431 = switchResult531_g3431;
			float4 switchResult540_g3431 = (((i.ASEVFace>0)?(localfloat4switch324_g3431):(_Vector3)));
			float4 m_CullBackFace539_g3431 = switchResult540_g3431;
			float4 localfloat4switch539_g3431 = float4switch539_g3431( m_switch539_g3431 , m_Default539_g3431 , m_CullFrontFace539_g3431 , m_CullBackFace539_g3431 );
			int m_switch537_g3431 = _TranslucencyCullForward;
			int m_switch332_g3431 = TRANSLUCENCY_MODE523_g3431;
			float4 m_Off332_g3431 = float4( 0,0,0,0 );
			float4 m_Active332_g3431 = ( ( _TransmissionTint * _TransmissionTint.a * lerpResult369_g3431 ) * float4( GLOBAL_LIGHT_COLOR373_g3431 , 0.0 ) );
			float4 localfloat4switch332_g3431 = float4switch332_g3431( m_switch332_g3431 , m_Off332_g3431 , m_Active332_g3431 );
			float4 m_Default537_g3431 = localfloat4switch332_g3431;
			float4 switchResult535_g3431 = (((i.ASEVFace>0)?(_Vector3):(localfloat4switch332_g3431)));
			float4 m_CullFrontFace537_g3431 = switchResult535_g3431;
			float4 switchResult541_g3431 = (((i.ASEVFace>0)?(localfloat4switch332_g3431):(_Vector3)));
			float4 m_CullBackFace537_g3431 = switchResult541_g3431;
			float4 localfloat4switch537_g3431 = float4switch537_g3431( m_switch537_g3431 , m_Default537_g3431 , m_CullFrontFace537_g3431 , m_CullBackFace537_g3431 );
			float4 ALBEDO_IN65_g3442 = ( ( temp_output_71_0_g3442 + float4( localfloat4switch539_g3431.xyz , 0.0 ) ) + float4( localfloat4switch537_g3431.xyz , 0.0 ) );
			s111_g3442.Albedo = ALBEDO_IN65_g3442.xyz;
			s111_g3442.Normal = WorldNormalVector( i , NORMAL_IN26_g3442 );
			int m_switch72_g3440 = _EnableHighlight;
			float4 color79_g3440 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 m_Off72_g3440 = color79_g3440;
			int m_switch131_g3438 = _EmissionMode;
			float4 color46_g3438 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 COLOR_000079_g3438 = color46_g3438;
			float4 m_Off131_g3438 = COLOR_000079_g3438;
			float4 EMISSION_TINT_01_RGBA75_g3438 = _EmissionTint_01;
			float EMISSION_TINT_01_A62_g3438 = _EmissionTint_01.a;
			float EMISSION_TINT_01_STRENGHT73_g3438 = _EmissionTintStrength_01;
			int m_switch58_g3438 = _EmissionMask_TillingMode;
			float2 appendResult57_g3438 = (float2(_EmissionMask_TilingX , _EmissionMask_TilingY));
			float2 m_Standard58_g3438 = appendResult57_g3438;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break35_g3438 = ase_parentObjectScale;
			float2 appendResult13_g3438 = (float2(break35_g3438.z , break35_g3438.y));
			float3 normalizeResult60_g3438 = normalize( ase_vertexNormal );
			float3 break44_g3438 = normalizeResult60_g3438;
			float2 appendResult28_g3438 = (float2(break35_g3438.x , break35_g3438.z));
			float2 appendResult9_g3438 = (float2(break35_g3438.x , break35_g3438.y));
			float2 m_Scale58_g3438 = ( ( ( appendResult13_g3438 * break44_g3438.x ) + ( break44_g3438.y * appendResult28_g3438 ) + ( break44_g3438.z * appendResult9_g3438 ) ) * appendResult57_g3438 );
			float2 localfloat2switch58_g3438 = float2switch58_g3438( m_switch58_g3438 , m_Standard58_g3438 , m_Scale58_g3438 );
			float2 appendResult27_g3438 = (float2(_EmissionMask_OffsetX , _EmissionMask_OffsetY));
			float2 uv_TexCoord74_g3438 = i.uv_texcoord * localfloat2switch58_g3438 + appendResult27_g3438;
			float4 tex2DNode82_g3438 = SAMPLE_TEXTURE2D( _EmissionMapMask, sampler_trilinear_repeat, uv_TexCoord74_g3438 );
			float4 EMISSION_MAP_MASK_RGBA91_g3438 = tex2DNode82_g3438;
			float4 lerpResult117_g3438 = lerp( COLOR_000079_g3438 , ( EMISSION_TINT_01_RGBA75_g3438 * EMISSION_TINT_01_A62_g3438 * EMISSION_TINT_01_STRENGHT73_g3438 ) , EMISSION_MAP_MASK_RGBA91_g3438);
			float4 EMISSION_TINT_02_RGBA69_g3438 = _EmissionTint_02;
			float EMISSION_TINT_02_A92_g3438 = _EmissionTint_02.a;
			float EMISSION_TINT_02_STRENGHT70_g3438 = _EmissionTintStrength_02;
			float4 lerpResult124_g3438 = lerp( lerpResult117_g3438 , ( EMISSION_TINT_02_RGBA69_g3438 * EMISSION_TINT_02_A92_g3438 * EMISSION_TINT_02_STRENGHT70_g3438 ) , EMISSION_MAP_MASK_RGBA91_g3438);
			float4 EMISSION_TINTGLOW_RGBA90_g3438 = _EmissionTintGlow;
			float EMISSION_TINTGLOW_A78_g3438 = _EmissionTintGlow.a;
			float3 NORMAL3052 = temp_output_3057_95;
			float3 NORMAL_IN77_g3438 = NORMAL3052;
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
			float fresnelNdotV123_g3438 = dot( mul(ase_tangentToWorldFast,NORMAL_IN77_g3438), ase_worldViewDir );
			float fresnelNode123_g3438 = ( 0.0 + 1.0 * pow( max( 1.0 - fresnelNdotV123_g3438 , 0.0001 ), 10.0 ) );
			float4 lerpResult121_g3438 = lerp( COLOR_000079_g3438 , ( EMISSION_TINTGLOW_RGBA90_g3438 * EMISSION_TINTGLOW_A78_g3438 ) , fresnelNode123_g3438);
			float EMISSION_TINTGLOW_STRENGHT93_g3438 = _EmissionTintGlowStrength;
			float4 EMISSION_TYPE_HIGHLIGHT109_g3438 = saturate( ( lerpResult124_g3438 + ( lerpResult121_g3438 * EMISSION_TINTGLOW_STRENGHT93_g3438 ) ) );
			float4 m_Active131_g3438 = EMISSION_TYPE_HIGHLIGHT109_g3438;
			float4 localfloat4switch131_g3438 = float4switch131_g3438( m_switch131_g3438 , m_Off131_g3438 , m_Active131_g3438 );
			float3 temp_output_104_0_g3440 = NORMAL3052;
			float3 normalizeResult113_g3440 = normalize( temp_output_104_0_g3440 );
			float3 normalizeResult110_g3440 = normalize( i.viewDir );
			float dotResult107_g3440 = dot( normalizeResult113_g3440 , normalizeResult110_g3440 );
			float mulTime97_g3440 = _Time.y * 0.05;
			float4 temp_output_74_0_g3440 = ( ( pow( ( 1.0 - saturate( dotResult107_g3440 ) ) , (10.0 + ((_SpeedMinLevel + (sin( ( mulTime97_g3440 * _Speed ) ) - -1.0) * (_SpeedMaxLevel - _SpeedMinLevel) / (1.0 - -1.0)) - 0.0) * (0.0 - 10.0) / (1.0 - 0.0)) ) * _HighlightTint * _HighlightTint.a ) * _HighlightStrength );
			float4 m_Active72_g3440 = ( localfloat4switch131_g3438 + temp_output_74_0_g3440 );
			float4 localfloat4switch72_g3440 = float4switch( m_switch72_g3440 , m_Off72_g3440 , m_Active72_g3440 );
			float4 EMISSION_IN7_g3442 = localfloat4switch72_g3440;
			s111_g3442.Emission = EMISSION_IN7_g3442.xyz;
			float3 normalizeResult126_g3442 = normalize( (WorldNormalVector( i , NORMAL_IN26_g3442 )) );
			float3 normalizeResult133_g3442 = normalize( ( ase_worldViewDir + ase_worldlightDir ) );
			float dotResult128_g3442 = dot( normalizeResult126_g3442 , normalizeResult133_g3442 );
			float clampResult124_g3442 = clamp( ( dotResult128_g3442 * dotResult128_g3442 * dotResult128_g3442 ) , 0.0 , 1.0 );
			float4 SPECULAR101_g3442 = saturate( ( pow( clampResult124_g3442 , max( _Shininess , 110.0 ) ) * _SpecularColor * _SpecularColor.a ) );
			s111_g3442.Specular = SPECULAR101_g3442.rgb;
			int m_switch845_g3431 = _SmoothnessType;
			float4 tex2DNode28_g3431 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3431 );
			float4 m_Smoothness845_g3431 = tex2DNode28_g3431;
			float4 m_Roughness845_g3431 = ( 1.0 - tex2DNode28_g3431 );
			float4 localfloat4switch845_g3431 = float4switch845_g3431( m_switch845_g3431 , m_Smoothness845_g3431 , m_Roughness845_g3431 );
			float4 temp_output_21_0_g3442 = ( _SmoothnessStrength * localfloat4switch845_g3431 );
			float4 SMOOTHNESS_IN60_g3442 = temp_output_21_0_g3442;
			s111_g3442.Smoothness = SMOOTHNESS_IN60_g3442.x;
			float4 color749_g3431 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_cast_47 = (i.vertexColor.a).xxxx;
			float4 lerpResult39_g3431 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3431 ) , temp_cast_47 , (float)_OcclusionSourceMode);
			float4 lerpResult29_g3431 = lerp( color749_g3431 , lerpResult39_g3431 , _OcclusionStrengthAO);
			float4 temp_output_74_0_g3442 = lerpResult29_g3431;
			float4 temp_cast_50 = (1.0).xxxx;
			float NdotL166_g3442 = dotResult33_g3442;
			float4 lerpResult167_g3442 = lerp( temp_output_74_0_g3442 , temp_cast_50 , NdotL166_g3442);
			float4 lerpResult170_g3442 = lerp( lerpResult167_g3442 , temp_output_74_0_g3442 , ( 1.0 - temp_output_21_0_g3442 ));
			float4 OCCLUSION_IN53_g3442 = lerpResult170_g3442;
			s111_g3442.Occlusion = OCCLUSION_IN53_g3442.x;

			data.light = gi.light;

			UnityGI gi111_g3442 = gi;
			#ifdef UNITY_PASS_FORWARDBASE
			Unity_GlossyEnvironmentData g111_g3442 = UnityGlossyEnvironmentSetup( s111_g3442.Smoothness, data.worldViewDir, s111_g3442.Normal, float3(0,0,0));
			gi111_g3442 = UnityGlobalIllumination( data, s111_g3442.Occlusion, s111_g3442.Normal, g111_g3442 );
			#endif

			float3 surfResult111_g3442 = LightingStandardSpecular ( s111_g3442, viewDir, gi111_g3442 ).rgb;
			surfResult111_g3442 += s111_g3442.Emission;

			#ifdef UNITY_PASS_FORWARDADD//111_g3442
			surfResult111_g3442 -= s111_g3442.Emission;
			#endif//111_g3442
			c.rgb = surfResult111_g3442;
			c.a = temp_output_9_0_g3442.x;
			clip( temp_output_47_0_g3442.x - _MaskClipValue );
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
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows exclude_path:deferred dithercrossfade vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			AlphaToMask Off
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.5
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 customPack1 : TEXCOORD1;
				float2 customPack2 : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				half4 color : COLOR0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.customPack1.zw = customInputData.vertexToFrag30_g3435;
				o.customPack2.xy = customInputData.uv4_texcoord4;
				o.customPack2.xy = v.texcoord3;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.color = v.color;
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				surfIN.vertexToFrag30_g3435 = IN.customPack1.zw;
				surfIN.uv4_texcoord4 = IN.customPack2.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = IN.tSpace0.xyz * worldViewDir.x + IN.tSpace1.xyz * worldViewDir.y + IN.tSpace2.xyz * worldViewDir.z;
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.worldRefl = -worldViewDir;
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.vertexColor = IN.color;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT( UnityGI, gi );
				o.Alpha = LightingStandardCustomLighting( o, worldViewDir, gi ).a;
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;6024.158;4178.656;1.438112;True;False
Node;AmplifyShaderEditor.FunctionNode;3056;-5358.907,-3568.125;Inherit;False;DECSF Module Wind;102;;3419;a1f35481f1717b54dbd93d220457588d;8,2454,1,2433,1,2371,1,2457,1,2432,1,2434,1,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.FunctionNode;3057;-5038.93,-3597.998;Inherit;False;DECSF Master Map Cutout;4;;3431;000f89ea707009441837de6c4e59b637;23,684,0,666,0,553,0,489,0,470,0,512,0,688,0,433,0,446,0,364,1,398,1,323,1,499,1,595,1,190,1,760,1,753,0,390,1,356,1,500,1,399,1,461,0,467,0;2;756;FLOAT3;0,0,0;False;847;FLOAT4;0,0,0,0;False;13;FLOAT4;189;FLOAT3;95;COLOR;100;FLOAT4;97;COLOR;99;FLOAT;403;FLOAT;96;FLOAT;600;FLOAT;480;FLOAT4;258;FLOAT4;259;FLOAT3;401;FLOAT3;757
Node;AmplifyShaderEditor.RegisterLocalVarNode;3052;-4424.104,-3696.757;Inherit;False;NORMAL;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;3053;-5342.51,-3672.24;Inherit;False;3052;NORMAL;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3035;-5147.139,-3714.262;Inherit;False;DECSF Module Emission;87;;3438;58d2647a47347ee4891854495f246dd8;0;1;72;FLOAT3;0,0,1;False;1;FLOAT4;2
Node;AmplifyShaderEditor.CommentaryNode;3059;-3969.011,-4074.283;Inherit;False;348.3333;132.5;Header;1;2760;;0.3200356,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2820;-3946.95,-3862.98;Inherit;False;341.5028;250.4201;;3;202;2786;2758;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2819;-3972.228,-4201.184;Inherit;False;352;119;Header;1;203;GLOBAL SETTINGS ;0.1973789,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3036;-4824.286,-3690.804;Inherit;False;DECSF Module Highlight;78;;3440;0d70e226ee2a0634ba3a01f211d91aae;1,73,1;2;77;FLOAT4;0,0,0,0;False;104;FLOAT3;1,1,1;False;1;FLOAT4;80
Node;AmplifyShaderEditor.IntNode;2758;-3940.576,-3761.426;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-3940.271,-3828.877;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2786;-3940.189,-3690.799;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;True;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3058;-4431.247,-3548.732;Inherit;False;DECSF Module Custom Lighting;63;;3442;17e43a223603563419b42df41ff5e7c3;9,91,1,39,1,23,1,38,1,105,1,4,1,72,1,73,1,172,1;10;5;FLOAT4;0,0,0,0;False;62;FLOAT4;0,0,0,0;False;22;FLOAT3;1,1,1;False;48;FLOAT4;0,0,0,0;False;21;FLOAT4;0,0,0,0;False;74;FLOAT4;0,0,0,0;False;9;FLOAT4;0,0,0,0;False;47;FLOAT4;0,0,0,0;False;49;FLOAT3;0,0,0;False;46;FLOAT3;0,0,0;False;3;FLOAT4;109;FLOAT4;108;FLOAT3;107
Node;AmplifyShaderEditor.IntNode;203;-3962.873,-4163.117;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;2760;-3952.811,-4024.283;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;1319;-3940.074,-3572.245;Float;False;True;-1;3;;200;0;CustomLighting;DEC/Custom Lighting/Custom Lighting Cutout Translucency;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;True;True;False;Back;0;True;2760;3;False;2757;False;0;False;-1;0;False;-1;False;3;Custom;0;True;True;-10;True;Opaque;;Transparent;ForwardOnly;14;all;True;True;True;True;0;True;2758;True;0;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;203;-1;0;True;202;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;8ccd508f733f5f0418220eaf14ecdf81;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;True;2786;True;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3057;756;3056;2190
WireConnection;3057;847;3056;2970
WireConnection;3052;0;3057;95
WireConnection;3035;72;3053;0
WireConnection;3036;77;3035;2
WireConnection;3036;104;3053;0
WireConnection;3058;5;3036;80
WireConnection;3058;62;3057;189
WireConnection;3058;22;3057;95
WireConnection;3058;21;3057;97
WireConnection;3058;74;3057;99
WireConnection;3058;9;3057;96
WireConnection;3058;47;3057;600
WireConnection;3058;49;3057;258
WireConnection;3058;46;3057;259
WireConnection;1319;9;3058;109
WireConnection;1319;10;3058;108
WireConnection;1319;13;3058;107
WireConnection;1319;11;3057;757
ASEEND*/
//CHKSM=B932B906F77D3B894DB300606EC9C60B74B738A1