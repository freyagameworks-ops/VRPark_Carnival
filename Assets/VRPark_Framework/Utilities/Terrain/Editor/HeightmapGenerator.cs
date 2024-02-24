using UnityEditor;
using UnityEngine;
using System.IO;

public class HeightmapGenerator : EditorWindow
{
    string filename = "Heightmap";
    float perlinXScale = 0.01f;
    float perlinYScale = 0.01f;
    int perlinOctaves = 3;
    float perlinPersistance = 0.5f;
    float perlinHeightScale = 0.5f;
    int perlinOffsetX = 0;
    int perlinOffsetY = 0;
    bool alphaToggle = false;
    bool seamlessToggle = false;
    bool mapToggle = false;

    float brightness = 0.5f;
    float contrast = 0.5f;

    Texture2D pTexture;

    bool saveAsRaw = false; // Toggle for saving as RAW

    [MenuItem("VRPark/Utilities/Terrain/Heightmap Generator")]
    public static void ShowWindow()
    {
        EditorWindow.GetWindow(typeof(HeightmapGenerator));
    }

    void OnEnable()
    {
        pTexture = new Texture2D(513, 513, TextureFormat.ARGB32, false);
    }

    private void OnGUI()
    {
        GUILayout.Label("Settings", EditorStyles.boldLabel);
        filename = EditorGUILayout.TextField("Heightmap Name", filename);

        perlinXScale = EditorGUILayout.Slider("X Scale", perlinXScale, 0, 0.1f);
        perlinYScale = EditorGUILayout.Slider("Y Scale", perlinYScale, 0, 0.1f);
        perlinOctaves = EditorGUILayout.IntSlider("Octaves", perlinOctaves, 1, 10);
        perlinPersistance = EditorGUILayout.Slider("Persistance", perlinPersistance, 1, 10);
        perlinHeightScale = EditorGUILayout.Slider("Height Scale", perlinHeightScale, 0, 1);
        perlinOffsetX = EditorGUILayout.IntSlider("Offset X", perlinOffsetX, 0, 10000);
        perlinOffsetY = EditorGUILayout.IntSlider("Offset Y", perlinOffsetY, 0, 10000);
        brightness = EditorGUILayout.Slider("Brightness", brightness, 0, 2);
        contrast = EditorGUILayout.Slider("Contrast", contrast, 0, 2);
        alphaToggle = EditorGUILayout.Toggle("Alpha?", alphaToggle);
        mapToggle = EditorGUILayout.Toggle("Map?", mapToggle);
        seamlessToggle = EditorGUILayout.Toggle("Seamless", seamlessToggle);

        saveAsRaw = EditorGUILayout.Toggle("Save as RAW", saveAsRaw); // Toggle to choose save format

        if (GUILayout.Button("Generate"))
        {
            GenerateTexture();
        }
        
        if (GUILayout.Button("Randomize"))
        {
            RandomizeParameters();
        }

        GUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        GUILayout.Label(pTexture, GUILayout.Width(256), GUILayout.Height(256));
        GUILayout.FlexibleSpace();
        GUILayout.EndHorizontal();

        if (GUILayout.Button("Save"))
        {
            if (saveAsRaw)
            {
                SaveTextureAsRaw();
            }
            else
            {
                SaveTextureAsPng();
            }
        }
    }

    void GenerateTexture()
    {
        for (int y = 0; y < pTexture.height; y++)
        {
            for (int x = 0; x < pTexture.width; x++)
            {
                float pValue = Mathf.PerlinNoise((x + perlinOffsetX) * perlinXScale, (y + perlinOffsetY) * perlinYScale);
                pValue *= perlinHeightScale;
                Color color = new Color(pValue, pValue, pValue, alphaToggle ? pValue : 1);
                pTexture.SetPixel(x, y, color);
            }
        }

        pTexture.Apply();
    }

    void SaveTextureAsPng()
    {
        string filePath = EditorUtility.SaveFilePanel("Save Texture as PNG", "", filename, "png");
    
        if (!string.IsNullOrEmpty(filePath))
        {
            byte[] bytes = pTexture.EncodeToPNG();
            File.WriteAllBytes(filePath, bytes);
            AssetDatabase.Refresh();
        }
    }

    void SaveTextureAsRaw()
    {
        string filePath = EditorUtility.SaveFilePanel("Save Texture as RAW", "", filename, "raw");

        if (!string.IsNullOrEmpty(filePath))
        {
            byte[] bytes = new byte[pTexture.width * pTexture.height];
            for (int y = 0; y < pTexture.height; y++)
            {
                for (int x = 0; x < pTexture.width; x++)
                {
                    bytes[y * pTexture.width + x] = (byte)(pTexture.GetPixel(x, y).grayscale * 255);
                }
            }

            File.WriteAllBytes(filePath, bytes);
            AssetDatabase.Refresh();
        }
    }
    
    void RandomizeParameters()
    {
        perlinXScale = Random.Range(0.001f, 0.1f);
        perlinYScale = perlinXScale;
        perlinOctaves = Random.Range(1, 11);
        perlinPersistance = Random.Range(0.1f, 1.0f);
        perlinHeightScale = Random.Range(0.1f, 1.0f);
        perlinOffsetX = Random.Range(0, 10001);
        perlinOffsetY = Random.Range(0, 10001);
        brightness = Random.Range(0f, 2f);
        contrast = Random.Range(0f, 2f);
        
        GenerateTexture();
    }
    
    public static float FractalBrownianMotion(float x, float y, int oct, float persistance)
    {
        float total = 0;
        float frequency = 1;
        float amplitude = 1;
        float maxValue = 0;

        for(int i = 0; i < oct; i++)
        {
            total += Mathf.PerlinNoise(x * frequency, y * frequency) * amplitude;
            maxValue += amplitude;
            amplitude *= persistance;
            frequency *= 2;
        }

        return total / maxValue;
    }

    public static float Map(float value, float originalMin, float originalMax, float targetMin, float targetMax)
    {
        return (value - originalMin) * (targetMax - targetMin) / (originalMax - originalMin) + targetMin;
    }

}


