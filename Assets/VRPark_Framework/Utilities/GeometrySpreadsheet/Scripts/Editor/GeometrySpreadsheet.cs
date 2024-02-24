/*
 
Basic functionality and development by Ismail Burak Cendik 
    https://www.linkedin.com/in/ismailcendik/

UI Optimization and scalability by Onur Bulbul
    https://www.linkedin.com/in/onur-bulbul-97905084/
 
Freya Gameworks - 2023

 */

using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using ColorUtility = UnityEngine.ColorUtility;
using Debug = UnityEngine.Debug;

public class GeometrySpreadsheet : EditorWindow
{
    #region Variables and Declaration

    private Mesh _selectedMesh;
    private int _tabIndex;
    private Vector2 _scrollPosition = Vector2.one;

    private float _faceIndexWidth = 100f;
    private float _verticesWidth = 200f;
    private float _uvsWidth = 300f;
    private float _colorsWidth = 300f;
    private float _vertexIndexWidth = 100f;
    private float _positionWidth = 150f;
    private float _boneWeightsWidth = 400f;
    private float _edgeIndexWidth = 150f;
    private float _edgeWidth = 150f;
    private float _normalsWidth = 300;

    private int _uvChannels;

    private bool _isResizing;
    private float _currentColumnWidth;
    private float? _resizingStartingX;
    
    private bool _uiInitialized;

    private ResizingColumn _currentResizingColumn = ResizingColumn.None;

    private Mesh _previousMesh;
    private Vector3[] _verticesCache;
    private Color[] _colorsCache;
    private int[] _trianglesCache;
    private readonly List<Vector2[]> _uvsCache = new();

    private int _firstVisibleRow;
    private int _lastVisibleRow;
    
    private const string IconPath = "Assets/FreyaGameworks/GeometrySpreadsheet/Sprites/GeometrySpreadsheet_Icon0.png";

    private GUIStyle _separatorStyle;
    private GUILayoutOption[] _separatorLayoutOptions;
    
    private enum ResizingColumn
    {
        None,
        FaceIndex,
        Vertices,
        UVs,
        VertexIndex,
        Position,
        ColorData,
        BoneWeights,
        EdgeIndex,
        Normals,
        NormalData
    }

    private MeshPreview _meshPreview;
    private string _meshInfoString;

    private GUIContent[] _tabContents;

    private readonly (string, string)[] _tabInfo =
    {
        ("Primitive", "GeometrySpreadsheet_Icon1"),
        ("Faces", "GeometrySpreadsheet_Icon2"),
        ("Vertices", "GeometrySpreadsheet_Icon3"),
        ("Edges", "GeometrySpreadsheet_Icon4")
    };

    private event Action OnRefreshButtonClicked;

    private long _cacheTimeMilliseconds;
    private long _cacheMemoryBytes;

    private ColorDisplayMode _colorDisplayMode;

    private enum ColorDisplayMode
    {
        RGBA_0_1,
        RGBA_0_255,
        HEX,
        ColorField
    }
    
    private NormalHighlightMode _normalHighlightMode;

    private enum NormalHighlightMode
    {
        Regular,
        RGB_TO_XYZ
    }
    
    private static DebugMode _debugMode;
    
    private enum DebugMode
    {
        Disabled = 0,
        DebugLogs = 1,
        DebugLogsAndWarnings = 2,
        DebugAll = 3
    }

    #endregion

    [MenuItem("VRPark/Utilities/Geometry Spreadsheet/Geometry Spreadsheet")]
    public static void ShowWindow()
    {
        var wnd = GetWindow<GeometrySpreadsheet>();

        const string iconPath = "Assets/VRPark_Framework/GeometrySpreadsheet/Sprites/GeometrySpreadsheet_Icon0.png";

        if (AssetDatabase.LoadAssetAtPath(iconPath, typeof(Texture)) is not Texture icon)
        {
            if (_debugMode is DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll){
                Debug.LogWarning("Icon not found at the expected path: " + iconPath);
            }
            
            wnd.titleContent = new GUIContent("Geometry Spreadsheet");
        }
        else
        {
            wnd.titleContent = new GUIContent("Geometry Spreadsheet", icon);
        }
        
        wnd._separatorStyle = new GUIStyle
        {
            normal =
            {
                background = EditorGUIUtility.whiteTexture
            },
            margin = new RectOffset(0, 0, 0, 0),
            padding = new RectOffset(0, 0, 0, 0),
            fontStyle = FontStyle.Bold
        };
        
        wnd._separatorLayoutOptions = new[] {GUILayout.Width(1), GUILayout.Height(20)};
        
    }

