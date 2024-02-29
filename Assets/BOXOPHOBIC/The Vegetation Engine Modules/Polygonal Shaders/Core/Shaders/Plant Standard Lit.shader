// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Geometry/Plant Standard Lit (Polygonal)"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
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
		_FadeConstantValue("Fade Constant", Range( 0 , 1)) = 0
		_FadeCameraValue("Fade Proximity", Range( 0 , 1)) = 1
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
		_MainMetallicValue("Main Metallic", Range( 0 , 1)) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 0
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
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsPlantShader("_IsPlantShader", Float) = 1

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1.0
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4 				// DEPRECATED
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4	// DEPRECATED
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4 // Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _EnableBlendModePreserveSpecularLighting("Enable Blend Mode Preserve Specular Lighting", Float) = 1
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)

		[HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0 //DoubleSidedGIMode added in api 12x and higher

		[HideInInspector][ToggleUI] _AlphaToMaskInspectorValue("_AlphaToMaskInspectorValue", Float) = 0 // Property used to save the alpha to mask state in the inspector
        [HideInInspector][ToggleUI] _AlphaToMask("__alphaToMask", Float) = 0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 BaseColor;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float DiffusionProfile;
			float TransmissionMask;
			// Transmission + Diffusion Profile
			float Thickness;
			float SubsurfaceMask;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
			//Virtual Texturing
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
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

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
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
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask [_LightLayersMaskBuffer4] 4
			ColorMask [_LightLayersMaskBuffer5] 5

			HLSLPROGRAM

            #pragma shader_feature_local_fragment _DISABLE_DECALS
            #pragma shader_feature_local_fragment _DISABLE_SSR
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140007
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment _ LIGHT_LAYERS
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_GBUFFER

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

		    // Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_WetnessContrast;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[ 2 ];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
			#ifdef DECAL_NORMAL_BLENDING
				if (_EnableDecals)
				{
					#ifndef SURFACE_GRADIENT
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData, normalTS);
				}

				GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
			#else
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#endif
				
				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON
				builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.ase_texcoord.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord6 = vertexToFrag11_g76415;
				half Mesh_Height1524_g76330 = inputMesh.ase_color.a;
				float temp_output_7_0_g76384 = _GradientMinValue;
				float temp_output_10_0_g76384 = ( _GradientMaxValue - temp_output_7_0_g76384 );
				half Tint_Gradient_Value2784_g76330 = saturate( ( ( Mesh_Height1524_g76330 - temp_output_7_0_g76384 ) / ( temp_output_10_0_g76384 + 0.0001 ) ) );
				float vertexToFrag11_g76385 = Tint_Gradient_Value2784_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord7.x = vertexToFrag11_g76385;
				outputPackedVaryingsMeshToPS.ase_texcoord7.yzw = vertexToFrag3890_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = vertexToFrag4224_g76330;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5095_g76330 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = vertexToFrag5095_g76330;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76330;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord5.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float3 lerpResult5342_g76330 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76330).rgb , _MainAlbedoValue);
				half3 Vertex_Color5344_g76330 = (packedInput.ase_color).rgb;
				float3 lerpResult4812_g76330 = lerp( lerpResult5342_g76330 , Vertex_Color5344_g76330 , _VertexColorMode);
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord6;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half3 Main_Color_RGB5335_g76330 = (lerpResult5328_g76330).rgb;
				half3 Main_Albedo99_g76330 = ( lerpResult4812_g76330 * Main_Color_RGB5335_g76330 );
				float3 temp_cast_0 = (1.0).xxx;
				float vertexToFrag11_g76385 = packedInput.ase_texcoord7.x;
				float3 lerpResult2779_g76330 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , vertexToFrag11_g76385);
				float3 lerpResult5052_g76330 = lerp( temp_cast_0 , lerpResult2779_g76330 , Main_Mask57_g76330);
				half3 Tint_Gradient_Color5252_g76330 = lerpResult5052_g76330;
				half3 Blend_Albedo_Tinted2808_g76330 = ( Main_Albedo99_g76330 * Tint_Gradient_Color5252_g76330 );
				float dotResult3616_g76330 = dot( Blend_Albedo_Tinted2808_g76330 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_1 = (dotResult3616_g76330).xxx;
				float temp_output_82_0_g76344 = _LayerColorsValue;
				float temp_output_19_0_g76348 = TVE_ColorsUsage[(int)temp_output_82_0_g76344];
				float4 temp_output_91_19_g76344 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord7.yzw;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 vertexToFrag4224_g76330 = packedInput.ase_texcoord8.xyz;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 lerpResult4868_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ColorsPositionMode);
				half2 UV94_g76344 = ( (temp_output_91_19_g76344).zw + ( (temp_output_91_19_g76344).xy * (lerpResult4868_g76330).xz ) );
				float4 tex2DArrayNode83_g76344 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76344,temp_output_82_0_g76344, 0.0 );
				float4 temp_output_17_0_g76348 = tex2DArrayNode83_g76344;
				float4 temp_output_92_86_g76344 = TVE_ColorsParams;
				float4 temp_output_3_0_g76348 = temp_output_92_86_g76344;
				float4 ifLocalVar18_g76348 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76348 >= 0.5 )
				ifLocalVar18_g76348 = temp_output_17_0_g76348;
				else
				ifLocalVar18_g76348 = temp_output_3_0_g76348;
				float4 lerpResult22_g76348 = lerp( temp_output_3_0_g76348 , temp_output_17_0_g76348 , temp_output_19_0_g76348);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76348 = lerpResult22_g76348;
				#else
				float4 staticSwitch24_g76348 = ifLocalVar18_g76348;
				#endif
				half4 Global_Colors_Params4994_g76330 = staticSwitch24_g76348;
				float4 temp_output_346_0_g76359 = Global_Colors_Params4994_g76330;
				half Global_Colors_A1701_g76330 = saturate( (temp_output_346_0_g76359).w );
				half Global_Colors_Influence3668_g76330 = Global_Colors_A1701_g76330;
				float3 lerpResult3618_g76330 = lerp( Blend_Albedo_Tinted2808_g76330 , temp_cast_1 , Global_Colors_Influence3668_g76330);
				half3 Global_Colors_RGB1700_g76330 = (temp_output_346_0_g76359).xyz;
				half3 Global_Colors1954_g76330 = ( Global_Colors_RGB1700_g76330 * 4.594794 * _ColorsIntensityValue );
				half Global_Colors_Mask5155_g76330 = Main_Mask57_g76330;
				float lerpResult16_g76386 = lerp( 0.0 , ( _GlobalColors * Global_Colors_Mask5155_g76330 ) , TVE_IsEnabled);
				float3 lerpResult3628_g76330 = lerp( Blend_Albedo_Tinted2808_g76330 , ( lerpResult3618_g76330 * Global_Colors1954_g76330 ) , lerpResult16_g76386);
				half3 Blend_Albedo_Colored863_g76330 = lerpResult3628_g76330;
				half3 Global_OverlayColor1758_g76330 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5095_g76330 = packedInput.ase_texcoord9.xyz;
				half3 World_Normal5097_g76330 = vertexToFrag5095_g76330;
				half Global_DynamicMode5093_g76330 = _VertexDynamicMode;
				float lerpResult5116_g76330 = lerp( (World_Normal5097_g76330).y , packedInput.ase_normal.y , Global_DynamicMode5093_g76330);
				half Overlay_Mask_Projection5120_g76330 = saturate( lerpResult5116_g76330 );
				float temp_output_84_0_g76339 = _LayerExtrasValue;
				float temp_output_19_0_g76343 = TVE_ExtrasUsage[(int)temp_output_84_0_g76339];
				float4 temp_output_93_19_g76339 = TVE_ExtrasCoords;
				float3 lerpResult4873_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ExtrasPositionMode);
				half2 UV96_g76339 = ( (temp_output_93_19_g76339).zw + ( (temp_output_93_19_g76339).xy * (lerpResult4873_g76330).xz ) );
				float4 tex2DArrayNode48_g76339 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76339,temp_output_84_0_g76339, 0.0 );
				float4 temp_output_17_0_g76343 = tex2DArrayNode48_g76339;
				float4 temp_output_94_85_g76339 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76343 = temp_output_94_85_g76339;
				float4 ifLocalVar18_g76343 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76343 >= 0.5 )
				ifLocalVar18_g76343 = temp_output_17_0_g76343;
				else
				ifLocalVar18_g76343 = temp_output_3_0_g76343;
				float4 lerpResult22_g76343 = lerp( temp_output_3_0_g76343 , temp_output_17_0_g76343 , temp_output_19_0_g76343);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76343 = lerpResult22_g76343;
				#else
				float4 staticSwitch24_g76343 = ifLocalVar18_g76343;
				#endif
				half4 Global_Extras_Params4995_g76330 = staticSwitch24_g76343;
				float4 break456_g76351 = Global_Extras_Params4995_g76330;
				half Global_Extras_Overlay156_g76330 = break456_g76351.z;
				half Overlay_Mask269_g76330 = ( _GlobalOverlay * Overlay_Mask_Projection5120_g76330 * Global_Extras_Overlay156_g76330 );
				float3 lerpResult336_g76330 = lerp( Blend_Albedo_Colored863_g76330 , Global_OverlayColor1758_g76330 , Overlay_Mask269_g76330);
				half3 Blend_Albedo_Overlay359_g76330 = lerpResult336_g76330;
				half Global_WetnessContrast5191_g76330 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76330 = break456_g76351.y;
				half Wetness_Value5174_g76330 = ( Global_Extras_Wetness305_g76330 * _GlobalWetness );
				float3 lerpResult5186_g76330 = lerp( Blend_Albedo_Overlay359_g76330 , ( Blend_Albedo_Overlay359_g76330 * Blend_Albedo_Overlay359_g76330 ) , ( Global_WetnessContrast5191_g76330 * Wetness_Value5174_g76330 ));
				half3 Blend_Albedo_Wetness5182_g76330 = lerpResult5186_g76330;
				half3 Blend_Albedo_Subsurface149_g76330 = Blend_Albedo_Wetness5182_g76330;
				
				half Main_Metallic237_g76330 = ( _MainMetallicValue * break5051_g76330.r );
				float lerpResult342_g76330 = lerp( Main_Metallic237_g76330 , 0.0 , Overlay_Mask269_g76330);
				half Blend_Metallic_Overlay367_g76330 = lerpResult342_g76330;
				
				half Main_Smoothness227_g76330 = ( _MainSmoothnessValue * break5051_g76330.a );
				half Global_OverlaySmoothness311_g76330 = TVE_OverlaySmoothness;
				float lerpResult343_g76330 = lerp( Main_Smoothness227_g76330 , Global_OverlaySmoothness311_g76330 , Overlay_Mask269_g76330);
				half Blend_Smoothness_Overlay371_g76330 = lerpResult343_g76330;
				float temp_output_5193_0_g76330 = ( 1.0 - Wetness_Value5174_g76330 );
				half Blend_Smoothness_Wetness4130_g76330 = saturate( ( Blend_Smoothness_Overlay371_g76330 + ( 1.0 - ( temp_output_5193_0_g76330 * temp_output_5193_0_g76330 ) ) ) );
				
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.BaseColor = Blend_Albedo_Subsurface149_g76330;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = Blend_Metallic_Overlay367_g76330;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76330;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = Final_Clip914_g76330;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 0;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_WetnessContrast;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
			#ifdef DECAL_NORMAL_BLENDING
				if (_EnableDecals)
				{
					#ifndef SURFACE_GRADIENT
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData, normalTS);
				}

				GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
			#else
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT
			#define SCENEPICKINGPASS
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.uv3.x , inputMesh.uv3.z , inputMesh.uv3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.uv0.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.uv0.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.uv0.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = vertexToFrag11_g76415;
				half Mesh_Height1524_g76330 = inputMesh.ase_color.a;
				float temp_output_7_0_g76384 = _GradientMinValue;
				float temp_output_10_0_g76384 = ( _GradientMaxValue - temp_output_7_0_g76384 );
				half Tint_Gradient_Value2784_g76330 = saturate( ( ( Mesh_Height1524_g76330 - temp_output_7_0_g76384 ) / ( temp_output_10_0_g76384 + 0.0001 ) ) );
				float vertexToFrag11_g76385 = Tint_Gradient_Value2784_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord4.x = vertexToFrag11_g76385;
				outputPackedVaryingsMeshToPS.ase_texcoord4.yzw = vertexToFrag3890_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag4224_g76330;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5095_g76330 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag5095_g76330;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2 = inputMesh.uv0;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76330;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				outputPackedVaryingsMeshToPS.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);


				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					outputPackedVaryingsMeshToPS.VizUV.xy = vizUV;
					outputPackedVaryingsMeshToPS.LightCoord = lightCoord;
				#endif

				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord2.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float3 lerpResult5342_g76330 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76330).rgb , _MainAlbedoValue);
				half3 Vertex_Color5344_g76330 = (packedInput.ase_color).rgb;
				float3 lerpResult4812_g76330 = lerp( lerpResult5342_g76330 , Vertex_Color5344_g76330 , _VertexColorMode);
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord3;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half3 Main_Color_RGB5335_g76330 = (lerpResult5328_g76330).rgb;
				half3 Main_Albedo99_g76330 = ( lerpResult4812_g76330 * Main_Color_RGB5335_g76330 );
				float3 temp_cast_0 = (1.0).xxx;
				float vertexToFrag11_g76385 = packedInput.ase_texcoord4.x;
				float3 lerpResult2779_g76330 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , vertexToFrag11_g76385);
				float3 lerpResult5052_g76330 = lerp( temp_cast_0 , lerpResult2779_g76330 , Main_Mask57_g76330);
				half3 Tint_Gradient_Color5252_g76330 = lerpResult5052_g76330;
				half3 Blend_Albedo_Tinted2808_g76330 = ( Main_Albedo99_g76330 * Tint_Gradient_Color5252_g76330 );
				float dotResult3616_g76330 = dot( Blend_Albedo_Tinted2808_g76330 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_1 = (dotResult3616_g76330).xxx;
				float temp_output_82_0_g76344 = _LayerColorsValue;
				float temp_output_19_0_g76348 = TVE_ColorsUsage[(int)temp_output_82_0_g76344];
				float4 temp_output_91_19_g76344 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord4.yzw;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 vertexToFrag4224_g76330 = packedInput.ase_texcoord5.xyz;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 lerpResult4868_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ColorsPositionMode);
				half2 UV94_g76344 = ( (temp_output_91_19_g76344).zw + ( (temp_output_91_19_g76344).xy * (lerpResult4868_g76330).xz ) );
				float4 tex2DArrayNode83_g76344 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76344,temp_output_82_0_g76344, 0.0 );
				float4 temp_output_17_0_g76348 = tex2DArrayNode83_g76344;
				float4 temp_output_92_86_g76344 = TVE_ColorsParams;
				float4 temp_output_3_0_g76348 = temp_output_92_86_g76344;
				float4 ifLocalVar18_g76348 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76348 >= 0.5 )
				ifLocalVar18_g76348 = temp_output_17_0_g76348;
				else
				ifLocalVar18_g76348 = temp_output_3_0_g76348;
				float4 lerpResult22_g76348 = lerp( temp_output_3_0_g76348 , temp_output_17_0_g76348 , temp_output_19_0_g76348);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76348 = lerpResult22_g76348;
				#else
				float4 staticSwitch24_g76348 = ifLocalVar18_g76348;
				#endif
				half4 Global_Colors_Params4994_g76330 = staticSwitch24_g76348;
				float4 temp_output_346_0_g76359 = Global_Colors_Params4994_g76330;
				half Global_Colors_A1701_g76330 = saturate( (temp_output_346_0_g76359).w );
				half Global_Colors_Influence3668_g76330 = Global_Colors_A1701_g76330;
				float3 lerpResult3618_g76330 = lerp( Blend_Albedo_Tinted2808_g76330 , temp_cast_1 , Global_Colors_Influence3668_g76330);
				half3 Global_Colors_RGB1700_g76330 = (temp_output_346_0_g76359).xyz;
				half3 Global_Colors1954_g76330 = ( Global_Colors_RGB1700_g76330 * 4.594794 * _ColorsIntensityValue );
				half Global_Colors_Mask5155_g76330 = Main_Mask57_g76330;
				float lerpResult16_g76386 = lerp( 0.0 , ( _GlobalColors * Global_Colors_Mask5155_g76330 ) , TVE_IsEnabled);
				float3 lerpResult3628_g76330 = lerp( Blend_Albedo_Tinted2808_g76330 , ( lerpResult3618_g76330 * Global_Colors1954_g76330 ) , lerpResult16_g76386);
				half3 Blend_Albedo_Colored863_g76330 = lerpResult3628_g76330;
				half3 Global_OverlayColor1758_g76330 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5095_g76330 = packedInput.ase_texcoord6.xyz;
				half3 World_Normal5097_g76330 = vertexToFrag5095_g76330;
				half Global_DynamicMode5093_g76330 = _VertexDynamicMode;
				float lerpResult5116_g76330 = lerp( (World_Normal5097_g76330).y , packedInput.ase_normal.y , Global_DynamicMode5093_g76330);
				half Overlay_Mask_Projection5120_g76330 = saturate( lerpResult5116_g76330 );
				float temp_output_84_0_g76339 = _LayerExtrasValue;
				float temp_output_19_0_g76343 = TVE_ExtrasUsage[(int)temp_output_84_0_g76339];
				float4 temp_output_93_19_g76339 = TVE_ExtrasCoords;
				float3 lerpResult4873_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ExtrasPositionMode);
				half2 UV96_g76339 = ( (temp_output_93_19_g76339).zw + ( (temp_output_93_19_g76339).xy * (lerpResult4873_g76330).xz ) );
				float4 tex2DArrayNode48_g76339 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76339,temp_output_84_0_g76339, 0.0 );
				float4 temp_output_17_0_g76343 = tex2DArrayNode48_g76339;
				float4 temp_output_94_85_g76339 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76343 = temp_output_94_85_g76339;
				float4 ifLocalVar18_g76343 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76343 >= 0.5 )
				ifLocalVar18_g76343 = temp_output_17_0_g76343;
				else
				ifLocalVar18_g76343 = temp_output_3_0_g76343;
				float4 lerpResult22_g76343 = lerp( temp_output_3_0_g76343 , temp_output_17_0_g76343 , temp_output_19_0_g76343);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76343 = lerpResult22_g76343;
				#else
				float4 staticSwitch24_g76343 = ifLocalVar18_g76343;
				#endif
				half4 Global_Extras_Params4995_g76330 = staticSwitch24_g76343;
				float4 break456_g76351 = Global_Extras_Params4995_g76330;
				half Global_Extras_Overlay156_g76330 = break456_g76351.z;
				half Overlay_Mask269_g76330 = ( _GlobalOverlay * Overlay_Mask_Projection5120_g76330 * Global_Extras_Overlay156_g76330 );
				float3 lerpResult336_g76330 = lerp( Blend_Albedo_Colored863_g76330 , Global_OverlayColor1758_g76330 , Overlay_Mask269_g76330);
				half3 Blend_Albedo_Overlay359_g76330 = lerpResult336_g76330;
				half Global_WetnessContrast5191_g76330 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76330 = break456_g76351.y;
				half Wetness_Value5174_g76330 = ( Global_Extras_Wetness305_g76330 * _GlobalWetness );
				float3 lerpResult5186_g76330 = lerp( Blend_Albedo_Overlay359_g76330 , ( Blend_Albedo_Overlay359_g76330 * Blend_Albedo_Overlay359_g76330 ) , ( Global_WetnessContrast5191_g76330 * Wetness_Value5174_g76330 ));
				half3 Blend_Albedo_Wetness5182_g76330 = lerpResult5186_g76330;
				half3 Blend_Albedo_Subsurface149_g76330 = Blend_Albedo_Wetness5182_g76330;
				
				half Main_Metallic237_g76330 = ( _MainMetallicValue * break5051_g76330.r );
				float lerpResult342_g76330 = lerp( Main_Metallic237_g76330 , 0.0 , Overlay_Mask269_g76330);
				half Blend_Metallic_Overlay367_g76330 = lerpResult342_g76330;
				
				half Main_Smoothness227_g76330 = ( _MainSmoothnessValue * break5051_g76330.a );
				half Global_OverlaySmoothness311_g76330 = TVE_OverlaySmoothness;
				float lerpResult343_g76330 = lerp( Main_Smoothness227_g76330 , Global_OverlaySmoothness311_g76330 , Overlay_Mask269_g76330);
				half Blend_Smoothness_Overlay371_g76330 = lerpResult343_g76330;
				float temp_output_5193_0_g76330 = ( 1.0 - Wetness_Value5174_g76330 );
				half Blend_Smoothness_Wetness4130_g76330 = saturate( ( Blend_Smoothness_Overlay371_g76330 + ( 1.0 - ( temp_output_5193_0_g76330 * temp_output_5193_0_g76330 ) ) ) );
				
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = packedInput.ase_texcoord7.xyz;
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.BaseColor = Blend_Albedo_Subsurface149_g76330;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = Blend_Metallic_Overlay367_g76330;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76330;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = Final_Clip914_g76330;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;

			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			//#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_SHADOWS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
			#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
			#ifdef DECAL_NORMAL_BLENDING
				if (_EnableDecals)
				{
					#ifndef SURFACE_GRADIENT
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData, normalTS);
				}

				GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
			#else
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.ase_texcoord.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord2.xyz = vertexToFrag3890_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord3 = vertexToFrag11_g76415;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1 = inputMesh.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76330;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord1.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord2.xyz;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord3;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.Alpha = Final_Clip914_g76330;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmesh.positionCS.z;

				#ifdef _ALPHATOMASK_ON
				depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

            #pragma shader_feature_local_fragment _DISABLE_DECALS
            #pragma shader_feature_local_fragment _DISABLE_SSR
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140007
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT

			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
		    #define SCENESELECTIONPASS 1

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
			#ifdef DECAL_NORMAL_BLENDING
				if (_EnableDecals)
				{
					#ifndef SURFACE_GRADIENT
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData, normalTS);
				}

				GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
			#else
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.ase_texcoord.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord2.xyz = vertexToFrag3890_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord3 = vertexToFrag11_g76415;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1 = inputMesh.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76330;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord1.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord2.xyz;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord3;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.Alpha = Final_Clip914_g76330;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

            #pragma shader_feature_local_fragment _DISABLE_DECALS
            #pragma shader_feature_local_fragment _DISABLE_SSR
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140007
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			half TVE_OverlaySmoothness;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
			#ifdef DECAL_NORMAL_BLENDING
				if (_EnableDecals)
				{
					#ifndef SURFACE_GRADIENT
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData, normalTS);
				}

				GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
			#else
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif
			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.ase_texcoord.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = vertexToFrag11_g76415;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5095_g76330 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = vertexToFrag5095_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag3890_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag4224_g76330;
				
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_texcoord7 = inputMesh.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76330;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : DEPTH_OFFSET_SEMANTIC
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord3;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Smoothness227_g76330 = ( _MainSmoothnessValue * break5051_g76330.a );
				half Global_OverlaySmoothness311_g76330 = TVE_OverlaySmoothness;
				float3 vertexToFrag5095_g76330 = packedInput.ase_texcoord4.xyz;
				half3 World_Normal5097_g76330 = vertexToFrag5095_g76330;
				half Global_DynamicMode5093_g76330 = _VertexDynamicMode;
				float lerpResult5116_g76330 = lerp( (World_Normal5097_g76330).y , packedInput.ase_normal.y , Global_DynamicMode5093_g76330);
				half Overlay_Mask_Projection5120_g76330 = saturate( lerpResult5116_g76330 );
				float temp_output_84_0_g76339 = _LayerExtrasValue;
				float temp_output_19_0_g76343 = TVE_ExtrasUsage[(int)temp_output_84_0_g76339];
				float4 temp_output_93_19_g76339 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord5.xyz;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 vertexToFrag4224_g76330 = packedInput.ase_texcoord6.xyz;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 lerpResult4873_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ExtrasPositionMode);
				half2 UV96_g76339 = ( (temp_output_93_19_g76339).zw + ( (temp_output_93_19_g76339).xy * (lerpResult4873_g76330).xz ) );
				float4 tex2DArrayNode48_g76339 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76339,temp_output_84_0_g76339, 0.0 );
				float4 temp_output_17_0_g76343 = tex2DArrayNode48_g76339;
				float4 temp_output_94_85_g76339 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76343 = temp_output_94_85_g76339;
				float4 ifLocalVar18_g76343 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76343 >= 0.5 )
				ifLocalVar18_g76343 = temp_output_17_0_g76343;
				else
				ifLocalVar18_g76343 = temp_output_3_0_g76343;
				float4 lerpResult22_g76343 = lerp( temp_output_3_0_g76343 , temp_output_17_0_g76343 , temp_output_19_0_g76343);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76343 = lerpResult22_g76343;
				#else
				float4 staticSwitch24_g76343 = ifLocalVar18_g76343;
				#endif
				half4 Global_Extras_Params4995_g76330 = staticSwitch24_g76343;
				float4 break456_g76351 = Global_Extras_Params4995_g76330;
				half Global_Extras_Overlay156_g76330 = break456_g76351.z;
				half Overlay_Mask269_g76330 = ( _GlobalOverlay * Overlay_Mask_Projection5120_g76330 * Global_Extras_Overlay156_g76330 );
				float lerpResult343_g76330 = lerp( Main_Smoothness227_g76330 , Global_OverlaySmoothness311_g76330 , Overlay_Mask269_g76330);
				half Blend_Smoothness_Overlay371_g76330 = lerpResult343_g76330;
				half Global_Extras_Wetness305_g76330 = break456_g76351.y;
				half Wetness_Value5174_g76330 = ( Global_Extras_Wetness305_g76330 * _GlobalWetness );
				float temp_output_5193_0_g76330 = ( 1.0 - Wetness_Value5174_g76330 );
				half Blend_Smoothness_Wetness4130_g76330 = saturate( ( Blend_Smoothness_Overlay371_g76330 + ( 1.0 - ( temp_output_5193_0_g76330 * temp_output_5193_0_g76330 ) ) ) );
				
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord7.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76330;
				surfaceDescription.Alpha = Final_Clip914_g76330;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#ifdef _ALPHATOMASK_ON
						depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM

            #pragma shader_feature_local_fragment _DISABLE_DECALS
            #pragma shader_feature_local_fragment _DISABLE_SSR
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140007
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_MOTION_VECTORS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			half TVE_OverlaySmoothness;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
			#ifdef DECAL_NORMAL_BLENDING
				if (_EnableDecals)
				{
					#ifndef SURFACE_GRADIENT
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData, normalTS);
				}

				GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
			#else
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.ase_texcoord.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = vertexToFrag11_g76415;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5095_g76330 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = vertexToFrag5095_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag3890_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag4224_g76330;
				
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_texcoord7 = inputMesh.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76330;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						if (_TransparentCameraOnlyMotionVectors > 0)
						{
							previousPositionRWS = VMESHpositionRWS.xyz;
						}
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			#if ( 0 ) // TEMPORARY: defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : DEPTH_OFFSET_SEMANTIC
					#endif
				
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord3;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Smoothness227_g76330 = ( _MainSmoothnessValue * break5051_g76330.a );
				half Global_OverlaySmoothness311_g76330 = TVE_OverlaySmoothness;
				float3 vertexToFrag5095_g76330 = packedInput.ase_texcoord4.xyz;
				half3 World_Normal5097_g76330 = vertexToFrag5095_g76330;
				half Global_DynamicMode5093_g76330 = _VertexDynamicMode;
				float lerpResult5116_g76330 = lerp( (World_Normal5097_g76330).y , packedInput.ase_normal.y , Global_DynamicMode5093_g76330);
				half Overlay_Mask_Projection5120_g76330 = saturate( lerpResult5116_g76330 );
				float temp_output_84_0_g76339 = _LayerExtrasValue;
				float temp_output_19_0_g76343 = TVE_ExtrasUsage[(int)temp_output_84_0_g76339];
				float4 temp_output_93_19_g76339 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord5.xyz;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 vertexToFrag4224_g76330 = packedInput.ase_texcoord6.xyz;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 lerpResult4873_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ExtrasPositionMode);
				half2 UV96_g76339 = ( (temp_output_93_19_g76339).zw + ( (temp_output_93_19_g76339).xy * (lerpResult4873_g76330).xz ) );
				float4 tex2DArrayNode48_g76339 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76339,temp_output_84_0_g76339, 0.0 );
				float4 temp_output_17_0_g76343 = tex2DArrayNode48_g76339;
				float4 temp_output_94_85_g76339 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76343 = temp_output_94_85_g76339;
				float4 ifLocalVar18_g76343 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76343 >= 0.5 )
				ifLocalVar18_g76343 = temp_output_17_0_g76343;
				else
				ifLocalVar18_g76343 = temp_output_3_0_g76343;
				float4 lerpResult22_g76343 = lerp( temp_output_3_0_g76343 , temp_output_17_0_g76343 , temp_output_19_0_g76343);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76343 = lerpResult22_g76343;
				#else
				float4 staticSwitch24_g76343 = ifLocalVar18_g76343;
				#endif
				half4 Global_Extras_Params4995_g76330 = staticSwitch24_g76343;
				float4 break456_g76351 = Global_Extras_Params4995_g76330;
				half Global_Extras_Overlay156_g76330 = break456_g76351.z;
				half Overlay_Mask269_g76330 = ( _GlobalOverlay * Overlay_Mask_Projection5120_g76330 * Global_Extras_Overlay156_g76330 );
				float lerpResult343_g76330 = lerp( Main_Smoothness227_g76330 , Global_OverlaySmoothness311_g76330 , Overlay_Mask269_g76330);
				half Blend_Smoothness_Overlay371_g76330 = lerpResult343_g76330;
				half Global_Extras_Wetness305_g76330 = break456_g76351.y;
				half Wetness_Value5174_g76330 = ( Global_Extras_Wetness305_g76330 * _GlobalWetness );
				float temp_output_5193_0_g76330 = ( 1.0 - Wetness_Value5174_g76330 );
				half Blend_Smoothness_Wetness4130_g76330 = saturate( ( Blend_Smoothness_Overlay371_g76330 + ( 1.0 - ( temp_output_5193_0_g76330 * temp_output_5193_0_g76330 ) ) ) );
				
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord7.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = packedInput.ase_texcoord8.xyz;
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76330;
				surfaceDescription.Alpha = Final_Clip914_g76330;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				// Depth and Alpha to coverage
				#ifdef WRITE_MSAA_DEPTH
					// In case we are rendering in MSAA, reading the an MSAA depth buffer is way too expensive. To avoid that, we export the depth to a color buffer
					depthColor = packedInput.vmeshPositionCS.z;

					// Alpha channel is used for alpha to coverage
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif

				// Normal Buffer Processing
				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					#endif
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);

					// make sure we don't overwrite light layers
					outDecalBuffer.w = (GetMeshRenderingLightLayer() & 0x000000FF) / 255.0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Blend 1 SrcAlpha OneMinusSrcAlpha

			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


            ColorMask [_ColorMaskTransparentVelOne] 1
            ColorMask [_ColorMaskTransparentVelTwo] 2

			HLSLPROGRAM

            #pragma shader_feature_local_fragment _DISABLE_DECALS
            #pragma shader_feature_local_fragment _DISABLE_SSR
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 140007
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH
			#pragma multi_compile_fragment AREA_SHADOW_MEDIUM AREA_SHADOW_HIGH
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_FORWARD
		    #define HAS_LIGHTLOOP 1

			// Setup for Fog Enabled to apply in sky refletions in LightLoopDef.hlsl
            #define APPLY_FOG_ON_SKY_REFLECTIONS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_WetnessContrast;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask =			surfaceDescription.TransmissionMask;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
			#ifdef DECAL_NORMAL_BLENDING
				if (_EnableDecals)
				{
					#ifndef SURFACE_GRADIENT
					normalTS = SurfaceGradientFromTangentSpaceNormalAndFromTBN(normalTS, fragInputs.tangentToWorld[0], fragInputs.tangentToWorld[1]);
					#endif

					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData, normalTS);
				}

				GetNormalWS_SG(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);
			#else
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants);

				#if HAVE_DECALS
				if (_EnableDecals)
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
			#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.ase_texcoord.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord8 = vertexToFrag11_g76415;
				half Mesh_Height1524_g76330 = inputMesh.ase_color.a;
				float temp_output_7_0_g76384 = _GradientMinValue;
				float temp_output_10_0_g76384 = ( _GradientMaxValue - temp_output_7_0_g76384 );
				half Tint_Gradient_Value2784_g76330 = saturate( ( ( Mesh_Height1524_g76330 - temp_output_7_0_g76384 ) / ( temp_output_10_0_g76384 + 0.0001 ) ) );
				float vertexToFrag11_g76385 = Tint_Gradient_Value2784_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord9.x = vertexToFrag11_g76385;
				outputPackedVaryingsMeshToPS.ase_texcoord9.yzw = vertexToFrag3890_g76330;
				outputPackedVaryingsMeshToPS.ase_texcoord10.xyz = vertexToFrag4224_g76330;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5095_g76330 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord11.xyz = vertexToFrag5095_g76330;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord10.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord11.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76330;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

            #ifdef UNITY_VIRTUAL_TEXTURING
                #ifdef OUTPUT_SPLIT_LIGHTING
                   #define DIFFUSE_LIGHTING_TARGET SV_Target2
                   #define SSS_BUFFER_TARGET SV_Target3
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                   #define MOTION_VECTOR_TARGET SV_Target2
            	#endif
            #if defined(SHADER_API_PSSL)
            	#pragma PSSL_target_output_format(target 1 FMT_32_ABGR)
            #endif
            #else
                #ifdef OUTPUT_SPLIT_LIGHTING
                #define DIFFUSE_LIGHTING_TARGET SV_Target1
                #define SSS_BUFFER_TARGET SV_Target2
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                #define MOTION_VECTOR_TARGET SV_Target1
                #endif
            #endif

			void Frag(PackedVaryingsMeshToPS packedInput
				, out float4 outColor:SV_Target0
            #ifdef UNITY_VIRTUAL_TEXTURING
				, out float4 outVTFeedback : SV_Target1
            #endif
            #ifdef OUTPUT_SPLIT_LIGHTING
				, out float4 outDiffuseLighting : DIFFUSE_LIGHTING_TARGET
				, OUTPUT_SSSBUFFER(outSSSBuffer) : SSS_BUFFER_TARGET
            #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
				, out float4 outMotionVec : MOTION_VECTOR_TARGET
            #endif
            #ifdef _DEPTHOFFSET_ON
				, out float outputDepth : DEPTH_OFFSET_SEMANTIC
            #endif
		    
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 1.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (uint2)round(input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord7.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float3 lerpResult5342_g76330 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76330).rgb , _MainAlbedoValue);
				half3 Vertex_Color5344_g76330 = (packedInput.ase_color).rgb;
				float3 lerpResult4812_g76330 = lerp( lerpResult5342_g76330 , Vertex_Color5344_g76330 , _VertexColorMode);
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord8;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half3 Main_Color_RGB5335_g76330 = (lerpResult5328_g76330).rgb;
				half3 Main_Albedo99_g76330 = ( lerpResult4812_g76330 * Main_Color_RGB5335_g76330 );
				float3 temp_cast_0 = (1.0).xxx;
				float vertexToFrag11_g76385 = packedInput.ase_texcoord9.x;
				float3 lerpResult2779_g76330 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , vertexToFrag11_g76385);
				float3 lerpResult5052_g76330 = lerp( temp_cast_0 , lerpResult2779_g76330 , Main_Mask57_g76330);
				half3 Tint_Gradient_Color5252_g76330 = lerpResult5052_g76330;
				half3 Blend_Albedo_Tinted2808_g76330 = ( Main_Albedo99_g76330 * Tint_Gradient_Color5252_g76330 );
				float dotResult3616_g76330 = dot( Blend_Albedo_Tinted2808_g76330 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_1 = (dotResult3616_g76330).xxx;
				float temp_output_82_0_g76344 = _LayerColorsValue;
				float temp_output_19_0_g76348 = TVE_ColorsUsage[(int)temp_output_82_0_g76344];
				float4 temp_output_91_19_g76344 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord9.yzw;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 vertexToFrag4224_g76330 = packedInput.ase_texcoord10.xyz;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 lerpResult4868_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ColorsPositionMode);
				half2 UV94_g76344 = ( (temp_output_91_19_g76344).zw + ( (temp_output_91_19_g76344).xy * (lerpResult4868_g76330).xz ) );
				float4 tex2DArrayNode83_g76344 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76344,temp_output_82_0_g76344, 0.0 );
				float4 temp_output_17_0_g76348 = tex2DArrayNode83_g76344;
				float4 temp_output_92_86_g76344 = TVE_ColorsParams;
				float4 temp_output_3_0_g76348 = temp_output_92_86_g76344;
				float4 ifLocalVar18_g76348 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76348 >= 0.5 )
				ifLocalVar18_g76348 = temp_output_17_0_g76348;
				else
				ifLocalVar18_g76348 = temp_output_3_0_g76348;
				float4 lerpResult22_g76348 = lerp( temp_output_3_0_g76348 , temp_output_17_0_g76348 , temp_output_19_0_g76348);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76348 = lerpResult22_g76348;
				#else
				float4 staticSwitch24_g76348 = ifLocalVar18_g76348;
				#endif
				half4 Global_Colors_Params4994_g76330 = staticSwitch24_g76348;
				float4 temp_output_346_0_g76359 = Global_Colors_Params4994_g76330;
				half Global_Colors_A1701_g76330 = saturate( (temp_output_346_0_g76359).w );
				half Global_Colors_Influence3668_g76330 = Global_Colors_A1701_g76330;
				float3 lerpResult3618_g76330 = lerp( Blend_Albedo_Tinted2808_g76330 , temp_cast_1 , Global_Colors_Influence3668_g76330);
				half3 Global_Colors_RGB1700_g76330 = (temp_output_346_0_g76359).xyz;
				half3 Global_Colors1954_g76330 = ( Global_Colors_RGB1700_g76330 * 4.594794 * _ColorsIntensityValue );
				half Global_Colors_Mask5155_g76330 = Main_Mask57_g76330;
				float lerpResult16_g76386 = lerp( 0.0 , ( _GlobalColors * Global_Colors_Mask5155_g76330 ) , TVE_IsEnabled);
				float3 lerpResult3628_g76330 = lerp( Blend_Albedo_Tinted2808_g76330 , ( lerpResult3618_g76330 * Global_Colors1954_g76330 ) , lerpResult16_g76386);
				half3 Blend_Albedo_Colored863_g76330 = lerpResult3628_g76330;
				half3 Global_OverlayColor1758_g76330 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5095_g76330 = packedInput.ase_texcoord11.xyz;
				half3 World_Normal5097_g76330 = vertexToFrag5095_g76330;
				half Global_DynamicMode5093_g76330 = _VertexDynamicMode;
				float lerpResult5116_g76330 = lerp( (World_Normal5097_g76330).y , packedInput.ase_normal.y , Global_DynamicMode5093_g76330);
				half Overlay_Mask_Projection5120_g76330 = saturate( lerpResult5116_g76330 );
				float temp_output_84_0_g76339 = _LayerExtrasValue;
				float temp_output_19_0_g76343 = TVE_ExtrasUsage[(int)temp_output_84_0_g76339];
				float4 temp_output_93_19_g76339 = TVE_ExtrasCoords;
				float3 lerpResult4873_g76330 = lerp( WorldPosition3905_g76330 , ObjectPosition4223_g76330 , _ExtrasPositionMode);
				half2 UV96_g76339 = ( (temp_output_93_19_g76339).zw + ( (temp_output_93_19_g76339).xy * (lerpResult4873_g76330).xz ) );
				float4 tex2DArrayNode48_g76339 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76339,temp_output_84_0_g76339, 0.0 );
				float4 temp_output_17_0_g76343 = tex2DArrayNode48_g76339;
				float4 temp_output_94_85_g76339 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76343 = temp_output_94_85_g76339;
				float4 ifLocalVar18_g76343 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76343 >= 0.5 )
				ifLocalVar18_g76343 = temp_output_17_0_g76343;
				else
				ifLocalVar18_g76343 = temp_output_3_0_g76343;
				float4 lerpResult22_g76343 = lerp( temp_output_3_0_g76343 , temp_output_17_0_g76343 , temp_output_19_0_g76343);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76343 = lerpResult22_g76343;
				#else
				float4 staticSwitch24_g76343 = ifLocalVar18_g76343;
				#endif
				half4 Global_Extras_Params4995_g76330 = staticSwitch24_g76343;
				float4 break456_g76351 = Global_Extras_Params4995_g76330;
				half Global_Extras_Overlay156_g76330 = break456_g76351.z;
				half Overlay_Mask269_g76330 = ( _GlobalOverlay * Overlay_Mask_Projection5120_g76330 * Global_Extras_Overlay156_g76330 );
				float3 lerpResult336_g76330 = lerp( Blend_Albedo_Colored863_g76330 , Global_OverlayColor1758_g76330 , Overlay_Mask269_g76330);
				half3 Blend_Albedo_Overlay359_g76330 = lerpResult336_g76330;
				half Global_WetnessContrast5191_g76330 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76330 = break456_g76351.y;
				half Wetness_Value5174_g76330 = ( Global_Extras_Wetness305_g76330 * _GlobalWetness );
				float3 lerpResult5186_g76330 = lerp( Blend_Albedo_Overlay359_g76330 , ( Blend_Albedo_Overlay359_g76330 * Blend_Albedo_Overlay359_g76330 ) , ( Global_WetnessContrast5191_g76330 * Wetness_Value5174_g76330 ));
				half3 Blend_Albedo_Wetness5182_g76330 = lerpResult5186_g76330;
				half3 Blend_Albedo_Subsurface149_g76330 = Blend_Albedo_Wetness5182_g76330;
				
				half Main_Metallic237_g76330 = ( _MainMetallicValue * break5051_g76330.r );
				float lerpResult342_g76330 = lerp( Main_Metallic237_g76330 , 0.0 , Overlay_Mask269_g76330);
				half Blend_Metallic_Overlay367_g76330 = lerpResult342_g76330;
				
				half Main_Smoothness227_g76330 = ( _MainSmoothnessValue * break5051_g76330.a );
				half Global_OverlaySmoothness311_g76330 = TVE_OverlaySmoothness;
				float lerpResult343_g76330 = lerp( Main_Smoothness227_g76330 , Global_OverlaySmoothness311_g76330 , Overlay_Mask269_g76330);
				half Blend_Smoothness_Overlay371_g76330 = lerpResult343_g76330;
				float temp_output_5193_0_g76330 = ( 1.0 - Wetness_Value5174_g76330 );
				half Blend_Smoothness_Wetness4130_g76330 = saturate( ( Blend_Smoothness_Overlay371_g76330 + ( 1.0 - ( temp_output_5193_0_g76330 * temp_output_5193_0_g76330 ) ) ) );
				
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.BaseColor = Blend_Albedo_Subsurface149_g76330;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = Blend_Metallic_Overlay367_g76330;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76330;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = Final_Clip914_g76330;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);

            #ifdef DEBUG_DISPLAY
            #ifdef OUTPUT_SPLIT_LIGHTING
				outDiffuseLighting = float4(0, 0, 0, 1);
				ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
			#endif

				bool viewMaterial = false;
				int bufferSize = _DebugViewMaterialArray[0].x;
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = _DebugViewMaterialArray[index].x;

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB && _DebugAOVOutput == 0)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);
						GetPBRValidatorDebug(surfaceData, result);
						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
                #endif
					{
                #ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
                #else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
                #endif
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;

						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

                #ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = float4(0, 0, 0, 1);
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
                #else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
                #endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
                #if defined(HAVE_VFX_MODIFICATION) && !VFX_FEATURE_MOTION_VECTORS
                        forceNoMotion = true;
                #endif
				        if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
				}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
					outVTFeedback = builtinData.vtPackedFeedback;
				#endif

                #ifdef UNITY_VIRTUAL_TEXTURING
				    float vtAlphaValue = builtinData.opacity;
                    #if defined(HAS_REFRACTION) && HAS_REFRACTION
					vtAlphaValue = 1.0f - bsdfData.transmittanceMask;
                #endif
				outVTFeedback = PackVTFeedbackWithAlpha(builtinData.vtPackedFeedback, input.positionSS.xy, vtAlphaValue);
                #endif
			}
			ENDHLSL
		}

		
		Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

            HLSLPROGRAM

			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 140007
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_TANGENT_TO_WORLD

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		    #define VARYINGS_NEED_CULLFACE
			#endif
			#endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
			#define WRITE_NORMAL_BUFFER
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			float4 _SelectionID;
            CBUFFER_START( UnityPerMaterial )
			float4 _SubsurfaceDiffusion_Asset;
			half4 _GradientMaskRemap;
			half4 _MainColorTwo;
			half4 _MainColor;
			float4 _MaxBoundsInfo;
			half4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _LeavesFilterColor;
			half _IsStandardShader;
			float _MotionSpeed_32;
			float _MotionScale_32;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MotionAmplitude_32;
			half _LayerVertexValue;
			half _SizeFadeStartValue;
			half _SizeFadeEndValue;
			half _AlphaClipValue;
			half _MainSmoothnessValue;
			half _MainMetallicValue;
			half _GlobalWetness;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _VertexDynamicMode;
			half _GlobalOverlay;
			half _GlobalSize;
			half _GlobalColors;
			half _ColorsPositionMode;
			half _LayerColorsValue;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _MainColorMode;
			half _VertexColorMode;
			half _MainAlbedoValue;
			half _EmissiveFlagMode;
			half _ColorsIntensityValue;
			half _MessagePolygonalMask;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _CategorySizeFade;
			half _CategoryGradient;
			half _CategoryMain;
			half _CategoryGlobal;
			half _CategoryRender;
			half _SpaceRenderFade;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderPriority;
			half _RenderQueue;
			half _RenderMode;
			half _RenderSSR;
			half _RenderCoverage;
			half _RenderClip;
			half _RenderZWrite;
			half _RenderDecals;
			float _IsPlantShader;
			half _CategoryMotion;
			half _CategoryEmissive;
			half _IsPolygonalShader;
			half _IsTVEShader;
			half _FadeCameraValue;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _LeavesFilterMode;
			half _Cutoff;
			half _LayerReactValue;
			half _RenderShadow;
			half _RenderAmbient;
			half _SpaceSubsurface;
			half _RenderDirect;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _HasOcclusion;
			half _IsVersion;
			half _FadeConstantValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			TEXTURE2D(_MainMaskTex);
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 tangentWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

            struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
				float DepthOffset;
			};

			struct SurfaceDescriptionInputs
			{
				float3 ObjectSpaceNormal;
				float3 WorldSpaceNormal;
				float3 TangentSpaceNormal;
				float3 ObjectSpaceViewDirection;
				float3 WorldSpaceViewDirection;
				float3 ObjectSpacePosition;
			};


            void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {

                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif

                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
				float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
				ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);
                #endif

                #ifdef _ALPHATEST_ON
				float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
				alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                #endif
				GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif

                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

                #ifdef FRAG_INPUTS_USE_TEXCOORD1
				float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
				float4 lightmapTexCoord1 = float4(0, 0, 0, 0);
                #endif

                #ifdef FRAG_INPUTS_USE_TEXCOORD2
				float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
				float4 lightmapTexCoord2 = float4(0, 0, 0, 0);
                #endif

				//InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);

                //#else
                //BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

                ZERO_INITIALIZE(SurfaceData, surfaceData);

                ZERO_BUILTIN_INITIALIZE(builtinData);
                builtinData.opacity = surfaceDescription.Alpha;

                #if defined(DEBUG_DISPLAY)
				builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif

                #ifdef _ALPHATEST_ON
				builtinData.alphaClipTreshold = alphaCutoff;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif

                #if _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                #if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif

                #ifndef SHADER_UNLIT
				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
				ApplyDebugToBuiltinData(builtinData);
                #endif

				RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS

            }


			VertexOutput VertexFunction(VertexInput inputMesh  )
			{

				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o );

				float3 VertexPosition3588_g76330 = inputMesh.positionOS;
				float3 appendResult60_g76382 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData4924_g76330 = ( appendResult60_g76382 * _VertexPivotMode );
				half3 Mesh_PivotsOS4923_g76330 = Mesh_PivotsData4924_g76330;
				float3 temp_output_4933_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				half3 VertexPos40_g76406 = temp_output_4933_0_g76330;
				half3 VertexPos40_g76407 = VertexPos40_g76406;
				float3 appendResult74_g76407 = (float3(VertexPos40_g76407.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76407 = appendResult74_g76407;
				float3 break84_g76407 = VertexPos40_g76407;
				float3 appendResult81_g76407 = (float3(0.0 , break84_g76407.y , break84_g76407.z));
				half3 VertexPosOtherAxis82_g76407 = appendResult81_g76407;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76330 = ase_worldPos;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float3 WorldPosition_Shifted5264_g76330 = ( WorldPosition3905_g76330 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76393 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76393 = Mesh_PivotsData4924_g76330;
				float3 PivotsOnly105_g76393 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76393 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76393 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76393 = ( localObjectPosition_UNITY_MATRIX_M14_g76393 + PivotsOnly105_g76393 );
				#endif
				half3 ObjectData20_g76395 = staticSwitch13_g76393;
				half3 WorldData19_g76395 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76395 = WorldData19_g76395;
				#else
				float3 staticSwitch14_g76395 = ObjectData20_g76395;
				#endif
				float3 temp_output_114_0_g76393 = staticSwitch14_g76395;
				float3 vertexToFrag4224_g76330 = temp_output_114_0_g76393;
				float3 ObjectPosition4223_g76330 = vertexToFrag4224_g76330;
				float3 ObjectPosition_Shifted5268_g76330 = ( ObjectPosition4223_g76330 - TVE_WorldOrigin );
				float3 lerpResult5229_g76330 = lerp( WorldPosition_Shifted5264_g76330 , ObjectPosition_Shifted5268_g76330 , _MotionPosition_10);
				float3 Motion_10_Position5222_g76330 = lerpResult5229_g76330;
				half3 Input_Position419_g76366 = Motion_10_Position5222_g76330;
				float Input_MotionScale287_g76366 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76366 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76366 = (( Input_Position419_g76366 * Input_MotionScale287_g76366 * NoiseTex_Tilling735_g76366 * 0.0075 )).xz;
				float2 temp_output_447_0_g76357 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76330 = temp_output_447_0_g76357;
				half2 Input_DirectionWS423_g76366 = Global_Wind_DirectionWS4683_g76330;
				float lerpResult128_g76367 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76366 = _MotionSpeed_10;
				half Input_MotionVariation284_g76366 = 0.0;
				half Input_GlobalMeshVariation569_g76366 = 0.0;
				float temp_output_630_0_g76366 = ( ( ( lerpResult128_g76367 * Input_MotionSpeed62_g76366 ) + ( Input_MotionVariation284_g76366 * Input_GlobalMeshVariation569_g76366 ) ) * 0.03 );
				float temp_output_607_0_g76366 = frac( temp_output_630_0_g76366 );
				float4 lerpResult590_g76366 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * temp_output_607_0_g76366 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76366 + ( -Input_DirectionWS423_g76366 * frac( ( temp_output_630_0_g76366 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76366 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76366 = lerpResult590_g76366;
				float2 temp_output_645_0_g76366 = ((Noise_Complex703_g76366).rg*2.0 + -1.0);
				float2 break650_g76366 = temp_output_645_0_g76366;
				float3 appendResult649_g76366 = (float3(break650_g76366.x , 0.0 , break650_g76366.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5008_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76366 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76371 = Global_Noise_OS5008_g76330;
				float2 break448_g76357 = temp_output_447_0_g76357;
				float3 appendResult452_g76357 = (float3(break448_g76357.x , 0.0 , break448_g76357.y));
				half2 Global_Wind_DirectionOS5138_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76371 = Global_Wind_DirectionOS5138_g76330;
				float temp_output_84_0_g76352 = _LayerMotionValue;
				float temp_output_19_0_g76356 = TVE_MotionUsage[(int)temp_output_84_0_g76352];
				float4 temp_output_91_19_g76352 = TVE_MotionCoords;
				half2 UV94_g76352 = ( (temp_output_91_19_g76352).zw + ( (temp_output_91_19_g76352).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76352 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76352,temp_output_84_0_g76352, 0.0 );
				float4 temp_output_17_0_g76356 = tex2DArrayNode50_g76352;
				float4 temp_output_112_19_g76352 = TVE_MotionParams;
				float4 temp_output_3_0_g76356 = temp_output_112_19_g76352;
				float4 ifLocalVar18_g76356 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76356 >= 0.5 )
				ifLocalVar18_g76356 = temp_output_17_0_g76356;
				else
				ifLocalVar18_g76356 = temp_output_3_0_g76356;
				float4 lerpResult22_g76356 = lerp( temp_output_3_0_g76356 , temp_output_17_0_g76356 , temp_output_19_0_g76356);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76356 = lerpResult22_g76356;
				#else
				float4 staticSwitch24_g76356 = ifLocalVar18_g76356;
				#endif
				half4 Global_Motion_Params3909_g76330 = staticSwitch24_g76356;
				float4 break322_g76357 = Global_Motion_Params3909_g76330;
				float lerpResult457_g76357 = lerp( break322_g76357.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76357 = ( 1.0 - lerpResult457_g76357 );
				half Global_Motion_Wind2223_g76330 = ( 1.0 - ( temp_output_459_0_g76357 * temp_output_459_0_g76357 ) );
				half Input_WindPower449_g76371 = Global_Motion_Wind2223_g76330;
				float2 lerpResult516_g76371 = lerp( Input_Noise_DirectionOS487_g76371 , Input_Wind_DirectionOS458_g76371 , ( Input_WindPower449_g76371 * 0.6 ));
				half Mesh_Motion_105282_g76330 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76371 = Mesh_Motion_105282_g76330;
				half ObjectData20_g76372 = Input_MeshHeight388_g76371;
				float enc62_g76412 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76412 = DecodeFloatToVector2( enc62_g76412 );
				float2 break63_g76412 = ( localDecodeFloatToVector262_g76412 * 100.0 );
				float Bounds_Height4944_g76330 = break63_g76412.x;
				half Input_BoundsHeight390_g76371 = Bounds_Height4944_g76330;
				half WorldData19_g76372 = ( Input_MeshHeight388_g76371 * Input_MeshHeight388_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76372 = WorldData19_g76372;
				#else
				float staticSwitch14_g76372 = ObjectData20_g76372;
				#endif
				half Final_Motion10_Mask321_g76371 = ( staticSwitch14_g76372 * 2.0 );
				half Motion_10_Amplitude4617_g76330 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76371 = Motion_10_Amplitude4617_g76330;
				half Global_MotionValue640_g76371 = TVE_MotionValue_10;
				half2 Final_Bending631_g76371 = ( lerpResult516_g76371 * ( Final_Motion10_Mask321_g76371 * Input_BendingAmplitude376_g76371 * Input_WindPower449_g76371 * Input_WindPower449_g76371 * Global_MotionValue640_g76371 ) );
				float2 appendResult433_g76357 = (float2(break322_g76357.x , break322_g76357.y));
				float2 temp_output_436_0_g76357 = (appendResult433_g76357*2.0 + -1.0);
				float2 break441_g76357 = temp_output_436_0_g76357;
				float3 appendResult440_g76357 = (float3(break441_g76357.x , 0.0 , break441_g76357.y));
				half2 Global_React_DirectionOS5005_g76330 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76357 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76371 = Global_React_DirectionOS5005_g76330;
				float clampResult17_g76374 = clamp( Input_MeshHeight388_g76371 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76373 = 0.0;
				half Input_InteractionUseMask62_g76371 = _InteractionMaskValue;
				float temp_output_10_0_g76373 = ( Input_InteractionUseMask62_g76371 - temp_output_7_0_g76373 );
				half Final_InteractionRemap594_g76371 = saturate( ( ( clampResult17_g76374 - temp_output_7_0_g76373 ) / ( temp_output_10_0_g76373 + 0.0001 ) ) );
				half ObjectData20_g76375 = Final_InteractionRemap594_g76371;
				half WorldData19_g76375 = ( Final_InteractionRemap594_g76371 * Final_InteractionRemap594_g76371 * Input_BoundsHeight390_g76371 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76375 = WorldData19_g76375;
				#else
				float staticSwitch14_g76375 = ObjectData20_g76375;
				#endif
				half Final_InteractionMask373_g76371 = ( staticSwitch14_g76375 * 2.0 );
				half Input_InteractionAmplitude58_g76371 = _InteractionAmplitude;
				half2 Final_Interaction632_g76371 = ( Input_React_DirectionOS358_g76371 * Final_InteractionMask373_g76371 * Input_InteractionAmplitude58_g76371 );
				half Global_Motion_Interaction66_g76330 = ( break322_g76357.w * break322_g76357.w * break322_g76357.w * break322_g76357.w );
				float Input_InteractionGlobalMask330_g76371 = Global_Motion_Interaction66_g76330;
				half Final_InteractionValue525_g76371 = saturate( ( Input_InteractionAmplitude58_g76371 * Input_InteractionGlobalMask330_g76371 ) );
				float2 lerpResult551_g76371 = lerp( Final_Bending631_g76371 , Final_Interaction632_g76371 , Final_InteractionValue525_g76371);
				float2 break364_g76371 = lerpResult551_g76371;
				float3 appendResult638_g76371 = (float3(break364_g76371.x , 0.0 , break364_g76371.y));
				half3 Motion_10_Interaction190_g76330 = appendResult638_g76371;
				half3 Angle44_g76406 = Motion_10_Interaction190_g76330;
				half Angle44_g76407 = (Angle44_g76406).z;
				half3 VertexPos40_g76408 = ( VertexPosRotationAxis50_g76407 + ( VertexPosOtherAxis82_g76407 * cos( Angle44_g76407 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76407 ) * sin( Angle44_g76407 ) ) );
				float3 appendResult74_g76408 = (float3(0.0 , 0.0 , VertexPos40_g76408.z));
				half3 VertexPosRotationAxis50_g76408 = appendResult74_g76408;
				float3 break84_g76408 = VertexPos40_g76408;
				float3 appendResult81_g76408 = (float3(break84_g76408.x , break84_g76408.y , 0.0));
				half3 VertexPosOtherAxis82_g76408 = appendResult81_g76408;
				half Angle44_g76408 = -(Angle44_g76406).x;
				half3 Input_Position500_g76376 = WorldPosition_Shifted5264_g76330;
				half Input_MotionScale321_g76376 = _MotionScale_32;
				half Input_MotionVariation330_g76376 = 0.0;
				half Input_GlobalVariation372_g76376 = 0.0;
				float lerpResult128_g76377 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76376 = _MotionSpeed_32;
				float4 tex2DNode460_g76376 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76376).xz * Input_MotionScale321_g76376 * 0.03 ) + ( Input_MotionVariation330_g76376 * Input_GlobalVariation372_g76376 ) + ( lerpResult128_g76377 * Input_MotionSpeed62_g76376 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76376 = (float3(tex2DNode460_g76376.r , tex2DNode460_g76376.g , tex2DNode460_g76376.b));
				half3 Flutter_Texture489_g76376 = (appendResult462_g76376*2.0 + -1.0);
				half2 Main_UVs15_g76330 = inputMesh.ase_texcoord.xy;
				float4 vertexToFrag11_g76415 = SAMPLE_TEXTURE2D_LOD( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76330, 0.0 );
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float temp_output_7_0_g76381 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76381 = ( TVE_MotionFadeStart - temp_output_7_0_g76381 );
				half Wind_FadeOut4005_g76330 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76381 ) / ( temp_output_10_0_g76381 + 0.0001 ) ) );
				half Motion_30_Amplitude263_g76330 = ( _MotionAmplitude_32 * Main_Mask57_g76330 * Wind_FadeOut4005_g76330 );
				half Input_MotionAmplitude58_g76376 = Motion_30_Amplitude263_g76330;
				float enc59_g76412 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76412 = DecodeFloatToVector2( enc59_g76412 );
				float2 break61_g76412 = localDecodeFloatToVector259_g76412;
				half Mesh_Motion_30144_g76330 = break61_g76412.y;
				half Input_MeshMotion_30374_g76376 = Mesh_Motion_30144_g76330;
				half Input_GlobalWind471_g76376 = Global_Motion_Wind2223_g76330;
				half Global_MotionValue503_g76376 = TVE_MotionValue_30;
				float4 break638_g76366 = abs( Noise_Complex703_g76366 );
				half Global_Noise_B4967_g76330 = break638_g76366.b;
				half Input_GlobalNoise472_g76376 = Global_Noise_B4967_g76330;
				float lerpResult466_g76376 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76376);
				half Flutter_Amplitude491_g76376 = ( Input_MotionAmplitude58_g76376 * Input_MeshMotion_30374_g76376 * Input_GlobalWind471_g76376 * Global_MotionValue503_g76376 * pow( Input_GlobalNoise472_g76376 , lerpResult466_g76376 ) );
				half3 Motion_30_Flutter4899_g76330 = ( Flutter_Texture489_g76376 * Flutter_Amplitude491_g76376 );
				float3 Vertex_Motion_Object833_g76330 = ( ( VertexPosRotationAxis50_g76408 + ( VertexPosOtherAxis82_g76408 * cos( Angle44_g76408 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76408 ) * sin( Angle44_g76408 ) ) ) + Motion_30_Flutter4899_g76330 );
				half3 ObjectData20_g76403 = Vertex_Motion_Object833_g76330;
				float3 temp_output_4934_0_g76330 = ( VertexPosition3588_g76330 - Mesh_PivotsOS4923_g76330 );
				float3 Vertex_Motion_World1118_g76330 = ( ( temp_output_4934_0_g76330 + Motion_10_Interaction190_g76330 ) + Motion_30_Flutter4899_g76330 );
				half3 WorldData19_g76403 = Vertex_Motion_World1118_g76330;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76403 = WorldData19_g76403;
				#else
				float3 staticSwitch14_g76403 = ObjectData20_g76403;
				#endif
				float3 temp_output_5273_0_g76330 = staticSwitch14_g76403;
				float3 Vertex_Motion5270_g76330 = temp_output_5273_0_g76330;
				float temp_output_84_0_g76360 = _LayerVertexValue;
				float temp_output_19_0_g76364 = TVE_VertexUsage[(int)temp_output_84_0_g76360];
				float4 temp_output_94_19_g76360 = TVE_VertexCoords;
				half2 UV97_g76360 = ( (temp_output_94_19_g76360).zw + ( (temp_output_94_19_g76360).xy * (ObjectPosition4223_g76330).xz ) );
				float4 tex2DArrayNode50_g76360 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76360,temp_output_84_0_g76360, 0.0 );
				float4 temp_output_17_0_g76364 = tex2DArrayNode50_g76360;
				float4 temp_output_111_19_g76360 = TVE_VertexParams;
				float4 temp_output_3_0_g76364 = temp_output_111_19_g76360;
				float4 ifLocalVar18_g76364 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76364 >= 0.5 )
				ifLocalVar18_g76364 = temp_output_17_0_g76364;
				else
				ifLocalVar18_g76364 = temp_output_3_0_g76364;
				float4 lerpResult22_g76364 = lerp( temp_output_3_0_g76364 , temp_output_17_0_g76364 , temp_output_19_0_g76364);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76364 = lerpResult22_g76364;
				#else
				float4 staticSwitch24_g76364 = ifLocalVar18_g76364;
				#endif
				half4 Global_Vertex_Params4173_g76330 = staticSwitch24_g76364;
				float4 break322_g76370 = Global_Vertex_Params4173_g76330;
				half Global_Vertex_Size174_g76330 = saturate( break322_g76370.w );
				float lerpResult346_g76330 = lerp( 1.0 , Global_Vertex_Size174_g76330 , _GlobalSize);
				float3 appendResult3480_g76330 = (float3(lerpResult346_g76330 , lerpResult346_g76330 , lerpResult346_g76330));
				half3 ObjectData20_g76401 = appendResult3480_g76330;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76401 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76401 = WorldData19_g76401;
				#else
				float3 staticSwitch14_g76401 = ObjectData20_g76401;
				#endif
				half3 Vertex_Size1741_g76330 = staticSwitch14_g76401;
				float temp_output_7_0_g76402 = _SizeFadeEndValue;
				float temp_output_10_0_g76402 = ( _SizeFadeStartValue - temp_output_7_0_g76402 );
				float temp_output_556_0_g76330 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76330 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 appendResult3482_g76330 = (float3(temp_output_556_0_g76330 , temp_output_556_0_g76330 , temp_output_556_0_g76330));
				half3 ObjectData20_g76400 = appendResult3482_g76330;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76400 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76400 = WorldData19_g76400;
				#else
				float3 staticSwitch14_g76400 = ObjectData20_g76400;
				#endif
				float3 Vertex_SizeFade1740_g76330 = staticSwitch14_g76400;
				float3 lerpResult16_g76405 = lerp( VertexPosition3588_g76330 , ( ( Vertex_Motion5270_g76330 * Vertex_Size1741_g76330 * Vertex_SizeFade1740_g76330 ) + Mesh_PivotsOS4923_g76330 ) , TVE_IsEnabled);
				float3 temp_output_4889_0_g76330 = lerpResult16_g76405;
				float3 Final_VertexPosition890_g76330 = ( temp_output_4889_0_g76330 + _DisableSRPBatcher );
				
				o.ase_texcoord3.xyz = ase_worldPos;
				o.ase_texcoord4.xyz = vertexToFrag3890_g76330;
				o.ase_texcoord5 = vertexToFrag11_g76415;
				
				o.ase_texcoord2 = inputMesh.ase_texcoord;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  Final_VertexPosition890_g76330;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS = inputMesh.tangentOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				o.positionCS = TransformWorldToHClip(positionRWS);
				o.normalWS.xyz =  normalWS;
				o.tangentWS.xyzw =  tangentWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(	VertexOutput packedInput
						, out float4 outColor : SV_Target0
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS.xyzw, packedInput.normalWS.xyz);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float localCustomAlphaClip19_g76392 = ( 0.0 );
				half2 Main_UVs15_g76330 = packedInput.ase_texcoord2.xy;
				float4 tex2DNode29_g76330 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76330 );
				float Main_Alpha316_g76330 = tex2DNode29_g76330.a;
				half AlphaTreshold2132_g76330 = _AlphaClipValue;
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float temp_output_7_0_g76387 = TVE_CameraFadeMin;
				float temp_output_10_0_g76387 = ( TVE_CameraFadeMax - temp_output_7_0_g76387 );
				float lerpResult4755_g76330 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76387 ) / ( temp_output_10_0_g76387 + 0.0001 ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76330 = lerpResult4755_g76330;
				half Fade_Effects3727_g76330 = ( Fade_Camera3743_g76330 * ( 1.0 - _FadeConstantValue ) );
				float3 vertexToFrag3890_g76330 = packedInput.ase_texcoord4.xyz;
				float3 WorldPosition3905_g76330 = vertexToFrag3890_g76330;
				float temp_output_5044_0_g76330 = saturate( ( Fade_Effects3727_g76330 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76330 ) ).r ) );
				half Fade_Alpha4990_g76330 = temp_output_5044_0_g76330;
				half Final_Alpha5254_g76330 = min( ( Main_Alpha316_g76330 - AlphaTreshold2132_g76330 ) , Fade_Alpha4990_g76330 );
				float temp_output_3_0_g76392 = Final_Alpha5254_g76330;
				float Alpha19_g76392 = temp_output_3_0_g76392;
				float temp_output_15_0_g76392 = 0.01;
				float Treshold19_g76392 = temp_output_15_0_g76392;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#else
				clip(Alpha19_g76392 - Treshold19_g76392);
				#endif
				#endif
				}
				float4 vertexToFrag11_g76415 = packedInput.ase_texcoord5;
				float4 break5051_g76330 = vertexToFrag11_g76415;
				half Main_Mask57_g76330 = break5051_g76330.b;
				float lerpResult5346_g76330 = lerp( 1.0 , Main_Mask57_g76330 , _MainColorMode);
				float4 lerpResult5328_g76330 = lerp( _MainColorTwo , _MainColor , lerpResult5346_g76330);
				half Main_Color_Alpha5337_g76330 = (lerpResult5328_g76330).a;
				half Final_Clip914_g76330 = saturate( ( Alpha19_g76392 * Main_Color_Alpha5337_g76330 ) );
				
				surfaceDescription.Alpha = Final_Clip914_g76330;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;


				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				outColor = _SelectionID;
			}

            ENDHLSL
		}

        Pass
        {

            Name "FullScreenDebug"
            Tags 
			{ 
				"LightMode" = "FullScreenDebug" 
            }

            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

            HLSLPROGRAM

			/*ase_pragma_before*/

			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer

			#pragma vertex Vert
			#pragma fragment Frag


			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
		    #define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if !( (SHADERPASS == SHADERPASS_FORWARD) || (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT) \
               || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT)\
               || (SHADERPASS == SHADERPASS_PATH_TRACING) || (SHADERPASS == SHADERPASS_RAYTRACING_SUB_SURFACE) \
               || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) )

		    #define DISABLE_MODIFY_BAKED_DIFFUSE_LIGHTING
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};

			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}

            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};

			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);

				output.ObjectSpaceNormal =                          input.normalOS;
				output.ObjectSpaceTangent =                         input.tangentOS.xyz;
				output.ObjectSpacePosition =                        input.positionOS;

				return output;
			}

			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);

				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS;

				return output;
			}

			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil]
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}
            ENDHLSL
        }
		
	}
	
	CustomEditor "TVEShaderCoreGUI"
	
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;541;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentBackface;0;6;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;False;False;True;0;True;_ZWrite;True;0;True;_ZTestTransparent;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;543;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPostpass;0;8;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;537;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;538;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;542;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPrepass;0;7;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;1;False;;1;False;;7;False;;3;False;;1;False;;1;False;;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;545;-1376,-274;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;10;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;536;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;535;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;544;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;9;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;True;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;340;-2176,256;Inherit;False;1279.938;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1280.296;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;534;-1088,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;15;BOXOPHOBIC/The Vegetation Engine/Geometry/Plant Standard Lit (Polygonal);28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;0;GBuffer;34;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;_CullMode;False;True;True;True;True;True;0;True;_LightLayersMaskBuffer4;False;False;False;False;False;False;True;True;True;0;True;_StencilRefGBuffer;255;False;;255;True;_StencilWriteMaskGBuffer;7;False;;3;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;False;True;0;True;_ZTestGBuffer;False;True;1;LightMode=GBuffer;False;False;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;0;0;Standard;39;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;637921063891781133;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;0;0;  Energy Conserving Specular;1;0;  Transmission,InvertActionOnDeselection;0;0;Forward Only;0;0;Receive Decals;1;0;Receives SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;1;637831994384971479;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;0;637831994400901266;Override Baked GI;0;0;Depth Offset;0;0;DOTS Instancing;1;637921063843334459;GPU Instancing;1;0;LOD CrossFade;1;637921063851469112;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position;0;637831994420739201;0;11;True;True;True;True;True;True;False;False;False;True;True;False;;True;0
Node;AmplifyShaderEditor.FunctionNode;431;-1088,384;Inherit;False;Compile All Shaders;-1;;76325;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;533;-1280,384;Inherit;False;Compile Polygonal;-1;;76326;f2db24258d28b2a4885b7bfa20c80bc2;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;546;-2176,384;Inherit;False;Define Pipeline HD;-1;;76327;7af1bc24c286d754db63fb6a44aba77b;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;547;-1952,384;Inherit;False;Define Lighting Standard;133;;76328;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;548;-1696,384;Inherit;False;Define ShaderType Plant;135;;76329;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;549;-1088,-9;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;532;-2176,-384;Inherit;False;Base Polygonal;0;;76330;69ac49dc448658e459ede3d88c745447;43,5351,1,5257,0,4028,1,3900,1,3908,1,4172,1,3586,0,4499,1,1708,1,1717,1,1714,1,1718,1,3475,1,5170,1,4210,0,1745,1,3479,0,5156,1,1646,0,3501,1,2807,1,3886,0,5249,0,4981,1,5196,0,4976,0,3728,1,4980,0,1742,1,3484,0,860,1,2261,1,2260,1,2062,1,2039,1,5278,1,5280,1,4217,1,5226,1,5276,0,4931,1,4919,1,5274,0;2;5251;FLOAT3;1,1,1;False;5275;FLOAT3;0,0,0;False;19;FLOAT3;0;FLOAT3;2489;FLOAT;4135;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4127;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;4966;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;4993;FLOAT;629;FLOAT3;534
WireConnection;534;0;532;0
WireConnection;534;4;532;529
WireConnection;534;7;532;530
WireConnection;534;9;532;532
WireConnection;534;11;532;534
ASEEND*/
//CHKSM=87BFA75A6F1B15A9E07E6F020A6B5FBC070A3E61
