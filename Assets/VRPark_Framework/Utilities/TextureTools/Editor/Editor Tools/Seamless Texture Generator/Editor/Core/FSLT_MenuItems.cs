using UnityEditor;

namespace FIMSpace.FSeamlessGenerator
{
    public static class FSLT_MenuItems 
    {
        [MenuItem("VRPark/Utilities/Texture Tools/Texture to Seamless")]
        public static void OpenSeamlessLooperWindow()
        {
            FSeamlessWindow.Init();
        }

        [MenuItem("VRPark/Utilities/Texture Tools/Equalize Texture")]
        public static void OpenEqualizeTextureWindow()
        {
            FTexEqualizeWindow.Init();
        }

        //[MenuItem("Assets/FImpossible Creations/Texture Tools/Channel Swapping Window", false, -100)]
        //public static void OpenSwappingWindow()
        //{
        //    FChannelsSwapperWindow.Init();
        //}
    }
}