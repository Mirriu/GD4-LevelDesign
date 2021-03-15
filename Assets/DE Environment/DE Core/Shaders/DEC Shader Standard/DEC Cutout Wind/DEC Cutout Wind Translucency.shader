// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Cutout Wind/Cutout Wind Translucency"
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
		[SingleLineTexture]_MetallicGlossMap("Metallic Map", 2D) = "white" {}
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[SingleLineTexture]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Smoothness,0,Roughness,1)]_SmoothnessType("Smoothness Type", Int) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0
		[Enum(Texture,0,Baked,1)]_OcclusionSourceMode("Occlusion Source Mode", Int) = 1
		[SingleLineTexture]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		[Enum(Off,0,Color Shift Vertex Normal,1,Color Shift Vertex Color,2)][Header(COLOR SHIFT MODE)]_ColorMode("Color Mode", Int) = 0
		_ColorShift_ShiftVariation("Shift Variation", Range( 0 , 1)) = 0.145
		_ColorShift_RGBBrightness("Color Shift RGB Brightness ", Range( 0.25 , 3)) = 1
		_ColorShift_RGBHue("Color Shift RGB Hue", Range( -0.5 , 0.5)) = -0.2
		_ColorShift_RGBSaturation("Color Shift RGB Saturation", Range( 0 , 0.95)) = 0.95
		[Enum(Off,0,Active,1)][Header(TRANSLUCENCY)]_EnableTranslucency("Enable Translucency", Int) = 0
		[Enum(Default,0,Cull Front Face,1,Cull Back Face,2)]_TranslucencyCullDeferred("Translucency Cull", Int) = 0
		[Enum(Texture,0,Baked UV4,1)]_TranslucencySource("Translucency Source", Int) = 0
		[Enum(Global Light Color,0,Translucency Tint,1)]_TranslucencyColorSource("Translucency Color Source", Int) = 1
		[HDR]_TranslucencyTint("Translucency Tint", Color) = (0.575,0.75,0,1)
		[NoScaleOffset][SingleLineTexture]_TranslucencyMap("Translucency Map", 2D) = "white" {}
		[Enum(Default,0,Inverted,1)]_MapInverted("Map Inverted", Int) = 0
		_TranslucencyThickness("Translucency Thickness", Range( 0 , 1.5)) = 1.5
		[Header(DEFERRED TRANSLUCENCY)]_SubsurfaceIntensity("Subsurface Intensity", Range( 0 , 10)) = 5
		_TranslucentScatteringStandard("Subsurface Falloff", Range( 1 , 50)) = 50
		_SubsurfaceDistortion("Subsurface Distortion", Range( 0 , 10)) = 1.52
		_SubsurfacePower("Subsurface Power", Range( 0.01 , 49)) = 4
		[HideInInspector]_MaskClipValue("Mask Clip Value", Float) = 0.5
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
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
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
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
		#include "UnityCG.cginc"
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
			float3 worldPos;
			float2 uv_texcoord;
			half ASEVFace : VFACE;
			float3 worldNormal;
			INTERNAL_DATA
			float4 vertexColor : COLOR;
			float2 uv4_texcoord4;
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
		uniform int _NormalMode;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		uniform half _NormalStrength;
		uniform int _EnableTranslucency;
		uniform int _ColorMode;
		uniform float4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _Brightness;
		uniform float _ColorShift_ShiftVariation;
		uniform float _ColorShift_RGBHue;
		uniform float _ColorShift_RGBSaturation;
		uniform float _ColorShift_RGBBrightness;
		uniform int _TranslucencyCullDeferred;
		uniform float _SubsurfaceDistortion;
		uniform float _SubsurfacePower;
		uniform float _SubsurfaceIntensity;
		uniform float4 _TranslucencyTint;
		uniform int _TranslucencyColorSource;
		uniform int _MapInverted;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_TranslucencyMap);
		uniform float _TranslucencyThickness;
		uniform int _TranslucencySource;
		uniform float _TranslucentScatteringStandard;
		uniform float _WindMask_TextureVisualize;
		uniform float _WindMask_ProceduralVisualize;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MetallicGlossMap);
		uniform float _SmoothnessStrength;
		uniform int _SmoothnessType;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;
		uniform half _AlphaCutoffBias;
		uniform int _GlancingClipMode;
		uniform float _MaskClipValue;


		float floatswitch2458_g3064( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2468_g3064( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2312_g3064( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2456_g3064( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2326_g3064( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float3 float3switch2439_g3064( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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


		float floatswitch2655_g3064( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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


		float3 float3switch2966_g3064( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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


		float3 float3switch2527_g3064( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch2453_g3064( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		float3 float3switch9_g3415( int m_switch, float3 m_Default, float3 m_Flip, float3 m_Mirror )
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


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		float floatswitch836_g3397( int m_switch, float m_Off, float m_ColorShiftVertexNormal, float m_ColorShiftVertexColor )
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

		float3 float3switch420_g3397( int m_switch, float3 m_Off, float3 m_ColorShiftVertexNormal, float3 m_ColorShiftVertexColor )
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


		float4 float4switch( int m_switch, float4 m_Default, float4 m_Inverted )
		{
			if(m_switch ==0)
				return m_Default;
			else if(m_switch ==1)
				return m_Inverted;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch544_g3397( int m_switch, float4 m_Default, float4 m_CullFrontFace, float4 m_CullBackFace )
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


		float4 float4switch2972_g3064( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2982_g3064( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2986_g3064( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch2991_g3064( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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


		float4 float4switch845_g3397( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float floatswitch599_g3397( int m_switch, float m_Off, float m_Active )
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
			int m_switch2453_g3064 = _WindMode;
			float3 m_Off2453_g3064 = float3(0,0,0);
			int m_switch2527_g3064 = _WindMask_Texture;
			int _MASK_MODE_PROCEDRAL2677_g3064 = _WindMask_Procedural;
			int m_switch2966_g3064 = _MASK_MODE_PROCEDRAL2677_g3064;
			int m_switch2439_g3064 = _WindType;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VAR_VERTEXPOSITION_MATRIX2352_g3064 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 break2265_g3064 = VAR_VERTEXPOSITION_MATRIX2352_g3064;
			int _WIND_MODE2462_g3064 = _WindMode;
			int m_switch2458_g3064 = _WIND_MODE2462_g3064;
			float m_Off2458_g3064 = 1.0;
			float _Global_Wind_Main_Intensity2403_g3064 = _Global_Wind_Main_Intensity;
			float m_Global2458_g3064 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3064 );
			float m_Local2458_g3064 = _LocalWindStrength;
			float localfloatswitch2458_g3064 = floatswitch2458_g3064( m_switch2458_g3064 , m_Off2458_g3064 , m_Global2458_g3064 , m_Local2458_g3064 );
			float VAR_WindStrength2400_g3064 = localfloatswitch2458_g3064;
			int m_switch2468_g3064 = _WIND_MODE2462_g3064;
			float m_Off2468_g3064 = 1.0;
			float _Global_Wind_Main_RandomOffset2378_g3064 = _Global_Wind_Main_RandomOffset;
			float m_Global2468_g3064 = _Global_Wind_Main_RandomOffset2378_g3064;
			float m_Local2468_g3064 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3064 = floatswitch2468_g3064( m_switch2468_g3064 , m_Off2468_g3064 , m_Global2468_g3064 , m_Local2468_g3064 );
			float VAR_WindOffset2419_g3064 = localfloatswitch2468_g3064;
			float4 transform2423_g3064 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3064 = (float2(transform2423_g3064.x , transform2423_g3064.z));
			float dotResult2341_g3064 = dot( appendResult2307_g3064 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3064 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3064 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3064 ) * 43758.55 ) ));
			float VAR_RandomTime2244_g3064 = ( _Time.x * lerpResult2238_g3064 );
			float FUNC_Turbulence2274_g3064 = ( sin( ( ( VAR_RandomTime2244_g3064 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3064.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3064 = _WIND_MODE2462_g3064;
			float m_Off2312_g3064 = 1.0;
			float _Global_Wind_Main_Pulse2302_g3064 = _Global_Wind_Main_Pulse;
			float m_Global2312_g3064 = _Global_Wind_Main_Pulse2302_g3064;
			float m_Local2312_g3064 = _LocalWindPulse;
			float localfloatswitch2312_g3064 = floatswitch2312_g3064( m_switch2312_g3064 , m_Off2312_g3064 , m_Global2312_g3064 , m_Local2312_g3064 );
			float VAR_WindPulse2421_g3064 = localfloatswitch2312_g3064;
			float FUNC_Angle2470_g3064 = ( VAR_WindStrength2400_g3064 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3064 * 2.0 ) + FUNC_Turbulence2274_g3064 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3064.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * VAR_WindPulse2421_g3064 );
			float VAR_SinA2424_g3064 = sin( FUNC_Angle2470_g3064 );
			float VAR_CosA2362_g3064 = cos( FUNC_Angle2470_g3064 );
			int m_switch2456_g3064 = _WIND_MODE2462_g3064;
			float m_Off2456_g3064 = 1.0;
			float _Global_Wind_Main_Direction2350_g3064 = _Global_Wind_Main_Direction;
			float m_Global2456_g3064 = _Global_Wind_Main_Direction2350_g3064;
			float m_Local2456_g3064 = _LocalWindDirection;
			float localfloatswitch2456_g3064 = floatswitch2456_g3064( m_switch2456_g3064 , m_Off2456_g3064 , m_Global2456_g3064 , m_Local2456_g3064 );
			float _WindDirection2249_g3064 = localfloatswitch2456_g3064;
			float2 localDirectionalEquation2249_g3064 = DirectionalEquation( _WindDirection2249_g3064 );
			float2 break2469_g3064 = localDirectionalEquation2249_g3064;
			float VAR_xLerp2418_g3064 = break2469_g3064.x;
			float lerpResult2258_g3064 = lerp( break2265_g3064.x , ( ( break2265_g3064.y * VAR_SinA2424_g3064 ) + ( break2265_g3064.x * VAR_CosA2362_g3064 ) ) , VAR_xLerp2418_g3064);
			float3 break2340_g3064 = VAR_VERTEXPOSITION_MATRIX2352_g3064;
			float3 break2233_g3064 = VAR_VERTEXPOSITION_MATRIX2352_g3064;
			float VAR_zLerp2416_g3064 = break2469_g3064.y;
			float lerpResult2275_g3064 = lerp( break2233_g3064.z , ( ( break2233_g3064.y * VAR_SinA2424_g3064 ) + ( break2233_g3064.z * VAR_CosA2362_g3064 ) ) , VAR_zLerp2416_g3064);
			float3 appendResult2235_g3064 = (float3(lerpResult2258_g3064 , ( ( break2340_g3064.y * VAR_CosA2362_g3064 ) - ( break2340_g3064.z * VAR_SinA2424_g3064 ) ) , lerpResult2275_g3064));
			float3 VAR_VERTEXPOSITION2354_g3064 = ase_vertex3Pos;
			float3 FUNC_vertexPos2282_g3064 = ( mul( unity_WorldToObject, float4( appendResult2235_g3064 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3064 );
			float3 break2518_g3064 = FUNC_vertexPos2282_g3064;
			half FUNC_SinFunction2336_g3064 = sin( ( ( VAR_RandomTime2244_g3064 * 200.0 * ( 0.2 + v.color.g ) ) + ( v.color.g * 10.0 ) + FUNC_Turbulence2274_g3064 + ( VAR_VERTEXPOSITION_MATRIX2352_g3064.z / 2.0 ) ) );
			int m_switch2326_g3064 = _WIND_MODE2462_g3064;
			float m_Off2326_g3064 = 1.0;
			float _Global_Wind_Main_Turbulence2267_g3064 = _Global_Wind_Main_Turbulence;
			float m_Global2326_g3064 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence2267_g3064 );
			float m_Local2326_g3064 = _LocalWindTurbulence;
			float localfloatswitch2326_g3064 = floatswitch2326_g3064( m_switch2326_g3064 , m_Off2326_g3064 , m_Global2326_g3064 , m_Local2326_g3064 );
			float VAR_GlobalWindTurbulence2442_g3064 = localfloatswitch2326_g3064;
			float3 appendResult2480_g3064 = (float3(break2518_g3064.x , ( break2518_g3064.y + ( FUNC_SinFunction2336_g3064 * v.color.b * ( FUNC_Angle2470_g3064 + ( VAR_WindStrength2400_g3064 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3064 ) ) , break2518_g3064.z));
			float3 OUT_Leafs_Standalone2396_g3064 = appendResult2480_g3064;
			float3 m_Leaf2439_g3064 = OUT_Leafs_Standalone2396_g3064;
			float3 OUT_Palm_Standalone2310_g3064 = ( ( FUNC_SinFunction2336_g3064 * v.color.b * ( FUNC_Angle2470_g3064 + ( VAR_WindStrength2400_g3064 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3064 ) + FUNC_vertexPos2282_g3064 );
			float3 m_Palm2439_g3064 = OUT_Palm_Standalone2310_g3064;
			float3 break2486_g3064 = FUNC_vertexPos2282_g3064;
			float temp_output_2514_0_g3064 = ( FUNC_SinFunction2336_g3064 * v.color.b * ( FUNC_Angle2470_g3064 + ( VAR_WindStrength2400_g3064 / 200.0 ) ) );
			float lerpResult2482_g3064 = lerp( 0.0 , temp_output_2514_0_g3064 , VAR_xLerp2418_g3064);
			float lerpResult2484_g3064 = lerp( 0.0 , temp_output_2514_0_g3064 , VAR_zLerp2416_g3064);
			float3 appendResult2489_g3064 = (float3(( break2486_g3064.x + lerpResult2482_g3064 ) , break2486_g3064.y , ( break2486_g3064.z + lerpResult2484_g3064 )));
			float3 OUT_Grass_Standalone2242_g3064 = appendResult2489_g3064;
			float3 m_Grass2439_g3064 = OUT_Grass_Standalone2242_g3064;
			float3 m_Simple2439_g3064 = FUNC_vertexPos2282_g3064;
			float clampResult2884_g3064 = clamp( ( VAR_WindStrength2400_g3064 - 0.95 ) , 0.0 , 1.0 );
			float3 break2708_g3064 = FUNC_vertexPos2282_g3064;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 break2718_g3064 = ase_worldPos;
			float temp_output_2690_0_g3064 = ( VAR_RandomTime2244_g3064 * 25.0 );
			float clampResult2691_g3064 = clamp( 25.0 , 0.2 , 0.25 );
			float2 appendResult2694_g3064 = (float2(temp_output_2690_0_g3064 , ( temp_output_2690_0_g3064 / clampResult2691_g3064 )));
			float3 appendResult2706_g3064 = (float3(break2708_g3064.x , ( break2708_g3064.y + cos( ( ( ( break2718_g3064.x + break2718_g3064.y + break2718_g3064.z ) * 2.0 ) + appendResult2694_g3064 + FUNC_Angle2470_g3064 + VAR_GlobalWindTurbulence2442_g3064 ) ) ).x , break2708_g3064.z));
			float3 temp_output_2613_0_g3064 = ( clampResult2884_g3064 * appendResult2706_g3064 );
			float3 ase_vertexNormal = v.normal.xyz;
			float4 ase_vertexTangent = v.tangent;
			float3 WIND_CLOTH_VERTEX997_g3064 = ( ( ( cos( temp_output_2613_0_g3064 ) + ( -0.3193 * UNITY_PI ) ) * ase_vertexNormal * 0.2 * ( FUNC_SinFunction2336_g3064 * v.color.b ) ) + ( sin( temp_output_2613_0_g3064 ) * cross( ase_vertexNormal , ase_vertexTangent.xyz ) * 0.2 ) );
			float3 m_Ivy2439_g3064 = WIND_CLOTH_VERTEX997_g3064;
			float3 localfloat3switch2439_g3064 = float3switch2439_g3064( m_switch2439_g3064 , m_Leaf2439_g3064 , m_Palm2439_g3064 , m_Grass2439_g3064 , m_Simple2439_g3064 , m_Ivy2439_g3064 );
			float3 WIND_FINAL2753_g3064 = localfloat3switch2439_g3064;
			float3 m_Off2966_g3064 = WIND_FINAL2753_g3064;
			int m_switch2655_g3064 = _WindMask_Procedural;
			float m_Off2655_g3064 = 0.0;
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float MASK_OFFSET2670_g3064 = _WindMask_Offset1;
			float temp_output_2957_0_g3064 = ( 1.0 - MASK_OFFSET2670_g3064 );
			float m_TopDown2655_g3064 = ( ( ase_worldNormal.y - temp_output_2957_0_g3064 ) - 0.05 );
			float m_BottomUp2655_g3064 = ( -( ase_worldNormal.y + temp_output_2957_0_g3064 ) - 0.05 );
			float3 temp_cast_5 = (0.5).xxx;
			float3 break2635_g3064 = ( abs( ase_worldNormal ) - temp_cast_5 );
			float dotResult2928_g3064 = dot( ( MASK_OFFSET2670_g3064 + break2635_g3064.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3064 ) + -0.5 ) - break2635_g3064.y ) );
			float m_SideWall2655_g3064 = dotResult2928_g3064;
			float dotResult2921_g3064 = dot( ( MASK_OFFSET2670_g3064 + break2635_g3064.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3064 ) + break2635_g3064.z + -0.75 ) );
			float m_Spherical2655_g3064 = dotResult2921_g3064;
			float m_Spherical_Inverted2655_g3064 = -dotResult2921_g3064;
			float localfloatswitch2655_g3064 = floatswitch2655_g3064( m_switch2655_g3064 , m_Off2655_g3064 , m_TopDown2655_g3064 , m_BottomUp2655_g3064 , m_SideWall2655_g3064 , m_Spherical2655_g3064 , m_Spherical_Inverted2655_g3064 );
			float temp_output_2915_0_g3064 = ( localfloatswitch2655_g3064 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3064 = (float3(temp_output_2915_0_g3064 , temp_output_2915_0_g3064 , temp_output_2915_0_g3064));
			float3 lerpResult2917_g3064 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3064 , appendResult2916_g3064);
			float3 m_TopDown2966_g3064 = lerpResult2917_g3064;
			float3 m_BottomUp2966_g3064 = lerpResult2917_g3064;
			float3 m_SideWall2966_g3064 = lerpResult2917_g3064;
			float3 m_Spherical2966_g3064 = lerpResult2917_g3064;
			float3 m_Spherical_Inverted2966_g3064 = lerpResult2917_g3064;
			float3 localfloat3switch2966_g3064 = float3switch2966_g3064( m_switch2966_g3064 , m_Off2966_g3064 , m_TopDown2966_g3064 , m_BottomUp2966_g3064 , m_SideWall2966_g3064 , m_Spherical2966_g3064 , m_Spherical_Inverted2966_g3064 );
			float3 m_Off2527_g3064 = localfloat3switch2966_g3064;
			float2 uv_WindMask_Map = v.texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3064 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
			float3 appendResult2744_g3064 = (float3(tex2DNode2742_g3064.r , tex2DNode2742_g3064.r , tex2DNode2742_g3064.r));
			float3 temp_output_2910_0_g3064 = ( appendResult2744_g3064 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float3 m_Active2527_g3064 = ( localfloat3switch2966_g3064 * temp_output_2910_0_g3064 );
			float3 localfloat3switch2527_g3064 = float3switch2527_g3064( m_switch2527_g3064 , m_Off2527_g3064 , m_Active2527_g3064 );
			float3 WIND_MASK2748_g3064 = localfloat3switch2527_g3064;
			float3 m_Global2453_g3064 = WIND_MASK2748_g3064;
			float3 m_Local2453_g3064 = WIND_MASK2748_g3064;
			float3 localfloat3switch2453_g3064 = float3switch2453_g3064( m_switch2453_g3064 , m_Off2453_g3064 , m_Global2453_g3064 , m_Local2453_g3064 );
			float3 temp_output_756_0_g3397 = localfloat3switch2453_g3064;
			v.vertex.xyz += temp_output_756_0_g3397;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch9_g3415 = _NormalMode;
			float2 appendResult77_g3397 = (float2(_TilingX , _TilingY));
			float2 appendResult82_g3397 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord73_g3397 = i.uv_texcoord * appendResult77_g3397 + appendResult82_g3397;
			float2 appendResult559_g3397 = (float2(uv_TexCoord73_g3397.x , uv_TexCoord73_g3397.y));
			float3 NORMAL_IN17_g3415 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, appendResult559_g3397 ), _NormalStrength );
			float3 m_Default9_g3415 = NORMAL_IN17_g3415;
			float3 m_Flip9_g3415 = ( NORMAL_IN17_g3415 * i.ASEVFace );
			float3 break2_g3415 = NORMAL_IN17_g3415;
			float3 appendResult3_g3415 = (float3(break2_g3415.x , break2_g3415.y , ( break2_g3415.z * i.ASEVFace )));
			float3 m_Mirror9_g3415 = appendResult3_g3415;
			float3 localfloat3switch9_g3415 = float3switch9_g3415( m_switch9_g3415 , m_Default9_g3415 , m_Flip9_g3415 , m_Mirror9_g3415 );
			float3 temp_output_530_11_g3397 = localfloat3switch9_g3415;
			o.Normal = temp_output_530_11_g3397;
			int TRANSLUCENCY_MODE523_g3397 = _EnableTranslucency;
			int m_switch497_g3397 = TRANSLUCENCY_MODE523_g3397;
			int m_switch420_g3397 = _ColorMode;
			float3 temp_output_11_0_g3397 = (_Color).rgb;
			float4 tex2DNode57_g3397 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, appendResult559_g3397 );
			float3 temp_output_76_0_g3397 = ( temp_output_11_0_g3397 * (tex2DNode57_g3397).rgb * _Brightness );
			float3 ALBEDO_01424_g3397 = temp_output_76_0_g3397;
			float3 m_Off420_g3397 = ALBEDO_01424_g3397;
			int _COLOR_MODE835_g3397 = _ColorMode;
			int m_switch836_g3397 = _COLOR_MODE835_g3397;
			float m_Off836_g3397 = 0.0;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float m_ColorShiftVertexNormal836_g3397 = ( ase_vertexNormal.y - 0.5 );
			float m_ColorShiftVertexColor836_g3397 = ( i.vertexColor.g - 0.5 );
			float localfloatswitch836_g3397 = floatswitch836_g3397( m_switch836_g3397 , m_Off836_g3397 , m_ColorShiftVertexNormal836_g3397 , m_ColorShiftVertexColor836_g3397 );
			float3 hsvTorgb823_g3397 = RGBToHSV( ALBEDO_01424_g3397 );
			float3 hsvTorgb816_g3397 = HSVToRGB( float3(( ( localfloatswitch836_g3397 * _ColorShift_ShiftVariation ) + _ColorShift_RGBHue + hsvTorgb823_g3397 ).x,( hsvTorgb823_g3397.y * _ColorShift_RGBSaturation ),( hsvTorgb823_g3397.z * _ColorShift_RGBBrightness )) );
			float3 m_ColorShiftVertexNormal420_g3397 = hsvTorgb816_g3397;
			float3 m_ColorShiftVertexColor420_g3397 = hsvTorgb816_g3397;
			float3 localfloat3switch420_g3397 = float3switch420_g3397( m_switch420_g3397 , m_Off420_g3397 , m_ColorShiftVertexNormal420_g3397 , m_ColorShiftVertexColor420_g3397 );
			float3 COLOR_SHIFTING426_g3397 = localfloat3switch420_g3397;
			float3 ALBEDO_02_COLOR_SHIFT397_g3397 = COLOR_SHIFTING426_g3397;
			float4 m_Off497_g3397 = float4( ALBEDO_02_COLOR_SHIFT397_g3397 , 0.0 );
			int m_switch544_g3397 = _TranslucencyCullDeferred;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 NORMAL_WORLD_OUT_NORMALIZED261_g3397 = normalize( (WorldNormalVector( i , localfloat3switch9_g3415 )) );
			float3 temp_output_506_0_g3397 = ( NORMAL_WORLD_OUT_NORMALIZED261_g3397 * _SubsurfaceDistortion );
			float3 ADDITIONAL_LIGHT471_g3397 = -_WorldSpaceLightPos0.xyz;
			float3 normalizeResult511_g3397 = normalize( ( -( ase_worldlightDir + temp_output_506_0_g3397 ) * ( ADDITIONAL_LIGHT471_g3397 + temp_output_506_0_g3397 ) ) );
			float dotResult521_g3397 = dot( ase_worldViewDir , normalizeResult511_g3397 );
			float temp_output_517_0_g3397 = ( 50.0 - _SubsurfacePower );
			float temp_output_519_0_g3397 = ( pow( saturate( max( dotResult521_g3397 , 0.0 ) ) , temp_output_517_0_g3397 ) * _SubsurfaceIntensity );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			float3 temp_output_371_0_g3397 = ( ase_lightColor.rgb * ase_lightColor.a );
			float3 GLOBAL_LIGHT_COLOR373_g3397 = temp_output_371_0_g3397;
			float4 TRANSLUCENCY_TINT389_g3397 = ( _TranslucencyTint * _TranslucencyTint.a );
			float4 lerpResult501_g3397 = lerp( float4( GLOBAL_LIGHT_COLOR373_g3397 , 0.0 ) , TRANSLUCENCY_TINT389_g3397 , (float)_TranslucencyColorSource);
			float4 temp_output_486_0_g3397 = ( temp_output_519_0_g3397 + lerpResult501_g3397 );
			int m_switch639_g3397 = _MapInverted;
			float4 color726_g3397 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 COLOR_0000727_g3397 = color726_g3397;
			float2 CUSTOM_UV1263_g3397 = appendResult559_g3397;
			float4 tex2DNode322_g3397 = SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3397 );
			float4 lerpResult326_g3397 = lerp( COLOR_0000727_g3397 , tex2DNode322_g3397 , _TranslucencyThickness);
			float4 m_Default639_g3397 = lerpResult326_g3397;
			float temp_output_620_0_g3397 = ( 0.0 - 1.0 );
			float temp_output_623_0_g3397 = ( tex2DNode322_g3397.r - 1.0 );
			float lerpResult631_g3397 = lerp( ( temp_output_620_0_g3397 / temp_output_623_0_g3397 ) , ( temp_output_623_0_g3397 / temp_output_620_0_g3397 ) , ( 0.7 + _TranslucencyThickness ));
			float4 temp_cast_7 = (saturate( lerpResult631_g3397 )).xxxx;
			float4 m_Inverted639_g3397 = temp_cast_7;
			float4 localfloat4switch639_g3397 = float4switch( m_switch639_g3397 , m_Default639_g3397 , m_Inverted639_g3397 );
			float lerpResult334_g3397 = lerp( 0.0 , ( 5.0 - i.uv4_texcoord4.x ) , _TranslucencyThickness);
			float4 temp_cast_8 = (lerpResult334_g3397).xxxx;
			float4 lerpResult369_g3397 = lerp( localfloat4switch639_g3397 , temp_cast_8 , (float)_TranslucencySource);
			float4 TRANSLUCENCY_THICKNESS335_g3397 = lerpResult369_g3397;
			float4 temp_output_542_0_g3397 = ( temp_output_486_0_g3397 + ( TRANSLUCENCY_THICKNESS335_g3397 * _TranslucentScatteringStandard ) );
			float4 m_Default544_g3397 = temp_output_542_0_g3397;
			float4 _Vector4 = float4(1,1,1,1);
			float4 switchResult545_g3397 = (((i.ASEVFace>0)?(_Vector4):(temp_output_542_0_g3397)));
			float4 m_CullFrontFace544_g3397 = switchResult545_g3397;
			float4 switchResult546_g3397 = (((i.ASEVFace>0)?(temp_output_542_0_g3397):(_Vector4)));
			float4 m_CullBackFace544_g3397 = switchResult546_g3397;
			float4 localfloat4switch544_g3397 = float4switch544_g3397( m_switch544_g3397 , m_Default544_g3397 , m_CullFrontFace544_g3397 , m_CullBackFace544_g3397 );
			float4 m_Active497_g3397 = ( float4( ALBEDO_02_COLOR_SHIFT397_g3397 , 0.0 ) * localfloat4switch544_g3397 );
			float4 localfloat4switch497_g3397 = float4switch( m_switch497_g3397 , m_Off497_g3397 , m_Active497_g3397 );
			float4 SUBSURFACE_OUT_DEFERRED507_g3397 = localfloat4switch497_g3397;
			int _MASK_MODE_TEXTURE2980_g3064 = _WindMask_Texture;
			int m_switch2982_g3064 = _MASK_MODE_TEXTURE2980_g3064;
			float4 _Vector3 = float4(0,0,0,0);
			float4 m_Off2982_g3064 = _Vector3;
			int m_switch2972_g3064 = (int)_WindMask_TextureVisualize;
			float4 m_Off2972_g3064 = _Vector3;
			float4 color2979_g3064 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
			float4 _Visualize_Color2992_g3064 = color2979_g3064;
			float2 uv_WindMask_Map = i.uv_texcoord * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
			float4 tex2DNode2742_g3064 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
			float3 appendResult2744_g3064 = (float3(tex2DNode2742_g3064.r , tex2DNode2742_g3064.r , tex2DNode2742_g3064.r));
			float3 temp_output_2910_0_g3064 = ( appendResult2744_g3064 + ( 1.0 - _WindMask_Texture_Intensity ) );
			float4 appendResult2974_g3064 = (float4(temp_output_2910_0_g3064 , temp_output_2910_0_g3064.x));
			float4 lerpResult2967_g3064 = lerp( _Visualize_Color2992_g3064 , float4( 0,0,0,0 ) , appendResult2974_g3064);
			float4 m_Active2972_g3064 = lerpResult2967_g3064;
			float4 localfloat4switch2972_g3064 = float4switch2972_g3064( m_switch2972_g3064 , m_Off2972_g3064 , m_Active2972_g3064 );
			float4 m_Active2982_g3064 = localfloat4switch2972_g3064;
			float4 localfloat4switch2982_g3064 = float4switch2982_g3064( m_switch2982_g3064 , m_Off2982_g3064 , m_Active2982_g3064 );
			int _MASK_MODE_PROCEDRAL2677_g3064 = _WindMask_Procedural;
			int m_switch2991_g3064 = _MASK_MODE_PROCEDRAL2677_g3064;
			float4 m_Off2991_g3064 = _Vector3;
			int m_switch2986_g3064 = (int)_WindMask_ProceduralVisualize;
			float4 m_Off2986_g3064 = _Vector3;
			int m_switch2655_g3064 = _WindMask_Procedural;
			float m_Off2655_g3064 = 0.0;
			float MASK_OFFSET2670_g3064 = _WindMask_Offset1;
			float temp_output_2957_0_g3064 = ( 1.0 - MASK_OFFSET2670_g3064 );
			float m_TopDown2655_g3064 = ( ( ase_worldNormal.y - temp_output_2957_0_g3064 ) - 0.05 );
			float m_BottomUp2655_g3064 = ( -( ase_worldNormal.y + temp_output_2957_0_g3064 ) - 0.05 );
			float3 temp_cast_20 = (0.5).xxx;
			float3 break2635_g3064 = ( abs( ase_worldNormal ) - temp_cast_20 );
			float dotResult2928_g3064 = dot( ( MASK_OFFSET2670_g3064 + break2635_g3064.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3064 ) + -0.5 ) - break2635_g3064.y ) );
			float m_SideWall2655_g3064 = dotResult2928_g3064;
			float dotResult2921_g3064 = dot( ( MASK_OFFSET2670_g3064 + break2635_g3064.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3064 ) + break2635_g3064.z + -0.75 ) );
			float m_Spherical2655_g3064 = dotResult2921_g3064;
			float m_Spherical_Inverted2655_g3064 = -dotResult2921_g3064;
			float localfloatswitch2655_g3064 = floatswitch2655_g3064( m_switch2655_g3064 , m_Off2655_g3064 , m_TopDown2655_g3064 , m_BottomUp2655_g3064 , m_SideWall2655_g3064 , m_Spherical2655_g3064 , m_Spherical_Inverted2655_g3064 );
			float temp_output_2915_0_g3064 = ( localfloatswitch2655_g3064 * ( 1.0 - _WindMask_Procedural_Intensity ) );
			float3 appendResult2916_g3064 = (float3(temp_output_2915_0_g3064 , temp_output_2915_0_g3064 , temp_output_2915_0_g3064));
			float4 appendResult2977_g3064 = (float4(appendResult2916_g3064 , appendResult2916_g3064.x));
			float4 lerpResult2976_g3064 = lerp( _Visualize_Color2992_g3064 , float4( 0,0,0,0 ) , appendResult2977_g3064);
			float4 m_Active2986_g3064 = lerpResult2976_g3064;
			float4 localfloat4switch2986_g3064 = float4switch2986_g3064( m_switch2986_g3064 , m_Off2986_g3064 , m_Active2986_g3064 );
			float4 m_TopDown2991_g3064 = localfloat4switch2986_g3064;
			float4 m_BottomUp2991_g3064 = localfloat4switch2986_g3064;
			float4 m_SideWall2991_g3064 = localfloat4switch2986_g3064;
			float4 m_Spherical2991_g3064 = localfloat4switch2986_g3064;
			float4 m_Spherical_Inverted2991_g3064 = localfloat4switch2986_g3064;
			float4 localfloat4switch2991_g3064 = float4switch2991_g3064( m_switch2991_g3064 , m_Off2991_g3064 , m_TopDown2991_g3064 , m_BottomUp2991_g3064 , m_SideWall2991_g3064 , m_Spherical2991_g3064 , m_Spherical_Inverted2991_g3064 );
			o.Albedo = ( SUBSURFACE_OUT_DEFERRED507_g3397 + ( localfloat4switch2982_g3064 + localfloat4switch2991_g3064 ) ).xyz;
			o.Metallic = ( _MetallicStrength * SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3397 ) ).r;
			int m_switch845_g3397 = _SmoothnessType;
			float4 tex2DNode28_g3397 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3397 );
			float4 m_Smoothness845_g3397 = tex2DNode28_g3397;
			float4 m_Roughness845_g3397 = ( 1.0 - tex2DNode28_g3397 );
			float4 localfloat4switch845_g3397 = float4switch845_g3397( m_switch845_g3397 , m_Smoothness845_g3397 , m_Roughness845_g3397 );
			o.Smoothness = ( _SmoothnessStrength * localfloat4switch845_g3397 ).x;
			float4 color749_g3397 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 temp_cast_29 = (i.vertexColor.a).xxxx;
			float4 lerpResult39_g3397 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3397 ) , temp_cast_29 , (float)_OcclusionSourceMode);
			float4 lerpResult29_g3397 = lerp( color749_g3397 , lerpResult39_g3397 , _OcclusionStrengthAO);
			o.Occlusion = lerpResult29_g3397.r;
			float ALBEDO_A716_g3397 = tex2DNode57_g3397.a;
			clip( ALBEDO_A716_g3397 - ( 1.0 - _AlphaCutoffBias ));
			float temp_output_741_0_g3397 = saturate( ( ( ALBEDO_A716_g3397 / max( fwidth( ALBEDO_A716_g3397 ) , 0.0001 ) ) + 0.5 ) );
			o.Alpha = temp_output_741_0_g3397;
			int m_switch599_g3397 = _GlancingClipMode;
			float m_Off599_g3397 = 1.0;
			float3 normalizeResult583_g3397 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
			float dotResult587_g3397 = dot( ase_worldViewDir , normalizeResult583_g3397 );
			float temp_output_585_0_g3397 = ( 1.0 - abs( dotResult587_g3397 ) );
			float temp_output_590_0_g3397 = ( 1.0 - ( temp_output_585_0_g3397 * temp_output_585_0_g3397 ) );
			float m_Active599_g3397 = temp_output_590_0_g3397;
			float localfloatswitch599_g3397 = floatswitch599_g3397( m_switch599_g3397 , m_Off599_g3397 , m_Active599_g3397 );
			clip( localfloatswitch599_g3397 - _MaskClipValue );
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;5314.814;4010.329;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;2876;-3942.31,-4092.784;Inherit;False;347.3333;123;Header;1;2760;;0.2299978,0.990566,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2820;-3940.45,-3907.181;Inherit;False;341.5028;250.4201;;3;202;2786;2758;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2819;-3942.628,-4221.585;Inherit;False;352;119;Header;1;203;GLOBAL SETTINGS ;0.3890928,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2870;-4907.856,-3593.999;Inherit;False;DECSF Module Wind;63;;3064;a1f35481f1717b54dbd93d220457588d;8,2454,1,2433,1,2371,1,2457,1,2432,1,2434,1,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.IntNode;2758;-3934.076,-3805.627;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-3933.771,-3873.078;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2786;-3933.689,-3735;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;True;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2875;-4575.615,-3635.311;Inherit;False;DECSF Master Map Cutout;4;;3397;000f89ea707009441837de6c4e59b637;23,684,0,666,0,553,0,489,0,470,0,512,0,688,0,433,0,446,0,364,0,398,0,323,0,499,0,595,1,190,1,760,0,753,0,390,1,356,1,500,1,399,1,461,0,467,0;2;756;FLOAT3;0,0,0;False;847;FLOAT4;0,0,0,0;False;13;FLOAT4;189;FLOAT3;95;COLOR;100;FLOAT4;97;COLOR;99;FLOAT;403;FLOAT;96;FLOAT;600;FLOAT;480;FLOAT3;258;FLOAT3;259;FLOAT3;401;FLOAT3;757
Node;AmplifyShaderEditor.IntNode;203;-3931.373,-4178.418;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;2760;-3930.31,-4048.784;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;1319;-3941.374,-3630.745;Float;False;True;-1;3;;200;0;Standard;DEC/Cutout Wind/Cutout Wind Translucency;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;True;True;True;Back;0;True;2760;3;False;2757;False;0;False;-1;0;False;-1;False;0;Custom;0;True;True;-10;True;Opaque;;Geometry;All;14;all;True;True;True;True;0;True;2758;True;0;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;203;-1;0;True;202;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;8ccd508f733f5f0418220eaf14ecdf81;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;True;2786;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2875;756;2870;2190
WireConnection;2875;847;2870;2970
WireConnection;1319;0;2875;189
WireConnection;1319;1;2875;95
WireConnection;1319;3;2875;100
WireConnection;1319;4;2875;97
WireConnection;1319;5;2875;99
WireConnection;1319;9;2875;96
WireConnection;1319;10;2875;600
WireConnection;1319;11;2875;757
ASEEND*/
//CHKSM=F4737F6BF4A2D755FAC6C20F25517EFA457283E4