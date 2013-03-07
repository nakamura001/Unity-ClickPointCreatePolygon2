Shader "Example/ScreenPos" {
	Properties {
		_MainTex ("Texture", 2D) = "white" { }
	}
	SubShader {
		Tags { "RenderType" = "Opaque" "LightMode" = "Vertex" }
		CGPROGRAM
		#pragma surface surf Lambert
		struct Input {
			float2 uv_MainTex;
			float4 screenPos;
		};
		sampler2D _MainTex;
		sampler2D _Detail;
		void surf (Input IN, inout SurfaceOutput o) {
			float2 screenUV = IN.screenPos.xy / IN.screenPos.w*0.5;
			screenUV *= float2(2.0,1.5);
			o.Albedo = tex2D (_MainTex, screenUV).rgb;
		}
		ENDCG
	} 
	Fallback "Diffuse"
}