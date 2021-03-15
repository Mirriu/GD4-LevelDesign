// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Surface/Surface Height Detail"
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
		uniform int _Displacement_Mode;
		uniform half _DisplacementStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_ParallaxMap);
		uniform int _TillingMode;
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		SamplerState sampler_trilinear_repeat;
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
		uniform half4 _ColorDetail;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailAlbedoMap);
		uniform half _DetailBrightness;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Metal);
		uniform float _SmoothnessStrength;
		uniform int _SmoothnessType;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;


		float2 float2switch214_g3426( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch361_g3426( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float2 float2switch393_g3426( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float3 float3switch467_g3426( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float3 float3switch502_g3426( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float4 float4switch476_g3426( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch506_g3426( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch547_g3426( int m_switch, float4 m_Smoothness, float4 m_Roughness )
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
			float3 temp_output_538_0_g3426 = float3(0,0,0);
			int m_switch361_g3426 = _Displacement_Mode;
			float4 temp_cast_1 = (0.0).xxxx;
			float4 m_Off361_g3426 = temp_cast_1;
			int TILLING_MODE190_g3426 = _TillingMode;
			int m_switch214_g3426 = TILLING_MODE190_g3426;
			float2 appendResult192_g3426 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3426 = appendResult192_g3426;
			float2 m_Standard214_g3426 = TEXTURE_TILLING200_g3426;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3426 = ase_parentObjectScale;
			float2 appendResult205_g3426 = (float2(break206_g3426.z , break206_g3426.y));
			float3 ase_vertexNormal = v.normal.xyz;
			float3 normalizeResult194_g3426 = normalize( ase_vertexNormal );
			float3 break201_g3426 = normalizeResult194_g3426;
			float2 appendResult204_g3426 = (float2(break206_g3426.x , break206_g3426.z));
			float2 appendResult193_g3426 = (float2(break206_g3426.x , break206_g3426.y));
			float2 TEXTURE_TILLING_SCALE210_g3426 = ( ( ( appendResult205_g3426 * break201_g3426.x ) + ( break201_g3426.y * appendResult204_g3426 ) + ( break201_g3426.z * appendResult193_g3426 ) ) * TEXTURE_TILLING200_g3426 );
			float2 m_Scale214_g3426 = TEXTURE_TILLING_SCALE210_g3426;
			float2 localfloat2switch214_g3426 = float2switch214_g3426( m_switch214_g3426 , m_Standard214_g3426 , m_Scale214_g3426 );
			float2 appendResult166_g3426 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3426 = v.texcoord.xy * localfloat2switch214_g3426 + appendResult166_g3426;
			float2 CUSTOM_UV1179_g3426 = uv_TexCoord165_g3426;
			float4 m_Active361_g3426 = ( _DisplacementStrength * ( SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3426, 1.0 ) * float4( ase_vertexNormal , 0.0 ) ) );
			float4 localfloat4switch361_g3426 = float4switch361_g3426( m_switch361_g3426 , m_Off361_g3426 , m_Active361_g3426 );
			float4 DISPLACEMENT_OUT543_g3426 = localfloat4switch361_g3426;
			v.vertex.xyz += ( float4( temp_output_538_0_g3426 , 0.0 ) + DISPLACEMENT_OUT543_g3426 ).xyz;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int SURFACE_MAP_MODE456_g3426 = _EnableDetailMap;
			int m_switch502_g3426 = SURFACE_MAP_MODE456_g3426;
			int TILLING_MODE190_g3426 = _TillingMode;
			int m_switch214_g3426 = TILLING_MODE190_g3426;
			float2 appendResult192_g3426 = (float2(_TilingX , _TilingY));
			float2 TEXTURE_TILLING200_g3426 = appendResult192_g3426;
			float2 m_Standard214_g3426 = TEXTURE_TILLING200_g3426;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break206_g3426 = ase_parentObjectScale;
			float2 appendResult205_g3426 = (float2(break206_g3426.z , break206_g3426.y));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 normalizeResult194_g3426 = normalize( ase_vertexNormal );
			float3 break201_g3426 = normalizeResult194_g3426;
			float2 appendResult204_g3426 = (float2(break206_g3426.x , break206_g3426.z));
			float2 appendResult193_g3426 = (float2(break206_g3426.x , break206_g3426.y));
			float2 TEXTURE_TILLING_SCALE210_g3426 = ( ( ( appendResult205_g3426 * break201_g3426.x ) + ( break201_g3426.y * appendResult204_g3426 ) + ( break201_g3426.z * appendResult193_g3426 ) ) * TEXTURE_TILLING200_g3426 );
			float2 m_Scale214_g3426 = TEXTURE_TILLING_SCALE210_g3426;
			float2 localfloat2switch214_g3426 = float2switch214_g3426( m_switch214_g3426 , m_Standard214_g3426 , m_Scale214_g3426 );
			float2 appendResult166_g3426 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord165_g3426 = i.uv_texcoord * localfloat2switch214_g3426 + appendResult166_g3426;
			float3 NORMAL_OUT23_g3426 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, uv_TexCoord165_g3426 ), _NormalStrength );
			float3 m_Off502_g3426 = NORMAL_OUT23_g3426;
			int EnableDetailMask428_g3426 = _EnableDetailMask;
			int m_switch467_g3426 = EnableDetailMask428_g3426;
			int TILLING_MODE_DETAIL435_g3426 = _TillingModeDetail;
			int m_switch393_g3426 = TILLING_MODE_DETAIL435_g3426;
			float2 appendResult432_g3426 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
			float2 TEXTURE_TILLING_DETAIL425_g3426 = appendResult432_g3426;
			float2 m_Standard393_g3426 = TEXTURE_TILLING_DETAIL425_g3426;
			float3 break420_g3426 = ase_parentObjectScale;
			float2 appendResult448_g3426 = (float2(break420_g3426.z , break420_g3426.y));
			float3 normalizeResult480_g3426 = normalize( ase_vertexNormal );
			float3 break431_g3426 = normalizeResult480_g3426;
			float2 appendResult426_g3426 = (float2(break420_g3426.x , break420_g3426.z));
			float2 appendResult433_g3426 = (float2(break420_g3426.x , break420_g3426.y));
			float2 TEXTURE_TILLING_SCALE_DETAIL427_g3426 = ( ( ( appendResult448_g3426 * break431_g3426.x ) + ( break431_g3426.y * appendResult426_g3426 ) + ( break431_g3426.z * appendResult433_g3426 ) ) * TEXTURE_TILLING_DETAIL425_g3426 );
			float2 m_Scale393_g3426 = TEXTURE_TILLING_SCALE_DETAIL427_g3426;
			float2 localfloat2switch393_g3426 = float2switch393_g3426( m_switch393_g3426 , m_Standard393_g3426 , m_Scale393_g3426 );
			float2 appendResult394_g3426 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
			float2 uv_TexCoord414_g3426 = i.uv_texcoord * localfloat2switch393_g3426 + appendResult394_g3426;
			float3 NORMAL_OUT_DETAIL491_g3426 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, uv_TexCoord414_g3426 ), _DetailNormalMapScale );
			float3 m_Off467_g3426 = NORMAL_OUT_DETAIL491_g3426;
			float2 appendResult445_g3426 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
			float2 appendResult417_g3426 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
			float2 uv_TexCoord415_g3426 = i.uv_texcoord * appendResult445_g3426 + appendResult417_g3426;
			float4 tex2DNode418_g3426 = SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, uv_TexCoord415_g3426 );
			float3 lerpResult470_g3426 = lerp( NORMAL_OUT23_g3426 , NORMAL_OUT_DETAIL491_g3426 , tex2DNode418_g3426.r);
			float3 m_Active467_g3426 = saturate( lerpResult470_g3426 );
			float3 localfloat3switch467_g3426 = float3switch467_g3426( m_switch467_g3426 , m_Off467_g3426 , m_Active467_g3426 );
			float3 MASK_NORMAL_OUT469_g3426 = localfloat3switch467_g3426;
			float4 tex2DNode35_g3426 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, uv_TexCoord165_g3426 );
			float4 temp_output_159_0_g3426 = ( float4( (_Color).rgb , 0.0 ) * tex2DNode35_g3426 * _Brightness );
			float4 ALBEDO_OUT91_g3426 = temp_output_159_0_g3426;
			float4 break462_g3426 = ALBEDO_OUT91_g3426;
			float ALBEDO_IN_XYZ464_g3426 = ( break462_g3426.r + break462_g3426.g + break462_g3426.b );
			float clampResult486_g3426 = clamp( ( ( ( ( ALBEDO_IN_XYZ464_g3426 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( i.vertexColor.r - ( _DetailBlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
			float DETAIL_BLEND396_g3426 = clampResult486_g3426;
			float3 lerpResult498_g3426 = lerp( MASK_NORMAL_OUT469_g3426 , NORMAL_OUT23_g3426 , DETAIL_BLEND396_g3426);
			float3 m_Active502_g3426 = ( NORMAL_OUT23_g3426 + saturate( lerpResult498_g3426 ) );
			float3 localfloat3switch502_g3426 = float3switch502_g3426( m_switch502_g3426 , m_Off502_g3426 , m_Active502_g3426 );
			o.Normal = localfloat3switch502_g3426;
			int m_switch506_g3426 = SURFACE_MAP_MODE456_g3426;
			float4 m_Off506_g3426 = ALBEDO_OUT91_g3426;
			int m_switch476_g3426 = EnableDetailMask428_g3426;
			float4 tex2DNode449_g3426 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, uv_TexCoord414_g3426 );
			float4 ALBEDO_OUT_DETAIL493_g3426 = ( _ColorDetail * tex2DNode449_g3426 * _DetailBrightness );
			float4 m_Off476_g3426 = ALBEDO_OUT_DETAIL493_g3426;
			float4 lerpResult477_g3426 = lerp( ALBEDO_OUT91_g3426 , ALBEDO_OUT_DETAIL493_g3426 , tex2DNode418_g3426.r);
			float4 m_Active476_g3426 = lerpResult477_g3426;
			float4 localfloat4switch476_g3426 = float4switch476_g3426( m_switch476_g3426 , m_Off476_g3426 , m_Active476_g3426 );
			float4 MASK_ALBEDO_OUT473_g3426 = localfloat4switch476_g3426;
			float4 lerpResult503_g3426 = lerp( MASK_ALBEDO_OUT473_g3426 , ALBEDO_OUT91_g3426 , DETAIL_BLEND396_g3426);
			float4 m_Active506_g3426 = lerpResult503_g3426;
			float4 localfloat4switch506_g3426 = float4switch506_g3426( m_switch506_g3426 , m_Off506_g3426 , m_Active506_g3426 );
			o.Albedo = ( localfloat4switch506_g3426 + float4(0,0,0,0) ).xyz;
			float2 CUSTOM_UV1179_g3426 = uv_TexCoord165_g3426;
			o.Metallic = ( _MetallicStrength * SAMPLE_TEXTURE2D( _Metal, sampler_trilinear_repeat, CUSTOM_UV1179_g3426 ) ).r;
			int m_switch547_g3426 = _SmoothnessType;
			float4 tex2DNode126_g3426 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3426 );
			float4 m_Smoothness547_g3426 = tex2DNode126_g3426;
			float4 m_Roughness547_g3426 = ( 1.0 - tex2DNode126_g3426 );
			float4 localfloat4switch547_g3426 = float4switch547_g3426( m_switch547_g3426 , m_Smoothness547_g3426 , m_Roughness547_g3426 );
			o.Smoothness = ( _SmoothnessStrength * localfloat4switch547_g3426 ).x;
			float4 color525_g3426 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float lerpResult134_g3426 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1179_g3426 ).r , i.vertexColor.a , (float)_OcclusionSourceMode);
			float4 temp_cast_14 = (lerpResult134_g3426).xxxx;
			float4 lerpResult135_g3426 = lerp( color525_g3426 , temp_cast_14 , _OcclusionStrengthAO);
			o.Occlusion = lerpResult135_g3426.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;84.57169;1023.255;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;468;1384.695,-1048.718;Inherit;False;260.5;115.5;Header;1;293;;0.08167672,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;290;1386.96,-890.2607;Inherit;False;346.5028;193.4201;;2;291;353;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1383.783,-1176.665;Inherit;False;252;121;GLOBAL SETTINGS ;1;294;Header;0.1496565,0.8490566,0,1;0;0
Node;AmplifyShaderEditor.IntNode;291;1396.189,-848.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1400.431,-777.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;467;521.7002,-681.8051;Inherit;False;DECSF Master Map Surface;3;;3426;6c26b12be02413b47bab527585da6bf6;6,185,0,508,1,520,1,533,0,534,0,542,1;2;538;FLOAT3;0,0,0;False;550;FLOAT4;0,0,0,0;False;9;FLOAT4;106;FLOAT3;88;COLOR;115;FLOAT4;129;COLOR;116;FLOAT;181;FLOAT;144;FLOAT;318;FLOAT4;535
Node;AmplifyShaderEditor.IntNode;294;1394.596,-1136.853;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;293;1396.695,-1011.718;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;6;;200;0;Standard;DEC/Surface/Surface Height Detail;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;14;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;1;0;5;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;194;0;467;106
WireConnection;194;1;467;88
WireConnection;194;3;467;115
WireConnection;194;4;467;129
WireConnection;194;5;467;116
WireConnection;194;11;467;535
ASEEND*/
//CHKSM=35C3F8C68A2541B4E7FF413CD1D739B55C7ADDAC