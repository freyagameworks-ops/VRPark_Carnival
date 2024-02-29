// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Geometry/Plant Vertex Lit (Polygonal)"
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
		[StyledEnum(TVEColorsLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerColorsValue("Layer Colors", Float) = 0
		[StyledEnum(TVEExtrasLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVEMotionLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVEVertexLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalColors("Global Color", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		_ColorsIntensityValue("Color Intensity", Range( 0 , 2)) = 1
		[StyledSpace(10)]_SpaceGlobalOptions("# Space Global Options", Float) = 0
		[StyledToggle]_ColorsPositionMode("Use Pivot Position for Colors", Float) = 0
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
		_SizeFadeStartValue("Size Fade Start", Range( 0 , 1000)) = 0
		_SizeFadeEndValue("Size Fade End", Range( 0 , 1000)) = 0
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 0
		_MotionAmplitude_10("Motion Bending", Range( 0 , 2)) = 0.2
		_MotionPosition_10("Motion Rigidity", Range( 0 , 1)) = 0.5
		[IntRange]_MotionSpeed_10("Motion Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Motion Scale", Range( 0 , 20)) = 1
		[Space(10)]_MotionAmplitude_32("Motion Flutter", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_32("Motion Speed", Range( 0 , 40)) = 20
		_MotionScale_32("Motion Scale", Range( 0 , 20)) = 10
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 1
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
		[HideInInspector]_IsPlantShader("_IsPlantShader", Float) = 1
		[HideInInspector]_IsVertexShader("_IsVertexShader", Float) = 1
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
		#define TVE_IS_PLANT_SHADER
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
		#endif//ASE Sampling Macros

		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows noambient novertexlights nolightmap  nodynlightmap nodirlightmap nometa noforwardadd dithercrossfade vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float3 worldPos;
			float3 vertexToFrag86_g75882;
			float4 uv_texcoord;
			float4 vertexColor : COLOR;
			float4 vertexToFrag11_g76408;
			float vertexToFrag11_g76378;
			float3 vertexToFrag3890_g76323;
			float3 vertexToFrag4224_g76323;
			float3 vertexToFrag5095_g76323;
			float3 worldNormal;
		};

		uniform half _render_zw;
		uniform half _render_src;
		uniform half _render_dst;
		uniform half _render_coverage;
		uniform half _render_cull;
		uniform float _IsVertexShader;
		uniform float _IsPlantShader;
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
		uniform half _VertexPivotMode;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_NoiseTex);
		uniform float3 TVE_WorldOrigin;
		uniform half _MotionPosition_10;
		uniform float _MotionScale_10;
		uniform half TVE_NoiseTexTilling;
		uniform half4 TVE_MotionParams;
		uniform half4 TVE_TimeParams;
		uniform float _MotionSpeed_10;
		SamplerState sampler_Linear_Repeat;
		uniform half _LayerMotionValue;
		uniform float TVE_MotionUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_MotionTex);
		uniform half4 TVE_MotionCoords;
		SamplerState sampler_Linear_Clamp;
		uniform half4 TVE_WindEditor;
		uniform half _MotionAmplitude_10;
		uniform half TVE_MotionValue_10;
		uniform half _InteractionMaskValue;
		uniform half _InteractionAmplitude;
		uniform float _MotionScale_32;
		uniform float _MotionSpeed_32;
		uniform half _MotionAmplitude_32;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
		uniform half TVE_MotionFadeEnd;
		uniform half TVE_MotionFadeStart;
		uniform half TVE_MotionValue_30;
		uniform half _LayerVertexValue;
		uniform float TVE_VertexUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_VertexTex);
		uniform half4 TVE_VertexCoords;
		uniform half4 TVE_VertexParams;
		uniform half _GlobalSize;
		uniform half TVE_DistanceFadeBias;
		uniform half _SizeFadeEndValue;
		uniform half _SizeFadeStartValue;
		uniform half TVE_IsEnabled;
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
		uniform half _MainColorMode;
		uniform half4 _GradientColorTwo;
		uniform half4 _GradientColorOne;
		uniform half _GradientMinValue;
		uniform half _GradientMaxValue;
		uniform half _LayerColorsValue;
		uniform float TVE_ColorsUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ColorsTex);
		uniform half4 TVE_ColorsCoords;
		uniform half _ColorsPositionMode;
		uniform half4 TVE_ColorsParams;
		uniform half _ColorsIntensityValue;
		uniform half _GlobalColors;
		uniform half4 TVE_OverlayColor;
		uniform half _GlobalOverlay;
		uniform half _VertexDynamicMode;
		uniform half _LayerExtrasValue;
		uniform float TVE_ExtrasUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
		uniform half4 TVE_ExtrasCoords;
		uniform half _ExtrasPositionMode;
		uniform half4 TVE_ExtrasParams;
		uniform half TVE_WetnessContrast;
		uniform half _GlobalWetness;
		uniform half _AlphaClipValue;


		float2 DecodeFloatToVector2( float enc )
		{
			float2 result ;
			result.y = enc % 2048;
			result.x = floor(enc / 2048);
			return result / (2048 - 1);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VertexPosition3588_g76323 = ase_vertex3Pos;
			float3 appendResult60_g76375 = (float3(v.texcoord3.x , v.texcoord3.z , v.texcoord3.y));
			half3 Mesh_PivotsData4924_g76323 = ( appendResult60_g76375 * _VertexPivotMode );
			half3 Mesh_PivotsOS4923_g76323 = Mesh_PivotsData4924_g76323;
			float3 temp_output_4933_0_g76323 = ( VertexPosition3588_g76323 - Mesh_PivotsOS4923_g76323 );
			half3 VertexPos40_g76399 = temp_output_4933_0_g76323;
			half3 VertexPos40_g76400 = VertexPos40_g76399;
			float3 appendResult74_g76400 = (float3(VertexPos40_g76400.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g76400 = appendResult74_g76400;
			float3 break84_g76400 = VertexPos40_g76400;
			float3 appendResult81_g76400 = (float3(0.0 , break84_g76400.y , break84_g76400.z));
			half3 VertexPosOtherAxis82_g76400 = appendResult81_g76400;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 vertexToFrag3890_g76323 = ase_worldPos;
			float3 WorldPosition3905_g76323 = vertexToFrag3890_g76323;
			float3 WorldPosition_Shifted5264_g76323 = ( WorldPosition3905_g76323 - TVE_WorldOrigin );
			float4x4 break19_g76386 = unity_ObjectToWorld;
			float3 appendResult20_g76386 = (float3(break19_g76386[ 0 ][ 3 ] , break19_g76386[ 1 ][ 3 ] , break19_g76386[ 2 ][ 3 ]));
			float3 temp_output_122_0_g76386 = Mesh_PivotsData4924_g76323;
			float3 PivotsOnly105_g76386 = (mul( unity_ObjectToWorld, float4( temp_output_122_0_g76386 , 0.0 ) ).xyz).xyz;
			half3 ObjectData20_g76388 = ( appendResult20_g76386 + PivotsOnly105_g76386 );
			half3 WorldData19_g76388 = ase_worldPos;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76388 = WorldData19_g76388;
			#else
				float3 staticSwitch14_g76388 = ObjectData20_g76388;
			#endif
			float3 temp_output_114_0_g76386 = staticSwitch14_g76388;
			float3 vertexToFrag4224_g76323 = temp_output_114_0_g76386;
			float3 ObjectPosition4223_g76323 = vertexToFrag4224_g76323;
			float3 ObjectPosition_Shifted5268_g76323 = ( ObjectPosition4223_g76323 - TVE_WorldOrigin );
			float3 lerpResult5229_g76323 = lerp( WorldPosition_Shifted5264_g76323 , ObjectPosition_Shifted5268_g76323 , _MotionPosition_10);
			float3 Motion_10_Position5222_g76323 = lerpResult5229_g76323;
			half3 Input_Position419_g76359 = Motion_10_Position5222_g76323;
			float Input_MotionScale287_g76359 = ( _MotionScale_10 + 0.2 );
			half NoiseTex_Tilling735_g76359 = TVE_NoiseTexTilling;
			float2 temp_output_597_0_g76359 = (( Input_Position419_g76359 * Input_MotionScale287_g76359 * NoiseTex_Tilling735_g76359 * 0.0075 )).xz;
			float2 temp_output_447_0_g76350 = ((TVE_MotionParams).xy*2.0 + -1.0);
			half2 Global_Wind_DirectionWS4683_g76323 = temp_output_447_0_g76350;
			half2 Input_DirectionWS423_g76359 = Global_Wind_DirectionWS4683_g76323;
			float lerpResult128_g76360 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g76359 = _MotionSpeed_10;
			half Input_MotionVariation284_g76359 = 0.0;
			half Input_GlobalMeshVariation569_g76359 = 0.0;
			float temp_output_630_0_g76359 = ( ( ( lerpResult128_g76360 * Input_MotionSpeed62_g76359 ) + ( Input_MotionVariation284_g76359 * Input_GlobalMeshVariation569_g76359 ) ) * 0.03 );
			float temp_output_607_0_g76359 = frac( temp_output_630_0_g76359 );
			float4 lerpResult590_g76359 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76359 + ( -Input_DirectionWS423_g76359 * temp_output_607_0_g76359 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76359 + ( -Input_DirectionWS423_g76359 * frac( ( temp_output_630_0_g76359 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76359 - 0.5 ) ) / 0.5 ));
			half4 Noise_Complex703_g76359 = lerpResult590_g76359;
			float2 temp_output_645_0_g76359 = ((Noise_Complex703_g76359).rg*2.0 + -1.0);
			float2 break650_g76359 = temp_output_645_0_g76359;
			float3 appendResult649_g76359 = (float3(break650_g76359.x , 0.0 , break650_g76359.y));
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half2 Global_Noise_OS5008_g76323 = (( mul( unity_WorldToObject, float4( appendResult649_g76359 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_Noise_DirectionOS487_g76364 = Global_Noise_OS5008_g76323;
			float2 break448_g76350 = temp_output_447_0_g76350;
			float3 appendResult452_g76350 = (float3(break448_g76350.x , 0.0 , break448_g76350.y));
			half2 Global_Wind_DirectionOS5138_g76323 = (( mul( unity_WorldToObject, float4( appendResult452_g76350 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_Wind_DirectionOS458_g76364 = Global_Wind_DirectionOS5138_g76323;
			float temp_output_84_0_g76345 = _LayerMotionValue;
			float temp_output_19_0_g76349 = TVE_MotionUsage[(int)temp_output_84_0_g76345];
			float4 temp_output_91_19_g76345 = TVE_MotionCoords;
			half2 UV94_g76345 = ( (temp_output_91_19_g76345).zw + ( (temp_output_91_19_g76345).xy * (ObjectPosition4223_g76323).xz ) );
			float4 tex2DArrayNode50_g76345 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g76345,temp_output_84_0_g76345), 0.0 );
			float4 temp_output_17_0_g76349 = tex2DArrayNode50_g76345;
			float4 temp_output_112_19_g76345 = TVE_MotionParams;
			float4 temp_output_3_0_g76349 = temp_output_112_19_g76345;
			float4 ifLocalVar18_g76349 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g76349 >= 0.5 )
				ifLocalVar18_g76349 = temp_output_17_0_g76349;
			else
				ifLocalVar18_g76349 = temp_output_3_0_g76349;
			float4 lerpResult22_g76349 = lerp( temp_output_3_0_g76349 , temp_output_17_0_g76349 , temp_output_19_0_g76349);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76349 = lerpResult22_g76349;
			#else
				float4 staticSwitch24_g76349 = ifLocalVar18_g76349;
			#endif
			half4 Global_Motion_Params3909_g76323 = staticSwitch24_g76349;
			float4 break322_g76350 = Global_Motion_Params3909_g76323;
			float lerpResult457_g76350 = lerp( break322_g76350.z , TVE_WindEditor.z , TVE_WindEditor.w);
			float temp_output_459_0_g76350 = ( 1.0 - lerpResult457_g76350 );
			half Global_Motion_Wind2223_g76323 = ( 1.0 - ( temp_output_459_0_g76350 * temp_output_459_0_g76350 ) );
			half Input_WindPower449_g76364 = Global_Motion_Wind2223_g76323;
			float2 lerpResult516_g76364 = lerp( Input_Noise_DirectionOS487_g76364 , Input_Wind_DirectionOS458_g76364 , ( Input_WindPower449_g76364 * 0.6 ));
			half Mesh_Motion_105282_g76323 = v.color.a;
			half Input_MeshHeight388_g76364 = Mesh_Motion_105282_g76323;
			half ObjectData20_g76365 = Input_MeshHeight388_g76364;
			float enc62_g76405 = v.texcoord.w;
			float2 localDecodeFloatToVector262_g76405 = DecodeFloatToVector2( enc62_g76405 );
			float2 break63_g76405 = ( localDecodeFloatToVector262_g76405 * 100.0 );
			float Bounds_Height4944_g76323 = break63_g76405.x;
			half Input_BoundsHeight390_g76364 = Bounds_Height4944_g76323;
			half WorldData19_g76365 = ( Input_MeshHeight388_g76364 * Input_MeshHeight388_g76364 * Input_BoundsHeight390_g76364 );
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76365 = WorldData19_g76365;
			#else
				float staticSwitch14_g76365 = ObjectData20_g76365;
			#endif
			half Final_Motion10_Mask321_g76364 = ( staticSwitch14_g76365 * 2.0 );
			half Motion_10_Amplitude4617_g76323 = _MotionAmplitude_10;
			half Input_BendingAmplitude376_g76364 = Motion_10_Amplitude4617_g76323;
			half Global_MotionValue640_g76364 = TVE_MotionValue_10;
			half2 Final_Bending631_g76364 = ( lerpResult516_g76364 * ( Final_Motion10_Mask321_g76364 * Input_BendingAmplitude376_g76364 * Input_WindPower449_g76364 * Input_WindPower449_g76364 * Global_MotionValue640_g76364 ) );
			float2 appendResult433_g76350 = (float2(break322_g76350.x , break322_g76350.y));
			float2 temp_output_436_0_g76350 = (appendResult433_g76350*2.0 + -1.0);
			float2 break441_g76350 = temp_output_436_0_g76350;
			float3 appendResult440_g76350 = (float3(break441_g76350.x , 0.0 , break441_g76350.y));
			half2 Global_React_DirectionOS5005_g76323 = (( mul( unity_WorldToObject, float4( appendResult440_g76350 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_React_DirectionOS358_g76364 = Global_React_DirectionOS5005_g76323;
			float clampResult17_g76367 = clamp( Input_MeshHeight388_g76364 , 0.0001 , 0.9999 );
			float temp_output_7_0_g76366 = 0.0;
			half Input_InteractionUseMask62_g76364 = _InteractionMaskValue;
			float temp_output_10_0_g76366 = ( Input_InteractionUseMask62_g76364 - temp_output_7_0_g76366 );
			half Final_InteractionRemap594_g76364 = saturate( ( ( clampResult17_g76367 - temp_output_7_0_g76366 ) / ( temp_output_10_0_g76366 + 0.0001 ) ) );
			half ObjectData20_g76368 = Final_InteractionRemap594_g76364;
			half WorldData19_g76368 = ( Final_InteractionRemap594_g76364 * Final_InteractionRemap594_g76364 * Input_BoundsHeight390_g76364 );
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76368 = WorldData19_g76368;
			#else
				float staticSwitch14_g76368 = ObjectData20_g76368;
			#endif
			half Final_InteractionMask373_g76364 = ( staticSwitch14_g76368 * 2.0 );
			half Input_InteractionAmplitude58_g76364 = _InteractionAmplitude;
			half2 Final_Interaction632_g76364 = ( Input_React_DirectionOS358_g76364 * Final_InteractionMask373_g76364 * Input_InteractionAmplitude58_g76364 );
			half Global_Motion_Interaction66_g76323 = ( break322_g76350.w * break322_g76350.w * break322_g76350.w * break322_g76350.w );
			float Input_InteractionGlobalMask330_g76364 = Global_Motion_Interaction66_g76323;
			half Final_InteractionValue525_g76364 = saturate( ( Input_InteractionAmplitude58_g76364 * Input_InteractionGlobalMask330_g76364 ) );
			float2 lerpResult551_g76364 = lerp( Final_Bending631_g76364 , Final_Interaction632_g76364 , Final_InteractionValue525_g76364);
			float2 break364_g76364 = lerpResult551_g76364;
			float3 appendResult638_g76364 = (float3(break364_g76364.x , 0.0 , break364_g76364.y));
			half3 Motion_10_Interaction190_g76323 = appendResult638_g76364;
			half3 Angle44_g76399 = Motion_10_Interaction190_g76323;
			half Angle44_g76400 = (Angle44_g76399).z;
			half3 VertexPos40_g76401 = ( VertexPosRotationAxis50_g76400 + ( VertexPosOtherAxis82_g76400 * cos( Angle44_g76400 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76400 ) * sin( Angle44_g76400 ) ) );
			float3 appendResult74_g76401 = (float3(0.0 , 0.0 , VertexPos40_g76401.z));
			half3 VertexPosRotationAxis50_g76401 = appendResult74_g76401;
			float3 break84_g76401 = VertexPos40_g76401;
			float3 appendResult81_g76401 = (float3(break84_g76401.x , break84_g76401.y , 0.0));
			half3 VertexPosOtherAxis82_g76401 = appendResult81_g76401;
			half Angle44_g76401 = -(Angle44_g76399).x;
			half3 Input_Position500_g76369 = WorldPosition_Shifted5264_g76323;
			half Input_MotionScale321_g76369 = _MotionScale_32;
			half Input_MotionVariation330_g76369 = 0.0;
			half Input_GlobalVariation372_g76369 = 0.0;
			float lerpResult128_g76370 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g76369 = _MotionSpeed_32;
			float4 tex2DNode460_g76369 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76369).xz * Input_MotionScale321_g76369 * 0.03 ) + ( Input_MotionVariation330_g76369 * Input_GlobalVariation372_g76369 ) + ( lerpResult128_g76370 * Input_MotionSpeed62_g76369 * 0.02 ) ), 0.0 );
			float3 appendResult462_g76369 = (float3(tex2DNode460_g76369.r , tex2DNode460_g76369.g , tex2DNode460_g76369.b));
			half3 Flutter_Texture489_g76369 = (appendResult462_g76369*2.0 + -1.0);
			half2 Main_UVs15_g76323 = v.texcoord.xy;
			float4 vertexToFrag11_g76408 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76323, 0.0 );
			float4 break5051_g76323 = vertexToFrag11_g76408;
			half Main_Mask57_g76323 = break5051_g76323.b;
			float temp_output_7_0_g76374 = TVE_MotionFadeEnd;
			float temp_output_10_0_g76374 = ( TVE_MotionFadeStart - temp_output_7_0_g76374 );
			half Wind_FadeOut4005_g76323 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76374 ) / ( temp_output_10_0_g76374 + 0.0001 ) ) );
			half Motion_30_Amplitude263_g76323 = ( _MotionAmplitude_32 * Main_Mask57_g76323 * Wind_FadeOut4005_g76323 );
			half Input_MotionAmplitude58_g76369 = Motion_30_Amplitude263_g76323;
			float enc59_g76405 = v.texcoord.z;
			float2 localDecodeFloatToVector259_g76405 = DecodeFloatToVector2( enc59_g76405 );
			float2 break61_g76405 = localDecodeFloatToVector259_g76405;
			half Mesh_Motion_30144_g76323 = break61_g76405.y;
			half Input_MeshMotion_30374_g76369 = Mesh_Motion_30144_g76323;
			half Input_GlobalWind471_g76369 = Global_Motion_Wind2223_g76323;
			half Global_MotionValue503_g76369 = TVE_MotionValue_30;
			float4 break638_g76359 = abs( Noise_Complex703_g76359 );
			half Global_Noise_B4967_g76323 = break638_g76359.b;
			half Input_GlobalNoise472_g76369 = Global_Noise_B4967_g76323;
			float lerpResult466_g76369 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76369);
			half Flutter_Amplitude491_g76369 = ( Input_MotionAmplitude58_g76369 * Input_MeshMotion_30374_g76369 * Input_GlobalWind471_g76369 * Global_MotionValue503_g76369 * pow( Input_GlobalNoise472_g76369 , lerpResult466_g76369 ) );
			half3 Motion_30_Flutter4899_g76323 = ( Flutter_Texture489_g76369 * Flutter_Amplitude491_g76369 );
			float3 Vertex_Motion_Object833_g76323 = ( ( VertexPosRotationAxis50_g76401 + ( VertexPosOtherAxis82_g76401 * cos( Angle44_g76401 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76401 ) * sin( Angle44_g76401 ) ) ) + Motion_30_Flutter4899_g76323 );
			half3 ObjectData20_g76396 = Vertex_Motion_Object833_g76323;
			float3 temp_output_4934_0_g76323 = ( VertexPosition3588_g76323 - Mesh_PivotsOS4923_g76323 );
			float3 Vertex_Motion_World1118_g76323 = ( ( temp_output_4934_0_g76323 + Motion_10_Interaction190_g76323 ) + Motion_30_Flutter4899_g76323 );
			half3 WorldData19_g76396 = Vertex_Motion_World1118_g76323;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76396 = WorldData19_g76396;
			#else
				float3 staticSwitch14_g76396 = ObjectData20_g76396;
			#endif
			float3 temp_output_5273_0_g76323 = staticSwitch14_g76396;
			float3 Vertex_Motion5270_g76323 = temp_output_5273_0_g76323;
			float temp_output_84_0_g76353 = _LayerVertexValue;
			float temp_output_19_0_g76357 = TVE_VertexUsage[(int)temp_output_84_0_g76353];
			float4 temp_output_94_19_g76353 = TVE_VertexCoords;
			half2 UV97_g76353 = ( (temp_output_94_19_g76353).zw + ( (temp_output_94_19_g76353).xy * (ObjectPosition4223_g76323).xz ) );
			float4 tex2DArrayNode50_g76353 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g76353,temp_output_84_0_g76353), 0.0 );
			float4 temp_output_17_0_g76357 = tex2DArrayNode50_g76353;
			float4 temp_output_111_19_g76353 = TVE_VertexParams;
			float4 temp_output_3_0_g76357 = temp_output_111_19_g76353;
			float4 ifLocalVar18_g76357 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g76357 >= 0.5 )
				ifLocalVar18_g76357 = temp_output_17_0_g76357;
			else
				ifLocalVar18_g76357 = temp_output_3_0_g76357;
			float4 lerpResult22_g76357 = lerp( temp_output_3_0_g76357 , temp_output_17_0_g76357 , temp_output_19_0_g76357);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76357 = lerpResult22_g76357;
			#else
				float4 staticSwitch24_g76357 = ifLocalVar18_g76357;
			#endif
			half4 Global_Vertex_Params4173_g76323 = staticSwitch24_g76357;
			float4 break322_g76363 = Global_Vertex_Params4173_g76323;
			half Global_Vertex_Size174_g76323 = saturate( break322_g76363.w );
			float lerpResult346_g76323 = lerp( 1.0 , Global_Vertex_Size174_g76323 , _GlobalSize);
			float3 appendResult3480_g76323 = (float3(lerpResult346_g76323 , lerpResult346_g76323 , lerpResult346_g76323));
			half3 ObjectData20_g76394 = appendResult3480_g76323;
			half3 _Vector11 = half3(1,1,1);
			half3 WorldData19_g76394 = _Vector11;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76394 = WorldData19_g76394;
			#else
				float3 staticSwitch14_g76394 = ObjectData20_g76394;
			#endif
			half3 Vertex_Size1741_g76323 = staticSwitch14_g76394;
			float temp_output_7_0_g76395 = _SizeFadeEndValue;
			float temp_output_10_0_g76395 = ( _SizeFadeStartValue - temp_output_7_0_g76395 );
			float temp_output_556_0_g76323 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76323 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76395 ) / ( temp_output_10_0_g76395 + 0.0001 ) ) );
			float3 appendResult3482_g76323 = (float3(temp_output_556_0_g76323 , temp_output_556_0_g76323 , temp_output_556_0_g76323));
			half3 ObjectData20_g76393 = appendResult3482_g76323;
			half3 _Vector5 = half3(1,1,1);
			half3 WorldData19_g76393 = _Vector5;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76393 = WorldData19_g76393;
			#else
				float3 staticSwitch14_g76393 = ObjectData20_g76393;
			#endif
			float3 Vertex_SizeFade1740_g76323 = staticSwitch14_g76393;
			float3 lerpResult16_g76398 = lerp( VertexPosition3588_g76323 , ( ( Vertex_Motion5270_g76323 * Vertex_Size1741_g76323 * Vertex_SizeFade1740_g76323 ) + Mesh_PivotsOS4923_g76323 ) , TVE_IsEnabled);
			float3 temp_output_4889_0_g76323 = lerpResult16_g76398;
			float3 Final_VertexPosition890_g76323 = ( temp_output_4889_0_g76323 + _DisableSRPBatcher );
			v.vertex.xyz = Final_VertexPosition890_g76323;
			v.vertex.w = 1;
			float3 lerpResult105_g75882 = lerp( float3( 1,1,1 ) , ( (TVE_MainLightParams).xyz * TVE_MainLightParams.w ) , _render_direct);
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			half3 World_Normal75_g75882 = ase_normWorldNormal;
			float dotResult62_g75882 = dot( TVE_MainLightDirection , World_Normal75_g75882 );
			float lerpResult107_g75882 = lerp( 1.0 , saturate( dotResult62_g75882 ) , _render_shadow);
			float3 lerpResult109_g75882 = lerp( float3( 0,0,0 ) , (unity_AmbientSky).rgb , _render_ambient);
			o.vertexToFrag86_g75882 = ( ( lerpResult105_g75882 * lerpResult107_g75882 ) + lerpResult109_g75882 );
			o.vertexToFrag11_g76408 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76323, 0.0 );
			half Mesh_Height1524_g76323 = v.color.a;
			float temp_output_7_0_g76377 = _GradientMinValue;
			float temp_output_10_0_g76377 = ( _GradientMaxValue - temp_output_7_0_g76377 );
			half Tint_Gradient_Value2784_g76323 = saturate( ( ( Mesh_Height1524_g76323 - temp_output_7_0_g76377 ) / ( temp_output_10_0_g76377 + 0.0001 ) ) );
			o.vertexToFrag11_g76378 = Tint_Gradient_Value2784_g76323;
			o.vertexToFrag3890_g76323 = ase_worldPos;
			o.vertexToFrag4224_g76323 = temp_output_114_0_g76386;
			o.vertexToFrag5095_g76323 = ase_worldNormal;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			half2 Main_UVs15_g76323 = i.uv_texcoord.xy;
			float4 tex2DNode29_g76323 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76323 );
			float3 lerpResult5342_g76323 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76323).rgb , _MainAlbedoValue);
			half3 Vertex_Color5344_g76323 = (i.vertexColor).rgb;
			float3 lerpResult4812_g76323 = lerp( lerpResult5342_g76323 , Vertex_Color5344_g76323 , _VertexColorMode);
			float4 break5051_g76323 = i.vertexToFrag11_g76408;
			half Main_Mask57_g76323 = break5051_g76323.b;
			float lerpResult5346_g76323 = lerp( 1.0 , Main_Mask57_g76323 , _MainColorMode);
			float4 lerpResult5328_g76323 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76323);
			half3 Main_Color_RGB5335_g76323 = (lerpResult5328_g76323).rgb;
			half3 Main_Albedo99_g76323 = ( lerpResult4812_g76323 * Main_Color_RGB5335_g76323 );
			float3 temp_cast_0 = (1.0).xxx;
			float3 lerpResult2779_g76323 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , i.vertexToFrag11_g76378);
			float3 lerpResult5052_g76323 = lerp( temp_cast_0 , lerpResult2779_g76323 , Main_Mask57_g76323);
			half3 Tint_Gradient_Color5252_g76323 = lerpResult5052_g76323;
			half3 Blend_Albedo_Tinted2808_g76323 = ( Main_Albedo99_g76323 * Tint_Gradient_Color5252_g76323 );
			float dotResult3616_g76323 = dot( Blend_Albedo_Tinted2808_g76323 , float3(0.2126,0.7152,0.0722) );
			float3 temp_cast_1 = (dotResult3616_g76323).xxx;
			float temp_output_82_0_g76337 = _LayerColorsValue;
			float temp_output_19_0_g76341 = TVE_ColorsUsage[(int)temp_output_82_0_g76337];
			float4 temp_output_91_19_g76337 = TVE_ColorsCoords;
			float3 WorldPosition3905_g76323 = i.vertexToFrag3890_g76323;
			float3 ObjectPosition4223_g76323 = i.vertexToFrag4224_g76323;
			float3 lerpResult4868_g76323 = lerp( WorldPosition3905_g76323 , ObjectPosition4223_g76323 , _ColorsPositionMode);
			half2 UV94_g76337 = ( (temp_output_91_19_g76337).zw + ( (temp_output_91_19_g76337).xy * (lerpResult4868_g76323).xz ) );
			float4 tex2DArrayNode83_g76337 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, float3(UV94_g76337,temp_output_82_0_g76337), 0.0 );
			float4 temp_output_17_0_g76341 = tex2DArrayNode83_g76337;
			float4 temp_output_92_86_g76337 = TVE_ColorsParams;
			float4 temp_output_3_0_g76341 = temp_output_92_86_g76337;
			float4 ifLocalVar18_g76341 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g76341 >= 0.5 )
				ifLocalVar18_g76341 = temp_output_17_0_g76341;
			else
				ifLocalVar18_g76341 = temp_output_3_0_g76341;
			float4 lerpResult22_g76341 = lerp( temp_output_3_0_g76341 , temp_output_17_0_g76341 , temp_output_19_0_g76341);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76341 = lerpResult22_g76341;
			#else
				float4 staticSwitch24_g76341 = ifLocalVar18_g76341;
			#endif
			half4 Global_Colors_Params4994_g76323 = staticSwitch24_g76341;
			float4 temp_output_346_0_g76352 = Global_Colors_Params4994_g76323;
			half Global_Colors_A1701_g76323 = saturate( (temp_output_346_0_g76352).w );
			half Global_Colors_Influence3668_g76323 = Global_Colors_A1701_g76323;
			float3 lerpResult3618_g76323 = lerp( Blend_Albedo_Tinted2808_g76323 , temp_cast_1 , Global_Colors_Influence3668_g76323);
			half3 Global_Colors_RGB1700_g76323 = (temp_output_346_0_g76352).xyz;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76376 = 2.0;
			#else
				float staticSwitch1_g76376 = 4.594794;
			#endif
			half3 Global_Colors1954_g76323 = ( Global_Colors_RGB1700_g76323 * staticSwitch1_g76376 * _ColorsIntensityValue );
			half Global_Colors_Mask5155_g76323 = Main_Mask57_g76323;
			float lerpResult16_g76379 = lerp( 0.0 , ( _GlobalColors * Global_Colors_Mask5155_g76323 ) , TVE_IsEnabled);
			float3 lerpResult3628_g76323 = lerp( Blend_Albedo_Tinted2808_g76323 , ( lerpResult3618_g76323 * Global_Colors1954_g76323 ) , lerpResult16_g76379);
			half3 Blend_Albedo_Colored863_g76323 = lerpResult3628_g76323;
			half3 Global_OverlayColor1758_g76323 = (TVE_OverlayColor).rgb;
			half3 World_Normal5097_g76323 = i.vertexToFrag5095_g76323;
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			ase_vertexNormal = normalize( ase_vertexNormal );
			half Global_DynamicMode5093_g76323 = _VertexDynamicMode;
			float lerpResult5116_g76323 = lerp( (World_Normal5097_g76323).y , ase_vertexNormal.y , Global_DynamicMode5093_g76323);
			half Overlay_Mask_Projection5120_g76323 = saturate( lerpResult5116_g76323 );
			float temp_output_84_0_g76332 = _LayerExtrasValue;
			float temp_output_19_0_g76336 = TVE_ExtrasUsage[(int)temp_output_84_0_g76332];
			float4 temp_output_93_19_g76332 = TVE_ExtrasCoords;
			float3 lerpResult4873_g76323 = lerp( WorldPosition3905_g76323 , ObjectPosition4223_g76323 , _ExtrasPositionMode);
			half2 UV96_g76332 = ( (temp_output_93_19_g76332).zw + ( (temp_output_93_19_g76332).xy * (lerpResult4873_g76323).xz ) );
			float4 tex2DArrayNode48_g76332 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g76332,temp_output_84_0_g76332), 0.0 );
			float4 temp_output_17_0_g76336 = tex2DArrayNode48_g76332;
			float4 temp_output_94_85_g76332 = TVE_ExtrasParams;
			float4 temp_output_3_0_g76336 = temp_output_94_85_g76332;
			float4 ifLocalVar18_g76336 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g76336 >= 0.5 )
				ifLocalVar18_g76336 = temp_output_17_0_g76336;
			else
				ifLocalVar18_g76336 = temp_output_3_0_g76336;
			float4 lerpResult22_g76336 = lerp( temp_output_3_0_g76336 , temp_output_17_0_g76336 , temp_output_19_0_g76336);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76336 = lerpResult22_g76336;
			#else
				float4 staticSwitch24_g76336 = ifLocalVar18_g76336;
			#endif
			half4 Global_Extras_Params4995_g76323 = staticSwitch24_g76336;
			float4 break456_g76344 = Global_Extras_Params4995_g76323;
			half Global_Extras_Overlay156_g76323 = break456_g76344.z;
			half Overlay_Mask269_g76323 = ( _GlobalOverlay * Overlay_Mask_Projection5120_g76323 * Global_Extras_Overlay156_g76323 );
			float3 lerpResult336_g76323 = lerp( Blend_Albedo_Colored863_g76323 , Global_OverlayColor1758_g76323 , Overlay_Mask269_g76323);
			half3 Blend_Albedo_Overlay359_g76323 = lerpResult336_g76323;
			half Global_WetnessContrast5191_g76323 = TVE_WetnessContrast;
			half Global_Extras_Wetness305_g76323 = break456_g76344.y;
			half Wetness_Value5174_g76323 = ( Global_Extras_Wetness305_g76323 * _GlobalWetness );
			float3 lerpResult5186_g76323 = lerp( Blend_Albedo_Overlay359_g76323 , ( Blend_Albedo_Overlay359_g76323 * Blend_Albedo_Overlay359_g76323 ) , ( Global_WetnessContrast5191_g76323 * Wetness_Value5174_g76323 ));
			half3 Blend_Albedo_Wetness5182_g76323 = lerpResult5186_g76323;
			half3 Blend_Albedo_Subsurface149_g76323 = Blend_Albedo_Wetness5182_g76323;
			half3 Main_Albedo70_g75882 = Blend_Albedo_Subsurface149_g76323;
			o.Emission = ( i.vertexToFrag86_g75882 * Main_Albedo70_g75882 );
			float localCustomAlphaClip19_g76385 = ( 0.0 );
			float Main_Alpha316_g76323 = tex2DNode29_g76323.a;
			half AlphaTreshold2132_g76323 = _AlphaClipValue;
			half Fade_Alpha4990_g76323 = 1.0;
			half Final_Alpha5254_g76323 = min( ( Main_Alpha316_g76323 - AlphaTreshold2132_g76323 ) , Fade_Alpha4990_g76323 );
			float temp_output_3_0_g76385 = Final_Alpha5254_g76323;
			float Alpha19_g76385 = temp_output_3_0_g76385;
			float temp_output_15_0_g76385 = 0.01;
			float Treshold19_g76385 = temp_output_15_0_g76385;
			{
			#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
			#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
					clip(Alpha19_g76385 - Treshold19_g76385);
				#endif
			#else
				clip(Alpha19_g76385 - Treshold19_g76385);
			#endif
			#endif
			}
			half Main_Color_Alpha5337_g76323 = (lerpResult5328_g76323).a;
			half Final_Clip914_g76323 = saturate( ( Alpha19_g76385 * Main_Color_Alpha5337_g76323 ) );
			o.Alpha = Final_Clip914_g76323;
		}

		ENDCG
	}
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;140;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;138;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;139;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;538;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;141;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;137;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;340;-2176,256;Inherit;False;1281.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1283.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1279.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.FunctionNode;539;-1920,-384;Inherit;False;Compute Lighting Vertex;133;;75882;40e1ef0a39540cb46929883ebf1eb187;0;1;69;FLOAT3;0,0,0;False;1;FLOAT3;53
Node;AmplifyShaderEditor.FunctionNode;384;-2176,384;Inherit;False;Define Pipeline Standard;-1;;76318;9af03ae8defe78d448ef2a4ef3601e12;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;540;-1920,384;Inherit;False;Define Lighting Vertex;145;;76319;22bd65fb26ef51b4580769eaf56a20b5;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;541;-1664,384;Inherit;False;Define ShaderType Plant;143;;76320;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;431;-1088,384;Inherit;False;Compile All Shaders;-1;;76321;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;533;-1280,384;Inherit;False;Compile Polygonal;-1;;76322;f2db24258d28b2a4885b7bfa20c80bc2;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;383;-1152,-384;Float;False;True;-1;5;TVEShaderCoreGUI;0;0;Unlit;BOXOPHOBIC/The Vegetation Engine/Geometry/Plant Vertex Lit (Polygonal);False;False;False;False;True;True;True;True;True;False;True;True;True;False;False;False;False;False;False;False;True;Back;0;True;_render_zw;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;1;0;True;_render_src;0;True;_render_dst;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;142;-1;-1;-1;0;False;0;0;True;_render_cull;-1;0;False;;0;0;0;False;0.1;False;;0;True;_render_coverage;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.FunctionNode;537;-2176,-384;Inherit;False;Base Polygonal;0;;76323;69ac49dc448658e459ede3d88c745447;43,5351,1,5257,0,4028,1,3900,1,3908,1,4172,1,3586,0,4499,1,1708,1,1717,1,1714,1,1718,1,3475,1,5170,1,4210,0,1745,1,3479,0,5156,1,1646,0,3501,1,2807,1,3886,0,5249,0,4981,0,5196,0,4976,0,3728,1,4980,0,1742,1,3484,0,860,1,2261,1,2260,1,2062,1,2039,1,5278,1,5280,1,4217,1,5226,1,5276,0,4931,1,4919,1,5274,0;2;5251;FLOAT3;1,1,1;False;5275;FLOAT3;0,0,0;False;19;FLOAT3;0;FLOAT3;2489;FLOAT;4135;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4127;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;4966;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;4993;FLOAT;629;FLOAT3;534
WireConnection;539;69;537;0
WireConnection;383;2;539;53
WireConnection;383;9;537;532
WireConnection;383;11;537;534
ASEEND*/
//CHKSM=A8C5E08C4F0182F4B0E3F474FB1C67F66EDF8AAC
