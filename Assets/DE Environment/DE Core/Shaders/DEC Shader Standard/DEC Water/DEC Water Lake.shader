// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Water/Water Lake"
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
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
			float4 vertexColor : COLOR;
			float3 worldRefl;
			half ASEVFace : VFACE;
		};

		uniform int _ColorMask;
		uniform float _AlphatoCoverage;
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform int _CullMode;
		uniform int _ZWriteMode;
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
		uniform int _SmoothnessCullModeWater;
		uniform int _SmoothnessModeWater;
		uniform float _SmoothnessStrength;
		uniform float _SmoothnessVariance;
		uniform float _SmoothnessThreshold;
		uniform float _SmoothnessBias;
		uniform float _SmoothnessScale;
		uniform float _SmoothnessPower;
		uniform float _SmoothnessFresnel;


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


		float2 float2switch963_g756( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float3 float3switch932_g756( int m_switch, float3 m_Off, float3 m_Swirling )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Swirling;
			else
			return float3(0,0,0);
		}


		float2 float2switch1015_g756( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch936_g756( int m_switch, float4 m_Off, float4 m_Swirling )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Swirling;
			else
			return float4(0,0,0,0);
		}


		float2 float2switch989_g756( int m_switch, float2 m_Standard, float2 m_Scale )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Scale;
			else
			return float2(0,0);
		}


		float4 float4switch934_g756( int m_switch, float4 m_Off, float4 m_Swirling )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Swirling;
			else
			return float4(0,0,0,0);
		}


		float GetRefractedDepth55_g760( float3 tangentSpaceNormal, float4 screenPos, inout float2 uv )
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


		float4 float4switch95_g758( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch92_g758( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch1051_g756( int m_switch, float4 m_Standard, float4 m_Geometric )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Geometric;
			else
			return float4(0,0,0,0);
		}


		float3 float3switch1041_g756( int m_switch, float3 m_Standard, float3 m_Cullfront, float3 m_Cullback )
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


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch932_g756 = _WaterNormal_FlowDirection;
			float3 m_Off932_g756 = float3( 0,0,0 );
			float mulTime863_g756 = _Time.y * _WaterNormal_Timescale;
			float temp_output_849_0_g756 = ( _WaterNormal_NormalMapSpeed * 0.0006 );
			float2 temp_cast_0 = (temp_output_849_0_g756).xx;
			int m_switch963_g756 = _WaterNormal_TillingMode;
			float2 appendResult947_g756 = (float2(_WaterNormal_TilingX , _WaterNormal_TilingY));
			float2 TEXTURE_TILLING_Normal959_g756 = appendResult947_g756;
			float2 m_Standard963_g756 = TEXTURE_TILLING_Normal959_g756;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float3 break939_g756 = ase_parentObjectScale;
			float2 appendResult941_g756 = (float2(break939_g756.z , break939_g756.y));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 normalizeResult957_g756 = normalize( ase_vertexNormal );
			float3 break948_g756 = normalizeResult957_g756;
			float2 appendResult940_g756 = (float2(break939_g756.x , break939_g756.z));
			float2 appendResult953_g756 = (float2(break939_g756.x , break939_g756.y));
			float2 TEXTURE_TILLING_SCALE_Normal942_g756 = ( ( ( appendResult941_g756 * break948_g756.x ) + ( break948_g756.y * appendResult940_g756 ) + ( break948_g756.z * appendResult953_g756 ) ) * TEXTURE_TILLING_Normal959_g756 );
			float2 m_Scale963_g756 = TEXTURE_TILLING_SCALE_Normal942_g756;
			float2 localfloat2switch963_g756 = float2switch963_g756( m_switch963_g756 , m_Standard963_g756 , m_Scale963_g756 );
			float2 uv4_TexCoord844_g756 = i.uv4_texcoord4 * ( localfloat2switch963_g756 * float2( 2,2 ) );
			float2 _G_FlowSwirling = float2(2,4);
			float cos843_g756 = cos( _G_FlowSwirling.x );
			float sin843_g756 = sin( _G_FlowSwirling.x );
			float2 rotator843_g756 = mul( uv4_TexCoord844_g756 - float2( 0,0 ) , float2x2( cos843_g756 , -sin843_g756 , sin843_g756 , cos843_g756 )) + float2( 0,0 );
			float2 panner845_g756 = ( mulTime863_g756 * temp_cast_0 + rotator843_g756);
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float lerpResult1191_g756 = lerp( 0.0 , _WaterNormal_NormalMapStrength , ase_normWorldNormal.y);
			float cos847_g756 = cos( _G_FlowSwirling.y );
			float sin847_g756 = sin( _G_FlowSwirling.y );
			float2 rotator847_g756 = mul( uv4_TexCoord844_g756 - float2( 0,0 ) , float2x2( cos847_g756 , -sin847_g756 , sin847_g756 , cos847_g756 )) + float2( 0,0 );
			float2 panner839_g756 = ( temp_output_849_0_g756 * float2( 0,0 ) + rotator847_g756);
			float2 temp_cast_1 = (temp_output_849_0_g756).xx;
			float2 panner850_g756 = ( mulTime863_g756 * temp_cast_1 + uv4_TexCoord844_g756);
			float3 m_Swirling932_g756 = BlendNormals( UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner845_g756 ), lerpResult1191_g756 ) , ( UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner839_g756 ), lerpResult1191_g756 ) + UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, panner850_g756 ), lerpResult1191_g756 ) ) );
			float3 localfloat3switch932_g756 = float3switch932_g756( m_switch932_g756 , m_Off932_g756 , m_Swirling932_g756 );
			float4 appendResult486_g756 = (float4(1.0 , 0.0 , 1.0 , localfloat3switch932_g756.x));
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 temp_output_1230_0_g756 = ( ase_vertex3Pos * 100.0 );
			float3 temp_output_1225_0_g756 = cross( ase_worldNormal , ddy( temp_output_1230_0_g756 ) );
			float3 temp_output_1210_0_g756 = ddx( temp_output_1230_0_g756 );
			float dotResult1248_g756 = dot( temp_output_1225_0_g756 , temp_output_1210_0_g756 );
			float temp_output_1221_0_g756 = abs( dotResult1248_g756 );
			int m_switch936_g756 = _OffshoreFoam_FlowDirectionMode;
			float4 m_Off936_g756 = float4( 0,0,0,0 );
			float mulTime920_g756 = _Time.y * _OffshoreFoam_Timescale;
			float temp_output_908_0_g756 = ( _OffshoreFoam_Speed * 0.0006 );
			float2 temp_cast_3 = (temp_output_908_0_g756).xx;
			int m_switch1015_g756 = _OffshoreFoam_TillingMode;
			float2 appendResult991_g756 = (float2(_OffshoreFoam_TilingX , _OffshoreFoam_TilingY));
			float2 TEXTURE_TILLING_Offshore996_g756 = appendResult991_g756;
			float2 m_Standard1015_g756 = TEXTURE_TILLING_Offshore996_g756;
			float3 break1001_g756 = ase_parentObjectScale;
			float2 appendResult1002_g756 = (float2(break1001_g756.z , break1001_g756.y));
			float3 normalizeResult1008_g756 = normalize( ase_vertexNormal );
			float3 break1007_g756 = normalizeResult1008_g756;
			float2 appendResult1000_g756 = (float2(break1001_g756.x , break1001_g756.z));
			float2 appendResult1005_g756 = (float2(break1001_g756.x , break1001_g756.y));
			float2 TEXTURE_TILLING_SCALE_Offshore1011_g756 = ( ( ( appendResult1002_g756 * break1007_g756.x ) + ( break1007_g756.y * appendResult1000_g756 ) + ( break1007_g756.z * appendResult1005_g756 ) ) * TEXTURE_TILLING_Offshore996_g756 );
			float2 m_Scale1015_g756 = TEXTURE_TILLING_SCALE_Offshore1011_g756;
			float2 localfloat2switch1015_g756 = float2switch1015_g756( m_switch1015_g756 , m_Standard1015_g756 , m_Scale1015_g756 );
			float2 uv_TexCoord912_g756 = i.uv_texcoord * ( localfloat2switch1015_g756 * float2( 2,2 ) );
			float2 _Vector1 = float2(2,4);
			float cos911_g756 = cos( _Vector1.x );
			float sin911_g756 = sin( _Vector1.x );
			float2 rotator911_g756 = mul( uv_TexCoord912_g756 - float2( 0,0 ) , float2x2( cos911_g756 , -sin911_g756 , sin911_g756 , cos911_g756 )) + float2( 0,0 );
			float2 panner914_g756 = ( mulTime920_g756 * temp_cast_3 + rotator911_g756);
			float2 temp_cast_4 = (temp_output_908_0_g756).xx;
			float cos913_g756 = cos( _Vector1.y );
			float sin913_g756 = sin( _Vector1.y );
			float2 rotator913_g756 = mul( uv_TexCoord912_g756 - float2( 0,0 ) , float2x2( cos913_g756 , -sin913_g756 , sin913_g756 , cos913_g756 )) + float2( 0,0 );
			float2 panner910_g756 = ( mulTime920_g756 * temp_cast_4 + rotator913_g756);
			float2 temp_cast_5 = (temp_output_908_0_g756).xx;
			float2 panner915_g756 = ( mulTime920_g756 * temp_cast_5 + uv_TexCoord912_g756);
			float4 m_Swirling936_g756 = ( float4( (_OffshoreFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner914_g756 ) + ( SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner910_g756 ) + SAMPLE_TEXTURE2D( _OffshoreFoam_Map, sampler_trilinear_repeat, panner915_g756 ) ) ) );
			float4 localfloat4switch936_g756 = float4switch936_g756( m_switch936_g756 , m_Off936_g756 , m_Swirling936_g756 );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float clampDepth47_g756 = SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy );
			float z46_g756 = clampDepth47_g756;
			float4 localCalculateObliqueFrustumCorrection63_g756 = CalculateObliqueFrustumCorrection();
			float dotResult59_g756 = dot( float4( ase_vertex3Pos , 0.0 ) , localCalculateObliqueFrustumCorrection63_g756 );
			float correctionFactor46_g756 = dotResult59_g756;
			float localCorrectedLinearEyeDepth46_g756 = CorrectedLinearEyeDepth( z46_g756 , correctionFactor46_g756 );
			float eyeDepth53_g756 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float temp_output_56_0_g756 = ( eyeDepth53_g756 - ase_screenPos.w );
			float temp_output_48_0_g756 = ( localCorrectedLinearEyeDepth46_g756 - abs( temp_output_56_0_g756 ) );
			float temp_output_49_0_g756 = saturate( temp_output_48_0_g756 );
			float GRAB_SCREEN_DEPTH_BEHIND80_g756 = temp_output_49_0_g756;
			float3 unityObjectToViewPos531_g756 = UnityObjectToViewPos( ase_vertex3Pos );
			float GRAB_SCREEN_DEPTH73_g756 = localCorrectedLinearEyeDepth46_g756;
			float temp_output_548_0_g756 = ( unityObjectToViewPos531_g756.z + GRAB_SCREEN_DEPTH73_g756 );
			float3 ase_worldPos = i.worldPos;
			float temp_output_55_0_g756 = saturate( ( 1.0 / distance( _WorldSpaceCameraPos , ase_worldPos ) ) );
			float GRAB_SCREEN_CLOSENESS83_g756 = temp_output_55_0_g756;
			float4 lerpResult537_g756 = lerp( float4( 0,0,0,0 ) , ( ( localfloat4switch936_g756 * GRAB_SCREEN_DEPTH_BEHIND80_g756 ) / 3.0 ) , saturate( ( ( ( temp_output_548_0_g756 - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g756 ) / ( ( _OffshoreFoam_Distance - 0.001 ) * GRAB_SCREEN_CLOSENESS83_g756 ) ) ));
			float4 lerpResult578_g756 = lerp( float4( 0,0,0,0 ) , lerpResult537_g756 , _OffshoreFoam_FoamStrength);
			float4 FOAM_OFFSHORE655_g756 = lerpResult578_g756;
			float4 temp_output_1235_0_g756 = ( _FoamNormalStrength_Offshore * FOAM_OFFSHORE655_g756 );
			float4 break1228_g756 = ( sign( temp_output_1221_0_g756 ) * ( ( ddx( temp_output_1235_0_g756 ) * float4( temp_output_1225_0_g756 , 0.0 ) ) + ( ddy( temp_output_1235_0_g756 ) * float4( cross( ase_worldNormal , temp_output_1210_0_g756 ) , 0.0 ) ) ) );
			float3 appendResult1245_g756 = (float3(break1228_g756.x , -break1228_g756.y , break1228_g756.z));
			float3 normalizeResult1236_g756 = normalize( ( ( temp_output_1221_0_g756 * ase_worldNormal ) - appendResult1245_g756 ) );
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_worldToTangent = float3x3( ase_worldTangent, ase_worldBitangent, ase_worldNormal );
			float3 worldToTangentDir1243_g756 = mul( ase_worldToTangent, normalizeResult1236_g756);
			float3 _FoamNormalStrength_Offshore1254_g756 = worldToTangentDir1243_g756;
			float3 temp_output_1292_0_g756 = ( ase_vertex3Pos * 100.0 );
			float3 temp_output_1273_0_g756 = cross( ase_worldNormal , ddy( temp_output_1292_0_g756 ) );
			float3 temp_output_1291_0_g756 = ddx( temp_output_1292_0_g756 );
			float dotResult1295_g756 = dot( temp_output_1273_0_g756 , temp_output_1291_0_g756 );
			float temp_output_1297_0_g756 = abs( dotResult1295_g756 );
			int m_switch934_g756 = _ShorelineFoam_FlowDirectionMode;
			float4 m_Off934_g756 = float4( 0,0,0,0 );
			float mulTime877_g756 = _Time.y * _ShorelineFoam_Timescale;
			float temp_output_888_0_g756 = ( _ShorelineFoam_Speed * 0.0006 );
			float2 temp_cast_11 = (temp_output_888_0_g756).xx;
			int m_switch989_g756 = _ShorelineFoam_TillingMode;
			float2 appendResult981_g756 = (float2(_ShorelineFoam_TilingX , _ShorelineFoam_TilingY));
			float2 TEXTURE_TILLING_Shoreline982_g756 = appendResult981_g756;
			float2 m_Standard989_g756 = TEXTURE_TILLING_Shoreline982_g756;
			float3 break971_g756 = ase_parentObjectScale;
			float2 appendResult972_g756 = (float2(break971_g756.z , break971_g756.y));
			float3 normalizeResult978_g756 = normalize( ase_vertexNormal );
			float3 break977_g756 = normalizeResult978_g756;
			float2 appendResult970_g756 = (float2(break971_g756.x , break971_g756.z));
			float2 appendResult975_g756 = (float2(break971_g756.x , break971_g756.y));
			float2 TEXTURE_TILLING_SCALE_Shoreline980_g756 = ( ( ( appendResult972_g756 * break977_g756.x ) + ( break977_g756.y * appendResult970_g756 ) + ( break977_g756.z * appendResult975_g756 ) ) * TEXTURE_TILLING_Shoreline982_g756 );
			float2 m_Scale989_g756 = TEXTURE_TILLING_SCALE_Shoreline980_g756;
			float2 localfloat2switch989_g756 = float2switch989_g756( m_switch989_g756 , m_Standard989_g756 , m_Scale989_g756 );
			float2 uv_TexCoord893_g756 = i.uv_texcoord * ( localfloat2switch989_g756 * float2( 2,2 ) );
			float2 _Vector0 = float2(2,4);
			float cos892_g756 = cos( _Vector0.x );
			float sin892_g756 = sin( _Vector0.x );
			float2 rotator892_g756 = mul( uv_TexCoord893_g756 - float2( 0,0 ) , float2x2( cos892_g756 , -sin892_g756 , sin892_g756 , cos892_g756 )) + float2( 0,0 );
			float2 panner897_g756 = ( mulTime877_g756 * temp_cast_11 + rotator892_g756);
			float2 temp_cast_12 = (temp_output_888_0_g756).xx;
			float cos895_g756 = cos( _Vector0.y );
			float sin895_g756 = sin( _Vector0.y );
			float2 rotator895_g756 = mul( uv_TexCoord893_g756 - float2( 0,0 ) , float2x2( cos895_g756 , -sin895_g756 , sin895_g756 , cos895_g756 )) + float2( 0,0 );
			float2 panner891_g756 = ( mulTime877_g756 * temp_cast_12 + rotator895_g756);
			float2 temp_cast_13 = (temp_output_888_0_g756).xx;
			float2 panner898_g756 = ( mulTime877_g756 * temp_cast_13 + uv_TexCoord893_g756);
			float4 m_Swirling934_g756 = ( float4( (_ShorelineFoam_Tint).rgb , 0.0 ) * ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner897_g756 ) + ( SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner891_g756 ) + SAMPLE_TEXTURE2D( _ShorelineFoam_Map, sampler_trilinear_repeat, panner898_g756 ) ) ) );
			float4 localfloat4switch934_g756 = float4switch934_g756( m_switch934_g756 , m_Off934_g756 , m_Swirling934_g756 );
			float3 unityObjectToViewPos561_g756 = UnityObjectToViewPos( ase_vertex3Pos );
			float temp_output_565_0_g756 = ( unityObjectToViewPos561_g756.z + GRAB_SCREEN_DEPTH73_g756 );
			float4 lerpResult511_g756 = lerp( ( localfloat4switch934_g756 * GRAB_SCREEN_DEPTH_BEHIND80_g756 ) , float4( 0,0,0,0 ) , saturate( ( ( ( temp_output_565_0_g756 - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g756 ) / ( ( _ShorelineFoam_Distance - 0.2237944 ) * GRAB_SCREEN_CLOSENESS83_g756 ) ) ));
			float4 lerpResult552_g756 = lerp( float4( 0,0,0,0 ) , lerpResult511_g756 , _ShorelineFoam_FoamStrength);
			float4 FOAM_SHORELINE654_g756 = lerpResult552_g756;
			float4 temp_output_1298_0_g756 = ( _FoamNormalStrength_Shoreline * FOAM_SHORELINE654_g756 );
			float4 break1278_g756 = ( sign( temp_output_1297_0_g756 ) * ( ( ddx( temp_output_1298_0_g756 ) * float4( temp_output_1273_0_g756 , 0.0 ) ) + ( ddy( temp_output_1298_0_g756 ) * float4( cross( ase_worldNormal , temp_output_1291_0_g756 ) , 0.0 ) ) ) );
			float3 appendResult1277_g756 = (float3(break1278_g756.x , -break1278_g756.y , break1278_g756.z));
			float3 normalizeResult1294_g756 = normalize( ( ( temp_output_1297_0_g756 * ase_worldNormal ) - appendResult1277_g756 ) );
			float3 worldToTangentDir1257_g756 = mul( ase_worldToTangent, normalizeResult1294_g756);
			float3 _FoamNormalStrength_Shoreline1286_g756 = worldToTangentDir1257_g756;
			float3 NORMAL_OUT504_g756 = BlendNormals( UnpackScaleNormal( appendResult486_g756, 0.15 ) , BlendNormals( _FoamNormalStrength_Offshore1254_g756 , _FoamNormalStrength_Shoreline1286_g756 ) );
			o.Normal = NORMAL_OUT504_g756;
			int REFLECTION_MODE65_g758 = _Reflection_Mode;
			int m_switch92_g758 = REFLECTION_MODE65_g758;
			float screenDepth1198_g756 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth1198_g756 = abs( ( screenDepth1198_g756 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _ShorelineDepth ) );
			float4 lerpResult25_g756 = lerp( _ShorelineTint , _MidwaterTint , saturate( (distanceDepth1198_g756*1.0 + _ShorelineOffset) ));
			float4 lerpResult27_g756 = lerp( _DepthTint , lerpResult25_g756 , saturate( (distanceDepth1198_g756*-1.0 + _DepthOffset) ));
			float4 COLOR_TINT161_g756 = lerpResult27_g756;
			float REFACTED_SCALE_FLOAT78_g760 = _RefractionScale;
			float3 NORMAL_OUT_Z505_g756 = localfloat3switch932_g756;
			float3 NORMAL_IN84_g760 = NORMAL_OUT_Z505_g756;
			float3 tangentSpaceNormal55_g760 = ( REFACTED_SCALE_FLOAT78_g760 * NORMAL_IN84_g760 );
			float4 screenPos55_g760 = ase_screenPos;
			float2 uv55_g760 = _CameraDepthTexture_TexelSize.xy;
			float localGetRefractedDepth55_g760 = GetRefractedDepth55_g760( tangentSpaceNormal55_g760 , screenPos55_g760 , uv55_g760 );
			float2 uv61_g760 = uv55_g760;
			float2 localAlignWithGrabTexel61_g760 = AlignWithGrabTexel( uv61_g760 );
			float4 screenColor53_g760 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,localAlignWithGrabTexel61_g760);
			float4 REFRACTED_DEPTH144_g756 = screenColor53_g760;
			float temp_output_20_0_g756 = ( i.vertexColor.a * ( 1.0 - _Opacity ) );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch37_g756 = 0.0;
			#else
				float staticSwitch37_g756 = ( 1.0 - ( ( 1.0 - saturate( ( _OpacityShoreline * (distanceDepth1198_g756*-5.0 + 1.0) ) ) ) * temp_output_20_0_g756 ) );
			#endif
			float DEPTH_TINT_ALPHA93_g756 = staticSwitch37_g756;
			float4 lerpResult105_g756 = lerp( COLOR_TINT161_g756 , REFRACTED_DEPTH144_g756 , DEPTH_TINT_ALPHA93_g756);
			float4 temp_output_1194_0_g756 = ( ( FOAM_OFFSHORE655_g756 + FOAM_SHORELINE654_g756 ) + lerpResult105_g756 );
			float4 ALBEDO_IN60_g758 = temp_output_1194_0_g756;
			float4 m_Off92_g758 = ALBEDO_IN60_g758;
			int m_switch95_g758 = _Reflection_FresnelMode;
			float3 NORMAL_IN54_g758 = NORMAL_OUT_Z505_g756;
			float2 temp_cast_19 = (-_Reflection_BumpClamp).xx;
			float2 temp_cast_20 = (_Reflection_BumpClamp).xx;
			float2 clampResult29_g758 = clamp( ( (NORMAL_IN54_g758).xy * _Reflection_BumpScale ) , temp_cast_19 , temp_cast_20 );
			float2 REFLECTION_BUMP9_g758 = clampResult29_g758;
			float4 texCUBENode31_g758 = SAMPLE_TEXTURECUBE_LOD( _Reflection_Cubemap, sampler_trilinear_repeat, ( float3( REFLECTION_BUMP9_g758 ,  0.0 ) + WorldReflectionVector( i , NORMAL_IN54_g758 ) + _Reflection_Wobble ), ( 1.0 - _Reflection_Smoothness ) );
			float4 temp_cast_22 = (texCUBENode31_g758.r).xxxx;
			float REFLECTION_CLOUD12_g758 = _Reflection_Cloud;
			float4 lerpResult49_g758 = lerp( texCUBENode31_g758 , temp_cast_22 , REFLECTION_CLOUD12_g758);
			float4 m_Off95_g758 = lerpResult49_g758;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float fresnelNdotV23_g758 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode23_g758 = ( _Reflection_FresnelBias + _Reflection_FresnelScale * pow( max( 1.0 - fresnelNdotV23_g758 , 0.0001 ), 5.0 ) );
			float REFLECTION_FRESNEL11_g758 = ( _Reflection_FresnelStrength * fresnelNode23_g758 );
			float4 lerpResult73_g758 = lerp( float4( 0,0,0,0 ) , lerpResult49_g758 , REFLECTION_FRESNEL11_g758);
			float4 m_Active95_g758 = lerpResult73_g758;
			float4 localfloat4switch95_g758 = float4switch95_g758( m_switch95_g758 , m_Off95_g758 , m_Active95_g758 );
			float4 switchResult100_g758 = (((i.ASEVFace>0)?(localfloat4switch95_g758):(float4( 0,0,0,0 ))));
			float4 m_Active92_g758 = ( ( ( 1.0 - 0.5 ) * switchResult100_g758 ) + ( ALBEDO_IN60_g758 * 0.5 ) );
			float4 localfloat4switch92_g758 = float4switch92_g758( m_switch92_g758 , m_Off92_g758 , m_Active92_g758 );
			float4 temp_cast_25 = (0.0).xxxx;
			#ifdef UNITY_PASS_FORWARDADD
				float4 staticSwitch105_g758 = temp_cast_25;
			#else
				float4 staticSwitch105_g758 = localfloat4switch92_g758;
			#endif
			o.Albedo = staticSwitch105_g758.xyz;
			int m_switch1041_g756 = _SmoothnessCullModeWater;
			int m_switch1051_g756 = _SmoothnessModeWater;
			float2 uv_WaterNormal_NormalMap870_g756 = i.uv_texcoord;
			float3 NORMAL_WORLD_OUT506_g756 = normalize( (WorldNormalVector( i , UnpackScaleNormal( SAMPLE_TEXTURE2D( _WaterNormal_NormalMap, sampler_trilinear_repeat, uv_WaterNormal_NormalMap870_g756 ), lerpResult1191_g756 ) )) );
			float3 temp_output_1106_0_g756 = ddx( NORMAL_WORLD_OUT506_g756 );
			float dotResult1088_g756 = dot( temp_output_1106_0_g756 , temp_output_1106_0_g756 );
			float3 temp_output_1087_0_g756 = ddy( NORMAL_WORLD_OUT506_g756 );
			float dotResult1114_g756 = dot( temp_output_1087_0_g756 , temp_output_1087_0_g756 );
			float temp_output_1102_0_g756 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult1088_g756 + dotResult1114_g756 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
			float4 m_Standard1051_g756 = float4( ( min( temp_output_1102_0_g756 , 0.5 ) * ( 1.0 - ( NORMAL_OUT504_g756 * float3( 0.79,0.79,0.79 ) ) ) ) , 0.0 );
			float4 m_Geometric1051_g756 = float4( ( temp_output_1102_0_g756 * ( 1.0 - NORMAL_OUT504_g756 ) ) , 0.0 );
			float4 localfloat4switch1051_g756 = float4switch1051_g756( m_switch1051_g756 , m_Standard1051_g756 , m_Geometric1051_g756 );
			float3 m_Standard1041_g756 = localfloat4switch1051_g756.xyz;
			float4 switchResult1059_g756 = (((i.ASEVFace>0)?(localfloat4switch1051_g756):(float4( 0,0,0,0 ))));
			float3 m_Cullfront1041_g756 = switchResult1059_g756.xyz;
			float4 switchResult1037_g756 = (((i.ASEVFace>0)?(float4( 1,0,0,0 )):(localfloat4switch1051_g756)));
			float3 m_Cullback1041_g756 = switchResult1037_g756.xyz;
			float3 localfloat3switch1041_g756 = float3switch1041_g756( m_switch1041_g756 , m_Standard1041_g756 , m_Cullfront1041_g756 , m_Cullback1041_g756 );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float fresnelNdotV1036_g756 = dot( NORMAL_WORLD_OUT506_g756, ase_worldlightDir );
			float fresnelNode1036_g756 = ( _SmoothnessBias + _SmoothnessScale * pow( max( 1.0 - fresnelNdotV1036_g756 , 0.0001 ), _SmoothnessPower ) );
			float clampResult1060_g756 = clamp( fresnelNode1036_g756 , 0.0 , 1.0 );
			float3 lerpResult1043_g756 = lerp( localfloat3switch1041_g756 , float3( 0,0,0 ) , ( clampResult1060_g756 * ( 1.0 - _SmoothnessFresnel ) ));
			o.Smoothness = lerpResult1043_g756.x;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;667.2454;3461.422;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;903;199.1788,-3227.381;Inherit;False;344.3333;121;Header;1;700;;0.3340696,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;844;199.208,-3064.666;Inherit;False;347.5028;191.4201;;2;698;894;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;843;201.0305,-3362.07;Inherit;False;352;119;Header;1;207;GLOBAL SETTINGS ;0.1784992,1,0,1;0;0
Node;AmplifyShaderEditor.IntNode;698;205.3818,-3024.394;Inherit;False;Property;_ColorMask;Color Mask Mode;2;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;209.2546,-2952.422;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;3;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;902;-193.8823,-2872.492;Inherit;False;DECSF Master Map Water Standard;5;;756;e9180da13cd3dd44380a8c2f4a746da6;1,1202,1;0;3;FLOAT4;0;FLOAT3;123;FLOAT3;122
Node;AmplifyShaderEditor.IntNode;207;212.0131,-3321.746;Float;False;Property;_CullMode;Cull Mode;4;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;700;214.1788,-3183.381;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;198.1309,-2867.459;Float;False;True;-1;6;;200;0;Standard;DEC/Water/Water Lake;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;False;True;True;True;False;Back;0;True;700;3;False;697;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;-20;True;Opaque;;Transparent;All;14;all;True;True;True;True;0;True;698;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;18;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;1;-1;-1;-1;0;True;0;0;True;207;-1;0;False;-1;0;1;;0;False;0.1;False;-1;0;True;894;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;902;0
WireConnection;0;1;902;123
WireConnection;0;4;902;122
ASEEND*/
//CHKSM=77E09CD262F72A4B87AB8C68FBF76B8FC5E66643