    private void OnGUI()
    {
        if (_selectedMesh is null)
        {
            EditorGUILayout.Separator();
            EditorGUILayout.LabelField("Select a GameObject with a MeshFilter component in Scene or Project.",
                GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
            return;
        }

        HandleUserInterface();
    }

    private void HandleUserInterface()
    {
        DrawStaticUIElements();
        DrawDynamicUIBasedOnTabIndex();

    }
    
    private void DrawStaticUIElements()
    {
        EditorGUILayout.BeginHorizontal();

        _tabIndex = GUILayout.Toolbar(_tabIndex, _tabContents);

        var icon = AssetDatabase.LoadAssetAtPath<Texture2D>("Assets/FreyaGameworks/GeometrySpreadsheet/Sprites/GeometrySpreadsheet_Icon5.png");
        if (icon == null)
        {
            //Debug.LogWarning("Icon not found at specified path.");
            // Handle the case where the icon is not found
        }

        if (GUILayout.Button(new GUIContent("Force Refresh", icon), GUILayout.Width(120)))
            OnRefreshButtonClicked?.Invoke();

        EditorGUILayout.EndHorizontal();
    }
    
    private void DrawDynamicUIBasedOnTabIndex()
    {
        switch (_tabIndex)
        {
            case 0:
                _scrollPosition = EditorGUILayout.BeginScrollView(_scrollPosition, false, true);
                DrawPrimitiveData(_selectedMesh);
                EditorGUILayout.EndScrollView();
                break;
            case 1:
                _scrollPosition = EditorGUILayout.BeginScrollView(_scrollPosition, false, true);
                DrawFaceDataRows();
                DrawFaceData();
                EditorGUILayout.EndScrollView();
                break;
            case 2:
                _scrollPosition = EditorGUILayout.BeginScrollView(_scrollPosition, false, true);
                DrawVertexDataRows();
                DrawVertexData();
                EditorGUILayout.EndScrollView();
                break;
            case 3:
                _scrollPosition = EditorGUILayout.BeginScrollView(_scrollPosition, false, true);
                DrawEdgeDataRows();
                DrawEdgeData();
                break;
        }
        
        EditorGUILayout.Separator();

        DrawCachingInformation();

        if (_tabIndex is 2)
        {
            DrawColorDisplayDropdown();
        }
    
        if (_tabIndex is 1 or 2)
        {
            DrawNormalsDisplayOptions();
        }
        
        if (_tabIndex is 0)
        {
            DrawDebugLevelDropdown();
        }
    }
    private void DrawPrimitiveData(Mesh mesh)
    {
        EditorGUILayout.LabelField($"<b>Selected Mesh:</b> {mesh.name}", RichTextStyle);

        EditorGUILayout.Separator();

        DrawBasicMeshInformation(mesh);

        DrawProjectReferenceInformation(mesh);

        DrawVerticesAndIndicesInformation(mesh);

        DrawBoundsInformation(mesh);

        DrawMeshPreview(mesh);
    }

    protected virtual void DrawBasicMeshInformation(Mesh mesh)
    {
        EditorGUI.indentLevel++;
        EditorGUILayout.LabelField("Basic Mesh Information", EditorStyles.boldLabel);

        EditorGUILayout.LabelField($"Total Vertex Count: {mesh.vertexCount}");
        EditorGUILayout.LabelField($"Total Triangles: {mesh.triangles.Length / 3}");
        EditorGUILayout.LabelField($"Total SubMeshes: {mesh.subMeshCount}");
        EditorGUI.indentLevel--;

        EditorGUILayout.Separator();
    }

    protected virtual void DrawProjectReferenceInformation(Mesh mesh)
    {
        EditorGUI.indentLevel++;
        EditorGUILayout.LabelField("Project Reference", EditorStyles.boldLabel);

        var meshPath = AssetDatabase.GetAssetPath(mesh);
        var fileType = Path.GetExtension(meshPath).ToUpper();
        var fileSize = GetAssetSizeInBytes(AssetDatabase.GetAssetPath(mesh));
        var fileSizeKb = fileSize / 1024f;

        GUI.enabled = false;

        EditorGUILayout.ObjectField("Mesh Reference: ", mesh, typeof(Mesh), false);

        if (mesh != null && !string.IsNullOrEmpty(AssetDatabase.GetAssetPath(mesh)))
        {
            if (meshPath.StartsWith("Assets/") || meshPath.StartsWith("Packages/"))
            {
                EditorGUI.indentLevel++;

                EditorGUILayout.LabelField("Mesh Path: ", meshPath);

                var description = GeometrySpreadsheetUIUtilities.GetFileTypeDescription(fileType);

                EditorGUILayout.LabelField("File Type:", description);
                EditorGUILayout.LabelField($"File Size: {fileSizeKb:F2} " + "KB");

                EditorGUI.indentLevel--;
            }
            else
            {
                EditorGUI.indentLevel++;

                EditorGUILayout.LabelField("Mesh Path: ", meshPath);
                EditorGUILayout.LabelField(
                    "File Type: Unavailable           Info: File type unavailable because you selected a Unity Default Primitive.");
                EditorGUILayout.LabelField($"File Size: {fileSizeKb:F2} " + "KB" +
                                           "                   Info: File size appears as 0.00KB because you selected a Unity Default Primitive.");

                EditorGUI.indentLevel--;
            }
        }

        else
        {
            EditorGUILayout.LabelField("Mesh Path: ",
                "Invalid or missing mesh. This is likely happening because you selected a Unity Default Primitive. If not, please reach the developer for a fix.");
        }

        GUI.enabled = true;

        EditorGUI.indentLevel--;

        EditorGUILayout.Separator();
    }

    private void DrawVerticesAndIndicesInformation(Mesh mesh)
    {
        var attributes = mesh.GetVertexAttributes();
        var vertexSize = CalculateVertexSize(attributes);
        var totalIndicesCount = mesh.triangles.Length;

        EditorGUILayout.LabelField(
            $"<b>Vertices:</b> {mesh.vertexCount} ({EditorUtility.FormatBytes(mesh.vertexCount * vertexSize)})",
            RichTextStyle);

        EditorGUI.indentLevel++;

        DrawVertexAttributesInformation(attributes);
        DrawIndicesInformation(mesh, totalIndicesCount);

        EditorGUI.indentLevel--;

        EditorGUILayout.Separator();
    }

    private void DrawVertexAttributesInformation(IEnumerable<VertexAttributeDescriptor> attributes)
    {
        EditorGUILayout.BeginVertical();

        foreach (var attribute in attributes)
        {
            var attributeName = GetAttributeName(attribute);
            var attributeInfo = $"{attributeName}  {GetAttributeString(attribute)}";

            EditorGUILayout.LabelField(attributeInfo, RichTextStyle);
        }
        EditorGUILayout.EndVertical();
    }

    private string GetAttributeName(VertexAttributeDescriptor attribute)
    {
        var attributeName = attribute.attribute.ToString();
        if (attributeName.Contains("TexCoord"))
            attributeName = "UV" + attributeName[^1..];
        return attributeName;
    }

    private void DrawIndicesInformation(Mesh mesh, int totalIndicesCount)
    {
        EditorGUILayout.Separator();

        EditorGUI.indentLevel--;

        EditorGUILayout.LabelField(
            $"<b>Indices:</b> {totalIndicesCount}, {mesh.indexFormat} format ({EditorUtility.FormatBytes(totalIndicesCount * (mesh.indexFormat == IndexFormat.UInt16 ? 2 : 4))})",
            RichTextStyle);

        EditorGUI.indentLevel++;

        var subMeshIndex = 0;
        for (; subMeshIndex < mesh.subMeshCount; subMeshIndex++)
        {
            var indices = mesh.GetIndices(subMeshIndex);
            EditorGUILayout.LabelField(
                $"<b>SubMesh {subMeshIndex}:</b> {indices.Length / 3} triangles ({indices.Length} indices starting from {totalIndicesCount - indices.Length})",
                RichTextStyle);
            totalIndicesCount -= indices.Length;
        }

        EditorGUILayout.Separator();
    }

    private void DrawBoundsInformation(Mesh mesh)
    {
        EditorGUILayout.LabelField("Bounds Information", EditorStyles.boldLabel);

        EditorGUI.indentLevel++;

        EditorGUILayout.LabelField($"Bounds Center: {mesh.bounds.center}");
        EditorGUILayout.LabelField($"Bounds Size: {mesh.bounds.size}");
        EditorGUILayout.LabelField($"Bounds Extents: {mesh.bounds.extents}");
        
        EditorGUILayout.Separator();
    }

    private void DrawMeshPreview(Mesh mesh)
    {
        EditorGUI.indentLevel--;

        _meshPreview ??= new MeshPreview(mesh);

        _meshPreview.mesh = mesh;
        var meshInfoString = MeshPreview.GetInfoString(mesh);

        GUILayout.FlexibleSpace();

        EditorGUILayout.LabelField(" " + meshInfoString, EditorStyles.boldLabel);

        EditorGUILayout.BeginVertical();
        _meshPreview.OnPreviewGUI(GUILayoutUtility.GetRect(200, 200), _previewBackgroundStyle);
        EditorGUILayout.EndVertical();
    }

    private void OnRefreshButtonClickedHandler()
    {
        if (_debugMode is DebugMode.DebugLogs or DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll)
        {
            Debug.Log("Geometry Spreadsheet: Refreshing the Spreadsheet.");
        }
        
        CacheSelectedMesh(true);
        Repaint();
    }

    private void OnEnable()
    {
        Selection.selectionChanged += OnSelectionChanged;
        OnRefreshButtonClicked += OnRefreshButtonClickedHandler;

        _tabContents = new GUIContent[_tabInfo.Length];

        var rootPath = Path.Combine("Assets", "FreyaGameworks", "GeometrySpreadsheet", "Sprites");

        for (var i = 0; i < _tabInfo.Length; i++)
        {
            var iconName = _tabInfo[i].Item2 + ".png";
            var iconPath = Path.Combine(rootPath, iconName);

            if (AssetDatabase.AssetPathToGUID(iconPath) != "")
            {
                var iconTexture = AssetDatabase.LoadAssetAtPath<Texture2D>(iconPath);
                var tabContent = new GUIContent(_tabInfo[i].Item1, iconTexture);
                _tabContents[i] = tabContent;
            }
            else
            {
                _tabContents[i] = new GUIContent(_tabInfo[i].Item1);
                
                if (_debugMode is DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll)
                {
                    Debug.LogWarning($"Icon for tab {_tabInfo[i].Item1} is missing. Expected at path: {iconPath}");
                }
               
            }
        }
    }

    private void OnDisable()
    {
        Selection.selectionChanged -= OnSelectionChanged;
        OnRefreshButtonClicked -= OnRefreshButtonClickedHandler;

        if (_meshPreview == null) return;
        _meshPreview.Dispose();
        _meshPreview = null;
    }

    private void OnSelectionChanged()
    {
        if (_debugMode is DebugMode.DebugLogs or DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll)
        {
            Debug.Log("Geometry Spreadsheet: Selection Changed.");
        }
        CacheSelectedMesh(false);
        Repaint();
    }
    #region UI Drawing

    private void DrawFaceDataRows()
    {
        if (!_selectedMesh) return;

        var uvChannels = GetUVChannelsCount();
        
        EditorGUILayout.BeginHorizontal();

        DrawResizableLabel("Face Index", ref _faceIndexWidth, ResizingColumn.FaceIndex,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        DrawResizableLabel("Vertices", ref _verticesWidth, ResizingColumn.Vertices,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        for (var i = 1; i <= uvChannels; i++)
        {
            DrawResizableLabel($"UV{i}", ref _uvsWidth, ResizingColumn.UVs,
                GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
        }

        DrawResizableLabel("Averaged Normals", ref _normalsWidth, ResizingColumn.Normals,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        EditorGUILayout.EndHorizontal();
    }

    private void DrawFaceData()
    {
        if (!_selectedMesh) return;

        var triangles = _selectedMesh.triangles;
        var normals = _selectedMesh.normals;

        var uvChannels = GetUVChannelsCount();

        _firstVisibleRow = Mathf.FloorToInt(_scrollPosition.y / 20);
        var visibleRowCount = Mathf.CeilToInt(this.position.height / 20);
        _lastVisibleRow = _firstVisibleRow + visibleRowCount;

        var maxRow = triangles.Length / 3;
        var lastRow = Mathf.Min(triangles.Length / 3, _lastVisibleRow);

        if (_firstVisibleRow > 0)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Box("", _separatorStyle, GUILayout.Width(1), GUILayout.Height(_firstVisibleRow * 20f));
            EditorGUILayout.EndHorizontal();
        }

        for (var i = _firstVisibleRow * 3; i < lastRow * 3; i += 3)
        {
            EditorGUILayout.BeginHorizontal();

            var dataStyle = (i % 2 == 0)
                ? new GUIStyle(GUI.skin.label)
                : new GUIStyle(GUI.skin.label) { normal = { textColor = new Color(0.55f, 0.55f, 0.55f) } };

            DrawResizableLabel($"Face {i / 3}", ref _faceIndexWidth, ResizingColumn.FaceIndex, dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            DrawResizableLabel($"({triangles[i]}, {triangles[i + 1]}, {triangles[i + 2]})", ref _verticesWidth,
                ResizingColumn.Vertices, dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            for (var uvIndex = 0; uvIndex < uvChannels; uvIndex++)
            {
                var uvString = GetUVsForFaceAtIndex(triangles[i], triangles[i + 1], triangles[i + 2], uvIndex);

                DrawResizableLabel(uvString, ref _uvsWidth, ResizingColumn.UVs, dataStyle);
                GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
            }
            
            var avgNormal = (normals[triangles[i]] + normals[triangles[i + 1]] + normals[triangles[i + 2]]) / 3;

            if (_normalHighlightMode == NormalHighlightMode.RGB_TO_XYZ)
            {
                var coloredNormal = 
                    $"(<color=red>{avgNormal.x:0.##}</color>, " +
                    $"<color=green>{avgNormal.y:0.##}</color>, " +
                    $"<color=blue>{avgNormal.z:0.##}</color>)";
        
                DrawResizableLabel(coloredNormal, ref _normalsWidth,
                    ResizingColumn.Normals, RichTextStyle);
            }
            else
            {
                DrawResizableLabel($"({avgNormal.x:0.##}, {avgNormal.y:0.##}, {avgNormal.z:0.##})", ref _normalsWidth,
                    ResizingColumn.Normals, dataStyle);
            }
            
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            EditorGUILayout.EndHorizontal();
        }

        if (_lastVisibleRow >= maxRow) return;
        
        EditorGUILayout.BeginHorizontal();
        GUILayout.Box("", _separatorStyle, GUILayout.Width(1), GUILayout.Height((maxRow - _lastVisibleRow) * 20f));
        EditorGUILayout.EndHorizontal();
        
    }

    private void DrawEdgeDataRows()
    {
        if (!_selectedMesh) return;

        EditorGUILayout.BeginHorizontal();

        DrawResizableLabel("Edge Index", ref _edgeIndexWidth, ResizingColumn.EdgeIndex,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        DrawResizableLabel("Edge", ref _edgeWidth, ResizingColumn.EdgeIndex,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
        
        EditorGUILayout.EndHorizontal();
    }

    private void DrawEdgeData()
    {
        if (!_selectedMesh) return;

        var triangles = _selectedMesh.triangles;

        _firstVisibleRow = Mathf.FloorToInt(_scrollPosition.y / 20);
        var visibleRowCount = Mathf.CeilToInt(this.position.height / 20);
        _lastVisibleRow = _firstVisibleRow + visibleRowCount;
        
        var maxRow = triangles.Length / 3;
        var lastRow = Mathf.Min(triangles.Length / 3, _lastVisibleRow);

        if (_firstVisibleRow > 0)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Box("", _separatorStyle, GUILayout.Width(1), GUILayout.Height(_firstVisibleRow * 20f));
            EditorGUILayout.EndHorizontal();
        }
        
        for (var i = _firstVisibleRow * 3; i < lastRow * 3; i += 3)
        {
            EditorGUILayout.BeginHorizontal();

            var dataStyle = (i % 2 == 0)
                ? new GUIStyle(GUI.skin.label)
                : new GUIStyle(GUI.skin.label) { normal = { textColor = new Color(0.55f, 0.55f, 0.55f) } };

            DrawResizableLabel($"Edge {i / 3 * 3 + 1}", ref _edgeIndexWidth, ResizingColumn.EdgeIndex, dataStyle);

            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
            DrawResizableLabel($"{triangles[i]} - {triangles[i + 1]}", ref _edgeWidth, ResizingColumn.EdgeIndex,
                dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            DrawResizableLabel($"Edge {i / 3 * 3 + 2}", ref _edgeWidth, ResizingColumn.EdgeIndex, dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            DrawResizableLabel($"{triangles[i + 1]} - {triangles[i + 2]}", ref _edgeWidth, ResizingColumn.EdgeIndex,
                dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            DrawResizableLabel($"Edge {i / 3 * 3 + 3}", ref _edgeWidth, ResizingColumn.EdgeIndex, dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            DrawResizableLabel($"{triangles[i + 2]} - {triangles[i]}", ref _edgeWidth, ResizingColumn.EdgeIndex,
                dataStyle);

            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
            EditorGUILayout.EndHorizontal();
        }

        if (_lastVisibleRow >= maxRow) return;
        
        EditorGUILayout.BeginHorizontal();
        GUILayout.Box("", _separatorStyle, GUILayout.Width(1), GUILayout.Height((maxRow - _lastVisibleRow) * 20f));
        EditorGUILayout.EndHorizontal();
        
        EditorGUILayout.EndScrollView();
    }

    private void DrawVertexDataRows()
    {
        if (!_selectedMesh) return;
        
        var uvChannels = GetUVChannelsCount();
        
        EditorGUILayout.BeginHorizontal();
        DrawResizableLabel("Vertex Index", ref _vertexIndexWidth, ResizingColumn.VertexIndex,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        DrawResizableLabel("Position", ref _positionWidth, ResizingColumn.Position,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        for (var i = 1; i <= uvChannels; i++)
        {
            DrawResizableLabel($"UV{i}", ref _uvsWidth, ResizingColumn.UVs,
                GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
        }

        DrawResizableLabel("Normal", ref _normalsWidth, ResizingColumn.NormalData,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel); // Normal column header
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        DrawResizableLabel("Color", ref _colorsWidth, ResizingColumn.ColorData,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

        DrawResizableLabel("Bone Weights", ref _boneWeightsWidth, ResizingColumn.BoneWeights,
            GeometrySpreadsheetUIUtilities.CenteredBoldLabel);
        GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
        
        EditorGUILayout.EndHorizontal();
    }

    private void DrawVertexData()
    {
        if (!_selectedMesh) return;

        var vertices = _selectedMesh.vertices;
        var normals = _selectedMesh.normals;
        var uvChannels = GetUVChannelsCount();

        _firstVisibleRow = Mathf.FloorToInt(_scrollPosition.y / 20);
        var visibleRowCount = Mathf.CeilToInt(this.position.height / 20);
        _lastVisibleRow = _firstVisibleRow + visibleRowCount;
        
        var maxRow = vertices.Length;
        var lastRow = Mathf.Min(vertices.Length, _lastVisibleRow);
        
        if (_firstVisibleRow > 0)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Box("", _separatorStyle, GUILayout.Width(1), GUILayout.Height(_firstVisibleRow * 20f));
            EditorGUILayout.EndHorizontal();
        }

        for (var i = _firstVisibleRow; i < lastRow; i++)
        {
            EditorGUILayout.BeginHorizontal();
            
            if (i < _firstVisibleRow || i > _lastVisibleRow)
            {
                GUILayout.Box("", _separatorStyle, _separatorLayoutOptions);

                EditorGUILayout.EndHorizontal();
                continue;
            }

            GeometrySpreadsheetUIUtilities.GetDataStyle(i);

            var dataStyle = (i % 2 == 0)
                ? new GUIStyle(GUI.skin.label)
                : new GUIStyle(GUI.skin.label) { normal = { textColor = new Color(0.55f, 0.55f, 0.55f) } };

            DrawResizableLabel($"{i}", ref _vertexIndexWidth, ResizingColumn.VertexIndex, dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            DrawResizableLabel($"{vertices[i].ToString()}", ref _positionWidth, ResizingColumn.Position, dataStyle);
            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            for (var uvIndex = 0; uvIndex < uvChannels; uvIndex++)
            {
                var uvString = GetUVsForVertex(i, uvIndex + 1);
                DrawResizableLabel(uvString, ref _uvsWidth, ResizingColumn.UVs, dataStyle);
                GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);
            }
            
            if (_normalHighlightMode == NormalHighlightMode.RGB_TO_XYZ)
            {
                var coloredNormalIndividual = 
                    $"(<color=red>{normals[i].x:0.##}</color>, " +
                    $"<color=green>{normals[i].y:0.##}</color>, " +
                    $"<color=blue>{normals[i].z:0.##}</color>)";
        
                DrawResizableLabel(coloredNormalIndividual, ref _normalsWidth,
                    ResizingColumn.NormalData, RichTextStyle);
            }
            else
            {
                DrawResizableLabel($"({normals[i].x:0.##}, {normals[i].y:0.##}, {normals[i].z:0.##})", ref _normalsWidth,
                    ResizingColumn.NormalData, dataStyle);
            }

            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            if (_colorDisplayMode == ColorDisplayMode.ColorField && _selectedMesh.colors.Length > 0)
            {
                EditorGUILayout.ColorField(GUIContent.none, _selectedMesh.colors[i], false, false, false,
                    GUILayout.Width(_colorsWidth));
            }
            else
            {
                var colorsStr = _selectedMesh.colors.Length > 0
                    ? FormatColor(_selectedMesh.colors[i])
                    : "No color data";
                DrawResizableLabel($"{colorsStr}", ref _colorsWidth, ResizingColumn.ColorData, dataStyle);
            }

            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            var skinnedMeshRenderer = Selection.activeGameObject?.GetComponent<SkinnedMeshRenderer>();
            var boneWeightStr = skinnedMeshRenderer && _selectedMesh.boneWeights.Length > 0
                ? $"({_selectedMesh.boneWeights[i].boneIndex0}, {_selectedMesh.boneWeights[i].weight0}), ({_selectedMesh.boneWeights[i].boneIndex1}, {_selectedMesh.boneWeights[i].weight1}), ({_selectedMesh.boneWeights[i].boneIndex2}, {_selectedMesh.boneWeights[i].weight2}), ({_selectedMesh.boneWeights[i].boneIndex3}, {_selectedMesh.boneWeights[i].weight3})"
                : "No skinning data";
            DrawResizableLabel($"{boneWeightStr}", ref _boneWeightsWidth, ResizingColumn.BoneWeights, dataStyle);

            GeometrySpreadsheetUIUtilities.DrawVerticalSeparator(20);

            EditorGUILayout.EndHorizontal();
        }

        if (_lastVisibleRow >= maxRow) return;
        
        EditorGUILayout.BeginHorizontal();
        GUILayout.Box("", _separatorStyle, GUILayout.Width(1), GUILayout.Height((maxRow - _lastVisibleRow) * 20f));
        EditorGUILayout.EndHorizontal();
    }
    #endregion

    #region UI Helpers
    private void DrawResizableLabel(string content, ref float width, ResizingColumn column, GUIStyle style = null)
    {
        var originalGUIColor = GUI.color;

        var isThisColumnResizing = column == _currentResizingColumn && _isResizing && _resizingStartingX.HasValue &&
                                   Mathf.Abs(_resizingStartingX.Value - Event.current.mousePosition.x) < width;

        var currentStyle = style ?? new GUIStyle();

        EditorGUILayout.LabelField(content, currentStyle, GUILayout.Width(width));

        var lastRect = GUILayoutUtility.GetLastRect();
        var resizeHandleArea = new Rect(lastRect.xMax - 2.5f, lastRect.y, 5, lastRect.height);

        EditorGUIUtility.AddCursorRect(resizeHandleArea, MouseCursor.ResizeHorizontal);

        if (Event.current.type == EventType.MouseDown && resizeHandleArea.Contains(Event.current.mousePosition))
        {
            _isResizing = true;
            _resizingStartingX = Event.current.mousePosition.x;
            _currentColumnWidth = width;
            _currentResizingColumn = column;
        }

        if (isThisColumnResizing)
        {
            width = _currentColumnWidth + (Event.current.mousePosition.x - _resizingStartingX.Value);
            Repaint();
        }

        if (Event.current.type == EventType.MouseUp && _isResizing)
        {
            _isResizing = false;
            _resizingStartingX = null;
        }

        if (isThisColumnResizing && style != null) style.normal.textColor = originalGUIColor;

        GUI.color = originalGUIColor;
    }

    private static GUIStyle _richTextStyle;

    private static GUIStyle RichTextStyle
    {
        get
        {
            if (_richTextStyle != null) return _richTextStyle;
            _richTextStyle = new GUIStyle(EditorStyles.label)
            {
                richText = true
            };

            return _richTextStyle;
        }
    }

    private readonly GUIStyle _previewBackgroundStyle = GUIStyle.none;

    private void DrawColorDisplayDropdown()
    {
        EditorGUILayout.BeginHorizontal(EditorStyles.helpBox, GUILayout.Width(300));
        _colorDisplayMode = (ColorDisplayMode)EditorGUILayout.EnumPopup("Vertex Color Appearance: ",
            _colorDisplayMode, GUILayout.Width(300));
        EditorGUILayout.EndHorizontal();
    }

    private void DrawNormalsDisplayOptions()
    {
        EditorGUILayout.BeginHorizontal(EditorStyles.helpBox, GUILayout.Width(300));
        _normalHighlightMode = (NormalHighlightMode)EditorGUILayout.EnumPopup("Normal Highlight Mode: ",
            _normalHighlightMode, GUILayout.Width(300));
        EditorGUILayout.EndHorizontal();
    }

    private void DrawCachingInformation()
    {
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField($"Caching took {_cacheTimeMilliseconds} ms." + "  " +
                                   $"Cached {_cacheMemoryBytes} bytes.");
        EditorGUILayout.EndHorizontal();
    }
    
    private void DrawDebugLevelDropdown()
    {
        EditorGUILayout.BeginHorizontal(EditorStyles.helpBox, GUILayout.Width(300));
        _debugMode = (DebugMode)EditorGUILayout.EnumPopup("Debug Level: ",
            _debugMode, GUILayout.Width(300));
        EditorGUILayout.EndHorizontal();
    }
    

    private string FormatColor(Color color)
    {
        switch (_colorDisplayMode)
        {
            case ColorDisplayMode.RGBA_0_1:
                return
                    $"({color.r:F2}, {color.g:F2}, {color.b:F2}, {color.a:F2})";
            case ColorDisplayMode.RGBA_0_255:
                return $"({color.r * 255:F0}, {color.g * 255:F0}, {color.b * 255:F0}, {color.a * 255:F0})";
            case ColorDisplayMode.HEX:
                return $"#{ColorUtility.ToHtmlStringRGBA(color)}";
            case ColorDisplayMode.ColorField:
                EditorGUILayout.ColorField(GUIContent.none, color, false, true, false);
                return string.Empty;
            default:
                return color.ToString();
        }
    }

    private static long GetAssetSizeInBytes(string assetPath)
    {
        if (string.IsNullOrEmpty(assetPath))
            return 0;

        var fullPath = Path.Combine(Application.dataPath, assetPath[7..]);

        return !File.Exists(fullPath) ? 0 : new FileInfo(fullPath).Length;
    }

    #endregion

    #region Caching
    private void CacheSelectedMesh(bool isForced)
    {
        if (!Selection.activeGameObject)
            return;

        Selection.activeGameObject.TryGetComponent(out MeshFilter meshFilter);
        Selection.activeGameObject.TryGetComponent(out SkinnedMeshRenderer skinnedMeshRenderer);

        if (meshFilter && meshFilter.sharedMesh != null)
        {
            _selectedMesh = meshFilter.sharedMesh;
        }
        else if (skinnedMeshRenderer && skinnedMeshRenderer.sharedMesh != null)
        {
            _selectedMesh = skinnedMeshRenderer.sharedMesh;
        }
        else
        {
            return;
        }

        var stopwatch = new Stopwatch();
        var startMemory = GC.GetTotalMemory(false);
        
        stopwatch.Start();

        if (isForced)
        {
            if (_debugMode is DebugMode.DebugLogs or DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll)
            {
                Debug.Log("Geometry Spreadsheet: [Force Refresh] Caching new mesh.");
            }
            

            CacheMeshData();
            _previousMesh = _selectedMesh;

            _uvChannels = GetUVChannelsCount();
        }

        var wnd = GetWindow<GeometrySpreadsheet>();
       
        var icon = AssetDatabase.LoadAssetAtPath<Texture>(IconPath);

        wnd.titleContent = new GUIContent("GS: - " + _selectedMesh.name, icon);

        if (_selectedMesh != _previousMesh)
        {
            if (_debugMode is DebugMode.DebugLogs or DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll)
            {
                Debug.Log("Geometry Spreadsheet: A new GameObject with different mesh has been selected. Caching new mesh.");
            }
            
            CacheMeshData();
            _previousMesh = _selectedMesh;
        }

        _uvChannels = GetUVChannelsCount();

        stopwatch.Stop();
        var endMemory = GC.GetTotalMemory(false);
        var memoryUsed = endMemory - startMemory;

        _cacheTimeMilliseconds = stopwatch.ElapsedMilliseconds;
        _cacheMemoryBytes = memoryUsed;

        if (_debugMode is not (DebugMode.DebugLogs or DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll)) return;
        Debug.Log($"Geometry Spreadsheet: Caching took {stopwatch.ElapsedMilliseconds} milliseconds.");
        Debug.Log($"Geometry Spreadsheet: Memory allocated during caching: {memoryUsed} bytes.");
    }
    
    private void CacheMeshData()
    {
        _verticesCache = _selectedMesh.vertices;
        _colorsCache = _selectedMesh.colors;
        _trianglesCache = _selectedMesh.triangles;

        _uvsCache.Clear();
        _uvsCache.Add(_selectedMesh.uv);
        _uvsCache.Add(_selectedMesh.uv2);
        _uvsCache.Add(_selectedMesh.uv3);
        _uvsCache.Add(_selectedMesh.uv4);
        _uvsCache.Add(_selectedMesh.uv5);
        _uvsCache.Add(_selectedMesh.uv6);
        _uvsCache.Add(_selectedMesh.uv7);
        _uvsCache.Add(_selectedMesh.uv8);

        if (_debugMode is DebugMode.DebugLogs or DebugMode.DebugLogsAndWarnings or DebugMode.DebugAll)
        {
            Debug.Log("Geometry Spreadsheet: Mesh data cached.");
        }
    }
    #endregion
    
    #region Mesh Helpers
    private string GetUVsForFaceAtIndex(int vert1, int vert2, int vert3, int uvIndex)
    {
        var uvSet = _uvsCache[uvIndex];
        
        var str = string.Concat(uvSet[vert1].ToString(), uvSet[vert2].ToString(), uvSet[vert3].ToString());
        return $"{str}";
    }

    private int GetUVChannelsCount()
    {
        if (_selectedMesh.uv8.Length > 0) return 8;
        if (_selectedMesh.uv7.Length > 0) return 7;
        if (_selectedMesh.uv6.Length > 0) return 6;
        if (_selectedMesh.uv5.Length > 0) return 5;
        if (_selectedMesh.uv4.Length > 0) return 4;
        if (_selectedMesh.uv3.Length > 0) return 3;
        if (_selectedMesh.uv2.Length > 0) return 2;
        return _selectedMesh.uv.Length > 0 ? 1 : 0;
    }

    private string GetUVsForVertex(int index, int uvChannel)
    {
        return uvChannel switch
        {
            1 => _selectedMesh.uv.Length > 0 ? $"{_selectedMesh.uv[index]}" : "",
            2 => _selectedMesh.uv2.Length > 0 ? $"{_selectedMesh.uv2[index]}" : "",
            3 => _selectedMesh.uv3.Length > 0 ? $"{_selectedMesh.uv3[index]}" : "",
            4 => _selectedMesh.uv4.Length > 0 ? $"{_selectedMesh.uv4[index]}" : "",
            5 => _selectedMesh.uv5.Length > 0 ? $"{_selectedMesh.uv5[index]}" : "",
            6 => _selectedMesh.uv6.Length > 0 ? $"{_selectedMesh.uv6[index]}" : "",
            7 => _selectedMesh.uv7.Length > 0 ? $"{_selectedMesh.uv7[index]}" : "",
            8 => _selectedMesh.uv8.Length > 0 ? $"{_selectedMesh.uv8[index]}" : "",
            _ => ""
        };
    }

    private int CalculateVertexSize(VertexAttributeDescriptor[] attributes)
    {
        return attributes.Sum(attribute => ConvertFormatToSize(attribute.format) * attribute.dimension);
    }
    
    protected virtual int ConvertFormatToSize(VertexAttributeFormat format)
    {
        switch (format)
        {
            case VertexAttributeFormat.Float32:
            case VertexAttributeFormat.UInt32:
            case VertexAttributeFormat.SInt32:
                return 4;
            case VertexAttributeFormat.Float16:
            case VertexAttributeFormat.UNorm16:
            case VertexAttributeFormat.SNorm16:
            case VertexAttributeFormat.UInt16:
            case VertexAttributeFormat.SInt16:
                return 2;
            case VertexAttributeFormat.UNorm8:
            case VertexAttributeFormat.SNorm8:
            case VertexAttributeFormat.UInt8:
            case VertexAttributeFormat.SInt8:
                return 1;
            default:
                throw new ArgumentOutOfRangeException(nameof(format), format, $"Unknown vertex format {format}");
        }
    }

    private string GetAttributeString(VertexAttributeDescriptor attr)
    {
        var format = attr.format;
        var dimension = attr.dimension;
        var str = $"{format} x {dimension} ({ConvertFormatToSize(format) * dimension} bytes)";
        if (attr.stream != 0)
            str += $", stream {attr.stream}";
        return str;
    }

    #endregion
}

#region UI Utilities
public static class GeometrySpreadsheetUIUtilities
{
    private static GUIStyle _centeredBoldLabel;

    public static GUIStyle CenteredBoldLabel
    {
        get
        {
            if (_centeredBoldLabel != null) return _centeredBoldLabel;
            _centeredBoldLabel = new GUIStyle(GUI.skin.label)
            {
                alignment = TextAnchor.MiddleCenter,
                fontStyle = FontStyle.Bold
            };

            return _centeredBoldLabel;
        }
    }

    public static GUIStyle GetDataStyle(int index)
    {
        return index % 2 == 0
            ? new GUIStyle(GUI.skin.label)
            : new GUIStyle(GUI.skin.label) { normal = { textColor = new Color(0.55f, 0.55f, 0.55f) } };
    }

    public static void DrawVerticalSeparator(float height)
    {
        var separatorStyle = new GUIStyle
        {
            normal =
            {
                background = EditorGUIUtility.whiteTexture
            },
            margin = new RectOffset(0, 0, 0, 0),
            padding = new RectOffset(0, 0, 0, 0),
            fontStyle = FontStyle.Bold
        };

        var color = GUI.color;
        GUI.color = new Color(0.5f, 0.5f, 0.5f, 1);
        GUILayout.Box("", separatorStyle, GUILayout.Width(1), GUILayout.Height(height));
        GUI.color = color;
    }

    private static readonly Dictionary<string, string> FileTypeDictionary = new Dictionary<string, string>
    {
        { ".FBX", "Filmbox .FBX" },
        { ".OBJ", "Wavefront .OBJ" },
        { ".DAE", "Collada .DAE" },
        { ".3DS", "3D Studio .3DS" },
        { ".BLEND", "Blender .BLEND" },
        { ".SKP", "Sketchup .SKP" },
        { ".MAX", "3DS Max .MAX" },
        { ".C4D", "Cinema 4D .C4D" },
        { ".LWO", "Lightwave .LWO" },
        { ".LXO", "Modo .LXO" },
        { ".STL", "Stereolithography .STL" },
        { ".MA", "Maya .MA" },
        { ".MB", "Maya .MB" },
        { ".XSI", "Softimage .XSI" },
        { ".GLTF", "Khronos Group GLTF .GLTF" },
        { ".GLB", "Khronos Group GLB .GLB" },
        { ".ASSET", "Unity Mesh Asset .ASSET" },
        { ".MESH", "Unity Mesh Asset .MESH" },
        { ".PREFAB", "Unity Prefab .PREFAB" },
        { ".UNITY", "Unity Scene .UNITY" }
    };

    public static string GetFileTypeDescription(string fileType)
    {
        return FileTypeDictionary.TryGetValue(fileType, out var description) ? description : fileType;
    }
}
#endregion