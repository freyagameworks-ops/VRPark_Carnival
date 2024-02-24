using UnityEngine;
using UnityEditor;
 
public class TerrainToolsObjectToTerrain : EditorWindow {
 
	[MenuItem("VRPark/Utilities/Terrain/Object to Terrain")]
	static void OpenWindow () {
 
		EditorWindow.GetWindow<TerrainToolsObjectToTerrain>(true);
	}
 
	private int resolution = 512;
	private Vector3 addTerrain;
	int bottomTopRadioSelected = 0;
	static readonly string[] BottomTopRadio = new string[] { "Bottom Up", "Top Down"};
	private float shiftHeight = 0f;
 
	private void OnGUI () {
 
		resolution = EditorGUILayout.IntField("Resolution", resolution);
		addTerrain = EditorGUILayout.Vector3Field("Add terrain", addTerrain);
		shiftHeight = EditorGUILayout.Slider("Shift height", shiftHeight, -1f, 1f);
		bottomTopRadioSelected = GUILayout.SelectionGrid(bottomTopRadioSelected, BottomTopRadio, BottomTopRadio.Length, EditorStyles.radioButton);
 
		if(GUILayout.Button("Create Terrain"))
		{

			if(Selection.activeGameObject == null){
 
				EditorUtility.DisplayDialog("No object selected", "Please select an object.", "Ok");
				return;
			}
			CreateTerrain();
		}
	}
 
	delegate void CleanUp();
 
	void CreateTerrain(){	
 
		//fire up the progress bar
		ShowProgressBar(1, 100);
 
		var terrain = new TerrainData
		{
			heightmapResolution = resolution
		};
		var terrainObject = Terrain.CreateTerrainGameObject(terrain);
 
		Undo.RegisterCreatedObjectUndo(terrainObject, "Object to Terrain");
 
		MeshCollider collider = Selection.activeGameObject.GetComponent<MeshCollider>();
		CleanUp cleanUp = null;
 
		//Add a collider to our source object if it does not exist.
		//Otherwise ray casting doesn't work.
		if(!collider){
 
			collider = Selection.activeGameObject.AddComponent<MeshCollider>();
			cleanUp = () => DestroyImmediate(collider);
		}
 
		Bounds bounds = collider.bounds;	
		float sizeFactor = collider.bounds.size.y / (collider.bounds.size.y + addTerrain.y);
		terrain.size = collider.bounds.size + addTerrain;
		bounds.size = new Vector3(terrain.size.x, collider.bounds.size.y, terrain.size.z);
 
		// Do ray casting samples over the object to see what terrain heights should be
		float[,] heights = new float[terrain.heightmapResolution, terrain.heightmapResolution];	
		Ray ray = new Ray(new Vector3(bounds.min.x, bounds.max.y + bounds.size.y, bounds.min.z), -Vector3.up);
		RaycastHit hit = new RaycastHit();
		float meshHeightInverse = 1 / bounds.size.y;
		Vector3 rayOrigin = ray.origin;
 
		int maxHeight = heights.GetLength(0);
		int maxLength = heights.GetLength(1);
 
		Vector2 stepXZ = new Vector2(bounds.size.x / maxLength, bounds.size.z / maxHeight);
 
		for(var zCount = 0; zCount < maxHeight; zCount++){
 
			ShowProgressBar(zCount, maxHeight);
 
			for(var xCount = 0; xCount < maxLength; xCount++){
 
				var height = 0.0f;
 
				if(collider.Raycast(ray, out hit, bounds.size.y * 3)){
 
					height = (hit.point.y - bounds.min.y) * meshHeightInverse;
					height += shiftHeight;
 
					//bottom up
					if(bottomTopRadioSelected == 0){
 
						height *= sizeFactor;
					}
 
					//clamp
					if(height < 0){
 
						height = 0;
					}
				}
 
				heights[zCount, xCount] = height;
           		rayOrigin.x += stepXZ[0];
           		ray.origin = rayOrigin;
			}
 
			rayOrigin.z += stepXZ[1];
      		rayOrigin.x = bounds.min.x;
      		ray.origin = rayOrigin;
		}
 
		terrain.SetHeights(0, 0, heights);
 
		EditorUtility.ClearProgressBar();

		cleanUp?.Invoke();
	}
 
    void ShowProgressBar(float progress, float maxProgress){
 
		var p = progress / maxProgress;
		EditorUtility.DisplayProgressBar("Creating Terrain...", Mathf.RoundToInt(p * 100f)+ " %", p);
	}
}