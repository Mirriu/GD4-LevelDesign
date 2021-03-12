// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/URP Cutout Wind/Cutout Wind Translucency"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(VERSION 1.4.0 URP 7_5_2)][Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Default,0,Flip,1,Mirror,2)]_NormalMode("Normal Mode", Int) = 0
		[Enum(Off,0,Active,1)]_GlancingClipMode("Clip Glancing Angle Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.49
		_AlphaCutoffBiasShadow("Alpha Cutoff Bias Shadow", Range( 0.01 , 1)) = 0.01
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
		[Enum(Default,0,Cull Front Face,1,Cull Back Face,2)]_TranslucencyCullForward("Translucency Cull", Int) = 0
		[Enum(Texture,0,Baked UV4,1)]_TranslucencySource("Translucency Source", Int) = 0
		[HDR]_TranslucencyTint("Translucency Tint", Color) = (0.575,0.75,0,1)
		[HDR]_TransmissionTint("Transmission Tint", Color) = (0.3833333,0.5,0,1)
		[NoScaleOffset][SingleLineTexture]_TranslucencyMap("Translucency Map", 2D) = "white" {}
		[Enum(Default,0,Inverted,1)]_MapInverted("Map Inverted", Int) = 0
		_TranslucencyThickness("Translucency Thickness", Range( 0 , 1.5)) = 1.5
		[Header(TRANSMISSION  URP)]_URP_TransmissionShadow("Transmission Shadow", Range( 0 , 1)) = 0.5
		[Header(TRANSLUCENCY URP)]_URP_TranslucencyStrength("Translucency Strength", Range( 1 , 50)) = 1
		_URP_TranslucencyNormalDistortion("Translucency Normal Distortion ", Range( 0 , 1)) = 0.2735869
		_URP_TranslucencyScattering("Translucency Scattering ", Range( 1 , 50)) = 2
		_URP_TranslucencyDirect("Translucency Direct ", Range( 0 , 1)) = 0.9
		_URP_TranslucencyAmbient("Translucency Ambient", Range( 0 , 1)) = 0.1
		_URP_TranslucencyShadow("Translucency Shadow ", Range( 0 , 1)) = 0.5
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
		[ASEEnd]_WindMask_Procedural_Intensity("Mask Intensity", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry-10" "NatureRendererInstancing"="True" }
		Cull [_CullMode]
		AlphaToMask [_AlphatoCoverage]
		HLSLINCLUDE
		#pragma target 3.5

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" "NatureRendererInstancing"="True" }
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _TransmissionTint;
			float4 _WindMask_Map_ST;
			float4 _TranslucencyTint;
			float _URP_TransmissionShadow;
			half _Brightness;
			float _ColorShift_ShiftVariation;
			float _ColorShift_RGBHue;
			float _ColorShift_RGBSaturation;
			float _ColorShift_RGBBrightness;
			float _WindMask_TextureVisualize;
			float _WindMask_ProceduralVisualize;
			int _NormalMode;
			half _NormalStrength;
			float _MetallicStrength;
			float _OffsetY;
			float _SmoothnessStrength;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
			int _TranslucencyCullForward;
			int _EnableTranslucency;
			float _URP_TranslucencyScattering;
			int _MapInverted;
			float _TranslucencyThickness;
			int _SmoothnessType;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyShadow;
			int _ColorMask;
			int _CullMode;
			int _ZWriteMode;
			float _AlphatoCoverage;
			int _WindMode;
			int _WindMask_Texture;
			int _WindMask_Procedural;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			float _WindMask_Offset1;
			float _WindMask_Procedural_Intensity;
			float _URP_TranslucencyNormalDistortion;
			float _WindMask_Texture_Intensity;
			int _ColorMode;
			int _TranslucencySource;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyDirect;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_TranslucencyMap);


			float floatswitch2458_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2468_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2312_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2456_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2326_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float3 float3switch2439_g3273( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float floatswitch2655_g3273( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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
			
			float3 float3switch2966_g3273( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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
			
			float3 float3switch2527_g3273( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3273( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float floatswitch836_g3275( int m_switch, float m_Off, float m_ColorShiftVertexNormal, float m_ColorShiftVertexColor )
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
			float3 float3switch420_g3275( int m_switch, float3 m_Off, float3 m_ColorShiftVertexNormal, float3 m_ColorShiftVertexColor )
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
			
			float4 float4switch2972_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2982_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2986_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2991_g3273( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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
			
			float3 AdditionalLightsFlat( float3 WorldPosition )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
					Light light = GetAdditionalLight(i, WorldPosition);
					Color += light.color *(light.distanceAttenuation * light.shadowAttenuation);
					
				}
				#endif
				return Color;
			}
			
			float4 float4switch845_g3275( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			
			float floatswitch599_g3275( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
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
			
			float4 float4switch332_g3275( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch537_g3275( int m_switch, float4 m_Default, float4 m_CullFrontFace, float4 m_CullBackFace )
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
			
			float4 float4switch324_g3275( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch539_g3275( int m_switch, float4 m_Default, float4 m_CullFrontFace, float4 m_CullBackFace )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch2453_g3273 = _WindMode;
				float3 m_Off2453_g3273 = float3(0,0,0);
				int m_switch2527_g3273 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2966_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				int m_switch2439_g3273 = _WindType;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3273 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				int _WIND_MODE2462_g3273 = _WindMode;
				int m_switch2458_g3273 = _WIND_MODE2462_g3273;
				float m_Off2458_g3273 = 1.0;
				float _Global_Wind_Main_Intensity2403_g3273 = _Global_Wind_Main_Intensity;
				float m_Global2458_g3273 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3273 );
				float m_Local2458_g3273 = _LocalWindStrength;
				float localfloatswitch2458_g3273 = floatswitch2458_g3273( m_switch2458_g3273 , m_Off2458_g3273 , m_Global2458_g3273 , m_Local2458_g3273 );
				float VAR_WindStrength2400_g3273 = localfloatswitch2458_g3273;
				int m_switch2468_g3273 = _WIND_MODE2462_g3273;
				float m_Off2468_g3273 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3273 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3273 = _Global_Wind_Main_RandomOffset2378_g3273;
				float m_Local2468_g3273 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3273 = floatswitch2468_g3273( m_switch2468_g3273 , m_Off2468_g3273 , m_Global2468_g3273 , m_Local2468_g3273 );
				float VAR_WindOffset2419_g3273 = localfloatswitch2468_g3273;
				float4 transform2423_g3273 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3273 = (float2(transform2423_g3273.x , transform2423_g3273.z));
				float dotResult2341_g3273 = dot( appendResult2307_g3273 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3273 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3273 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3273 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3273 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3273 );
				float FUNC_Turbulence2274_g3273 = ( sin( ( ( VAR_RandomTime2244_g3273 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3273 = _WIND_MODE2462_g3273;
				float m_Off2312_g3273 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3273 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3273 = _Global_Wind_Main_Pulse2302_g3273;
				float m_Local2312_g3273 = _LocalWindPulse;
				float localfloatswitch2312_g3273 = floatswitch2312_g3273( m_switch2312_g3273 , m_Off2312_g3273 , m_Global2312_g3273 , m_Local2312_g3273 );
				float VAR_WindPulse2421_g3273 = localfloatswitch2312_g3273;
				float FUNC_Angle2470_g3273 = ( VAR_WindStrength2400_g3273 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3273 * 2.0 ) + FUNC_Turbulence2274_g3273 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3273 );
				float VAR_SinA2424_g3273 = sin( FUNC_Angle2470_g3273 );
				float VAR_CosA2362_g3273 = cos( FUNC_Angle2470_g3273 );
				int m_switch2456_g3273 = _WIND_MODE2462_g3273;
				float m_Off2456_g3273 = 1.0;
				float _Global_Wind_Main_Direction2350_g3273 = _Global_Wind_Main_Direction;
				float m_Global2456_g3273 = _Global_Wind_Main_Direction2350_g3273;
				float m_Local2456_g3273 = _LocalWindDirection;
				float localfloatswitch2456_g3273 = floatswitch2456_g3273( m_switch2456_g3273 , m_Off2456_g3273 , m_Global2456_g3273 , m_Local2456_g3273 );
				float _WindDirection2249_g3273 = localfloatswitch2456_g3273;
				float2 localDirectionalEquation2249_g3273 = DirectionalEquation( _WindDirection2249_g3273 );
				float2 break2469_g3273 = localDirectionalEquation2249_g3273;
				float VAR_xLerp2418_g3273 = break2469_g3273.x;
				float lerpResult2258_g3273 = lerp( break2265_g3273.x , ( ( break2265_g3273.y * VAR_SinA2424_g3273 ) + ( break2265_g3273.x * VAR_CosA2362_g3273 ) ) , VAR_xLerp2418_g3273);
				float3 break2340_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float3 break2233_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float VAR_zLerp2416_g3273 = break2469_g3273.y;
				float lerpResult2275_g3273 = lerp( break2233_g3273.z , ( ( break2233_g3273.y * VAR_SinA2424_g3273 ) + ( break2233_g3273.z * VAR_CosA2362_g3273 ) ) , VAR_zLerp2416_g3273);
				float3 appendResult2235_g3273 = (float3(lerpResult2258_g3273 , ( ( break2340_g3273.y * VAR_CosA2362_g3273 ) - ( break2340_g3273.z * VAR_SinA2424_g3273 ) ) , lerpResult2275_g3273));
				float3 VAR_VERTEXPOSITION2354_g3273 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3273 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3273 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3273 );
				float3 break2518_g3273 = FUNC_vertexPos2282_g3273;
				half FUNC_SinFunction2336_g3273 = sin( ( ( VAR_RandomTime2244_g3273 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + FUNC_Turbulence2274_g3273 + ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 2.0 ) ) );
				int m_switch2326_g3273 = _WIND_MODE2462_g3273;
				float m_Off2326_g3273 = 1.0;
				float _Global_Wind_Main_Turbulence2267_g3273 = _Global_Wind_Main_Turbulence;
				float m_Global2326_g3273 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence2267_g3273 );
				float m_Local2326_g3273 = _LocalWindTurbulence;
				float localfloatswitch2326_g3273 = floatswitch2326_g3273( m_switch2326_g3273 , m_Off2326_g3273 , m_Global2326_g3273 , m_Local2326_g3273 );
				float VAR_GlobalWindTurbulence2442_g3273 = localfloatswitch2326_g3273;
				float3 appendResult2480_g3273 = (float3(break2518_g3273.x , ( break2518_g3273.y + ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) ) , break2518_g3273.z));
				float3 OUT_Leafs_Standalone2396_g3273 = appendResult2480_g3273;
				float3 m_Leaf2439_g3273 = OUT_Leafs_Standalone2396_g3273;
				float3 OUT_Palm_Standalone2310_g3273 = ( ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) + FUNC_vertexPos2282_g3273 );
				float3 m_Palm2439_g3273 = OUT_Palm_Standalone2310_g3273;
				float3 break2486_g3273 = FUNC_vertexPos2282_g3273;
				float temp_output_2514_0_g3273 = ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) );
				float lerpResult2482_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_xLerp2418_g3273);
				float lerpResult2484_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_zLerp2416_g3273);
				float3 appendResult2489_g3273 = (float3(( break2486_g3273.x + lerpResult2482_g3273 ) , break2486_g3273.y , ( break2486_g3273.z + lerpResult2484_g3273 )));
				float3 OUT_Grass_Standalone2242_g3273 = appendResult2489_g3273;
				float3 m_Grass2439_g3273 = OUT_Grass_Standalone2242_g3273;
				float3 m_Simple2439_g3273 = FUNC_vertexPos2282_g3273;
				float clampResult2884_g3273 = clamp( ( VAR_WindStrength2400_g3273 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3273 = FUNC_vertexPos2282_g3273;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3273 = ase_worldPos;
				float temp_output_2690_0_g3273 = ( VAR_RandomTime2244_g3273 * 25.0 );
				float clampResult2691_g3273 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3273 = (float2(temp_output_2690_0_g3273 , ( temp_output_2690_0_g3273 / clampResult2691_g3273 )));
				float3 appendResult2706_g3273 = (float3(break2708_g3273.x , ( break2708_g3273.y + cos( ( ( ( break2718_g3273.x + break2718_g3273.y + break2718_g3273.z ) * 2.0 ) + appendResult2694_g3273 + FUNC_Angle2470_g3273 + VAR_GlobalWindTurbulence2442_g3273 ) ) ).x , break2708_g3273.z));
				float3 temp_output_2613_0_g3273 = ( clampResult2884_g3273 * appendResult2706_g3273 );
				float3 WIND_CLOTH_VERTEX997_g3273 = ( ( ( cos( temp_output_2613_0_g3273 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3273 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3273 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3273 = WIND_CLOTH_VERTEX997_g3273;
				float3 localfloat3switch2439_g3273 = float3switch2439_g3273( m_switch2439_g3273 , m_Leaf2439_g3273 , m_Palm2439_g3273 , m_Grass2439_g3273 , m_Simple2439_g3273 , m_Ivy2439_g3273 );
				float3 WIND_FINAL2753_g3273 = localfloat3switch2439_g3273;
				float3 m_Off2966_g3273 = WIND_FINAL2753_g3273;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( ase_worldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( ase_worldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_5 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( ase_worldNormal ) - temp_cast_5 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float3 lerpResult2917_g3273 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3273 , appendResult2916_g3273);
				float3 m_TopDown2966_g3273 = lerpResult2917_g3273;
				float3 m_BottomUp2966_g3273 = lerpResult2917_g3273;
				float3 m_SideWall2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical_Inverted2966_g3273 = lerpResult2917_g3273;
				float3 localfloat3switch2966_g3273 = float3switch2966_g3273( m_switch2966_g3273 , m_Off2966_g3273 , m_TopDown2966_g3273 , m_BottomUp2966_g3273 , m_SideWall2966_g3273 , m_Spherical2966_g3273 , m_Spherical_Inverted2966_g3273 );
				float3 m_Off2527_g3273 = localfloat3switch2966_g3273;
				float2 uv_WindMask_Map = v.texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3273 = ( localfloat3switch2966_g3273 * temp_output_2910_0_g3273 );
				float3 localfloat3switch2527_g3273 = float3switch2527_g3273( m_switch2527_g3273 , m_Off2527_g3273 , m_Active2527_g3273 );
				float3 WIND_MASK2748_g3273 = localfloat3switch2527_g3273;
				float3 m_Global2453_g3273 = WIND_MASK2748_g3273;
				float3 m_Local2453_g3273 = WIND_MASK2748_g3273;
				float3 localfloat3switch2453_g3273 = float3switch2453_g3273( m_switch2453_g3273 , m_Off2453_g3273 , m_Global2453_g3273 , m_Local2453_g3273 );
				float3 temp_output_756_0_g3275 = localfloat3switch2453_g3273;
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_texcoord7.zw = v.ase_texcoord3.xy;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_756_0_g3275;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN , half ase_vface : VFACE ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				int m_switch420_g3275 = _ColorMode;
				float3 temp_output_11_0_g3275 = (_Color).rgb;
				float2 appendResult77_g3275 = (float2(_TilingX , _TilingY));
				float2 appendResult82_g3275 = (float2(_OffsetX , _OffsetY));
				float2 texCoord73_g3275 = IN.ase_texcoord7.xy * appendResult77_g3275 + appendResult82_g3275;
				float2 appendResult559_g3275 = (float2(texCoord73_g3275.x , texCoord73_g3275.y));
				float4 tex2DNode57_g3275 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, appendResult559_g3275 );
				float3 temp_output_76_0_g3275 = ( temp_output_11_0_g3275 * (tex2DNode57_g3275).rgb * _Brightness );
				float3 ALBEDO_01424_g3275 = temp_output_76_0_g3275;
				float3 m_Off420_g3275 = ALBEDO_01424_g3275;
				int _COLOR_MODE835_g3275 = _ColorMode;
				int m_switch836_g3275 = _COLOR_MODE835_g3275;
				float m_Off836_g3275 = 0.0;
				float m_ColorShiftVertexNormal836_g3275 = ( IN.ase_normal.y - 0.5 );
				float m_ColorShiftVertexColor836_g3275 = ( IN.ase_color.g - 0.5 );
				float localfloatswitch836_g3275 = floatswitch836_g3275( m_switch836_g3275 , m_Off836_g3275 , m_ColorShiftVertexNormal836_g3275 , m_ColorShiftVertexColor836_g3275 );
				float3 hsvTorgb823_g3275 = RGBToHSV( ALBEDO_01424_g3275 );
				float3 hsvTorgb816_g3275 = HSVToRGB( float3(( ( localfloatswitch836_g3275 * _ColorShift_ShiftVariation ) + _ColorShift_RGBHue + hsvTorgb823_g3275 ).x,( hsvTorgb823_g3275.y * _ColorShift_RGBSaturation ),( hsvTorgb823_g3275.z * _ColorShift_RGBBrightness )) );
				float3 m_ColorShiftVertexNormal420_g3275 = hsvTorgb816_g3275;
				float3 m_ColorShiftVertexColor420_g3275 = hsvTorgb816_g3275;
				float3 localfloat3switch420_g3275 = float3switch420_g3275( m_switch420_g3275 , m_Off420_g3275 , m_ColorShiftVertexNormal420_g3275 , m_ColorShiftVertexColor420_g3275 );
				float3 COLOR_SHIFTING426_g3275 = localfloat3switch420_g3275;
				int _MASK_MODE_TEXTURE2980_g3273 = _WindMask_Texture;
				int m_switch2982_g3273 = _MASK_MODE_TEXTURE2980_g3273;
				float4 _Vector3 = float4(0,0,0,0);
				float4 m_Off2982_g3273 = _Vector3;
				int m_switch2972_g3273 = (int)_WindMask_TextureVisualize;
				float4 m_Off2972_g3273 = _Vector3;
				float4 color2979_g3273 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
				float4 _Visualize_Color2992_g3273 = color2979_g3273;
				float2 uv_WindMask_Map = IN.ase_texcoord7.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float4 appendResult2974_g3273 = (float4(temp_output_2910_0_g3273 , temp_output_2910_0_g3273.x));
				float4 lerpResult2967_g3273 = lerp( _Visualize_Color2992_g3273 , float4( 0,0,0,0 ) , appendResult2974_g3273);
				float4 m_Active2972_g3273 = lerpResult2967_g3273;
				float4 localfloat4switch2972_g3273 = float4switch2972_g3273( m_switch2972_g3273 , m_Off2972_g3273 , m_Active2972_g3273 );
				float4 m_Active2982_g3273 = localfloat4switch2972_g3273;
				float4 localfloat4switch2982_g3273 = float4switch2982_g3273( m_switch2982_g3273 , m_Off2982_g3273 , m_Active2982_g3273 );
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2991_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				float4 m_Off2991_g3273 = _Vector3;
				int m_switch2986_g3273 = (int)_WindMask_ProceduralVisualize;
				float4 m_Off2986_g3273 = _Vector3;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( WorldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( WorldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_7 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( WorldNormal ) - temp_cast_7 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float4 appendResult2977_g3273 = (float4(appendResult2916_g3273 , appendResult2916_g3273.x));
				float4 lerpResult2976_g3273 = lerp( _Visualize_Color2992_g3273 , float4( 0,0,0,0 ) , appendResult2977_g3273);
				float4 m_Active2986_g3273 = lerpResult2976_g3273;
				float4 localfloat4switch2986_g3273 = float4switch2986_g3273( m_switch2986_g3273 , m_Off2986_g3273 , m_Active2986_g3273 );
				float4 m_TopDown2991_g3273 = localfloat4switch2986_g3273;
				float4 m_BottomUp2991_g3273 = localfloat4switch2986_g3273;
				float4 m_SideWall2991_g3273 = localfloat4switch2986_g3273;
				float4 m_Spherical2991_g3273 = localfloat4switch2986_g3273;
				float4 m_Spherical_Inverted2991_g3273 = localfloat4switch2986_g3273;
				float4 localfloat4switch2991_g3273 = float4switch2991_g3273( m_switch2991_g3273 , m_Off2991_g3273 , m_TopDown2991_g3273 , m_BottomUp2991_g3273 , m_SideWall2991_g3273 , m_Spherical2991_g3273 , m_Spherical_Inverted2991_g3273 );
				
				int m_switch9_g3415 = _NormalMode;
				float3 unpack34_g3275 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, appendResult559_g3275 ), _NormalStrength );
				unpack34_g3275.z = lerp( 1, unpack34_g3275.z, saturate(_NormalStrength) );
				float3 NORMAL_IN17_g3415 = unpack34_g3275;
				float3 m_Default9_g3415 = NORMAL_IN17_g3415;
				float3 m_Flip9_g3415 = ( NORMAL_IN17_g3415 * ase_vface );
				float3 break2_g3415 = NORMAL_IN17_g3415;
				float3 appendResult3_g3415 = (float3(break2_g3415.x , break2_g3415.y , ( break2_g3415.z * ase_vface )));
				float3 m_Mirror9_g3415 = appendResult3_g3415;
				float3 localfloat3switch9_g3415 = float3switch9_g3415( m_switch9_g3415 , m_Default9_g3415 , m_Flip9_g3415 , m_Mirror9_g3415 );
				float3 temp_output_530_11_g3275 = localfloat3switch9_g3415;
				float3 WorldPosition458_g3275 = WorldPosition;
				float3 localAdditionalLightsFlat458_g3275 = AdditionalLightsFlat( WorldPosition458_g3275 );
				float3 ADDITIONAL_LIGHT471_g3275 = localAdditionalLightsFlat458_g3275;
				float3 temp_output_687_0_g3275 = ( temp_output_530_11_g3275 + ADDITIONAL_LIGHT471_g3275 );
				
				float2 CUSTOM_UV1263_g3275 = appendResult559_g3275;
				
				int m_switch845_g3275 = _SmoothnessType;
				float4 tex2DNode28_g3275 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3275 );
				float4 m_Smoothness845_g3275 = tex2DNode28_g3275;
				float4 m_Roughness845_g3275 = ( 1.0 - tex2DNode28_g3275 );
				float4 localfloat4switch845_g3275 = float4switch845_g3275( m_switch845_g3275 , m_Smoothness845_g3275 , m_Roughness845_g3275 );
				
				float4 color749_g3275 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_17 = (IN.ase_color.a).xxxx;
				float4 lerpResult39_g3275 = lerp( SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3275 ) , temp_cast_17 , (float)_OcclusionSourceMode);
				float4 lerpResult29_g3275 = lerp( color749_g3275 , lerpResult39_g3275 , _OcclusionStrengthAO);
				
				float ALBEDO_A716_g3275 = tex2DNode57_g3275.a;
				clip( ALBEDO_A716_g3275 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_741_0_g3275 = saturate( ( ( ALBEDO_A716_g3275 / max( fwidth( ALBEDO_A716_g3275 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch599_g3275 = _GlancingClipMode;
				float m_Off599_g3275 = 0.0;
				float3 normalizeResult583_g3275 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult587_g3275 = dot( WorldViewDirection , normalizeResult583_g3275 );
				float temp_output_585_0_g3275 = ( 1.0 - abs( dotResult587_g3275 ) );
				float m_Active599_g3275 = ( temp_output_585_0_g3275 * 1.45 );
				float localfloatswitch599_g3275 = floatswitch599_g3275( m_switch599_g3275 , m_Off599_g3275 , m_Active599_g3275 );
				
				int m_switch537_g3275 = _TranslucencyCullForward;
				int TRANSLUCENCY_MODE523_g3275 = _EnableTranslucency;
				int m_switch332_g3275 = TRANSLUCENCY_MODE523_g3275;
				float4 m_Off332_g3275 = float4( 0,0,0,0 );
				int m_switch639_g3275 = _MapInverted;
				float4 color726_g3275 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 COLOR_0000727_g3275 = color726_g3275;
				float4 tex2DNode322_g3275 = SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3275 );
				float4 lerpResult326_g3275 = lerp( COLOR_0000727_g3275 , tex2DNode322_g3275 , _TranslucencyThickness);
				float4 m_Default639_g3275 = lerpResult326_g3275;
				float temp_output_620_0_g3275 = ( 0.0 - 1.0 );
				float temp_output_623_0_g3275 = ( tex2DNode322_g3275.r - 1.0 );
				float lerpResult631_g3275 = lerp( ( temp_output_620_0_g3275 / temp_output_623_0_g3275 ) , ( temp_output_623_0_g3275 / temp_output_620_0_g3275 ) , ( 0.7 + _TranslucencyThickness ));
				float4 temp_cast_21 = (saturate( lerpResult631_g3275 )).xxxx;
				float4 m_Inverted639_g3275 = temp_cast_21;
				float4 localfloat4switch639_g3275 = float4switch( m_switch639_g3275 , m_Default639_g3275 , m_Inverted639_g3275 );
				float lerpResult334_g3275 = lerp( 0.0 , ( 5.0 - IN.ase_texcoord7.zw.x ) , _TranslucencyThickness);
				float4 temp_cast_22 = (lerpResult334_g3275).xxxx;
				float4 lerpResult369_g3275 = lerp( localfloat4switch639_g3275 , temp_cast_22 , (float)_TranslucencySource);
				float3 temp_output_440_0_g3275 = (_MainLightColor).rgb;
				float3 GLOBAL_LIGHT_COLOR373_g3275 = temp_output_440_0_g3275;
				float4 m_Active332_g3275 = ( ( _TransmissionTint * _TransmissionTint.a * lerpResult369_g3275 ) * float4( GLOBAL_LIGHT_COLOR373_g3275 , 0.0 ) );
				float4 localfloat4switch332_g3275 = float4switch332_g3275( m_switch332_g3275 , m_Off332_g3275 , m_Active332_g3275 );
				float4 m_Default537_g3275 = localfloat4switch332_g3275;
				float4 switchResult535_g3275 = (((ase_vface>0)?(_Vector3):(localfloat4switch332_g3275)));
				float4 m_CullFrontFace537_g3275 = switchResult535_g3275;
				float4 switchResult541_g3275 = (((ase_vface>0)?(localfloat4switch332_g3275):(_Vector3)));
				float4 m_CullBackFace537_g3275 = switchResult541_g3275;
				float4 localfloat4switch537_g3275 = float4switch537_g3275( m_switch537_g3275 , m_Default537_g3275 , m_CullFrontFace537_g3275 , m_CullBackFace537_g3275 );
				
				int m_switch539_g3275 = _TranslucencyCullForward;
				int m_switch324_g3275 = TRANSLUCENCY_MODE523_g3275;
				float4 m_Off324_g3275 = float4( 0,0,0,0 );
				float4 m_Active324_g3275 = ( ( _TranslucencyTint * _TranslucencyTint.a * lerpResult369_g3275 ) * float4( GLOBAL_LIGHT_COLOR373_g3275 , 0.0 ) );
				float4 localfloat4switch324_g3275 = float4switch324_g3275( m_switch324_g3275 , m_Off324_g3275 , m_Active324_g3275 );
				float4 m_Default539_g3275 = localfloat4switch324_g3275;
				float4 switchResult531_g3275 = (((ase_vface>0)?(_Vector3):(localfloat4switch324_g3275)));
				float4 m_CullFrontFace539_g3275 = switchResult531_g3275;
				float4 switchResult540_g3275 = (((ase_vface>0)?(localfloat4switch324_g3275):(_Vector3)));
				float4 m_CullBackFace539_g3275 = switchResult540_g3275;
				float4 localfloat4switch539_g3275 = float4switch539_g3275( m_switch539_g3275 , m_Default539_g3275 , m_CullFrontFace539_g3275 , m_CullBackFace539_g3275 );
				
				float3 Albedo = ( float4( COLOR_SHIFTING426_g3275 , 0.0 ) + ( localfloat4switch2982_g3273 + localfloat4switch2991_g3273 ) ).xyz;
				float3 Normal = temp_output_687_0_g3275;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MetallicStrength * SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, CUSTOM_UV1263_g3275 ) ).r;
				float Smoothness = ( _SmoothnessStrength * localfloat4switch845_g3275 ).x;
				float Occlusion = lerpResult29_g3275.r;
				float Alpha = temp_output_741_0_g3275;
				float AlphaClipThreshold = localfloatswitch599_g3275;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = localfloat4switch537_g3275.xyz;
				float3 Translucency = localfloat4switch539_g3275.xyz;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _URP_TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _URP_TransmissionShadow;
					float normal = _URP_TranslucencyNormalDistortion;
					float scattering = _URP_TranslucencyScattering;
					float direct = _URP_TranslucencyDirect;
					float ambient = _URP_TranslucencyAmbient;
					float strength = _URP_TranslucencyStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _TransmissionTint;
			float4 _WindMask_Map_ST;
			float4 _TranslucencyTint;
			float _URP_TransmissionShadow;
			half _Brightness;
			float _ColorShift_ShiftVariation;
			float _ColorShift_RGBHue;
			float _ColorShift_RGBSaturation;
			float _ColorShift_RGBBrightness;
			float _WindMask_TextureVisualize;
			float _WindMask_ProceduralVisualize;
			int _NormalMode;
			half _NormalStrength;
			float _MetallicStrength;
			float _OffsetY;
			float _SmoothnessStrength;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
			int _TranslucencyCullForward;
			int _EnableTranslucency;
			float _URP_TranslucencyScattering;
			int _MapInverted;
			float _TranslucencyThickness;
			int _SmoothnessType;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyShadow;
			int _ColorMask;
			int _CullMode;
			int _ZWriteMode;
			float _AlphatoCoverage;
			int _WindMode;
			int _WindMask_Texture;
			int _WindMask_Procedural;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			float _WindMask_Offset1;
			float _WindMask_Procedural_Intensity;
			float _URP_TranslucencyNormalDistortion;
			float _WindMask_Texture_Intensity;
			int _ColorMode;
			int _TranslucencySource;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyDirect;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2458_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2468_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2312_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2456_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2326_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float3 float3switch2439_g3273( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float floatswitch2655_g3273( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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
			
			float3 float3switch2966_g3273( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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
			
			float3 float3switch2527_g3273( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3273( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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
			
			float floatswitch599_g3275( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				int m_switch2453_g3273 = _WindMode;
				float3 m_Off2453_g3273 = float3(0,0,0);
				int m_switch2527_g3273 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2966_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				int m_switch2439_g3273 = _WindType;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3273 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				int _WIND_MODE2462_g3273 = _WindMode;
				int m_switch2458_g3273 = _WIND_MODE2462_g3273;
				float m_Off2458_g3273 = 1.0;
				float _Global_Wind_Main_Intensity2403_g3273 = _Global_Wind_Main_Intensity;
				float m_Global2458_g3273 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3273 );
				float m_Local2458_g3273 = _LocalWindStrength;
				float localfloatswitch2458_g3273 = floatswitch2458_g3273( m_switch2458_g3273 , m_Off2458_g3273 , m_Global2458_g3273 , m_Local2458_g3273 );
				float VAR_WindStrength2400_g3273 = localfloatswitch2458_g3273;
				int m_switch2468_g3273 = _WIND_MODE2462_g3273;
				float m_Off2468_g3273 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3273 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3273 = _Global_Wind_Main_RandomOffset2378_g3273;
				float m_Local2468_g3273 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3273 = floatswitch2468_g3273( m_switch2468_g3273 , m_Off2468_g3273 , m_Global2468_g3273 , m_Local2468_g3273 );
				float VAR_WindOffset2419_g3273 = localfloatswitch2468_g3273;
				float4 transform2423_g3273 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3273 = (float2(transform2423_g3273.x , transform2423_g3273.z));
				float dotResult2341_g3273 = dot( appendResult2307_g3273 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3273 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3273 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3273 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3273 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3273 );
				float FUNC_Turbulence2274_g3273 = ( sin( ( ( VAR_RandomTime2244_g3273 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3273 = _WIND_MODE2462_g3273;
				float m_Off2312_g3273 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3273 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3273 = _Global_Wind_Main_Pulse2302_g3273;
				float m_Local2312_g3273 = _LocalWindPulse;
				float localfloatswitch2312_g3273 = floatswitch2312_g3273( m_switch2312_g3273 , m_Off2312_g3273 , m_Global2312_g3273 , m_Local2312_g3273 );
				float VAR_WindPulse2421_g3273 = localfloatswitch2312_g3273;
				float FUNC_Angle2470_g3273 = ( VAR_WindStrength2400_g3273 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3273 * 2.0 ) + FUNC_Turbulence2274_g3273 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3273 );
				float VAR_SinA2424_g3273 = sin( FUNC_Angle2470_g3273 );
				float VAR_CosA2362_g3273 = cos( FUNC_Angle2470_g3273 );
				int m_switch2456_g3273 = _WIND_MODE2462_g3273;
				float m_Off2456_g3273 = 1.0;
				float _Global_Wind_Main_Direction2350_g3273 = _Global_Wind_Main_Direction;
				float m_Global2456_g3273 = _Global_Wind_Main_Direction2350_g3273;
				float m_Local2456_g3273 = _LocalWindDirection;
				float localfloatswitch2456_g3273 = floatswitch2456_g3273( m_switch2456_g3273 , m_Off2456_g3273 , m_Global2456_g3273 , m_Local2456_g3273 );
				float _WindDirection2249_g3273 = localfloatswitch2456_g3273;
				float2 localDirectionalEquation2249_g3273 = DirectionalEquation( _WindDirection2249_g3273 );
				float2 break2469_g3273 = localDirectionalEquation2249_g3273;
				float VAR_xLerp2418_g3273 = break2469_g3273.x;
				float lerpResult2258_g3273 = lerp( break2265_g3273.x , ( ( break2265_g3273.y * VAR_SinA2424_g3273 ) + ( break2265_g3273.x * VAR_CosA2362_g3273 ) ) , VAR_xLerp2418_g3273);
				float3 break2340_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float3 break2233_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float VAR_zLerp2416_g3273 = break2469_g3273.y;
				float lerpResult2275_g3273 = lerp( break2233_g3273.z , ( ( break2233_g3273.y * VAR_SinA2424_g3273 ) + ( break2233_g3273.z * VAR_CosA2362_g3273 ) ) , VAR_zLerp2416_g3273);
				float3 appendResult2235_g3273 = (float3(lerpResult2258_g3273 , ( ( break2340_g3273.y * VAR_CosA2362_g3273 ) - ( break2340_g3273.z * VAR_SinA2424_g3273 ) ) , lerpResult2275_g3273));
				float3 VAR_VERTEXPOSITION2354_g3273 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3273 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3273 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3273 );
				float3 break2518_g3273 = FUNC_vertexPos2282_g3273;
				half FUNC_SinFunction2336_g3273 = sin( ( ( VAR_RandomTime2244_g3273 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + FUNC_Turbulence2274_g3273 + ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 2.0 ) ) );
				int m_switch2326_g3273 = _WIND_MODE2462_g3273;
				float m_Off2326_g3273 = 1.0;
				float _Global_Wind_Main_Turbulence2267_g3273 = _Global_Wind_Main_Turbulence;
				float m_Global2326_g3273 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence2267_g3273 );
				float m_Local2326_g3273 = _LocalWindTurbulence;
				float localfloatswitch2326_g3273 = floatswitch2326_g3273( m_switch2326_g3273 , m_Off2326_g3273 , m_Global2326_g3273 , m_Local2326_g3273 );
				float VAR_GlobalWindTurbulence2442_g3273 = localfloatswitch2326_g3273;
				float3 appendResult2480_g3273 = (float3(break2518_g3273.x , ( break2518_g3273.y + ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) ) , break2518_g3273.z));
				float3 OUT_Leafs_Standalone2396_g3273 = appendResult2480_g3273;
				float3 m_Leaf2439_g3273 = OUT_Leafs_Standalone2396_g3273;
				float3 OUT_Palm_Standalone2310_g3273 = ( ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) + FUNC_vertexPos2282_g3273 );
				float3 m_Palm2439_g3273 = OUT_Palm_Standalone2310_g3273;
				float3 break2486_g3273 = FUNC_vertexPos2282_g3273;
				float temp_output_2514_0_g3273 = ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) );
				float lerpResult2482_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_xLerp2418_g3273);
				float lerpResult2484_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_zLerp2416_g3273);
				float3 appendResult2489_g3273 = (float3(( break2486_g3273.x + lerpResult2482_g3273 ) , break2486_g3273.y , ( break2486_g3273.z + lerpResult2484_g3273 )));
				float3 OUT_Grass_Standalone2242_g3273 = appendResult2489_g3273;
				float3 m_Grass2439_g3273 = OUT_Grass_Standalone2242_g3273;
				float3 m_Simple2439_g3273 = FUNC_vertexPos2282_g3273;
				float clampResult2884_g3273 = clamp( ( VAR_WindStrength2400_g3273 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3273 = FUNC_vertexPos2282_g3273;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3273 = ase_worldPos;
				float temp_output_2690_0_g3273 = ( VAR_RandomTime2244_g3273 * 25.0 );
				float clampResult2691_g3273 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3273 = (float2(temp_output_2690_0_g3273 , ( temp_output_2690_0_g3273 / clampResult2691_g3273 )));
				float3 appendResult2706_g3273 = (float3(break2708_g3273.x , ( break2708_g3273.y + cos( ( ( ( break2718_g3273.x + break2718_g3273.y + break2718_g3273.z ) * 2.0 ) + appendResult2694_g3273 + FUNC_Angle2470_g3273 + VAR_GlobalWindTurbulence2442_g3273 ) ) ).x , break2708_g3273.z));
				float3 temp_output_2613_0_g3273 = ( clampResult2884_g3273 * appendResult2706_g3273 );
				float3 WIND_CLOTH_VERTEX997_g3273 = ( ( ( cos( temp_output_2613_0_g3273 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3273 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3273 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3273 = WIND_CLOTH_VERTEX997_g3273;
				float3 localfloat3switch2439_g3273 = float3switch2439_g3273( m_switch2439_g3273 , m_Leaf2439_g3273 , m_Palm2439_g3273 , m_Grass2439_g3273 , m_Simple2439_g3273 , m_Ivy2439_g3273 );
				float3 WIND_FINAL2753_g3273 = localfloat3switch2439_g3273;
				float3 m_Off2966_g3273 = WIND_FINAL2753_g3273;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( ase_worldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( ase_worldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_5 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( ase_worldNormal ) - temp_cast_5 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float3 lerpResult2917_g3273 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3273 , appendResult2916_g3273);
				float3 m_TopDown2966_g3273 = lerpResult2917_g3273;
				float3 m_BottomUp2966_g3273 = lerpResult2917_g3273;
				float3 m_SideWall2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical_Inverted2966_g3273 = lerpResult2917_g3273;
				float3 localfloat3switch2966_g3273 = float3switch2966_g3273( m_switch2966_g3273 , m_Off2966_g3273 , m_TopDown2966_g3273 , m_BottomUp2966_g3273 , m_SideWall2966_g3273 , m_Spherical2966_g3273 , m_Spherical_Inverted2966_g3273 );
				float3 m_Off2527_g3273 = localfloat3switch2966_g3273;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3273 = ( localfloat3switch2966_g3273 * temp_output_2910_0_g3273 );
				float3 localfloat3switch2527_g3273 = float3switch2527_g3273( m_switch2527_g3273 , m_Off2527_g3273 , m_Active2527_g3273 );
				float3 WIND_MASK2748_g3273 = localfloat3switch2527_g3273;
				float3 m_Global2453_g3273 = WIND_MASK2748_g3273;
				float3 m_Local2453_g3273 = WIND_MASK2748_g3273;
				float3 localfloat3switch2453_g3273 = float3switch2453_g3273( m_switch2453_g3273 , m_Off2453_g3273 , m_Global2453_g3273 , m_Local2453_g3273 );
				float3 temp_output_756_0_g3275 = localfloat3switch2453_g3273;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_756_0_g3275;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult77_g3275 = (float2(_TilingX , _TilingY));
				float2 appendResult82_g3275 = (float2(_OffsetX , _OffsetY));
				float2 texCoord73_g3275 = IN.ase_texcoord2.xy * appendResult77_g3275 + appendResult82_g3275;
				float2 appendResult559_g3275 = (float2(texCoord73_g3275.x , texCoord73_g3275.y));
				float4 tex2DNode57_g3275 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, appendResult559_g3275 );
				float ALBEDO_A716_g3275 = tex2DNode57_g3275.a;
				clip( ALBEDO_A716_g3275 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_741_0_g3275 = saturate( ( ( ALBEDO_A716_g3275 / max( fwidth( ALBEDO_A716_g3275 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch599_g3275 = _GlancingClipMode;
				float m_Off599_g3275 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult583_g3275 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult587_g3275 = dot( ase_worldViewDir , normalizeResult583_g3275 );
				float temp_output_585_0_g3275 = ( 1.0 - abs( dotResult587_g3275 ) );
				float m_Active599_g3275 = ( temp_output_585_0_g3275 * 1.45 );
				float localfloatswitch599_g3275 = floatswitch599_g3275( m_switch599_g3275 , m_Off599_g3275 , m_Active599_g3275 );
				
				float Alpha = temp_output_741_0_g3275;
				float AlphaClipThreshold = localfloatswitch599_g3275;
				float AlphaClipThresholdShadow = _AlphaCutoffBiasShadow;

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _TransmissionTint;
			float4 _WindMask_Map_ST;
			float4 _TranslucencyTint;
			float _URP_TransmissionShadow;
			half _Brightness;
			float _ColorShift_ShiftVariation;
			float _ColorShift_RGBHue;
			float _ColorShift_RGBSaturation;
			float _ColorShift_RGBBrightness;
			float _WindMask_TextureVisualize;
			float _WindMask_ProceduralVisualize;
			int _NormalMode;
			half _NormalStrength;
			float _MetallicStrength;
			float _OffsetY;
			float _SmoothnessStrength;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
			int _TranslucencyCullForward;
			int _EnableTranslucency;
			float _URP_TranslucencyScattering;
			int _MapInverted;
			float _TranslucencyThickness;
			int _SmoothnessType;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyShadow;
			int _ColorMask;
			int _CullMode;
			int _ZWriteMode;
			float _AlphatoCoverage;
			int _WindMode;
			int _WindMask_Texture;
			int _WindMask_Procedural;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			float _WindMask_Offset1;
			float _WindMask_Procedural_Intensity;
			float _URP_TranslucencyNormalDistortion;
			float _WindMask_Texture_Intensity;
			int _ColorMode;
			int _TranslucencySource;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyDirect;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2458_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2468_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2312_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2456_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2326_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float3 float3switch2439_g3273( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float floatswitch2655_g3273( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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
			
			float3 float3switch2966_g3273( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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
			
			float3 float3switch2527_g3273( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3273( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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
			
			float floatswitch599_g3275( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch2453_g3273 = _WindMode;
				float3 m_Off2453_g3273 = float3(0,0,0);
				int m_switch2527_g3273 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2966_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				int m_switch2439_g3273 = _WindType;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3273 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				int _WIND_MODE2462_g3273 = _WindMode;
				int m_switch2458_g3273 = _WIND_MODE2462_g3273;
				float m_Off2458_g3273 = 1.0;
				float _Global_Wind_Main_Intensity2403_g3273 = _Global_Wind_Main_Intensity;
				float m_Global2458_g3273 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3273 );
				float m_Local2458_g3273 = _LocalWindStrength;
				float localfloatswitch2458_g3273 = floatswitch2458_g3273( m_switch2458_g3273 , m_Off2458_g3273 , m_Global2458_g3273 , m_Local2458_g3273 );
				float VAR_WindStrength2400_g3273 = localfloatswitch2458_g3273;
				int m_switch2468_g3273 = _WIND_MODE2462_g3273;
				float m_Off2468_g3273 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3273 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3273 = _Global_Wind_Main_RandomOffset2378_g3273;
				float m_Local2468_g3273 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3273 = floatswitch2468_g3273( m_switch2468_g3273 , m_Off2468_g3273 , m_Global2468_g3273 , m_Local2468_g3273 );
				float VAR_WindOffset2419_g3273 = localfloatswitch2468_g3273;
				float4 transform2423_g3273 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3273 = (float2(transform2423_g3273.x , transform2423_g3273.z));
				float dotResult2341_g3273 = dot( appendResult2307_g3273 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3273 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3273 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3273 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3273 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3273 );
				float FUNC_Turbulence2274_g3273 = ( sin( ( ( VAR_RandomTime2244_g3273 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3273 = _WIND_MODE2462_g3273;
				float m_Off2312_g3273 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3273 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3273 = _Global_Wind_Main_Pulse2302_g3273;
				float m_Local2312_g3273 = _LocalWindPulse;
				float localfloatswitch2312_g3273 = floatswitch2312_g3273( m_switch2312_g3273 , m_Off2312_g3273 , m_Global2312_g3273 , m_Local2312_g3273 );
				float VAR_WindPulse2421_g3273 = localfloatswitch2312_g3273;
				float FUNC_Angle2470_g3273 = ( VAR_WindStrength2400_g3273 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3273 * 2.0 ) + FUNC_Turbulence2274_g3273 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3273 );
				float VAR_SinA2424_g3273 = sin( FUNC_Angle2470_g3273 );
				float VAR_CosA2362_g3273 = cos( FUNC_Angle2470_g3273 );
				int m_switch2456_g3273 = _WIND_MODE2462_g3273;
				float m_Off2456_g3273 = 1.0;
				float _Global_Wind_Main_Direction2350_g3273 = _Global_Wind_Main_Direction;
				float m_Global2456_g3273 = _Global_Wind_Main_Direction2350_g3273;
				float m_Local2456_g3273 = _LocalWindDirection;
				float localfloatswitch2456_g3273 = floatswitch2456_g3273( m_switch2456_g3273 , m_Off2456_g3273 , m_Global2456_g3273 , m_Local2456_g3273 );
				float _WindDirection2249_g3273 = localfloatswitch2456_g3273;
				float2 localDirectionalEquation2249_g3273 = DirectionalEquation( _WindDirection2249_g3273 );
				float2 break2469_g3273 = localDirectionalEquation2249_g3273;
				float VAR_xLerp2418_g3273 = break2469_g3273.x;
				float lerpResult2258_g3273 = lerp( break2265_g3273.x , ( ( break2265_g3273.y * VAR_SinA2424_g3273 ) + ( break2265_g3273.x * VAR_CosA2362_g3273 ) ) , VAR_xLerp2418_g3273);
				float3 break2340_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float3 break2233_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float VAR_zLerp2416_g3273 = break2469_g3273.y;
				float lerpResult2275_g3273 = lerp( break2233_g3273.z , ( ( break2233_g3273.y * VAR_SinA2424_g3273 ) + ( break2233_g3273.z * VAR_CosA2362_g3273 ) ) , VAR_zLerp2416_g3273);
				float3 appendResult2235_g3273 = (float3(lerpResult2258_g3273 , ( ( break2340_g3273.y * VAR_CosA2362_g3273 ) - ( break2340_g3273.z * VAR_SinA2424_g3273 ) ) , lerpResult2275_g3273));
				float3 VAR_VERTEXPOSITION2354_g3273 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3273 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3273 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3273 );
				float3 break2518_g3273 = FUNC_vertexPos2282_g3273;
				half FUNC_SinFunction2336_g3273 = sin( ( ( VAR_RandomTime2244_g3273 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + FUNC_Turbulence2274_g3273 + ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 2.0 ) ) );
				int m_switch2326_g3273 = _WIND_MODE2462_g3273;
				float m_Off2326_g3273 = 1.0;
				float _Global_Wind_Main_Turbulence2267_g3273 = _Global_Wind_Main_Turbulence;
				float m_Global2326_g3273 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence2267_g3273 );
				float m_Local2326_g3273 = _LocalWindTurbulence;
				float localfloatswitch2326_g3273 = floatswitch2326_g3273( m_switch2326_g3273 , m_Off2326_g3273 , m_Global2326_g3273 , m_Local2326_g3273 );
				float VAR_GlobalWindTurbulence2442_g3273 = localfloatswitch2326_g3273;
				float3 appendResult2480_g3273 = (float3(break2518_g3273.x , ( break2518_g3273.y + ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) ) , break2518_g3273.z));
				float3 OUT_Leafs_Standalone2396_g3273 = appendResult2480_g3273;
				float3 m_Leaf2439_g3273 = OUT_Leafs_Standalone2396_g3273;
				float3 OUT_Palm_Standalone2310_g3273 = ( ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) + FUNC_vertexPos2282_g3273 );
				float3 m_Palm2439_g3273 = OUT_Palm_Standalone2310_g3273;
				float3 break2486_g3273 = FUNC_vertexPos2282_g3273;
				float temp_output_2514_0_g3273 = ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) );
				float lerpResult2482_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_xLerp2418_g3273);
				float lerpResult2484_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_zLerp2416_g3273);
				float3 appendResult2489_g3273 = (float3(( break2486_g3273.x + lerpResult2482_g3273 ) , break2486_g3273.y , ( break2486_g3273.z + lerpResult2484_g3273 )));
				float3 OUT_Grass_Standalone2242_g3273 = appendResult2489_g3273;
				float3 m_Grass2439_g3273 = OUT_Grass_Standalone2242_g3273;
				float3 m_Simple2439_g3273 = FUNC_vertexPos2282_g3273;
				float clampResult2884_g3273 = clamp( ( VAR_WindStrength2400_g3273 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3273 = FUNC_vertexPos2282_g3273;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3273 = ase_worldPos;
				float temp_output_2690_0_g3273 = ( VAR_RandomTime2244_g3273 * 25.0 );
				float clampResult2691_g3273 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3273 = (float2(temp_output_2690_0_g3273 , ( temp_output_2690_0_g3273 / clampResult2691_g3273 )));
				float3 appendResult2706_g3273 = (float3(break2708_g3273.x , ( break2708_g3273.y + cos( ( ( ( break2718_g3273.x + break2718_g3273.y + break2718_g3273.z ) * 2.0 ) + appendResult2694_g3273 + FUNC_Angle2470_g3273 + VAR_GlobalWindTurbulence2442_g3273 ) ) ).x , break2708_g3273.z));
				float3 temp_output_2613_0_g3273 = ( clampResult2884_g3273 * appendResult2706_g3273 );
				float3 WIND_CLOTH_VERTEX997_g3273 = ( ( ( cos( temp_output_2613_0_g3273 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3273 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3273 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3273 = WIND_CLOTH_VERTEX997_g3273;
				float3 localfloat3switch2439_g3273 = float3switch2439_g3273( m_switch2439_g3273 , m_Leaf2439_g3273 , m_Palm2439_g3273 , m_Grass2439_g3273 , m_Simple2439_g3273 , m_Ivy2439_g3273 );
				float3 WIND_FINAL2753_g3273 = localfloat3switch2439_g3273;
				float3 m_Off2966_g3273 = WIND_FINAL2753_g3273;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( ase_worldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( ase_worldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_5 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( ase_worldNormal ) - temp_cast_5 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float3 lerpResult2917_g3273 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3273 , appendResult2916_g3273);
				float3 m_TopDown2966_g3273 = lerpResult2917_g3273;
				float3 m_BottomUp2966_g3273 = lerpResult2917_g3273;
				float3 m_SideWall2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical_Inverted2966_g3273 = lerpResult2917_g3273;
				float3 localfloat3switch2966_g3273 = float3switch2966_g3273( m_switch2966_g3273 , m_Off2966_g3273 , m_TopDown2966_g3273 , m_BottomUp2966_g3273 , m_SideWall2966_g3273 , m_Spherical2966_g3273 , m_Spherical_Inverted2966_g3273 );
				float3 m_Off2527_g3273 = localfloat3switch2966_g3273;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3273 = ( localfloat3switch2966_g3273 * temp_output_2910_0_g3273 );
				float3 localfloat3switch2527_g3273 = float3switch2527_g3273( m_switch2527_g3273 , m_Off2527_g3273 , m_Active2527_g3273 );
				float3 WIND_MASK2748_g3273 = localfloat3switch2527_g3273;
				float3 m_Global2453_g3273 = WIND_MASK2748_g3273;
				float3 m_Local2453_g3273 = WIND_MASK2748_g3273;
				float3 localfloat3switch2453_g3273 = float3switch2453_g3273( m_switch2453_g3273 , m_Off2453_g3273 , m_Global2453_g3273 , m_Local2453_g3273 );
				float3 temp_output_756_0_g3275 = localfloat3switch2453_g3273;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_756_0_g3275;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 appendResult77_g3275 = (float2(_TilingX , _TilingY));
				float2 appendResult82_g3275 = (float2(_OffsetX , _OffsetY));
				float2 texCoord73_g3275 = IN.ase_texcoord2.xy * appendResult77_g3275 + appendResult82_g3275;
				float2 appendResult559_g3275 = (float2(texCoord73_g3275.x , texCoord73_g3275.y));
				float4 tex2DNode57_g3275 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, appendResult559_g3275 );
				float ALBEDO_A716_g3275 = tex2DNode57_g3275.a;
				clip( ALBEDO_A716_g3275 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_741_0_g3275 = saturate( ( ( ALBEDO_A716_g3275 / max( fwidth( ALBEDO_A716_g3275 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch599_g3275 = _GlancingClipMode;
				float m_Off599_g3275 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult583_g3275 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult587_g3275 = dot( ase_worldViewDir , normalizeResult583_g3275 );
				float temp_output_585_0_g3275 = ( 1.0 - abs( dotResult587_g3275 ) );
				float m_Active599_g3275 = ( temp_output_585_0_g3275 * 1.45 );
				float localfloatswitch599_g3275 = floatswitch599_g3275( m_switch599_g3275 , m_Off599_g3275 , m_Active599_g3275 );
				
				float Alpha = temp_output_741_0_g3275;
				float AlphaClipThreshold = localfloatswitch599_g3275;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _TransmissionTint;
			float4 _WindMask_Map_ST;
			float4 _TranslucencyTint;
			float _URP_TransmissionShadow;
			half _Brightness;
			float _ColorShift_ShiftVariation;
			float _ColorShift_RGBHue;
			float _ColorShift_RGBSaturation;
			float _ColorShift_RGBBrightness;
			float _WindMask_TextureVisualize;
			float _WindMask_ProceduralVisualize;
			int _NormalMode;
			half _NormalStrength;
			float _MetallicStrength;
			float _OffsetY;
			float _SmoothnessStrength;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
			int _TranslucencyCullForward;
			int _EnableTranslucency;
			float _URP_TranslucencyScattering;
			int _MapInverted;
			float _TranslucencyThickness;
			int _SmoothnessType;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyShadow;
			int _ColorMask;
			int _CullMode;
			int _ZWriteMode;
			float _AlphatoCoverage;
			int _WindMode;
			int _WindMask_Texture;
			int _WindMask_Procedural;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			float _WindMask_Offset1;
			float _WindMask_Procedural_Intensity;
			float _URP_TranslucencyNormalDistortion;
			float _WindMask_Texture_Intensity;
			int _ColorMode;
			int _TranslucencySource;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyDirect;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2458_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2468_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2312_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2456_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2326_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float3 float3switch2439_g3273( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float floatswitch2655_g3273( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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
			
			float3 float3switch2966_g3273( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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
			
			float3 float3switch2527_g3273( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3273( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float floatswitch836_g3275( int m_switch, float m_Off, float m_ColorShiftVertexNormal, float m_ColorShiftVertexColor )
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
			float3 float3switch420_g3275( int m_switch, float3 m_Off, float3 m_ColorShiftVertexNormal, float3 m_ColorShiftVertexColor )
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
			
			float4 float4switch2972_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2982_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2986_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2991_g3273( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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
			
			float floatswitch599_g3275( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				int m_switch2453_g3273 = _WindMode;
				float3 m_Off2453_g3273 = float3(0,0,0);
				int m_switch2527_g3273 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2966_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				int m_switch2439_g3273 = _WindType;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3273 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				int _WIND_MODE2462_g3273 = _WindMode;
				int m_switch2458_g3273 = _WIND_MODE2462_g3273;
				float m_Off2458_g3273 = 1.0;
				float _Global_Wind_Main_Intensity2403_g3273 = _Global_Wind_Main_Intensity;
				float m_Global2458_g3273 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3273 );
				float m_Local2458_g3273 = _LocalWindStrength;
				float localfloatswitch2458_g3273 = floatswitch2458_g3273( m_switch2458_g3273 , m_Off2458_g3273 , m_Global2458_g3273 , m_Local2458_g3273 );
				float VAR_WindStrength2400_g3273 = localfloatswitch2458_g3273;
				int m_switch2468_g3273 = _WIND_MODE2462_g3273;
				float m_Off2468_g3273 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3273 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3273 = _Global_Wind_Main_RandomOffset2378_g3273;
				float m_Local2468_g3273 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3273 = floatswitch2468_g3273( m_switch2468_g3273 , m_Off2468_g3273 , m_Global2468_g3273 , m_Local2468_g3273 );
				float VAR_WindOffset2419_g3273 = localfloatswitch2468_g3273;
				float4 transform2423_g3273 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3273 = (float2(transform2423_g3273.x , transform2423_g3273.z));
				float dotResult2341_g3273 = dot( appendResult2307_g3273 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3273 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3273 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3273 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3273 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3273 );
				float FUNC_Turbulence2274_g3273 = ( sin( ( ( VAR_RandomTime2244_g3273 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3273 = _WIND_MODE2462_g3273;
				float m_Off2312_g3273 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3273 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3273 = _Global_Wind_Main_Pulse2302_g3273;
				float m_Local2312_g3273 = _LocalWindPulse;
				float localfloatswitch2312_g3273 = floatswitch2312_g3273( m_switch2312_g3273 , m_Off2312_g3273 , m_Global2312_g3273 , m_Local2312_g3273 );
				float VAR_WindPulse2421_g3273 = localfloatswitch2312_g3273;
				float FUNC_Angle2470_g3273 = ( VAR_WindStrength2400_g3273 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3273 * 2.0 ) + FUNC_Turbulence2274_g3273 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3273 );
				float VAR_SinA2424_g3273 = sin( FUNC_Angle2470_g3273 );
				float VAR_CosA2362_g3273 = cos( FUNC_Angle2470_g3273 );
				int m_switch2456_g3273 = _WIND_MODE2462_g3273;
				float m_Off2456_g3273 = 1.0;
				float _Global_Wind_Main_Direction2350_g3273 = _Global_Wind_Main_Direction;
				float m_Global2456_g3273 = _Global_Wind_Main_Direction2350_g3273;
				float m_Local2456_g3273 = _LocalWindDirection;
				float localfloatswitch2456_g3273 = floatswitch2456_g3273( m_switch2456_g3273 , m_Off2456_g3273 , m_Global2456_g3273 , m_Local2456_g3273 );
				float _WindDirection2249_g3273 = localfloatswitch2456_g3273;
				float2 localDirectionalEquation2249_g3273 = DirectionalEquation( _WindDirection2249_g3273 );
				float2 break2469_g3273 = localDirectionalEquation2249_g3273;
				float VAR_xLerp2418_g3273 = break2469_g3273.x;
				float lerpResult2258_g3273 = lerp( break2265_g3273.x , ( ( break2265_g3273.y * VAR_SinA2424_g3273 ) + ( break2265_g3273.x * VAR_CosA2362_g3273 ) ) , VAR_xLerp2418_g3273);
				float3 break2340_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float3 break2233_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float VAR_zLerp2416_g3273 = break2469_g3273.y;
				float lerpResult2275_g3273 = lerp( break2233_g3273.z , ( ( break2233_g3273.y * VAR_SinA2424_g3273 ) + ( break2233_g3273.z * VAR_CosA2362_g3273 ) ) , VAR_zLerp2416_g3273);
				float3 appendResult2235_g3273 = (float3(lerpResult2258_g3273 , ( ( break2340_g3273.y * VAR_CosA2362_g3273 ) - ( break2340_g3273.z * VAR_SinA2424_g3273 ) ) , lerpResult2275_g3273));
				float3 VAR_VERTEXPOSITION2354_g3273 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3273 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3273 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3273 );
				float3 break2518_g3273 = FUNC_vertexPos2282_g3273;
				half FUNC_SinFunction2336_g3273 = sin( ( ( VAR_RandomTime2244_g3273 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + FUNC_Turbulence2274_g3273 + ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 2.0 ) ) );
				int m_switch2326_g3273 = _WIND_MODE2462_g3273;
				float m_Off2326_g3273 = 1.0;
				float _Global_Wind_Main_Turbulence2267_g3273 = _Global_Wind_Main_Turbulence;
				float m_Global2326_g3273 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence2267_g3273 );
				float m_Local2326_g3273 = _LocalWindTurbulence;
				float localfloatswitch2326_g3273 = floatswitch2326_g3273( m_switch2326_g3273 , m_Off2326_g3273 , m_Global2326_g3273 , m_Local2326_g3273 );
				float VAR_GlobalWindTurbulence2442_g3273 = localfloatswitch2326_g3273;
				float3 appendResult2480_g3273 = (float3(break2518_g3273.x , ( break2518_g3273.y + ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) ) , break2518_g3273.z));
				float3 OUT_Leafs_Standalone2396_g3273 = appendResult2480_g3273;
				float3 m_Leaf2439_g3273 = OUT_Leafs_Standalone2396_g3273;
				float3 OUT_Palm_Standalone2310_g3273 = ( ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) + FUNC_vertexPos2282_g3273 );
				float3 m_Palm2439_g3273 = OUT_Palm_Standalone2310_g3273;
				float3 break2486_g3273 = FUNC_vertexPos2282_g3273;
				float temp_output_2514_0_g3273 = ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) );
				float lerpResult2482_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_xLerp2418_g3273);
				float lerpResult2484_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_zLerp2416_g3273);
				float3 appendResult2489_g3273 = (float3(( break2486_g3273.x + lerpResult2482_g3273 ) , break2486_g3273.y , ( break2486_g3273.z + lerpResult2484_g3273 )));
				float3 OUT_Grass_Standalone2242_g3273 = appendResult2489_g3273;
				float3 m_Grass2439_g3273 = OUT_Grass_Standalone2242_g3273;
				float3 m_Simple2439_g3273 = FUNC_vertexPos2282_g3273;
				float clampResult2884_g3273 = clamp( ( VAR_WindStrength2400_g3273 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3273 = FUNC_vertexPos2282_g3273;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3273 = ase_worldPos;
				float temp_output_2690_0_g3273 = ( VAR_RandomTime2244_g3273 * 25.0 );
				float clampResult2691_g3273 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3273 = (float2(temp_output_2690_0_g3273 , ( temp_output_2690_0_g3273 / clampResult2691_g3273 )));
				float3 appendResult2706_g3273 = (float3(break2708_g3273.x , ( break2708_g3273.y + cos( ( ( ( break2718_g3273.x + break2718_g3273.y + break2718_g3273.z ) * 2.0 ) + appendResult2694_g3273 + FUNC_Angle2470_g3273 + VAR_GlobalWindTurbulence2442_g3273 ) ) ).x , break2708_g3273.z));
				float3 temp_output_2613_0_g3273 = ( clampResult2884_g3273 * appendResult2706_g3273 );
				float3 WIND_CLOTH_VERTEX997_g3273 = ( ( ( cos( temp_output_2613_0_g3273 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3273 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3273 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3273 = WIND_CLOTH_VERTEX997_g3273;
				float3 localfloat3switch2439_g3273 = float3switch2439_g3273( m_switch2439_g3273 , m_Leaf2439_g3273 , m_Palm2439_g3273 , m_Grass2439_g3273 , m_Simple2439_g3273 , m_Ivy2439_g3273 );
				float3 WIND_FINAL2753_g3273 = localfloat3switch2439_g3273;
				float3 m_Off2966_g3273 = WIND_FINAL2753_g3273;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( ase_worldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( ase_worldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_5 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( ase_worldNormal ) - temp_cast_5 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float3 lerpResult2917_g3273 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3273 , appendResult2916_g3273);
				float3 m_TopDown2966_g3273 = lerpResult2917_g3273;
				float3 m_BottomUp2966_g3273 = lerpResult2917_g3273;
				float3 m_SideWall2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical_Inverted2966_g3273 = lerpResult2917_g3273;
				float3 localfloat3switch2966_g3273 = float3switch2966_g3273( m_switch2966_g3273 , m_Off2966_g3273 , m_TopDown2966_g3273 , m_BottomUp2966_g3273 , m_SideWall2966_g3273 , m_Spherical2966_g3273 , m_Spherical_Inverted2966_g3273 );
				float3 m_Off2527_g3273 = localfloat3switch2966_g3273;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3273 = ( localfloat3switch2966_g3273 * temp_output_2910_0_g3273 );
				float3 localfloat3switch2527_g3273 = float3switch2527_g3273( m_switch2527_g3273 , m_Off2527_g3273 , m_Active2527_g3273 );
				float3 WIND_MASK2748_g3273 = localfloat3switch2527_g3273;
				float3 m_Global2453_g3273 = WIND_MASK2748_g3273;
				float3 m_Local2453_g3273 = WIND_MASK2748_g3273;
				float3 localfloat3switch2453_g3273 = float3switch2453_g3273( m_switch2453_g3273 , m_Off2453_g3273 , m_Global2453_g3273 , m_Local2453_g3273 );
				float3 temp_output_756_0_g3275 = localfloat3switch2453_g3273;
				
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_756_0_g3275;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int m_switch420_g3275 = _ColorMode;
				float3 temp_output_11_0_g3275 = (_Color).rgb;
				float2 appendResult77_g3275 = (float2(_TilingX , _TilingY));
				float2 appendResult82_g3275 = (float2(_OffsetX , _OffsetY));
				float2 texCoord73_g3275 = IN.ase_texcoord2.xy * appendResult77_g3275 + appendResult82_g3275;
				float2 appendResult559_g3275 = (float2(texCoord73_g3275.x , texCoord73_g3275.y));
				float4 tex2DNode57_g3275 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, appendResult559_g3275 );
				float3 temp_output_76_0_g3275 = ( temp_output_11_0_g3275 * (tex2DNode57_g3275).rgb * _Brightness );
				float3 ALBEDO_01424_g3275 = temp_output_76_0_g3275;
				float3 m_Off420_g3275 = ALBEDO_01424_g3275;
				int _COLOR_MODE835_g3275 = _ColorMode;
				int m_switch836_g3275 = _COLOR_MODE835_g3275;
				float m_Off836_g3275 = 0.0;
				float m_ColorShiftVertexNormal836_g3275 = ( IN.ase_normal.y - 0.5 );
				float m_ColorShiftVertexColor836_g3275 = ( IN.ase_color.g - 0.5 );
				float localfloatswitch836_g3275 = floatswitch836_g3275( m_switch836_g3275 , m_Off836_g3275 , m_ColorShiftVertexNormal836_g3275 , m_ColorShiftVertexColor836_g3275 );
				float3 hsvTorgb823_g3275 = RGBToHSV( ALBEDO_01424_g3275 );
				float3 hsvTorgb816_g3275 = HSVToRGB( float3(( ( localfloatswitch836_g3275 * _ColorShift_ShiftVariation ) + _ColorShift_RGBHue + hsvTorgb823_g3275 ).x,( hsvTorgb823_g3275.y * _ColorShift_RGBSaturation ),( hsvTorgb823_g3275.z * _ColorShift_RGBBrightness )) );
				float3 m_ColorShiftVertexNormal420_g3275 = hsvTorgb816_g3275;
				float3 m_ColorShiftVertexColor420_g3275 = hsvTorgb816_g3275;
				float3 localfloat3switch420_g3275 = float3switch420_g3275( m_switch420_g3275 , m_Off420_g3275 , m_ColorShiftVertexNormal420_g3275 , m_ColorShiftVertexColor420_g3275 );
				float3 COLOR_SHIFTING426_g3275 = localfloat3switch420_g3275;
				int _MASK_MODE_TEXTURE2980_g3273 = _WindMask_Texture;
				int m_switch2982_g3273 = _MASK_MODE_TEXTURE2980_g3273;
				float4 _Vector3 = float4(0,0,0,0);
				float4 m_Off2982_g3273 = _Vector3;
				int m_switch2972_g3273 = (int)_WindMask_TextureVisualize;
				float4 m_Off2972_g3273 = _Vector3;
				float4 color2979_g3273 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
				float4 _Visualize_Color2992_g3273 = color2979_g3273;
				float2 uv_WindMask_Map = IN.ase_texcoord2.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float4 appendResult2974_g3273 = (float4(temp_output_2910_0_g3273 , temp_output_2910_0_g3273.x));
				float4 lerpResult2967_g3273 = lerp( _Visualize_Color2992_g3273 , float4( 0,0,0,0 ) , appendResult2974_g3273);
				float4 m_Active2972_g3273 = lerpResult2967_g3273;
				float4 localfloat4switch2972_g3273 = float4switch2972_g3273( m_switch2972_g3273 , m_Off2972_g3273 , m_Active2972_g3273 );
				float4 m_Active2982_g3273 = localfloat4switch2972_g3273;
				float4 localfloat4switch2982_g3273 = float4switch2982_g3273( m_switch2982_g3273 , m_Off2982_g3273 , m_Active2982_g3273 );
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2991_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				float4 m_Off2991_g3273 = _Vector3;
				int m_switch2986_g3273 = (int)_WindMask_ProceduralVisualize;
				float4 m_Off2986_g3273 = _Vector3;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( ase_worldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( ase_worldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_7 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( ase_worldNormal ) - temp_cast_7 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float4 appendResult2977_g3273 = (float4(appendResult2916_g3273 , appendResult2916_g3273.x));
				float4 lerpResult2976_g3273 = lerp( _Visualize_Color2992_g3273 , float4( 0,0,0,0 ) , appendResult2977_g3273);
				float4 m_Active2986_g3273 = lerpResult2976_g3273;
				float4 localfloat4switch2986_g3273 = float4switch2986_g3273( m_switch2986_g3273 , m_Off2986_g3273 , m_Active2986_g3273 );
				float4 m_TopDown2991_g3273 = localfloat4switch2986_g3273;
				float4 m_BottomUp2991_g3273 = localfloat4switch2986_g3273;
				float4 m_SideWall2991_g3273 = localfloat4switch2986_g3273;
				float4 m_Spherical2991_g3273 = localfloat4switch2986_g3273;
				float4 m_Spherical_Inverted2991_g3273 = localfloat4switch2986_g3273;
				float4 localfloat4switch2991_g3273 = float4switch2991_g3273( m_switch2991_g3273 , m_Off2991_g3273 , m_TopDown2991_g3273 , m_BottomUp2991_g3273 , m_SideWall2991_g3273 , m_Spherical2991_g3273 , m_Spherical_Inverted2991_g3273 );
				
				float ALBEDO_A716_g3275 = tex2DNode57_g3275.a;
				clip( ALBEDO_A716_g3275 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_741_0_g3275 = saturate( ( ( ALBEDO_A716_g3275 / max( fwidth( ALBEDO_A716_g3275 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch599_g3275 = _GlancingClipMode;
				float m_Off599_g3275 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult583_g3275 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult587_g3275 = dot( ase_worldViewDir , normalizeResult583_g3275 );
				float temp_output_585_0_g3275 = ( 1.0 - abs( dotResult587_g3275 ) );
				float m_Active599_g3275 = ( temp_output_585_0_g3275 * 1.45 );
				float localfloatswitch599_g3275 = floatswitch599_g3275( m_switch599_g3275 , m_Off599_g3275 , m_Active599_g3275 );
				
				
				float3 Albedo = ( float4( COLOR_SHIFTING426_g3275 , 0.0 ) + ( localfloat4switch2982_g3273 + localfloat4switch2991_g3273 ) ).xyz;
				float3 Emission = 0;
				float Alpha = temp_output_741_0_g3275;
				float AlphaClipThreshold = localfloatswitch599_g3275;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define _TRANSMISSION_ASE 1
			#define _TRANSLUCENCY_ASE 1
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_FINAL_COLOR_ALPHA_MULTIPLY 1
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 999999

			#pragma enable_d3d11_debug_symbols
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_instancing
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			half4 _TransmissionTint;
			float4 _WindMask_Map_ST;
			float4 _TranslucencyTint;
			float _URP_TransmissionShadow;
			half _Brightness;
			float _ColorShift_ShiftVariation;
			float _ColorShift_RGBHue;
			float _ColorShift_RGBSaturation;
			float _ColorShift_RGBBrightness;
			float _WindMask_TextureVisualize;
			float _WindMask_ProceduralVisualize;
			int _NormalMode;
			half _NormalStrength;
			float _MetallicStrength;
			float _OffsetY;
			float _SmoothnessStrength;
			int _OcclusionSourceMode;
			float _OcclusionStrengthAO;
			half _AlphaCutoffBias;
			int _GlancingClipMode;
			half _AlphaCutoffBiasShadow;
			int _TranslucencyCullForward;
			int _EnableTranslucency;
			float _URP_TranslucencyScattering;
			int _MapInverted;
			float _TranslucencyThickness;
			int _SmoothnessType;
			float _OffsetX;
			float _TilingY;
			float _TilingX;
			float _URP_TranslucencyAmbient;
			float _URP_TranslucencyShadow;
			int _ColorMask;
			int _CullMode;
			int _ZWriteMode;
			float _AlphatoCoverage;
			int _WindMode;
			int _WindMask_Texture;
			int _WindMask_Procedural;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			float _WindMask_Offset1;
			float _WindMask_Procedural_Intensity;
			float _URP_TranslucencyNormalDistortion;
			float _WindMask_Texture_Intensity;
			int _ColorMode;
			int _TranslucencySource;
			float _URP_TranslucencyStrength;
			float _URP_TranslucencyDirect;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Turbulence;
			TEXTURE2D(_WindMask_Map);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float floatswitch2458_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2468_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2312_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2456_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float floatswitch2326_g3273( int m_switch, float m_Off, float m_Global, float m_Local )
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
			
			float3 float3switch2439_g3273( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
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
			
			float floatswitch2655_g3273( int m_switch, float m_Off, float m_TopDown, float m_BottomUp, float m_SideWall, float m_Spherical, float m_Spherical_Inverted )
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
			
			float3 float3switch2966_g3273( int m_switch, float3 m_Off, float3 m_TopDown, float3 m_BottomUp, float3 m_SideWall, float3 m_Spherical, float3 m_Spherical_Inverted )
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
			
			float3 float3switch2527_g3273( int m_switch, float3 m_Off, float3 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float3(0,0,0);
			}
			
			float3 float3switch2453_g3273( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float floatswitch836_g3275( int m_switch, float m_Off, float m_ColorShiftVertexNormal, float m_ColorShiftVertexColor )
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
			float3 float3switch420_g3275( int m_switch, float3 m_Off, float3 m_ColorShiftVertexNormal, float3 m_ColorShiftVertexColor )
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
			
			float4 float4switch2972_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2982_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2986_g3273( int m_switch, float4 m_Off, float4 m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float4(0,0,0,0);
			}
			
			float4 float4switch2991_g3273( int m_switch, float4 m_Off, float4 m_TopDown, float4 m_BottomUp, float4 m_SideWall, float4 m_Spherical, float4 m_Spherical_Inverted )
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
			
			float floatswitch599_g3275( int m_switch, float m_Off, float m_Active )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				int m_switch2453_g3273 = _WindMode;
				float3 m_Off2453_g3273 = float3(0,0,0);
				int m_switch2527_g3273 = _WindMask_Texture;
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2966_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				int m_switch2439_g3273 = _WindType;
				float3 VAR_VERTEXPOSITION_MATRIX2352_g3273 = mul( GetObjectToWorldMatrix(), float4( v.vertex.xyz , 0.0 ) ).xyz;
				float3 break2265_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				int _WIND_MODE2462_g3273 = _WindMode;
				int m_switch2458_g3273 = _WIND_MODE2462_g3273;
				float m_Off2458_g3273 = 1.0;
				float _Global_Wind_Main_Intensity2403_g3273 = _Global_Wind_Main_Intensity;
				float m_Global2458_g3273 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity2403_g3273 );
				float m_Local2458_g3273 = _LocalWindStrength;
				float localfloatswitch2458_g3273 = floatswitch2458_g3273( m_switch2458_g3273 , m_Off2458_g3273 , m_Global2458_g3273 , m_Local2458_g3273 );
				float VAR_WindStrength2400_g3273 = localfloatswitch2458_g3273;
				int m_switch2468_g3273 = _WIND_MODE2462_g3273;
				float m_Off2468_g3273 = 1.0;
				float _Global_Wind_Main_RandomOffset2378_g3273 = _Global_Wind_Main_RandomOffset;
				float m_Global2468_g3273 = _Global_Wind_Main_RandomOffset2378_g3273;
				float m_Local2468_g3273 = _LocalRandomWindOffset;
				float localfloatswitch2468_g3273 = floatswitch2468_g3273( m_switch2468_g3273 , m_Off2468_g3273 , m_Global2468_g3273 , m_Local2468_g3273 );
				float VAR_WindOffset2419_g3273 = localfloatswitch2468_g3273;
				float4 transform2423_g3273 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				float2 appendResult2307_g3273 = (float2(transform2423_g3273.x , transform2423_g3273.z));
				float dotResult2341_g3273 = dot( appendResult2307_g3273 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3273 = lerp( 0.8 , ( ( VAR_WindOffset2419_g3273 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3273 ) * 43758.55 ) ));
				float VAR_RandomTime2244_g3273 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3273 );
				float FUNC_Turbulence2274_g3273 = ( sin( ( ( VAR_RandomTime2244_g3273 * 40.0 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3273 = _WIND_MODE2462_g3273;
				float m_Off2312_g3273 = 1.0;
				float _Global_Wind_Main_Pulse2302_g3273 = _Global_Wind_Main_Pulse;
				float m_Global2312_g3273 = _Global_Wind_Main_Pulse2302_g3273;
				float m_Local2312_g3273 = _LocalWindPulse;
				float localfloatswitch2312_g3273 = floatswitch2312_g3273( m_switch2312_g3273 , m_Off2312_g3273 , m_Global2312_g3273 , m_Local2312_g3273 );
				float VAR_WindPulse2421_g3273 = localfloatswitch2312_g3273;
				float FUNC_Angle2470_g3273 = ( VAR_WindStrength2400_g3273 * ( 1.0 + sin( ( ( ( ( VAR_RandomTime2244_g3273 * 2.0 ) + FUNC_Turbulence2274_g3273 ) - ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 50.0 ) ) - ( v.ase_color.r / 20.0 ) ) ) ) * sqrt( v.ase_color.r ) * VAR_WindPulse2421_g3273 );
				float VAR_SinA2424_g3273 = sin( FUNC_Angle2470_g3273 );
				float VAR_CosA2362_g3273 = cos( FUNC_Angle2470_g3273 );
				int m_switch2456_g3273 = _WIND_MODE2462_g3273;
				float m_Off2456_g3273 = 1.0;
				float _Global_Wind_Main_Direction2350_g3273 = _Global_Wind_Main_Direction;
				float m_Global2456_g3273 = _Global_Wind_Main_Direction2350_g3273;
				float m_Local2456_g3273 = _LocalWindDirection;
				float localfloatswitch2456_g3273 = floatswitch2456_g3273( m_switch2456_g3273 , m_Off2456_g3273 , m_Global2456_g3273 , m_Local2456_g3273 );
				float _WindDirection2249_g3273 = localfloatswitch2456_g3273;
				float2 localDirectionalEquation2249_g3273 = DirectionalEquation( _WindDirection2249_g3273 );
				float2 break2469_g3273 = localDirectionalEquation2249_g3273;
				float VAR_xLerp2418_g3273 = break2469_g3273.x;
				float lerpResult2258_g3273 = lerp( break2265_g3273.x , ( ( break2265_g3273.y * VAR_SinA2424_g3273 ) + ( break2265_g3273.x * VAR_CosA2362_g3273 ) ) , VAR_xLerp2418_g3273);
				float3 break2340_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float3 break2233_g3273 = VAR_VERTEXPOSITION_MATRIX2352_g3273;
				float VAR_zLerp2416_g3273 = break2469_g3273.y;
				float lerpResult2275_g3273 = lerp( break2233_g3273.z , ( ( break2233_g3273.y * VAR_SinA2424_g3273 ) + ( break2233_g3273.z * VAR_CosA2362_g3273 ) ) , VAR_zLerp2416_g3273);
				float3 appendResult2235_g3273 = (float3(lerpResult2258_g3273 , ( ( break2340_g3273.y * VAR_CosA2362_g3273 ) - ( break2340_g3273.z * VAR_SinA2424_g3273 ) ) , lerpResult2275_g3273));
				float3 VAR_VERTEXPOSITION2354_g3273 = v.vertex.xyz;
				float3 FUNC_vertexPos2282_g3273 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3273 , 0.0 ) ).xyz - VAR_VERTEXPOSITION2354_g3273 );
				float3 break2518_g3273 = FUNC_vertexPos2282_g3273;
				half FUNC_SinFunction2336_g3273 = sin( ( ( VAR_RandomTime2244_g3273 * 200.0 * ( 0.2 + v.ase_color.g ) ) + ( v.ase_color.g * 10.0 ) + FUNC_Turbulence2274_g3273 + ( VAR_VERTEXPOSITION_MATRIX2352_g3273.z / 2.0 ) ) );
				int m_switch2326_g3273 = _WIND_MODE2462_g3273;
				float m_Off2326_g3273 = 1.0;
				float _Global_Wind_Main_Turbulence2267_g3273 = _Global_Wind_Main_Turbulence;
				float m_Global2326_g3273 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence2267_g3273 );
				float m_Local2326_g3273 = _LocalWindTurbulence;
				float localfloatswitch2326_g3273 = floatswitch2326_g3273( m_switch2326_g3273 , m_Off2326_g3273 , m_Global2326_g3273 , m_Local2326_g3273 );
				float VAR_GlobalWindTurbulence2442_g3273 = localfloatswitch2326_g3273;
				float3 appendResult2480_g3273 = (float3(break2518_g3273.x , ( break2518_g3273.y + ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) ) , break2518_g3273.z));
				float3 OUT_Leafs_Standalone2396_g3273 = appendResult2480_g3273;
				float3 m_Leaf2439_g3273 = OUT_Leafs_Standalone2396_g3273;
				float3 OUT_Palm_Standalone2310_g3273 = ( ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) * VAR_GlobalWindTurbulence2442_g3273 ) + FUNC_vertexPos2282_g3273 );
				float3 m_Palm2439_g3273 = OUT_Palm_Standalone2310_g3273;
				float3 break2486_g3273 = FUNC_vertexPos2282_g3273;
				float temp_output_2514_0_g3273 = ( FUNC_SinFunction2336_g3273 * v.ase_color.b * ( FUNC_Angle2470_g3273 + ( VAR_WindStrength2400_g3273 / 200.0 ) ) );
				float lerpResult2482_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_xLerp2418_g3273);
				float lerpResult2484_g3273 = lerp( 0.0 , temp_output_2514_0_g3273 , VAR_zLerp2416_g3273);
				float3 appendResult2489_g3273 = (float3(( break2486_g3273.x + lerpResult2482_g3273 ) , break2486_g3273.y , ( break2486_g3273.z + lerpResult2484_g3273 )));
				float3 OUT_Grass_Standalone2242_g3273 = appendResult2489_g3273;
				float3 m_Grass2439_g3273 = OUT_Grass_Standalone2242_g3273;
				float3 m_Simple2439_g3273 = FUNC_vertexPos2282_g3273;
				float clampResult2884_g3273 = clamp( ( VAR_WindStrength2400_g3273 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3273 = FUNC_vertexPos2282_g3273;
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float3 break2718_g3273 = ase_worldPos;
				float temp_output_2690_0_g3273 = ( VAR_RandomTime2244_g3273 * 25.0 );
				float clampResult2691_g3273 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3273 = (float2(temp_output_2690_0_g3273 , ( temp_output_2690_0_g3273 / clampResult2691_g3273 )));
				float3 appendResult2706_g3273 = (float3(break2708_g3273.x , ( break2708_g3273.y + cos( ( ( ( break2718_g3273.x + break2718_g3273.y + break2718_g3273.z ) * 2.0 ) + appendResult2694_g3273 + FUNC_Angle2470_g3273 + VAR_GlobalWindTurbulence2442_g3273 ) ) ).x , break2708_g3273.z));
				float3 temp_output_2613_0_g3273 = ( clampResult2884_g3273 * appendResult2706_g3273 );
				float3 WIND_CLOTH_VERTEX997_g3273 = ( ( ( cos( temp_output_2613_0_g3273 ) + ( -0.3193 * PI ) ) * v.ase_normal * 0.2 * ( FUNC_SinFunction2336_g3273 * v.ase_color.b ) ) + ( sin( temp_output_2613_0_g3273 ) * cross( v.ase_normal , v.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3273 = WIND_CLOTH_VERTEX997_g3273;
				float3 localfloat3switch2439_g3273 = float3switch2439_g3273( m_switch2439_g3273 , m_Leaf2439_g3273 , m_Palm2439_g3273 , m_Grass2439_g3273 , m_Simple2439_g3273 , m_Ivy2439_g3273 );
				float3 WIND_FINAL2753_g3273 = localfloat3switch2439_g3273;
				float3 m_Off2966_g3273 = WIND_FINAL2753_g3273;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( ase_worldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( ase_worldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_5 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( ase_worldNormal ) - temp_cast_5 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float3 lerpResult2917_g3273 = lerp( float3( 0,0,0 ) , WIND_FINAL2753_g3273 , appendResult2916_g3273);
				float3 m_TopDown2966_g3273 = lerpResult2917_g3273;
				float3 m_BottomUp2966_g3273 = lerpResult2917_g3273;
				float3 m_SideWall2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical2966_g3273 = lerpResult2917_g3273;
				float3 m_Spherical_Inverted2966_g3273 = lerpResult2917_g3273;
				float3 localfloat3switch2966_g3273 = float3switch2966_g3273( m_switch2966_g3273 , m_Off2966_g3273 , m_TopDown2966_g3273 , m_BottomUp2966_g3273 , m_SideWall2966_g3273 , m_Spherical2966_g3273 , m_Spherical_Inverted2966_g3273 );
				float3 m_Off2527_g3273 = localfloat3switch2966_g3273;
				float2 uv_WindMask_Map = v.ase_texcoord.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D_LOD( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map, 0.0 );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float3 m_Active2527_g3273 = ( localfloat3switch2966_g3273 * temp_output_2910_0_g3273 );
				float3 localfloat3switch2527_g3273 = float3switch2527_g3273( m_switch2527_g3273 , m_Off2527_g3273 , m_Active2527_g3273 );
				float3 WIND_MASK2748_g3273 = localfloat3switch2527_g3273;
				float3 m_Global2453_g3273 = WIND_MASK2748_g3273;
				float3 m_Local2453_g3273 = WIND_MASK2748_g3273;
				float3 localfloat3switch2453_g3273 = float3switch2453_g3273( m_switch2453_g3273 , m_Off2453_g3273 , m_Global2453_g3273 , m_Local2453_g3273 );
				float3 temp_output_756_0_g3275 = localfloat3switch2453_g3273;
				
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = temp_output_756_0_g3275;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				int m_switch420_g3275 = _ColorMode;
				float3 temp_output_11_0_g3275 = (_Color).rgb;
				float2 appendResult77_g3275 = (float2(_TilingX , _TilingY));
				float2 appendResult82_g3275 = (float2(_OffsetX , _OffsetY));
				float2 texCoord73_g3275 = IN.ase_texcoord2.xy * appendResult77_g3275 + appendResult82_g3275;
				float2 appendResult559_g3275 = (float2(texCoord73_g3275.x , texCoord73_g3275.y));
				float4 tex2DNode57_g3275 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, appendResult559_g3275 );
				float3 temp_output_76_0_g3275 = ( temp_output_11_0_g3275 * (tex2DNode57_g3275).rgb * _Brightness );
				float3 ALBEDO_01424_g3275 = temp_output_76_0_g3275;
				float3 m_Off420_g3275 = ALBEDO_01424_g3275;
				int _COLOR_MODE835_g3275 = _ColorMode;
				int m_switch836_g3275 = _COLOR_MODE835_g3275;
				float m_Off836_g3275 = 0.0;
				float m_ColorShiftVertexNormal836_g3275 = ( IN.ase_normal.y - 0.5 );
				float m_ColorShiftVertexColor836_g3275 = ( IN.ase_color.g - 0.5 );
				float localfloatswitch836_g3275 = floatswitch836_g3275( m_switch836_g3275 , m_Off836_g3275 , m_ColorShiftVertexNormal836_g3275 , m_ColorShiftVertexColor836_g3275 );
				float3 hsvTorgb823_g3275 = RGBToHSV( ALBEDO_01424_g3275 );
				float3 hsvTorgb816_g3275 = HSVToRGB( float3(( ( localfloatswitch836_g3275 * _ColorShift_ShiftVariation ) + _ColorShift_RGBHue + hsvTorgb823_g3275 ).x,( hsvTorgb823_g3275.y * _ColorShift_RGBSaturation ),( hsvTorgb823_g3275.z * _ColorShift_RGBBrightness )) );
				float3 m_ColorShiftVertexNormal420_g3275 = hsvTorgb816_g3275;
				float3 m_ColorShiftVertexColor420_g3275 = hsvTorgb816_g3275;
				float3 localfloat3switch420_g3275 = float3switch420_g3275( m_switch420_g3275 , m_Off420_g3275 , m_ColorShiftVertexNormal420_g3275 , m_ColorShiftVertexColor420_g3275 );
				float3 COLOR_SHIFTING426_g3275 = localfloat3switch420_g3275;
				int _MASK_MODE_TEXTURE2980_g3273 = _WindMask_Texture;
				int m_switch2982_g3273 = _MASK_MODE_TEXTURE2980_g3273;
				float4 _Vector3 = float4(0,0,0,0);
				float4 m_Off2982_g3273 = _Vector3;
				int m_switch2972_g3273 = (int)_WindMask_TextureVisualize;
				float4 m_Off2972_g3273 = _Vector3;
				float4 color2979_g3273 = IsGammaSpace() ? float4(1,0,0.8408594,0) : float4(1,0,0.6754137,0);
				float4 _Visualize_Color2992_g3273 = color2979_g3273;
				float2 uv_WindMask_Map = IN.ase_texcoord2.xy * _WindMask_Map_ST.xy + _WindMask_Map_ST.zw;
				float4 tex2DNode2742_g3273 = SAMPLE_TEXTURE2D( _WindMask_Map, sampler_trilinear_repeat, uv_WindMask_Map );
				float3 appendResult2744_g3273 = (float3(tex2DNode2742_g3273.r , tex2DNode2742_g3273.r , tex2DNode2742_g3273.r));
				float3 temp_output_2910_0_g3273 = ( appendResult2744_g3273 + ( 1.0 - _WindMask_Texture_Intensity ) );
				float4 appendResult2974_g3273 = (float4(temp_output_2910_0_g3273 , temp_output_2910_0_g3273.x));
				float4 lerpResult2967_g3273 = lerp( _Visualize_Color2992_g3273 , float4( 0,0,0,0 ) , appendResult2974_g3273);
				float4 m_Active2972_g3273 = lerpResult2967_g3273;
				float4 localfloat4switch2972_g3273 = float4switch2972_g3273( m_switch2972_g3273 , m_Off2972_g3273 , m_Active2972_g3273 );
				float4 m_Active2982_g3273 = localfloat4switch2972_g3273;
				float4 localfloat4switch2982_g3273 = float4switch2982_g3273( m_switch2982_g3273 , m_Off2982_g3273 , m_Active2982_g3273 );
				int _MASK_MODE_PROCEDRAL2677_g3273 = _WindMask_Procedural;
				int m_switch2991_g3273 = _MASK_MODE_PROCEDRAL2677_g3273;
				float4 m_Off2991_g3273 = _Vector3;
				int m_switch2986_g3273 = (int)_WindMask_ProceduralVisualize;
				float4 m_Off2986_g3273 = _Vector3;
				int m_switch2655_g3273 = _WindMask_Procedural;
				float m_Off2655_g3273 = 0.0;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float MASK_OFFSET2670_g3273 = _WindMask_Offset1;
				float temp_output_2957_0_g3273 = ( 1.0 - MASK_OFFSET2670_g3273 );
				float m_TopDown2655_g3273 = ( ( ase_worldNormal.y - temp_output_2957_0_g3273 ) - 0.05 );
				float m_BottomUp2655_g3273 = ( -( ase_worldNormal.y + temp_output_2957_0_g3273 ) - 0.05 );
				float3 temp_cast_7 = (0.5).xxx;
				float3 break2635_g3273 = ( abs( ase_worldNormal ) - temp_cast_7 );
				float dotResult2928_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.x + -0.4 ) , -( ( ( 1.0 - MASK_OFFSET2670_g3273 ) + -0.5 ) - break2635_g3273.y ) );
				float m_SideWall2655_g3273 = dotResult2928_g3273;
				float dotResult2921_g3273 = dot( ( MASK_OFFSET2670_g3273 + break2635_g3273.z + 0.13 ) , -( ( 1.0 - MASK_OFFSET2670_g3273 ) + break2635_g3273.z + -0.75 ) );
				float m_Spherical2655_g3273 = dotResult2921_g3273;
				float m_Spherical_Inverted2655_g3273 = -dotResult2921_g3273;
				float localfloatswitch2655_g3273 = floatswitch2655_g3273( m_switch2655_g3273 , m_Off2655_g3273 , m_TopDown2655_g3273 , m_BottomUp2655_g3273 , m_SideWall2655_g3273 , m_Spherical2655_g3273 , m_Spherical_Inverted2655_g3273 );
				float temp_output_2915_0_g3273 = ( localfloatswitch2655_g3273 * ( 1.0 - _WindMask_Procedural_Intensity ) );
				float3 appendResult2916_g3273 = (float3(temp_output_2915_0_g3273 , temp_output_2915_0_g3273 , temp_output_2915_0_g3273));
				float4 appendResult2977_g3273 = (float4(appendResult2916_g3273 , appendResult2916_g3273.x));
				float4 lerpResult2976_g3273 = lerp( _Visualize_Color2992_g3273 , float4( 0,0,0,0 ) , appendResult2977_g3273);
				float4 m_Active2986_g3273 = lerpResult2976_g3273;
				float4 localfloat4switch2986_g3273 = float4switch2986_g3273( m_switch2986_g3273 , m_Off2986_g3273 , m_Active2986_g3273 );
				float4 m_TopDown2991_g3273 = localfloat4switch2986_g3273;
				float4 m_BottomUp2991_g3273 = localfloat4switch2986_g3273;
				float4 m_SideWall2991_g3273 = localfloat4switch2986_g3273;
				float4 m_Spherical2991_g3273 = localfloat4switch2986_g3273;
				float4 m_Spherical_Inverted2991_g3273 = localfloat4switch2986_g3273;
				float4 localfloat4switch2991_g3273 = float4switch2991_g3273( m_switch2991_g3273 , m_Off2991_g3273 , m_TopDown2991_g3273 , m_BottomUp2991_g3273 , m_SideWall2991_g3273 , m_Spherical2991_g3273 , m_Spherical_Inverted2991_g3273 );
				
				float ALBEDO_A716_g3275 = tex2DNode57_g3275.a;
				clip( ALBEDO_A716_g3275 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_741_0_g3275 = saturate( ( ( ALBEDO_A716_g3275 / max( fwidth( ALBEDO_A716_g3275 ) , 0.0001 ) ) + 0.5 ) );
				
				int m_switch599_g3275 = _GlancingClipMode;
				float m_Off599_g3275 = 0.0;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 normalizeResult583_g3275 = normalize( cross( ddx( WorldPosition ) , ddy( WorldPosition ) ) );
				float dotResult587_g3275 = dot( ase_worldViewDir , normalizeResult583_g3275 );
				float temp_output_585_0_g3275 = ( 1.0 - abs( dotResult587_g3275 ) );
				float m_Active599_g3275 = ( temp_output_585_0_g3275 * 1.45 );
				float localfloatswitch599_g3275 = floatswitch599_g3275( m_switch599_g3275 , m_Off599_g3275 , m_Active599_g3275 );
				
				
				float3 Albedo = ( float4( COLOR_SHIFTING426_g3275 , 0.0 ) + ( localfloat4switch2982_g3273 + localfloat4switch2991_g3273 ) ).xyz;
				float Alpha = temp_output_741_0_g3275;
				float AlphaClipThreshold = localfloatswitch599_g3275;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	/*ase_lod*/
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback " "
	
}
/*ASEBEGIN
Version=18713
2068;279.3333;1602;805;5795.13;4228.671;1.6;True;False
Node;AmplifyShaderEditor.CommentaryNode;2860;-3933.909,-4076.885;Inherit;False;326.1997;135.0999;;1;2760;;0.2003901,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2819;-3929.328,-4205.085;Inherit;False;316.8999;120.3;;1;2848;GLOBAL SETTINGS ;0.2229496,0.764151,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2858;-4886.525,-3608.426;Inherit;False;DECSF Module Wind;70;;3273;a1f35481f1717b54dbd93d220457588d;8,2454,1,2433,1,2371,1,2457,1,2432,1,2434,1,2878,1,2995,1;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.CommentaryNode;2820;-3940.45,-3907.181;Inherit;False;341.5028;250.4201;;3;202;2758;2849;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2861;-4631.16,-4218.424;Inherit;False;599.3186;531.5;URP TRANSMISSION TRANSLUCENCY ;7;2868;2867;2866;2865;2864;2863;2862;;0,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2868;-4332.542,-3853.624;Inherit;False;Property;_URP_TranslucencyAmbient;Translucency Ambient;68;0;Create;False;1;;0;0;True;0;False;0.1;0.573;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2862;-4337.542,-3927.624;Inherit;False;Property;_URP_TranslucencyDirect;Translucency Direct ;67;0;Create;False;1;;0;0;True;0;False;0.9;0.763;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2866;-4343.008,-4005.624;Inherit;False;Property;_URP_TranslucencyScattering;Translucency Scattering ;66;0;Create;False;1;;0;0;True;0;False;2;2.7;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2865;-4340.541,-4088.625;Inherit;False;Property;_URP_TranslucencyNormalDistortion;Translucency Normal Distortion ;65;0;Create;False;1;;0;0;True;0;False;0.2735869;0.506;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2864;-4341.659,-4168.84;Inherit;False;Property;_URP_TranslucencyStrength;Translucency Strength;64;0;Create;False;1;;0;0;True;1;Header(TRANSLUCENCY URP);False;1;20.3;1;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2863;-4618.658,-4168.969;Inherit;False;Property;_URP_TransmissionShadow;Transmission Shadow;63;0;Create;False;1;;0;1;UnityEngine.Rendering.CompareFunction;True;1;Header(TRANSMISSION  URP);False;0.5;0.479;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2859;-4543.326,-3646.127;Inherit;False;DECSF Master Map Cutout;4;;3275;000f89ea707009441837de6c4e59b637;23,684,4,666,4,553,4,489,4,470,4,512,4,688,4,433,4,446,4,364,2,398,2,323,2,499,2,595,1,190,1,760,0,753,0,390,1,356,1,500,1,399,1,461,0,467,0;2;756;FLOAT3;0,0,0;False;847;FLOAT4;0,0,0,0;False;13;FLOAT4;189;FLOAT3;95;COLOR;100;FLOAT4;97;COLOR;99;FLOAT;403;FLOAT;96;FLOAT;600;FLOAT;480;FLOAT4;258;FLOAT4;259;FLOAT3;401;FLOAT3;757
Node;AmplifyShaderEditor.RangedFloatNode;202;-3932.471,-3873.078;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2758;-3937.076,-3796.627;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;2848;-3905.848,-4167.999;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;2849;-3933.048,-3723.398;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2867;-4336.942,-3778.224;Inherit;False;Property;_URP_TranslucencyShadow;Translucency Shadow ;69;0;Create;False;1;;0;0;True;0;False;0.5;0.437;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2760;-3917.71,-4035.984;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 URP 7_5_2;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2841;-3953.374,-3640.745;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;11;DEC/URP Cutout Wind/Cutout Wind Translucency;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;True;2849;True;2;True;2848;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;3;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;2758;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;True;2760;True;3;False;2757;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;8;Include;;False;;Native;Pragma;multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS;False;;Custom;Pragma;multi_compile _ _ADDITIONAL_LIGHT_SHADOWS;False;;Custom;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom; ;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;0;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;1;  Transmission Shadow;0.5,True,2863;Translucency;1;  Translucency Strength;1,True,2864;  Normal Distortion;0.5,True,2865;  Scattering;2,True,2866;  Direct;0.9,True,2862;  Ambient;0.1,True,2868;  Shadow;0.5,True,2863;Cast Shadows;1;  Use Shadow Threshold;1;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;1;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;6;False;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2840;-3601.374,-3640.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2845;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;2758;False;False;False;False;True;1;True;2760;True;3;False;2757;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2844;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2843;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2842;-3941.374,-3630.745;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;2859;756;2858;2190
WireConnection;2859;847;2858;2970
WireConnection;2841;0;2859;189
WireConnection;2841;1;2859;95
WireConnection;2841;3;2859;100
WireConnection;2841;4;2859;97
WireConnection;2841;5;2859;99
WireConnection;2841;6;2859;96
WireConnection;2841;7;2859;600
WireConnection;2841;16;2859;480
WireConnection;2841;14;2859;258
WireConnection;2841;15;2859;259
WireConnection;2841;8;2859;757
ASEEND*/
//CHKSM=C6F9D2342365DCDAFE85CA20DDEA6F2D24A26D89