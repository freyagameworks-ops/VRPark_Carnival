// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Geometry/Prop Vertex Lit (Polygonal)"
{
	Properties
	{
		[StyledCategory(Render Settings, 5, 10)]_CategoryRender("[ Category Render]", Float) = 0
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Space(10)]_RenderDirect("Render Lighting", Range( 0 , 1)) = 1
		_RenderAmbient("Render Ambient", Range( 0 , 1)) = 1
		_RenderShadow("Render Shadow", Range( 0 , 1)) = 1
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Alpha To Mask", Float) = 1
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceRenderFade("# Space Render Fade", Float) = 0
		[StyledCategory(Global Settings)]_CategoryGlobal("[ Category Global ]", Float) = 0
		[StyledEnum(TVEExtrasLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		[StyledSpace(10)]_SpaceGlobalOptions("# Space Global Options", Float) = 0
		[StyledToggle]_ExtrasPositionMode("Use Pivot Position for Extras", Float) = 0
		[StyledCategory(Main Settings)]_CategoryMain("[ Category Main ]", Float) = 0
		[StyledMessage(Info, Use the Main Mask Blue channel to control the mask for Global Color__ Main Colors__ Gradient Tinting and Motion Flutter when available., 0, 10)]_MessagePolygonalMask("# Message Polygonal Mask", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Enum(Constant,0,Dual Color,1)]_MainColorMode("Main Color", Float) = 0
		[HDR][Space(10)]_MainColor("Main Color", Color) = (1,1,1,1)
		[HDR]_MainColorTwo("Main ColorB", Color) = (1,1,1,1)
		[Space(10)][StyledToggle]_VertexColorMode("Use Vertex Color for Albedo", Range( 0 , 1)) = 0
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 0
		[HDR]_GradientColorOne("Gradient ColorA", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient ColorB", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Mask Max ", Range( 0 , 1)) = 1
		[Space(10)][DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		_MainAlbedoValue("Main Albedo", Range( 0 , 1)) = 1
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# Space Subsurface", Float) = 0
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive ]", Float) = 0
		[Enum(Off,0,On,1)]_EmissiveMode("Emissive Mode", Float) = 0
		[Enum(None,0,Any,1,Baked,2,Realtime,3)]_EmissiveFlagMode("Emissive GI", Float) = 0
		[Enum(Nits,0,EV100,1)]_EmissiveIntensityMode("Emissive Power", Float) = 0
		_EmissiveIntensityValue("Emissive Power", Float) = 1
		[StyledCategory(Size Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 0
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 0
		[HideInInspector][StyledToggle]_VertexPivotMode("Enable Pre Baked Pivots", Float) = 0
		[HideInInspector][StyledToggle]_VertexDynamicMode("Enable Dynamic Support", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector]_Cutoff("Legacy Cutoff", Range( 0 , 1)) = 0.5
		[HideInInspector]_Color("Legacy Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("Legacy MainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("Legacy BumpMap", 2D) = "white" {}
		[HideInInspector]_LayerReactValue("Legacy Layer React", Float) = 0
		[HideInInspector]_MaxBoundsInfo("Legacy Bounds Info", Vector) = (1,1,1,1)
		[HideInInspector]_LeavesFilterColor("Legacy Filter Color", Color) = (0,0,0,1)
		[HideInInspector]_LeavesFilterMode("Legacy Filter Mode", Float) = 0
		[HideInInspector]_MotionValue_30("_MotionValue_30", Float) = 1
		[HideInInspector]_IsPolygonalShader("_IsPolygonalShader", Float) = 1
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsCustomShader("_IsCustomShader", Float) = 0
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1230
		[HideInInspector]_render_shadow("_render_shadow", Float) = 1
		[HideInInspector]_render_direct("_render_direct", Float) = 1
		[HideInInspector]_render_ambient("_render_ambient", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1
		[HideInInspector]_render_coverage("_render_coverage", Float) = 0
		[HideInInspector]_IsVertexShader("_IsVertexShader", Float) = 1
		[HideInInspector]_IsPropShader("_IsPropShader", Float) = 1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull [_render_cull]
		ZWrite [_render_zw]
		Blend [_render_src] [_render_dst]
		
		AlphaToMask [_render_coverage]
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 4.5
		#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
		//SHADER INJECTION POINT BEGIN
		//SHADER INJECTION POINT END
		#define THE_VEGETATION_ENGINE
		#define TVE_IS_STANDARD_PIPELINE
		#define TVE_IS_BASIC_SHADER
		#define TVE_IS_PROP_SHADER
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
		#endif//ASE Sampling Macros

		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows noambient novertexlights nolightmap  nodynlightmap nodirlightmap nometa noforwardadd dithercrossfade vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float3 vertexToFrag86_g76318;
			float4 uv_texcoord;
			float4 vertexColor : COLOR;
			float4 vertexToFrag11_g76495;
			float vertexToFrag11_g76465;
			float3 vertexToFrag5095_g76410;
			float3 worldNormal;
			float3 vertexToFrag3890_g76410;
			float3 worldPos;
			float3 vertexToFrag4224_g76410;
		};

		uniform half _render_cull;
		uniform half _render_coverage;
		uniform half _render_src;
		uniform half _render_dst;
		uniform half _render_zw;
		uniform float _IsVertexShader;
		uniform float _IsPropShader;
		uniform half _RenderDecals;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		SamplerState sampler_MainTex;
		uniform half _RenderZWrite;
		uniform half _RenderClip;
		uniform half _RenderCoverage;
		uniform half _RenderSSR;
		uniform half _RenderMode;
		uniform half _RenderQueue;
		uniform half _RenderPriority;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		SamplerState sampler_BumpMap;
		uniform half _RenderCull;
		uniform float _SubsurfaceDiffusion;
		uniform half _SpaceRenderFade;
		uniform half _CategoryRender;
		uniform half _CategoryGlobal;
		uniform half _CategoryMain;
		uniform half _CategoryGradient;
		uniform half _CategorySizeFade;
		uniform half _CategoryMotion;
		uniform half _CategoryEmissive;
		uniform float4 _SubsurfaceDiffusion_Asset;
		uniform half _IsPolygonalShader;
		uniform half _IsTVEShader;
		uniform half _HasOcclusion;
		uniform half _IsIdentifier;
		uniform half _IsCollected;
		uniform half _IsShared;
		uniform half _IsCustomShader;
		uniform half _HasGradient;
		uniform half _HasEmissive;
		uniform half _VertexVariationMode;
		uniform half _IsVersion;
		uniform half4 _LeavesFilterColor;
		uniform half _RenderDirect;
		uniform half _RenderAmbient;
		uniform half _RenderShadow;
		uniform half4 _Color;
		uniform float4 _MaxBoundsInfo;
		uniform half _LayerReactValue;
		uniform half _Cutoff;
		uniform half _LeavesFilterMode;
		uniform half4 _GradientMaskRemap;
		uniform half _SpaceGlobalOptions;
		uniform half _SpaceGlobalLayers;
		uniform half _SpaceGlobalLocals;
		uniform half _MotionValue_30;
		uniform half _SpaceSubsurface;
		uniform half _MessagePolygonalMask;
		uniform half _EmissiveFlagMode;
		uniform half _EmissiveIntensityValue;
		uniform half _EmissiveIntensityMode;
		uniform half _EmissiveMode;
		uniform half _DisableSRPBatcher;
		uniform half4 TVE_MainLightParams;
		uniform float _render_direct;
		uniform half3 TVE_MainLightDirection;
		uniform float _render_shadow;
		uniform float _render_ambient;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
		SamplerState sampler_MainAlbedoTex;
		uniform half _MainAlbedoValue;
		uniform half _VertexColorMode;
		uniform half4 _MainColorTwo;
		uniform half4 _MainColor;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
		SamplerState sampler_Linear_Repeat;
		uniform half _MainColorMode;
		uniform half4 _GradientColorTwo;
		uniform half4 _GradientColorOne;
		uniform half _GradientMinValue;
		uniform half _GradientMaxValue;
		uniform half4 TVE_OverlayColor;
		uniform half _GlobalOverlay;
		uniform half _VertexDynamicMode;
		uniform half _LayerExtrasValue;
		uniform float TVE_ExtrasUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
		uniform half4 TVE_ExtrasCoords;
		uniform half _VertexPivotMode;
		uniform half _ExtrasPositionMode;
		SamplerState sampler_Linear_Clamp;
		uniform half4 TVE_ExtrasParams;
		uniform half TVE_WetnessContrast;
		uniform half _GlobalWetness;
		uniform half _AlphaClipValue;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VertexPosition3588_g76410 = ase_vertex3Pos;
			float3 Final_VertexPosition890_g76410 = ( VertexPosition3588_g76410 + _DisableSRPBatcher );
			v.vertex.xyz = Final_VertexPosition890_g76410;
			v.vertex.w = 1;
			float3 lerpResult105_g76318 = lerp( float3( 1,1,1 ) , ( (TVE_MainLightParams).xyz * TVE_MainLightParams.w ) , _render_direct);
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			half3 World_Normal75_g76318 = ase_normWorldNormal;
			float dotResult62_g76318 = dot( TVE_MainLightDirection , World_Normal75_g76318 );
			float lerpResult107_g76318 = lerp( 1.0 , saturate( dotResult62_g76318 ) , _render_shadow);
			float3 lerpResult109_g76318 = lerp( float3( 0,0,0 ) , (unity_AmbientSky).rgb , _render_ambient);
			o.vertexToFrag86_g76318 = ( ( lerpResult105_g76318 * lerpResult107_g76318 ) + lerpResult109_g76318 );
			half2 Main_UVs15_g76410 = v.texcoord.xy;
			o.vertexToFrag11_g76495 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76410, 0.0 );
			half Mesh_Height1524_g76410 = v.color.a;
			float temp_output_7_0_g76464 = _GradientMinValue;
			float temp_output_10_0_g76464 = ( _GradientMaxValue - temp_output_7_0_g76464 );
			half Tint_Gradient_Value2784_g76410 = saturate( ( ( Mesh_Height1524_g76410 - temp_output_7_0_g76464 ) / ( temp_output_10_0_g76464 + 0.0001 ) ) );
			o.vertexToFrag11_g76465 = Tint_Gradient_Value2784_g76410;
			o.vertexToFrag5095_g76410 = ase_worldNormal;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			o.vertexToFrag3890_g76410 = ase_worldPos;
			float4x4 break19_g76473 = unity_ObjectToWorld;
			float3 appendResult20_g76473 = (float3(break19_g76473[ 0 ][ 3 ] , break19_g76473[ 1 ][ 3 ] , break19_g76473[ 2 ][ 3 ]));
			float3 appendResult60_g76462 = (float3(v.texcoord3.x , v.texcoord3.z , v.texcoord3.y));
			half3 Mesh_PivotsData4924_g76410 = ( appendResult60_g76462 * _VertexPivotMode );
			float3 temp_output_122_0_g76473 = Mesh_PivotsData4924_g76410;
			float3 PivotsOnly105_g76473 = (mul( unity_ObjectToWorld, float4( temp_output_122_0_g76473 , 0.0 ) ).xyz).xyz;
			half3 ObjectData20_g76475 = ( appendResult20_g76473 + PivotsOnly105_g76473 );
			half3 WorldData19_g76475 = ase_worldPos;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76475 = WorldData19_g76475;
			#else
				float3 staticSwitch14_g76475 = ObjectData20_g76475;
			#endif
			float3 temp_output_114_0_g76473 = staticSwitch14_g76475;
			o.vertexToFrag4224_g76410 = temp_output_114_0_g76473;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			half2 Main_UVs15_g76410 = i.uv_texcoord.xy;
			float4 tex2DNode29_g76410 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76410 );
			float3 lerpResult5342_g76410 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76410).rgb , _MainAlbedoValue);
			half3 Vertex_Color5344_g76410 = (i.vertexColor).rgb;
			float3 lerpResult4812_g76410 = lerp( lerpResult5342_g76410 , Vertex_Color5344_g76410 , _VertexColorMode);
			float4 break5051_g76410 = i.vertexToFrag11_g76495;
			half Main_Mask57_g76410 = break5051_g76410.b;
			float lerpResult5346_g76410 = lerp( 1.0 , Main_Mask57_g76410 , _MainColorMode);
			float4 lerpResult5328_g76410 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76410);
			half3 Main_Color_RGB5335_g76410 = (lerpResult5328_g76410).rgb;
			half3 Main_Albedo99_g76410 = ( lerpResult4812_g76410 * Main_Color_RGB5335_g76410 );
			float3 temp_cast_0 = (1.0).xxx;
			float3 lerpResult2779_g76410 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , i.vertexToFrag11_g76465);
			float3 lerpResult5052_g76410 = lerp( temp_cast_0 , lerpResult2779_g76410 , Main_Mask57_g76410);
			half3 Tint_Gradient_Color5252_g76410 = lerpResult5052_g76410;
			half3 Blend_Albedo_Tinted2808_g76410 = ( Main_Albedo99_g76410 * Tint_Gradient_Color5252_g76410 );
			half3 Blend_Albedo_Colored863_g76410 = Blend_Albedo_Tinted2808_g76410;
			half3 Global_OverlayColor1758_g76410 = (TVE_OverlayColor).rgb;
			half3 World_Normal5097_g76410 = i.vertexToFrag5095_g76410;
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			ase_vertexNormal = normalize( ase_vertexNormal );
			half Global_DynamicMode5093_g76410 = _VertexDynamicMode;
			float lerpResult5116_g76410 = lerp( (World_Normal5097_g76410).y , ase_vertexNormal.y , Global_DynamicMode5093_g76410);
			half Overlay_Mask_Projection5120_g76410 = saturate( lerpResult5116_g76410 );
			float temp_output_84_0_g76419 = _LayerExtrasValue;
			float temp_output_19_0_g76423 = TVE_ExtrasUsage[(int)temp_output_84_0_g76419];
			float4 temp_output_93_19_g76419 = TVE_ExtrasCoords;
			float3 WorldPosition3905_g76410 = i.vertexToFrag3890_g76410;
			float3 ObjectPosition4223_g76410 = i.vertexToFrag4224_g76410;
			float3 lerpResult4873_g76410 = lerp( WorldPosition3905_g76410 , ObjectPosition4223_g76410 , _ExtrasPositionMode);
			half2 UV96_g76419 = ( (temp_output_93_19_g76419).zw + ( (temp_output_93_19_g76419).xy * (lerpResult4873_g76410).xz ) );
			float4 tex2DArrayNode48_g76419 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g76419,temp_output_84_0_g76419), 0.0 );
			float4 temp_output_17_0_g76423 = tex2DArrayNode48_g76419;
			float4 temp_output_94_85_g76419 = TVE_ExtrasParams;
			float4 temp_output_3_0_g76423 = temp_output_94_85_g76419;
			float4 ifLocalVar18_g76423 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g76423 >= 0.5 )
				ifLocalVar18_g76423 = temp_output_17_0_g76423;
			else
				ifLocalVar18_g76423 = temp_output_3_0_g76423;
			float4 lerpResult22_g76423 = lerp( temp_output_3_0_g76423 , temp_output_17_0_g76423 , temp_output_19_0_g76423);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76423 = lerpResult22_g76423;
			#else
				float4 staticSwitch24_g76423 = ifLocalVar18_g76423;
			#endif
			half4 Global_Extras_Params4995_g76410 = staticSwitch24_g76423;
			float4 break456_g76431 = Global_Extras_Params4995_g76410;
			half Global_Extras_Overlay156_g76410 = break456_g76431.z;
			half Overlay_Mask269_g76410 = ( _GlobalOverlay * Overlay_Mask_Projection5120_g76410 * Global_Extras_Overlay156_g76410 );
			float3 lerpResult336_g76410 = lerp( Blend_Albedo_Colored863_g76410 , Global_OverlayColor1758_g76410 , Overlay_Mask269_g76410);
			half3 Blend_Albedo_Overlay359_g76410 = lerpResult336_g76410;
			half Global_WetnessContrast5191_g76410 = TVE_WetnessContrast;
			half Global_Extras_Wetness305_g76410 = break456_g76431.y;
			half Wetness_Value5174_g76410 = ( Global_Extras_Wetness305_g76410 * _GlobalWetness );
			float3 lerpResult5186_g76410 = lerp( Blend_Albedo_Overlay359_g76410 , ( Blend_Albedo_Overlay359_g76410 * Blend_Albedo_Overlay359_g76410 ) , ( Global_WetnessContrast5191_g76410 * Wetness_Value5174_g76410 ));
			half3 Blend_Albedo_Wetness5182_g76410 = lerpResult5186_g76410;
			half3 Blend_Albedo_Subsurface149_g76410 = Blend_Albedo_Wetness5182_g76410;
			half3 Main_Albedo70_g76318 = Blend_Albedo_Subsurface149_g76410;
			o.Emission = ( i.vertexToFrag86_g76318 * Main_Albedo70_g76318 );
			float localCustomAlphaClip19_g76472 = ( 0.0 );
			float Main_Alpha316_g76410 = tex2DNode29_g76410.a;
			half AlphaTreshold2132_g76410 = _AlphaClipValue;
			half Fade_Alpha4990_g76410 = 1.0;
			half Final_Alpha5254_g76410 = min( ( Main_Alpha316_g76410 - AlphaTreshold2132_g76410 ) , Fade_Alpha4990_g76410 );
			float temp_output_3_0_g76472 = Final_Alpha5254_g76410;
			float Alpha19_g76472 = temp_output_3_0_g76472;
			float temp_output_15_0_g76472 = 0.01;
			float Treshold19_g76472 = temp_output_15_0_g76472;
			{
			#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
			#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
					clip(Alpha19_g76472 - Treshold19_g76472);
				#endif
			#else
				clip(Alpha19_g76472 - Treshold19_g76472);
			#endif
			#endif
			}
			half Main_Color_Alpha5337_g76410 = (lerpResult5328_g76410).a;
			half Final_Clip914_g76410 = saturate( ( Alpha19_g76472 * Main_Color_Alpha5337_g76410 ) );
			o.Alpha = Final_Clip914_g76410;
		}

		ENDCG
	}
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.FunctionNode;480;-1920,-384;Inherit;False;Compute Lighting Vertex;133;;76318;40e1ef0a39540cb46929883ebf1eb187;0;1;69;FLOAT3;0,0,0;False;1;FLOAT3;53
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;137;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;479;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;141;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;138;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;139;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;140;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1282.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1279.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;340;-2176,256;Inherit;False;1280.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.FunctionNode;384;-2176,384;Inherit;False;Define Pipeline Standard;-1;;76319;9af03ae8defe78d448ef2a4ef3601e12;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;482;-1920,384;Inherit;False;Define Lighting Vertex;143;;76320;22bd65fb26ef51b4580769eaf56a20b5;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;431;-1088,384;Inherit;False;Compile All Shaders;-1;;76321;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;474;-1280,384;Inherit;False;Compile Polygonal;-1;;76322;f2db24258d28b2a4885b7bfa20c80bc2;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;383;-1152,-384;Float;False;True;-1;5;TVEShaderCoreGUI;0;0;Unlit;BOXOPHOBIC/The Vegetation Engine/Geometry/Prop Vertex Lit (Polygonal);False;False;False;False;True;True;True;True;True;False;True;True;True;False;False;False;False;False;False;False;True;Back;0;True;_render_zw;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;1;0;True;_render_src;0;True;_render_dst;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;142;-1;-1;-1;0;False;0;0;True;_render_cull;-1;0;False;;0;0;0;False;0.1;False;;0;True;_render_coverage;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.FunctionNode;483;-1664,384;Inherit;False;Define ShaderType Prop;145;;76409;96e31a47d32deff49ba83d5b364f536d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;478;-2176,-384;Inherit;False;Base Polygonal;0;;76410;69ac49dc448658e459ede3d88c745447;43,5351,1,5257,0,4028,1,3900,1,3908,1,4172,1,3586,0,4499,0,1708,0,1717,1,1714,1,1718,1,3475,1,5170,1,4210,0,1745,1,3479,0,5156,1,1646,0,3501,0,2807,1,3886,0,5249,0,4981,0,5196,0,4976,0,3728,1,4980,0,1742,1,3484,0,860,1,2261,1,2260,1,2062,1,2039,1,5278,1,5280,1,4217,1,5226,1,5276,0,4931,1,4919,1,5274,0;2;5251;FLOAT3;1,1,1;False;5275;FLOAT3;0,0,0;False;19;FLOAT3;0;FLOAT3;2489;FLOAT;4135;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4127;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;4966;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;4993;FLOAT;629;FLOAT3;534
WireConnection;480;69;478;0
WireConnection;383;2;480;53
WireConnection;383;9;478;532
WireConnection;383;11;478;534
ASEEND*/
//CHKSM=A00A5FAE86B1DEED532FE0AA165965B549AED437
