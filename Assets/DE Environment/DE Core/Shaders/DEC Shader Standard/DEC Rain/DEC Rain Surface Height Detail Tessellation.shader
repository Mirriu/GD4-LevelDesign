// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Rain/Rain Surface Height Detail Tessellation"
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
		[Header(TESSELLATION)][Enum(Off,0,Active,1)]_TessellationMode("Tessellation Mode", Int) = 0
		_TessellationStrength("Tessellation Strength", Range( 0.001 , 100)) = 6
		_TessellationDistanceMin("Tessellation Distance Min", Float) = 0
		_TessellationDistanceMax("Tessellation Distance Max ", Float) = 5
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
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
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

		#pragma surface surf Standard keepalpha addshadow fullforwardshadows dithercrossfade vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float3 worldPos;
			float4 screenPos;
		};

		uniform int _ZWriteMode;
		uniform int _CullMode;
		uniform int _ColorMask;
		uniform float _Horizontal_Intensity;
		uniform float _Vertical_Intensity;
		uniform int _Displacement_Mode;
		uniform half _DisplacementStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_ParallaxMap);
		uniform int _TillingMode;
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		SamplerState sampler_trilinear_repeat;
		uniform int _Vertical_RainMode;
		uniform int _EnableDetailMap;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
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
		uniform float _Rain_WetnessDarken;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Metal);
		uniform half _Global_Rain_Wetness;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;
		uniform int _TessellationMode;
		uniform half _TessellationDistanceMin;
		uniform half _TessellationDistanceMax;
		uniform half _TessellationStrength;


		float2 float2switch214_g3273( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch361_g3273( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float2 float2switch393_g3273( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float3 float3switch467_g3273( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch502_g3273( int m_switch, float3 m_Off, float3 m_Active )
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


		float4 float4switch547_g3273( int m_switch, float4 m_Smoothness, float4 m_Roughness )
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


		float4 float4switch476_g3273( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch506_g3273( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
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


		float4 float4switch457( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			int m_switch457 = _TessellationMode;
			float4 temp_cast_5 = (0.001).xxxx;
			float4 m_Off457 = temp_cast_5;
			float4 m_Active457 = UnityDistanceBasedTess( v0.vertex, v1.vertex, v2.vertex, _TessellationDistanceMin,_TessellationDistanceMax,_TessellationStrength);
			float4 localfloat4switch457 = float4switch457( m_switch457 , m_Off457 , m_Active457 );
			return localfloat4switch457;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 temp_output_538_0_g3273 = float3(0,0,0);
			int m_switch361_g3273 = _Displacement_Mode;
			float4 temp_cast_1 = (0.0).xxxx;
			float4 m_Off361_g3273 = temp_cast_1;
			int TILLING_MODE190_g3273 = _TillingMode;
			int m_switch214_g3273 = TILLING_MODE190_g3273;
			float2 appendResult192_g3273 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3273 = appendResult192_g3273;
			float2 m_Standard214_g3273 = TEXTURE_TILLING200_g3273;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3273 = ase_parentObjectScale;
			float2 appendResult205_g3273 = (float2(break206_g3273.z , break206_g3273.y));
			float3 ase_vertexNormal = v.normal.xyz;
			float3 normalizeResult194_g3273 = normalize( ase_vertexNormal );
			float3 break201_g3273 = normalizeResult194_g3273;
			float2 appendResult204_g3273 = (float2(break206_g3273.x , break206_g3273.z));
			float2 appendResult193_g3273 = (float2(break206_g3273.x , break206_g3273.y));
			float2 TEXTURE_TILLING_SCALE210_g3273 = ( ( ( appendResult205_g3273 * break201_g3273.x ) + ( break201_g3273.y * appendResult204_g3273 ) + ( break201_g3273.z * appendResult193_g3273 ) ) * TEXTURE_TILLING200_g3273 );
			float2 m_Scale214_g3273 = TEXTURE_TILLING_SCALE210_g3273;
			float2 localfloat2switch214_g3273 = float2switch214_g3273( m_switch214_g3273 , m_Standard214_g3273 , m_Scale214_g3273 );
			float2 appendResult166_g3273 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3273 = v.texcoord.xy * localfloat2switch214_g3273 + appendResult166_g3273;
			float2 CUSTOM_UV1179_g3273 = uv_TexCoord165_g3273;
			float4 m_Active361_g3273 = ( _DisplacementStrength * ( SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3273, 1.0 ) * float4( ase_vertexNormal , 0.0 ) ) );
			float4 localfloat4switch361_g3273 = float4switch361_g3273( m_switch361_g3273 , m_Off361_g3273 , m_Active361_g3273 );
			float4 DISPLACEMENT_OUT543_g3273 = localfloat4switch361_g3273;
			v.vertex.xyz += ( float4( temp_output_538_0_g3273 , 0.0 ) + DISPLACEMENT_OUT543_g3273 ).xyz;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch103_g3413 = _Vertical_RainMode;
			int SURFACE_MAP_MODE456_g3273 = _EnableDetailMap;
			int m_switch502_g3273 = SURFACE_MAP_MODE456_g3273;
			int TILLING_MODE190_g3273 = _TillingMode;
			int m_switch214_g3273 = TILLING_MODE190_g3273;
			float2 appendResult192_g3273 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3273 = appendResult192_g3273;
			float2 m_Standard214_g3273 = TEXTURE_TILLING200_g3273;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3273 = ase_parentObjectScale;
			float2 appendResult205_g3273 = (float2(break206_g3273.z , break206_g3273.y));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 normalizeResult194_g3273 = normalize( ase_vertexNormal );
			float3 break201_g3273 = normalizeResult194_g3273;
			float2 appendResult204_g3273 = (float2(break206_g3273.x , break206_g3273.z));
			float2 appendResult193_g3273 = (float2(break206_g3273.x , break206_g3273.y));
			float2 TEXTURE_TILLING_SCALE210_g3273 = ( ( ( appendResult205_g3273 * break201_g3273.x ) + ( break201_g3273.y * appendResult204_g3273 ) + ( break201_g3273.z * appendResult193_g3273 ) ) * TEXTURE_TILLING200_g3273 );
			float2 m_Scale214_g3273 = TEXTURE_TILLING_SCALE210_g3273;
			float2 localfloat2switch214_g3273 = float2switch214_g3273( m_switch214_g3273 , m_Standard214_g3273 , m_Scale214_g3273 );
			float2 appendResult166_g3273 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3273 = i.uv_texcoord * localfloat2switch214_g3273 + appendResult166_g3273;
			float3 NORMAL_OUT23_g3273 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, uv_TexCoord165_g3273 ), _NormalStrength );
			float3 m_Off502_g3273 = NORMAL_OUT23_g3273;
			int EnableDetailMask428_g3273 = _EnableDetailMask;
			int m_switch467_g3273 = EnableDetailMask428_g3273;
			int TILLING_MODE_DETAIL435_g3273 = _TillingModeDetail;
			int m_switch393_g3273 = TILLING_MODE_DETAIL435_g3273;
			float2 appendResult432_g3273 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
			float2 TEXTURE_TILLING_DETAIL425_g3273 = appendResult432_g3273;
			float2 m_Standard393_g3273 = TEXTURE_TILLING_DETAIL425_g3273;
			float3 break420_g3273 = ase_parentObjectScale;
			float2 appendResult448_g3273 = (float2(break420_g3273.z , break420_g3273.y));
			float3 normalizeResult480_g3273 = normalize( ase_vertexNormal );
			float3 break431_g3273 = normalizeResult480_g3273;
			float2 appendResult426_g3273 = (float2(break420_g3273.x , break420_g3273.z));
			float2 appendResult433_g3273 = (float2(break420_g3273.x , break420_g3273.y));
			float2 TEXTURE_TILLING_SCALE_DETAIL427_g3273 = ( ( ( appendResult448_g3273 * break431_g3273.x ) + ( break431_g3273.y * appendResult426_g3273 ) + ( break431_g3273.z * appendResult433_g3273 ) ) * TEXTURE_TILLING_DETAIL425_g3273 );
			float2 m_Scale393_g3273 = TEXTURE_TILLING_SCALE_DETAIL427_g3273;
			float2 localfloat2switch393_g3273 = float2switch393_g3273( m_switch393_g3273 , m_Standard393_g3273 , m_Scale393_g3273 );
			float2 appendResult394_g3273 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
			float2 uv_TexCoord414_g3273 = i.uv_texcoord * localfloat2switch393_g3273 + appendResult394_g3273;
			float3 NORMAL_OUT_DETAIL491_g3273 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, uv_TexCoord414_g3273 ), _DetailNormalMapScale );
			float3 m_Off467_g3273 = NORMAL_OUT_DETAIL491_g3273;
			float2 appendResult445_g3273 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
			float2 appendResult417_g3273 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
			float2 uv_TexCoord415_g3273 = i.uv_texcoord * appendResult445_g3273 + appendResult417_g3273;
			float4 tex2DNode418_g3273 = SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, uv_TexCoord415_g3273 );
			float3 lerpResult470_g3273 = lerp( NORMAL_OUT23_g3273 , NORMAL_OUT_DETAIL491_g3273 , tex2DNode418_g3273.r);
			float3 m_Active467_g3273 = saturate( lerpResult470_g3273 );
			float3 localfloat3switch467_g3273 = float3switch467_g3273( m_switch467_g3273 , m_Off467_g3273 , m_Active467_g3273 );
			float3 MASK_NORMAL_OUT469_g3273 = localfloat3switch467_g3273;
			float4 tex2DNode35_g3273 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, uv_TexCoord165_g3273 );
			float4 temp_output_159_0_g3273 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3273 * _Brightness );
			float4 ALBEDO_OUT91_g3273 = temp_output_159_0_g3273;
			float4 break462_g3273 = ALBEDO_OUT91_g3273;
			float ALBEDO_IN_XYZ464_g3273 = ( break462_g3273.r + break462_g3273.g + break462_g3273.b );
			float clampResult486_g3273 = clamp( ( ( ( ( ALBEDO_IN_XYZ464_g3273 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( i.vertexColor.r - ( _DetailBlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
			float DETAIL_BLEND396_g3273 = clampResult486_g3273;
			float3 lerpResult498_g3273 = lerp( MASK_NORMAL_OUT469_g3273 , NORMAL_OUT23_g3273 , DETAIL_BLEND396_g3273);
			float3 m_Active502_g3273 = ( NORMAL_OUT23_g3273 + saturate( lerpResult498_g3273 ) );
			float3 localfloat3switch502_g3273 = float3switch502_g3273( m_switch502_g3273 , m_Off502_g3273 , m_Active502_g3273 );
			float3 temp_output_19_0_g3413 = localfloat3switch502_g3273;
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
			int m_switch547_g3273 = _SmoothnessType;
			float2 CUSTOM_UV1179_g3273 = uv_TexCoord165_g3273;
			float4 tex2DNode126_g3273 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3273 );
			float4 m_Smoothness547_g3273 = tex2DNode126_g3273;
			float4 m_Roughness547_g3273 = ( 1.0 - tex2DNode126_g3273 );
			float4 localfloat4switch547_g3273 = float4switch547_g3273( m_switch547_g3273 , m_Smoothness547_g3273 , m_Roughness547_g3273 );
			float4 temp_output_23_0_g3413 = ( _SmoothnessStrength * localfloat4switch547_g3273 );
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
			int m_switch506_g3273 = SURFACE_MAP_MODE456_g3273;
			float4 m_Off506_g3273 = ALBEDO_OUT91_g3273;
			int m_switch476_g3273 = EnableDetailMask428_g3273;
			float4 tex2DNode449_g3273 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, uv_TexCoord414_g3273 );
			float4 ALBEDO_OUT_DETAIL493_g3273 = ( _ColorDetail * tex2DNode449_g3273 * _DetailBrightness );
			float4 m_Off476_g3273 = ALBEDO_OUT_DETAIL493_g3273;
			float4 lerpResult477_g3273 = lerp( ALBEDO_OUT91_g3273 , ALBEDO_OUT_DETAIL493_g3273 , tex2DNode418_g3273.r);
			float4 m_Active476_g3273 = lerpResult477_g3273;
			float4 localfloat4switch476_g3273 = float4switch476_g3273( m_switch476_g3273 , m_Off476_g3273 , m_Active476_g3273 );
			float4 MASK_ALBEDO_OUT473_g3273 = localfloat4switch476_g3273;
			float4 lerpResult503_g3273 = lerp( MASK_ALBEDO_OUT473_g3273 , ALBEDO_OUT91_g3273 , DETAIL_BLEND396_g3273);
			float4 m_Active506_g3273 = lerpResult503_g3273;
			float4 localfloat4switch506_g3273 = float4switch506_g3273( m_switch506_g3273 , m_Off506_g3273 , m_Active506_g3273 );
			float4 temp_output_746_0_g3413 = ( localfloat4switch506_g3273 + float4(0,0,0,0) );
			o.Albedo = ( temp_output_746_0_g3413 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
			o.Metallic = ( _MetallicStrength * SAMPLE_TEXTURE2D( _Metal, sampler_trilinear_repeat, CUSTOM_UV1179_g3273 ) ).r;
			int m_switch1437_g3413 = _Global_Rain_Enabled1178_g3413;
			float m_Off1437_g3413 = temp_output_23_0_g3413.x;
			float _Global_Rain_Wetness1431_g3413 = _Global_Rain_Wetness;
			float m_Active1437_g3413 = saturate( ( temp_output_23_0_g3413 + _Global_Rain_Wetness1431_g3413 ) ).x;
			float3 localfloatswitch1437_g3413 = floatswitch1437_g3413( m_switch1437_g3413 , m_Off1437_g3413 , m_Active1437_g3413 );
			o.Smoothness = localfloatswitch1437_g3413.x;
			float4 color525_g3273 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float lerpResult134_g3273 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3273 ).r , i.vertexColor.a , (float)_OcclusionSourceMode);
			float4 temp_cast_43 = (lerpResult134_g3273).xxxx;
			float4 lerpResult135_g3273 = lerp( color525_g3273 , temp_cast_43 , _OcclusionStrengthAO);
			o.Occlusion = lerpResult135_g3273.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;619.298;1121.596;1.538386;True;False
Node;AmplifyShaderEditor.CommentaryNode;451;194.0844,-183.1066;Inherit;False;1054.345;456.2369;;7;453;452;454;457;455;458;462;Tessellation;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;462;633.8019,-142.8654;Inherit;False;241.6667;118;Header;1;456;;0.01811683,1,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;453;223.3999,118.733;Half;False;Property;_TessellationDistanceMax;Tessellation Distance Max ;58;0;Create;False;1;;0;0;False;0;False;5;2000;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;452;229.5835,45.55386;Half;False;Property;_TessellationDistanceMin;Tessellation Distance Min;57;0;Create;False;1;;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;454;209.0845,-33.09503;Half;False;Property;_TessellationStrength;Tessellation Strength;56;0;Create;False;1;;0;0;False;0;False;6;0.5;0.001;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceBasedTessNode;455;496.9093,25.07978;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;458;747.3529,94.09287;Inherit;False;Constant;_Float4;Float 4;53;1;[HideInInspector];Create;True;1;;0;0;False;0;False;0.001;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;460;348.6721,-697.0591;Inherit;False;DECSF Master Map Surface;3;;3273;6c26b12be02413b47bab527585da6bf6;6,185,0,508,1,520,1,533,0,534,0,542,1;2;538;FLOAT3;0,0,0;False;550;FLOAT4;0,0,0,0;False;9;FLOAT4;106;FLOAT3;88;COLOR;115;FLOAT4;129;COLOR;116;FLOAT;181;FLOAT;144;FLOAT;318;FLOAT4;535
Node;AmplifyShaderEditor.IntNode;456;649.8019,-101.8654;Inherit;False;Property;_TessellationMode;Tessellation Mode;55;2;[Header];[Enum];Create;False;1;TESSELLATION;2;Off;0;Active;1;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.CommentaryNode;295;1387.768,-1173.258;Inherit;False;368.9078;114.1698;Header;1;294;GLOBAL SETTINGS ;0.3163385,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;463;1388.451,-1047.108;Inherit;False;357.3334;118;Header;1;293;;0.09301448,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;290;1386.96,-890.2607;Inherit;False;346.5028;193.4201;;2;291;353;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CustomExpressionNode;457;945.4557,-20.86854;Inherit;False;if(m_switch ==0)$	return m_Off@$else if(m_switch ==1)$	return m_Active@$else$return float4(0,0,0,0)@;4;False;3;True;m_switch;INT;0;In;;Inherit;False;True;m_Off;FLOAT4;0,0,0,0;In;;Inherit;False;True;m_Active;FLOAT4;0,0,0,0;In;;Inherit;False;float4 switch ;True;False;0;3;0;INT;0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.IntNode;293;1398.451,-1004.108;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;294;1401.212,-1134.354;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;291;1396.189,-848.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1400.431,-777.1531;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;461;934.2637,-702.9968;Inherit;False;DECSF Module Rain;59;;3413;794acd4ff0c67c64dae9e89693bd5acf;0;3;746;FLOAT4;0,0,0,0;False;19;FLOAT3;0,0,1;False;23;FLOAT4;1,0,0,0;False;3;FLOAT4;747;FLOAT3;0;FLOAT3;229
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;6;;200;0;Standard;DEC/Rain/Rain Surface Height Detail Tessellation;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;14;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;0;1;0;5;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;455;0;454;0
WireConnection;455;1;452;0
WireConnection;455;2;453;0
WireConnection;457;0;456;0
WireConnection;457;1;458;0
WireConnection;457;2;455;0
WireConnection;461;746;460;106
WireConnection;461;19;460;88
WireConnection;461;23;460;129
WireConnection;194;0;461;747
WireConnection;194;1;461;0
WireConnection;194;3;460;115
WireConnection;194;4;461;229
WireConnection;194;5;460;116
WireConnection;194;11;460;535
WireConnection;194;14;457;0
ASEEND*/
//CHKSM=5F319B7CCB137C26D92D5E5F951B3FF3F0151BDB