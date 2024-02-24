using UnityEngine;
using UnityEditor;

public class SmoothTerrain : EditorWindow
{
    public Terrain terrain;
    public int smoothIterations = 1;
    public float smoothAmount = 0.5f;

    [MenuItem("VRPark/Utilities/Terrain/Smooth Terrain")]
    static void Init()
    {
        // Get existing open window or if none, make a new one:
        SmoothTerrain window = (SmoothTerrain)EditorWindow.GetWindow(typeof(SmoothTerrain));
        window.Show();
    }

    void OnGUI()
    {
        // Display fields for the terrain and smoothing parameters
        terrain = (Terrain)EditorGUILayout.ObjectField("Terrain", terrain, typeof(Terrain), true);
        smoothIterations = EditorGUILayout.IntField("Smooth Iterations", smoothIterations);
        smoothAmount = EditorGUILayout.Slider("Smooth Amount", smoothAmount, 0.0f, 1.0f);

        // Display a button to apply the smoothing to the terrain
        if (GUILayout.Button("Smooth Terrain"))
        {
            // Get the terrain data
            TerrainData terrainData = terrain.terrainData;

            // Get the heightmap data
            float[,] heights = terrainData.GetHeights(0, 0, terrainData.heightmapResolution, terrainData.heightmapResolution);

            // Smooth the heightmap data
            for (int s = 0; s < smoothIterations; s++)
            {
                for (int i = 1; i < terrainData.heightmapResolution - 1; i++)
                {
                    for (int j = 1; j < terrainData.heightmapResolution - 1; j++)
                    {
                        // Calculate the average height of the surrounding samples
                        float avgHeight = (heights[i - 1, j] + heights[i + 1, j] + heights[i, j - 1] + heights[i, j + 1]) / 4.0f;

                        // Smooth the heightmap value by the specified amount
                        heights[i, j] = Mathf.Lerp(heights[i, j], avgHeight, smoothAmount);
                    }
                }
            }

            // Set the modified heightmap data back to the terrain
            terrainData.SetHeights(0, 0, heights);
        }
    }
}
