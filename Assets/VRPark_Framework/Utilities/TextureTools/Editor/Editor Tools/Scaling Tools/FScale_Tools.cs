using FIMSpace.FTex;
using UnityEditor;
using UnityEngine;

namespace FIMSpace.FEditor
{
    public static class FScale_Tools
    {
        
        [MenuItem("VRPark/Utilities/Texture Tools//Change Scale")]
        public static void RescaleTexture()
        {
            FScale_ScalerWindow.Init();
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Quick Rescale")]
        public static void QuickRescaleTexture()
        {
            FScale_QuickScaleWindow.Init();
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Convert any to PNG")]
        public static void ToPNGConversion()
        {
            FScale_QuickConverterWindow.Init();
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Channel Insert")]
        public static void ChannelInserter()
        {
            FScale_ChannelInserter.Init();
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Channelled Generator")]
        public static void ChanneledGenerator()
        {
            FScale_ChannelledGenerator.Init();
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Scale to nearest power of 2")]
        public static void ScaleToPowerOf2()
        {
            try
            {
                for (int i = 0; i < Selection.objects.Length; i++)
                {
                    Texture2D texture = AssetDatabase.LoadAssetAtPath<Texture2D>(AssetDatabase.GetAssetPath(Selection.objects[i]));

                    EditorUtility.DisplayProgressBar("Scaling textures...", "Scaling texture " + texture.name, (float)i / (float)Selection.objects.Length);

                    if (texture != null)
                        FScale_EditorToolsMethods.ScaleTextureFile(texture, texture, new Vector2(FTex_Methods.FindNearestPowOf2(texture.width), FTex_Methods.FindNearestPowOf2(texture.height)));
                }

                EditorUtility.ClearProgressBar();
            }
            catch (System.Exception exc)
            {
                EditorUtility.ClearProgressBar();
                Debug.LogError("[Fimpo Image Tools Something went wrong when scaling textures! " + exc);
            }
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Scale to power of 2 Lower")]
        public static void ScaleToPowerOf2Lower()
        {
            try
            {
                for (int i = 0; i < Selection.objects.Length; i++)
                {
                    Texture2D texture = AssetDatabase.LoadAssetAtPath<Texture2D>(AssetDatabase.GetAssetPath(Selection.objects[i]));

                    EditorUtility.DisplayProgressBar("Scaling textures...", "Scaling texture " + texture.name, (float)i / (float)Selection.objects.Length);

                    if (texture != null)
                        FScale_EditorToolsMethods.ScaleTextureFile(texture, texture, new Vector2(FTex_Methods.FindLowerPowOf2(texture.width), FTex_Methods.FindLowerPowOf2(texture.height)));
                }

                EditorUtility.ClearProgressBar();
            }
            catch (System.Exception exc)
            {
                EditorUtility.ClearProgressBar();
                Debug.LogError("[Fimpo Image Tools] Something went wrong when scaling textures! " + exc);
            }
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Scale to power of 2 Higher")]
        public static void ScaleToPowerOf2Higher()
        {
            try
            {
                for (int i = 0; i < Selection.objects.Length; i++)
                {
                    Texture2D texture = AssetDatabase.LoadAssetAtPath<Texture2D>(AssetDatabase.GetAssetPath(Selection.objects[i]));

                    EditorUtility.DisplayProgressBar("Scaling textures...", "Scaling texture " + texture.name, (float)i / (float)Selection.objects.Length);

                    if (texture != null)
                        FScale_EditorToolsMethods.ScaleTextureFile(texture, texture, new Vector2(FTex_Methods.FindHigherPowOf2(texture.width), FTex_Methods.FindHigherPowOf2(texture.height)));
                }

                EditorUtility.ClearProgressBar();
            }
            catch (System.Exception exc)
            {
                EditorUtility.ClearProgressBar();
                Debug.LogError("[Fimpo Image Tools] Something went wrong when scaling textures! " + exc);
            }

        }


        [MenuItem("VRPark/Utilities/Texture Tools/Change Scale", true)]
        [MenuItem("VRPark/Utilities/Texture Tools/Quick Rescale", true)]
        [MenuItem("VRPark/Utilities/Texture Tools/Seamless Looper Window", true)]
        public static bool CheckRescaleTextureAllSelected()
        {
            if (!Selection.activeObject) return false;

            for (int i = 0; i < Selection.objects.Length; i++) // We need just one file to be texture to return true
            {
                AssetImporter tex = AssetImporter.GetAtPath(AssetDatabase.GetAssetPath(Selection.objects[i]));
                if (tex as TextureImporter) return true;
            }

            return false;
        }
    }
}