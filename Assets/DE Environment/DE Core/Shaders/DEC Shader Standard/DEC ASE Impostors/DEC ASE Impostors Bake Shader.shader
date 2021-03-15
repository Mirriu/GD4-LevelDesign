// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/DEC ASE Impostors Bake Shader"
{
	Properties
	{
		[Header(VERSION 1.4.0 STANDARD)][Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Default,0,Flip,1,Mirror,2)]_NormalMode("Normal Mode", Int) = 0
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

	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
	LOD 100
		CGINCLUDE
		#pragma target 4.0
		ENDCG
		Cull Back
		

		Pass
		{
			Name "Unlit"
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			#pragma multi_compile_fwdbase
			#include "UnityStandardUtils.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float3 ase_normal : NORMAL;
				float4 ase_color : COLOR;
			};

			struct v2f
			{
				UNITY_POSITION(pos);
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
			};

			uniform int _CullMode;
			uniform float4 _Color;
			uniform sampler2D _MainTex;
			uniform float _TilingX;
			uniform float _TilingY;
			uniform float _OffsetX;
			uniform float _OffsetY;
			uniform half _Brightness;
			uniform int _NormalMode;
			uniform sampler2D _BumpMap;
			uniform half _NormalStrength;
			uniform float _MetallicStrength;
			uniform sampler2D _MetallicGlossMap;
			uniform float _SmoothnessStrength;
			uniform int _SmoothnessType;
			uniform sampler2D _SmoothnessMap;
			uniform sampler2D _OcclusionMap;
			uniform int _OcclusionSourceMode;
			uniform float _OcclusionStrengthAO;
			uniform half _AlphaCutoffBias;
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
			
			float4 float4switch845_g2954( int m_switch, float4 m_Smoothness, float4 m_Roughness )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else
				return float4(0,0,0,0);
			}
			


			v2f vert(appdata v )
			{
				v2f o = (v2f)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				float3 objectToViewPos = UnityObjectToViewPos(v.vertex.xyz);
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord.z = eyeDepth;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				v.vertex.xyz +=  float3(0,0,0) ;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}


			void frag(v2f i , half ase_vface : VFACE,
				out half4 outGBuffer0 : SV_Target0, 
				out half4 outGBuffer1 : SV_Target1, 
				out half4 outGBuffer2 : SV_Target2, 
				out half4 outGBuffer3 : SV_Target3,
				out half4 outGBuffer4 : SV_Target4,
				out half4 outGBuffer5 : SV_Target5,
				out half4 outGBuffer6 : SV_Target6,
				out half4 outGBuffer7 : SV_Target7,
				out float outDepth : SV_Depth
			) 
			{
				UNITY_SETUP_INSTANCE_ID( i );
				float3 temp_output_11_0_g2954 = (_Color).rgb;
				float2 appendResult77_g2954 = (float2(_TilingX , _TilingY));
				float2 appendResult82_g2954 = (float2(_OffsetX , _OffsetY));
				float2 texCoord73_g2954 = i.ase_texcoord.xy * appendResult77_g2954 + appendResult82_g2954;
				float2 appendResult559_g2954 = (float2(texCoord73_g2954.x , texCoord73_g2954.y));
				float4 tex2DNode57_g2954 = tex2D( _MainTex, appendResult559_g2954 );
				float3 temp_output_76_0_g2954 = ( temp_output_11_0_g2954 * (tex2DNode57_g2954).rgb * _Brightness );
				float4 appendResult14_g3418 = (float4(( float4( temp_output_76_0_g2954 , 0.0 ) + float4(0,0,0,0) ).xyz , 1.0));
				
				int m_switch9_g3415 = _NormalMode;
				float3 NORMAL_IN17_g3415 = UnpackScaleNormal( tex2D( _BumpMap, appendResult559_g2954 ), _NormalStrength );
				float3 m_Default9_g3415 = NORMAL_IN17_g3415;
				float3 m_Flip9_g3415 = ( NORMAL_IN17_g3415 * ase_vface );
				float3 break2_g3415 = NORMAL_IN17_g3415;
				float3 appendResult3_g3415 = (float3(break2_g3415.x , break2_g3415.y , ( break2_g3415.z * ase_vface )));
				float3 m_Mirror9_g3415 = appendResult3_g3415;
				float3 localfloat3switch9_g3415 = float3switch9_g3415( m_switch9_g3415 , m_Default9_g3415 , m_Flip9_g3415 , m_Mirror9_g3415 );
				float3 temp_output_530_11_g2954 = localfloat3switch9_g3415;
				float3 ase_worldTangent = i.ase_texcoord1.xyz;
				float3 ase_worldNormal = i.ase_texcoord2.xyz;
				float3 ase_worldBitangent = i.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal4_g3418 = temp_output_530_11_g2954;
				float3 worldNormal4_g3418 = float3(dot(tanToWorld0,tanNormal4_g3418), dot(tanToWorld1,tanNormal4_g3418), dot(tanToWorld2,tanNormal4_g3418));
				float eyeDepth = i.ase_texcoord.z;
				float temp_output_11_0_g3418 = ( -1.0 / UNITY_MATRIX_P[2].z );
				float temp_output_5_0_g3418 = ( ( eyeDepth + temp_output_11_0_g3418 ) / temp_output_11_0_g3418 );
				float4 appendResult18_g3418 = (float4((worldNormal4_g3418*0.5 + 0.5) , temp_output_5_0_g3418));
				
				float2 CUSTOM_UV1263_g2954 = appendResult559_g2954;
				
				int m_switch845_g2954 = _SmoothnessType;
				float4 tex2DNode28_g2954 = tex2D( _SmoothnessMap, CUSTOM_UV1263_g2954 );
				float4 m_Smoothness845_g2954 = tex2DNode28_g2954;
				float4 m_Roughness845_g2954 = ( 1.0 - tex2DNode28_g2954 );
				float4 localfloat4switch845_g2954 = float4switch845_g2954( m_switch845_g2954 , m_Smoothness845_g2954 , m_Roughness845_g2954 );
				
				float4 color749_g2954 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_6 = (i.ase_color.a).xxxx;
				float4 lerpResult39_g2954 = lerp( tex2D( _OcclusionMap, CUSTOM_UV1263_g2954 ) , temp_cast_6 , (float)_OcclusionSourceMode);
				float4 lerpResult29_g2954 = lerp( color749_g2954 , lerpResult39_g2954 , _OcclusionStrengthAO);
				
				float ALBEDO_A716_g2954 = tex2DNode57_g2954.a;
				clip( ALBEDO_A716_g2954 - ( 1.0 - _AlphaCutoffBias ));
				float temp_output_741_0_g2954 = saturate( ( ( ALBEDO_A716_g2954 / max( fwidth( ALBEDO_A716_g2954 ) , 0.0001 ) ) + 0.5 ) );
				

				outGBuffer0 = appendResult14_g3418;
				outGBuffer1 = appendResult18_g3418;
				outGBuffer2 = ( _MetallicStrength * tex2D( _MetallicGlossMap, CUSTOM_UV1263_g2954 ) );
				outGBuffer3 = ( _SmoothnessStrength * localfloat4switch845_g2954 );
				outGBuffer4 = lerpResult29_g2954;
				outGBuffer5 = 0;
				outGBuffer6 = 0;
				outGBuffer7 = 0;
				float alpha = temp_output_741_0_g2954;
				clip( alpha );
				outDepth = i.pos.z;
			}
			ENDCG
		}
	}
	
	CustomEditor "ASEMaterialInspector"
	
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;-1359.643;695.2036;1.114199;True;False
Node;AmplifyShaderEditor.CommentaryNode;215;2739.112,-457.1646;Inherit;False;209;117;Header;1;218;GLOBAL SETTINGS ;0.2865956,1,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;221;1734.864,-279.4958;Inherit;False;DECSF Master Map Cutout;1;;2954;000f89ea707009441837de6c4e59b637;23,684,0,666,0,553,0,489,0,470,0,512,0,688,0,433,0,446,0,364,1,398,1,323,1,499,1,595,0,190,0,760,0,753,0,390,0,356,0,500,0,399,0,461,0,467,0;2;756;FLOAT3;0,0,0;False;847;FLOAT4;0,0,0,0;False;13;FLOAT4;189;FLOAT3;95;COLOR;100;FLOAT4;97;COLOR;99;FLOAT;403;FLOAT;96;FLOAT;600;FLOAT;480;FLOAT4;258;FLOAT4;259;FLOAT3;401;FLOAT3;757
Node;AmplifyShaderEditor.FunctionNode;222;2334.743,-334.7993;Inherit;False;DECSF Module Impostors;-1;;3418;c564d5a6cd3366f40b5b50f48f502a01;1,8,0;2;6;FLOAT4;0,0,0,0;False;12;FLOAT3;0,0,0;False;3;FLOAT4;22;FLOAT4;23;FLOAT;21
Node;AmplifyShaderEditor.IntNode;218;2758.225,-418.3526;Inherit;False;Property;_CullMode;Cull Mode;0;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;224;2750,-275;Float;False;True;-1;2;ASEMaterialInspector;100;9;Hidden/DEC ASE Impostors Bake Shader;f53051a8190f7044fa936bd7fbe116c1;True;Unlit;0;0;Unlit;10;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;4;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;0;0;1;True;False;;False;0
WireConnection;222;6;221;189
WireConnection;222;12;221;95
WireConnection;224;0;222;22
WireConnection;224;1;222;23
WireConnection;224;2;221;100
WireConnection;224;3;221;97
WireConnection;224;4;221;99
WireConnection;224;8;221;96
ASEEND*/
//CHKSM=95B77C63D81709E9217B5B0B4EABE17364309EAB