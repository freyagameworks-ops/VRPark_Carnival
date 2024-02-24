using UnityEngine;
using UnityEditor;
using System.IO;

public class CubemapCaptureEditor : EditorWindow
{
    private ImageWidth width = ImageWidth.Width1024;
    private ImageFormat imageFormat = ImageFormat.JPEG;

    private Camera renderCam;
    private bool faceCameraDirection = true;
    
    public enum ImageWidth
    {
        Width32 = 32,
        Width64 = 64,
        Width128 = 128,
        Width256 = 256,
        Width512 = 512,
        Width1024 = 1024,
        Width2048 = 2048,
        Width4096 = 4096,
        Width8192 = 8192
    }

    public enum ImageFormat
    {
        JPEG,
        PNG
    }


    // Add menu named "I360 Render Editor" to the Window menu
    [MenuItem("VRPark/Utilities/Cubemap/Cubemap Capture")]

    public static void ShowWindow()
    {
        // Show existing window instance. If one doesn't exist, make one.
        EditorWindow.GetWindow(typeof(CubemapCaptureEditor));
    }

    void OnGUI()
    {
        GUILayout.Label("360 Render Settings", EditorStyles.boldLabel);

        // Enum popup for width selection
        width = (ImageWidth)EditorGUILayout.EnumPopup("Width", width);

        // Enum popup for format selection
        imageFormat = (ImageFormat)EditorGUILayout.EnumPopup("Format", imageFormat);

        renderCam = (Camera)EditorGUILayout.ObjectField("Render Camera", renderCam, typeof(Camera), true);
        faceCameraDirection = EditorGUILayout.Toggle("Face Camera Direction", faceCameraDirection);

        if (GUILayout.Button("Capture"))
        {
            Capture360Image();
        }
    }


    private void Capture360Image()
    {
        bool encodeAsJPEG = imageFormat == ImageFormat.JPEG;
        byte[] capturedBytes = CubemapCapture.Capture((int)width, encodeAsJPEG, renderCam, faceCameraDirection);

        if (capturedBytes != null)
        {
            string fileExtension = encodeAsJPEG ? "jpg" : "png";
            string path = EditorUtility.SaveFilePanel("Save Image", "", "360Image", fileExtension);
            if (!string.IsNullOrEmpty(path))
            {
                File.WriteAllBytes(path, capturedBytes);
                Debug.Log("Saved 360 Image to: " + path);
            }
        }
        else
        {
            Debug.LogError("Failed to capture 360 Image.");
        }
        
        AssetDatabase.Refresh();
    }
}