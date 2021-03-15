// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/DEC Core Debug Shader"
{
	Properties
	{
		[Header(VERSION 1.4.0 STANDARD)][Header(DEBUG SETTINGS)][Enum(VertexColor,0,VertexTangent,1,VertexNormal,2,BakedAO,3,BakedTranslucency,4,WorldNormal,5)]_MCoreDebugMode("Debug Mode", Int) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		_MCoreDebugStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.95
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		AlphaToMask [_AlphatoCoverage]
		ColorMask [_ColorMask]
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow 
		struct Input
		{
			float4 vertexColor : COLOR;
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv4_texcoord4;
		};

		uniform int _CullMode;
		uniform int _ZWriteMode;
		uniform int _ColorMask;
		uniform float _AlphatoCoverage;
		uniform int _MCoreDebugMode;
		uniform float _MCoreDebugStrengthAO;


		float4 float4switch603( int m_switch, float4 m_VertexColor, float4 m_VertexTangent, float4 m_VertexNormal, float4 m_BakedAO, float4 m_BakedTranslucency, float4 m_WorldNormal )
		{
			if(m_switch ==0)
			    return m_VertexColor;
			else if(m_switch ==1)
			    return m_VertexTangent;
			else if(m_switch ==2)
			    return m_VertexNormal;
			else if(m_switch ==3)
			    return m_BakedAO;
			else if(m_switch ==4)
			    return m_BakedTranslucency;
			else if(m_switch ==5)
			    return m_WorldNormal;
			else
			return float4(0,0,0,0);
		}


		float3 float3switch605( int m_switch, float3 m_VertexColor, float3 m_VertexTangent, float3 m_VertexNormal, float3 m_BakedAO, float3 m_BakedTranslucency, float3 m_WorldNormal )
		{
			if(m_switch ==0)
			    return m_VertexColor;
			else if(m_switch ==1)
			    return m_VertexTangent;
			else if(m_switch ==2)
			    return m_VertexNormal;
			else if(m_switch ==3)
			    return m_BakedAO;
			else if(m_switch ==4)
			    return m_BakedTranslucency;
			else if(m_switch ==5)
			    return m_WorldNormal;
			else
			return float3(0,0,0);
		}


		float2 float2switch606( int m_switch, float2 m_VertexColor, float2 m_VertexTangent, float2 m_VertexNormal, float2 m_BakedAO, float2 m_BakedTranslucency, float2 m_WorldNormal )
		{
			if(m_switch ==0)
			    return m_VertexColor;
			else if(m_switch ==1)
			    return m_VertexTangent;
			else if(m_switch ==2)
			    return m_VertexNormal;
			else if(m_switch ==3)
			    return m_BakedAO;
			else if(m_switch ==4)
			    return m_BakedTranslucency;
			else if(m_switch ==5)
			    return m_WorldNormal;
			else
			return float2(0,0);
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Normal = float3(0,0,1);
			int m_switch603 = _MCoreDebugMode;
			float4 m_VertexColor603 = i.vertexColor;
			float4 m_VertexTangent603 = float4( 0,0,0,0 );
			float4 m_VertexNormal603 = float4( 0,0,0,0 );
			float lerpResult970 = lerp( i.vertexColor.a , 0.0 , _MCoreDebugStrengthAO);
			float4 temp_cast_1 = (lerpResult970).xxxx;
			float4 m_BakedAO603 = temp_cast_1;
			float4 m_BakedTranslucency603 = float4( 0,0,0,0 );
			float4 m_WorldNormal603 = float4( 0,0,0,0 );
			float4 localfloat4switch603 = float4switch603( m_switch603 , m_VertexColor603 , m_VertexTangent603 , m_VertexNormal603 , m_BakedAO603 , m_BakedTranslucency603 , m_WorldNormal603 );
			int m_switch605 = _MCoreDebugMode;
			float3 m_VertexColor605 = float3( 0,0,0 );
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float4 ase_vertexTangent = mul( unity_WorldToObject, float4( ase_worldTangent, 0 ) );
			float3 m_VertexTangent605 = ase_vertexTangent.xyz;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 m_VertexNormal605 = ase_vertexNormal;
			float3 m_BakedAO605 = float3( 0,0,0 );
			float3 m_BakedTranslucency605 = float3( 0,0,0 );
			float3 m_WorldNormal605 = ase_worldNormal;
			float3 localfloat3switch605 = float3switch605( m_switch605 , m_VertexColor605 , m_VertexTangent605 , m_VertexNormal605 , m_BakedAO605 , m_BakedTranslucency605 , m_WorldNormal605 );
			int m_switch606 = _MCoreDebugMode;
			float2 m_VertexColor606 = float2( 0,0 );
			float2 m_VertexTangent606 = float2( 0,0 );
			float2 m_VertexNormal606 = float2( 0,0 );
			float2 m_BakedAO606 = float2( 0,0 );
			float2 temp_cast_4 = (i.uv4_texcoord4.x).xx;
			float2 m_BakedTranslucency606 = temp_cast_4;
			float2 m_WorldNormal606 = float2( 0,0 );
			float2 localfloat2switch606 = float2switch606( m_switch606 , m_VertexColor606 , m_VertexTangent606 , m_VertexNormal606 , m_BakedAO606 , m_BakedTranslucency606 , m_WorldNormal606 );
			o.Emission = ( localfloat4switch603 + float4( localfloat3switch605 , 0.0 ) + float4( localfloat2switch606, 0.0 , 0.0 ) ).xyz;
			o.Alpha = 1;
		}

		ENDCG
	}
}
/*ASEBEGIN
Version=18713
1976;274;1601;804;2010.487;885.9872;1.350081;True;False
Node;AmplifyShaderEditor.CommentaryNode;972;-943.6895,-670.4902;Inherit;False;231.7154;142.0486;Header;1;598;;0.2272818,0.9622642,0,1;0;0
Node;AmplifyShaderEditor.VertexColorNode;1;-1152.402,-378.0511;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;971;-1115.494,-202.7355;Inherit;False;Constant;_Float0;Float 0;9;0;Create;True;1;;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;965;-1233.863,-127.61;Inherit;False;Property;_MCoreDebugStrengthAO;Occlusion Strength;6;0;Create;False;1;;0;0;False;0;False;0.95;0.95;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;299;-1014.147,485.1603;Inherit;False;3;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TangentVertexDataNode;284;-1007.076,-4.16058;Inherit;False;1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;598;-912.5906,-619.1401;Inherit;False;Property;_MCoreDebugMode;Debug Mode;1;2;[Header];[Enum];Create;False;2;VERSION 1.4.0 STANDARD;DEBUG SETTINGS;6;VertexColor;0;VertexTangent;1;VertexNormal;2;BakedAO;3;BakedTranslucency;4;WorldNormal;5;0;False;0;False;0;3;False;0;1;INT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;241;-1001.171,158.362;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;961;-1002.996,301.8294;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;970;-935.3565,-239.7043;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;288;-14.80623,-713.7282;Inherit;False;341.5028;250.4201;;4;295;293;292;291;DEBUG SETTINGS ;0,0,0,1;0;0
Node;AmplifyShaderEditor.CustomExpressionNode;605;-662.8964,-3.183925;Inherit;False;if(m_switch ==0)$    return m_VertexColor@$else if(m_switch ==1)$    return m_VertexTangent@$else if(m_switch ==2)$    return m_VertexNormal@$else if(m_switch ==3)$    return m_BakedAO@$else if(m_switch ==4)$    return m_BakedTranslucency@$else if(m_switch ==5)$    return m_WorldNormal@$else$return float3(0,0,0)@;3;False;7;True;m_switch;INT;0;In;;Inherit;False;True;m_VertexColor;FLOAT3;0,0,0;In;;Inherit;False;True;m_VertexTangent;FLOAT3;0,0,0;In;;Inherit;False;True;m_VertexNormal;FLOAT3;0,0,0;In;;Inherit;False;True;m_BakedAO;FLOAT3;0,0,0;In;;Inherit;False;True;m_BakedTranslucency;FLOAT3;0,0,0;In;;Inherit;False;True;m_WorldNormal;FLOAT3;0,0,0;In;;Inherit;False;float3 switch ;True;False;0;7;0;INT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;603;-655.3964,-398.9522;Inherit;False;if(m_switch ==0)$    return m_VertexColor@$else if(m_switch ==1)$    return m_VertexTangent@$else if(m_switch ==2)$    return m_VertexNormal@$else if(m_switch ==3)$    return m_BakedAO@$else if(m_switch ==4)$    return m_BakedTranslucency@$else if(m_switch ==5)$    return m_WorldNormal@$else$return float4(0,0,0,0)@;4;False;7;True;m_switch;INT;0;In;;Inherit;False;True;m_VertexColor;FLOAT4;0,0,0,0;In;;Inherit;False;True;m_VertexTangent;FLOAT4;0,0,0,0;In;;Inherit;False;True;m_VertexNormal;FLOAT4;0,0,0,0;In;;Inherit;False;True;m_BakedAO;FLOAT4;0,0,0,0;In;;Inherit;False;True;m_BakedTranslucency;FLOAT4;0,0,0,0;In;;Inherit;False;True;m_WorldNormal;FLOAT4;0,0,0,0;In;;Inherit;False;float4 switch ;True;False;0;7;0;INT;0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CustomExpressionNode;606;-663.9494,392.5342;Inherit;False;if(m_switch ==0)$    return m_VertexColor@$else if(m_switch ==1)$    return m_VertexTangent@$else if(m_switch ==2)$    return m_VertexNormal@$else if(m_switch ==3)$    return m_BakedAO@$else if(m_switch ==4)$    return m_BakedTranslucency@$else if(m_switch ==5)$    return m_WorldNormal@$else$return float2(0,0)@;2;False;7;True;m_switch;INT;0;In;;Inherit;False;True;m_VertexColor;FLOAT2;0,0;In;;Inherit;False;True;m_VertexTangent;FLOAT2;0,0;In;;Inherit;False;True;m_VertexNormal;FLOAT2;0,0;In;;Inherit;False;True;m_BakedAO;FLOAT2;0,0;In;;Inherit;False;True;m_BakedTranslucency;FLOAT2;0,0;In;;Inherit;False;True;m_WorldNormal;FLOAT2;0,0;In;;Inherit;False;float2 switch ;True;False;0;7;0;INT;0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;289;-4.888813,-890.1624;Inherit;False;352;119;;1;290;GLOBAL SETTINGS ;0.09433961,0.09433961,0.09433961,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;604;-277.3181,-399.5818;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.IntNode;290;2.48241,-860.1966;Inherit;False;Property;_CullMode;Cull Mode;2;1;[Enum];Create;False;1;;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;295;175.0897,-680.9038;Inherit;False;Property;_ZWriteMode;ZWrite Mode;3;1;[Enum];Create;False;1;;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;291;-6.643163,-678.6977;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;292;-7.442219,-609.525;Inherit;False;Property;_ColorMask;Color Mask Mode;4;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-6.815205,-541.1588;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;5;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;908;-18.96703,-440.4294;Float;False;True;-1;2;;0;0;Standard;Hidden/DEC Core Debug Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;True;295;3;False;294;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Opaque;;Geometry;All;14;all;True;True;True;True;0;True;292;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;True;290;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;True;293;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;970;0;1;4
WireConnection;970;1;971;0
WireConnection;970;2;965;0
WireConnection;605;0;598;0
WireConnection;605;2;284;0
WireConnection;605;3;241;0
WireConnection;605;6;961;0
WireConnection;603;0;598;0
WireConnection;603;1;1;0
WireConnection;603;4;970;0
WireConnection;606;0;598;0
WireConnection;606;5;299;1
WireConnection;604;0;603;0
WireConnection;604;1;605;0
WireConnection;604;2;606;0
WireConnection;908;2;604;0
ASEEND*/
//CHKSM=36D1B0DC96DEB3F5811A68F36FCFA77FC5A33D12