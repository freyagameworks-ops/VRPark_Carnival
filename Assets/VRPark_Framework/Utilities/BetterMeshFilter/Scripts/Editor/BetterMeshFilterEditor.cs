using System;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEditor.AssetImporters;
using UnityEditor.UIElements;
using UnityEngine;
using UnityEngine.UIElements;

namespace TinyGiantStudio.BetterInspector
{
    [CustomEditor(typeof(MeshFilter))]
    public class BetterMeshFilterEditor : Editor
    {
        #region Variable Declarations

        #region Layout Variables

        [SerializeField]
        private VisualTreeAsset visualTreeAsset;

        private VisualElement root;

        private MeshFilter sourceMeshFilter;
        private Mesh mesh;

        /// <summary>
        /// This is for the import settings
        /// </summary>
        private AssetImporterEditor sourceAssetEditor;

        private MeshPreview meshPreview;
        private IMGUIContainer previewContainer;
        private IMGUIContainer previewSettingsContainer;
        private ObjectField meshField;

        #endregion Layout Variables

        #region Editor Settings Variables

        private bool inspectorSettingsToggledOff = true;

        private GroupBox inspectorSettingsFoldout;

        private bool autoHideSettings = true;

        private bool showMeshPreview = true;

        private float meshPreviewHeight = 120;

        #region Information Inspector Settings Variables

        private bool showInformationFoldout = true;
        private GroupBox informationFoldout;

        private bool showVertexInformation = true;

        private bool showTriangleInformation = true;

        private bool showEdgeInformation = false;

        private bool showFaceInformation = true;

        private bool showTangentInformation = true;

        #endregion Information Inspector Settings Variables

        private bool showSizeFoldout = true;
        private GroupBox sizeFoldout; 
        
        private bool showAssetLocation = true;
        private Label assetLocationLabel;

        private bool showDebugGizmoFoldout = true;
        private GroupBox gizmoFoldout;

        #region Actions Inspector Settings

        private bool showActionsFoldout = true;
        private GroupBox actionsFoldout;

        private bool showOptimizeButton = true;

        private bool showRecalculateNormalsButton = true;

        private bool showRecalculateTangentsButton = true;

        private bool showFlipNormalsButton = true;

        private bool showGenerateSecondaryUVButton = true;

        private bool showSaveMeshButtonAs = true;

        private bool showLoadMeshButton = true;

        #endregion Actions Inspector Settings

        private bool showImportSettings = true;
        private GroupBox importSettings;
        private Toggle importSettingsFoldoutToggle;

        private bool autoCloseImporterIfInvalidMesh = true;

        private bool doNotApplyActionToAsset = true;

        private Color inspectorColor;

        private int selectedUnit = 0;

        #endregion Editor Settings Variables

        /// <summary>
        /// This is used to prevent information needlessly being updated on change.
        /// </summary>
        [SerializeField] private bool updatedInformation = false;

        [SerializeField] private Material checkerMaterial = null;
        private IMGUIContainer importerElement;

        #endregion Variable Declarations

        #region Unity Stuff

        private void OnEnable()
        {
            //showingBetterInspector = EditorPrefs.GetBool(showingBetterInspectorPref, true);
            GetEditorPrefs();

            
        }

        private void OnDestroy()
        {
            CleanUpUnused();
        }

        private void OnDisable()
        {
            CleanUpUnused();
            //if (sourceAssetEditor == null)
            //    return;

            ////sourceAssetEditor.OnEnable();
            //DestroyImmediate(sourceAssetEditor);
            //sourceAssetEditor = null;
        }

        private void CleanUpUnused()
        {
            meshPreview?.Dispose();

            ResetMaterial();
        }

        /// <summary>
        /// CreateInspectorGUI is called each time something else is selected with this one locked.
        /// </summary>
        /// <returns></returns>
        public override VisualElement CreateInspectorGUI()
        {
            sourceMeshFilter = target as MeshFilter;
            mesh = sourceMeshFilter.sharedMesh;

            root = new VisualElement();
            if (visualTreeAsset == null)
                visualTreeAsset = AssetDatabase.LoadAssetAtPath<VisualTreeAsset>("Assets/Plugins/Tiny Giant Studio/Better Mesh Filter/Scripts/Editor/BetterMeshFilter.uxml");
            visualTreeAsset.CloneTree(root);

            meshField = root.Q<ObjectField>("mesh");
            meshField.RegisterValueChangedCallback(ev =>
            {
                UpdateInspector((Mesh)ev.newValue);
                mesh = sourceMeshFilter.sharedMesh;
            });

            UpdateInspector(mesh);

            SetupFloatingButtons();

            EditorThemeManager editorThemeManager = new EditorThemeManager(root);
            editorThemeManager.Start();

            return root;
        }

        #endregion Unity Stuff

        /// <summary>
        /// This is used at the beginning and when mesh is updated
        /// </summary>
        /// <param name="currentMesh"></param>
        private void UpdateInspector(Mesh currentMesh)
        {
            updatedInformation = false;

            if (currentMesh != null)
            {
                if (showMeshPreview)
                    UpdateMeshPreview(currentMesh);
                else
                    HideMeshPreview();

                UpdateFoldouts(currentMesh);
            }
            else //no mesh
            {
                HideAllFoldouts();
                HideMeshPreview();
            }
        }

        private void SetupFloatingButtons()
        {
            var inspectorSettingsButton = root.Q<Button>("InspectorSettingsButton");
            inspectorSettingsButton.RegisterCallback<ClickEvent>(ToggleInspectorSettings);
        }

        #region Preview

        private void UpdateMeshPreview(Mesh mesh)
        {
            meshField.style.marginTop = 0;

            if (mesh == null) return;

            if (previewContainer == null)
            {
                previewContainer = root.Q<IMGUIContainer>("PreviewContainer");
            }

            meshPreviewHeight = Mathf.Abs(meshPreviewHeight);
            previewContainer.style.height = meshPreviewHeight;

            if (previewSettingsContainer == null)
            {
                previewSettingsContainer = root.Q<IMGUIContainer>("PreviewSettingsContainer");
            }

            if (meshPreview != null)
                meshPreview.Dispose();

            //Create editor of the mesh
            meshPreview = new MeshPreview(mesh);

            previewContainer.style.display = DisplayStyle.Flex;
            previewSettingsContainer.style.display = DisplayStyle.Flex;

            previewContainer.onGUIHandler = null;
            previewSettingsContainer.onGUIHandler = null;

            //Draw preview
            if (meshPreview != null)
            {
                previewSettingsContainer.onGUIHandler = null;
                previewSettingsContainer.onGUIHandler += () =>
                {                    
                    GUI.backgroundColor = new Color(1,1,1,0.5f);
                    GUI.color = Color.white;
                    GUILayout.BeginHorizontal();
                    meshPreview.OnPreviewSettings();
                    GUILayout.EndHorizontal();
                };
                previewContainer.onGUIHandler = null;
                previewContainer.onGUIHandler += () =>
                {
                    if (previewContainer.contentRect.height <= 0)
                        previewContainer.style.height = 50;                    

                    //if (previewContainer.contentRect.width <= 0)
                    //    previewContainer.style.width = 50;

                    if (previewContainer.contentRect.height > 0 && previewContainer.contentRect.width > 0) //Should be unnecessary. But still fixes a bug with height and width being negative.
                        meshPreview.OnPreviewGUI(previewContainer.contentRect, null);
                };
            }
        }


        private void HideMeshPreview()
        {
            if (previewSettingsContainer != null)
                previewSettingsContainer.style.display = DisplayStyle.None;
            if (previewContainer != null)
                previewContainer.style.display = DisplayStyle.None;

            meshField.style.marginTop = 25;
        }

        #endregion Preview

        #region Foldouts

        /// <summary>
        /// This is called at the beginning and when mesh is updated
        /// </summary>
        /// <param name="newMesh"></param>
        private void UpdateFoldouts(Mesh newMesh)
        {
            var propertiesGroups = root.Query<GroupBox>(className: "properties-group").ToList();

            foreach (GroupBox propertiesGroup in propertiesGroups)
            {
                propertiesGroup.style.backgroundColor = new Color(inspectorColor.r, inspectorColor.g, inspectorColor.b, inspectorColor.a * 0.1f);

                var foldoutToggle = propertiesGroup.Q<Toggle>("FoldoutToggle");
                var contentContainer = propertiesGroup.Q<GroupBox>("Container");
                contentContainer.style.display = foldoutToggle.value ? DisplayStyle.Flex : DisplayStyle.None;

                if (foldoutToggle.value)
                {
                    contentContainer.style.opacity = 1;
                    contentContainer.style.translate = new StyleTranslate(new Translate(0, 0));
                }
                else
                {
                    contentContainer.style.opacity = 0;
                    contentContainer.style.translate = new StyleTranslate(new Translate(0, -50));
                }

                foldoutToggle.RegisterValueChangedCallback(ev =>
                {
                    if (ev.newValue)
                    {
                        contentContainer.style.opacity = 1;
                        contentContainer.style.translate = new StyleTranslate(new Translate(0, 0));
                    }
                    else
                    {
                        contentContainer.style.opacity = 0;
                        contentContainer.style.translate = new StyleTranslate(new Translate(0, -50));
                    }
                    contentContainer.style.display = ev.newValue ? DisplayStyle.Flex : DisplayStyle.None;
                });

                switch (propertiesGroup.name)
                {
                    case "Informations":
                        informationFoldout = propertiesGroup;
                        if (showInformationFoldout)
                        {
                            propertiesGroup.style.display = DisplayStyle.Flex;
                            if (foldoutToggle.value)
                            {
                                UpdateFoldout_informations(newMesh);
                            }
                        }
                        else propertiesGroup.style.display = DisplayStyle.None;

                        foldoutToggle.RegisterValueChangedCallback(ev =>
                        {
                            if (ev.newValue)
                                UpdateFoldout_informations(newMesh);
                        });
                        break;

                    case "MeshSize":
                        sizeFoldout = propertiesGroup;
                        if (showSizeFoldout) sizeFoldout.style.display = DisplayStyle.Flex;
                        else sizeFoldout.style.display = DisplayStyle.None;

                        UpdateFoldout_information_meshSize(contentContainer, newMesh);
                        break;

                    case "MeshDebug":
                        gizmoFoldout = propertiesGroup;
                        if (showDebugGizmoFoldout) gizmoFoldout.style.display = DisplayStyle.Flex;
                        else gizmoFoldout.style.display = DisplayStyle.None;

                        DrawGizmoSettings(contentContainer);
                        break;

                    //case "ImportSettings":
                    //    importSettings = propertiesGroup;
                    //    importSettingsFoldoutToggle = foldoutToggle;
                    //    if (showImportSettings) importSettings.style.display = DisplayStyle.Flex;
                    //    else importSettings.style.display = DisplayStyle.None;

                    //    UpdateFoldout_importSettings(contentContainer, newMesh);

                    //    break;

                    case "InspectorSettings":
                        inspectorSettingsFoldout = propertiesGroup;
                        UpdateFoldout_InspectorSettings();
                        break;

                    case "Buttons":
                        actionsFoldout = propertiesGroup;
                        if (showActionsFoldout) actionsFoldout.style.display = DisplayStyle.Flex;
                        else actionsFoldout.style.display = DisplayStyle.None;
                        UpdateFoldout_actionButtons();
                        break;
                }
            }
        }

        private void HideAllFoldouts()
        {
            var propertiesGroups = root.Query<GroupBox>(className: "properties-group").ToList();

            foreach (var propertiesGroup in propertiesGroups)
            {
                propertiesGroup.style.display = DisplayStyle.None;
            }
        }

        private void UpdateFoldout_informations(Mesh newMesh)
        {
            if (updatedInformation)
                return;
            updatedInformation = true;
            
                 assetLocationLabel = root.Q<Label>("assetLocation");
            if (showAssetLocation)
            {
                assetLocationLabel.style.display = DisplayStyle.Flex;
                if (MeshIsAnAsset(newMesh))
                    assetLocationLabel.text = "Asset Location :" + '\n' + AssetDatabase.GetAssetPath(newMesh);
                else
                    assetLocationLabel.text = "The mesh is not connected to an asset.";
            }
            else
            {
                assetLocationLabel.style.display = DisplayStyle.None;
            }

            string separator = " | ";

            string informationText = "";
            if (showVertexInformation) informationText += "Vertices: " + newMesh.VertexCount();
            if (showTriangleInformation) informationText += separator + "Triangles: " + newMesh.TrianglesCount();
            if (showEdgeInformation) informationText += separator + "Edges: " + newMesh.EdgeCount(); //slow
            if (showTangentInformation) informationText += separator + "Tangents: " + newMesh.tangents.Length;
            if (showFaceInformation) informationText += separator + "Faces: " + newMesh.FaceCount();

            if (showVertexInformation)
            {
                int[] subMeshVertexCounts = newMesh.SubMeshVertexCount();
                if (subMeshVertexCounts.Length > 1)
                {
                    informationText += " | Submeshes: " + subMeshVertexCounts.Length;
                    informationText += " | Vertices: ";
                    for (int i = 0; i < subMeshVertexCounts.Length; i++)
                    {
                        informationText += subMeshVertexCounts[i];
                        if (i + 1 != subMeshVertexCounts.Length)
                            informationText += ", ";
                    }
                }
            }

            var informationField = root.Q<Label>("meshData");
            informationField.text = informationText;
        }

        private void UpdateFoldout_information_meshSize(VisualElement container, Mesh newMesh)
        {
            if (newMesh == null)
                return;

            DropdownField meshUnitDropdown = container.parent.Q<DropdownField>("MeshUnit");
            string[] availableUnits = ScaleSettings.GetAvailableUnits();
            if (availableUnits.Length == 0) ScaleSettings.ResetSavedUnits();
            availableUnits = ScaleSettings.GetAvailableUnits();

            meshUnitDropdown.choices = availableUnits.ToList();
            if (selectedUnit >= availableUnits.Length || selectedUnit < 0)
                selectedUnit = 0;
            meshUnitDropdown.index = selectedUnit;

            meshUnitDropdown.RegisterCallback<ChangeEvent<string>>(ev =>
            {
                updateValues(" " + ev.newValue);
            });

            updateValues(" " + availableUnits[selectedUnit]);

            void updateValues(string selectedUnitName)
            {
                //selectedUnitName = " " + ScaleSettings.GetAvailableUnits()[selectedUnit];
                selectedUnit = meshUnitDropdown.index;
                Bounds meshBound = newMesh.MeshSizeEditorOnly(ScaleSettings.CurrentUnitValue(selectedUnit));
                BetterMeshSettings.instance.SelectedUnit = selectedUnit;

                Label sizeLabel = root.Q<Label>("Size");
                string text = "Length : " + RoundedFloat(meshBound.size.x) + selectedUnitName;
                text += "\nHeight : " + RoundedFloat(meshBound.size.y) + selectedUnitName;
                text += "\nDepth : " + RoundedFloat(meshBound.size.z) + selectedUnitName;
                sizeLabel.text = text;
                sizeLabel.tooltip = "Number is rounded after 8 digits";

                Label centerLabel = root.Q<Label>("Center");
                string centertext = "Center : " + RoundedFloat(meshBound.center.x) + ", " + RoundedFloat(meshBound.center.y) + ", " + RoundedFloat(meshBound.center.z) + selectedUnitName;
                centerLabel.text = centertext;
                centerLabel.tooltip = "Number is rounded after 8 digits";
            }

            float RoundedFloat(float rawFloat) => (float)System.Math.Round(rawFloat, 8);
        }

        private void UpdateFoldout_actionButtons()
        {
            var doNotApplyActionToAssetToggle = root.Q<Toggle>("doNotApplyActionToAsset");
            doNotApplyActionToAssetToggle.value = doNotApplyActionToAsset;
            doNotApplyActionToAssetToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.DoNotApplyActionToAssetPref = ev.newValue;
                doNotApplyActionToAsset = ev.newValue;
            });

            var optimizeMesh = root.Q<Button>("OptimizeMesh");
            if (showOptimizeButton) optimizeMesh.style.display = DisplayStyle.Flex;
            else optimizeMesh.style.display = DisplayStyle.None;
            optimizeMesh.RegisterCallback<ClickEvent>(MeshInsnanceCheck);
            optimizeMesh.RegisterCallback<ClickEvent>(OptimizeMesh);

            var recalculateNormals = root.Q<Button>("RecalculateNormals");
            if (showRecalculateNormalsButton) recalculateNormals.style.display = DisplayStyle.Flex;
            else recalculateNormals.style.display = DisplayStyle.None;
            recalculateNormals.RegisterCallback<ClickEvent>(MeshInsnanceCheck);
            recalculateNormals.RegisterCallback<ClickEvent>(RecalculateNormals);

            var recalculateTangents = root.Q<Button>("RecalculateTangents");
            if (showRecalculateTangentsButton) recalculateTangents.style.display = DisplayStyle.Flex;
            else recalculateTangents.style.display = DisplayStyle.None;
            recalculateTangents.RegisterCallback<ClickEvent>(MeshInsnanceCheck);
            recalculateTangents.RegisterCallback<ClickEvent>(RecalculateTangents);

            var flipNormals = root.Q<Button>("FlipNormals");
            if (showFlipNormalsButton) flipNormals.style.display = DisplayStyle.Flex;
            else flipNormals.style.display = DisplayStyle.None;
            flipNormals.RegisterCallback<ClickEvent>(MeshInsnanceCheck);
            flipNormals.RegisterCallback<ClickEvent>(FlipNormals);

            var generateSecondaryUVSet = root.Q<Button>("GenerateSecondaryUVSet");
            if (showGenerateSecondaryUVButton) generateSecondaryUVSet.style.display = DisplayStyle.Flex;
            else generateSecondaryUVSet.style.display = DisplayStyle.None;
            generateSecondaryUVSet.RegisterCallback<ClickEvent>(MeshInsnanceCheck);
            generateSecondaryUVSet.RegisterCallback<ClickEvent>(GenerateSecondaryUVSet);

            var saveMeshAsField = root.Q<Button>("exportMesh");
            if (showSaveMeshButtonAs) saveMeshAsField.style.display = DisplayStyle.Flex;
            else saveMeshAsField.style.display = DisplayStyle.None;
            saveMeshAsField.RegisterCallback<ClickEvent>(ExportMesh);

            /// <summary>
            /// This is used to make sure the mesh you are modifying is an instance and the user isn't accidentally modifying the asset
            /// </summary>
            void MeshInsnanceCheck(ClickEvent @event)
            {
                if (MeshIsAnAsset(mesh) && doNotApplyActionToAsset)
                {
                    Mesh newMesh = new Mesh();
                    newMesh.vertices = mesh.vertices;
                    newMesh.triangles = mesh.triangles;
                    newMesh.uv = mesh.uv;
                    newMesh.normals = mesh.normals;
                    newMesh.name = mesh.name + " (Local Instance)";
                    Undo.RecordObject(sourceMeshFilter, "Mesh instance creation");
                    sourceMeshFilter.mesh = newMesh;
                    EditorUtility.SetDirty(sourceMeshFilter);
                    mesh = newMesh;
                }

                //UpdateFoldout_importSettings(importSettings.Q<GroupBox>("Container"), mesh);
            }

            //void SubDivideMesh(ClickEvent evt)
            //{
            //    sourceMeshFilter.sharedMesh = mesh.SubDivide();
            //    mesh = sourceMeshFilter.sharedMesh;
            //    EditorUtility.SetDirty(mesh);
            //    Log("exported");
            //    UpdateFoldouts(mesh);
            //    SceneView.RepaintAll();
            //}

            void OptimizeMesh(ClickEvent evt)
            {
                Undo.RecordObject(sourceMeshFilter.gameObject, "Optimize mesh");
                mesh.Optimize();
                Log("optimized");
                UpdateFoldouts(mesh);
            }

            void RecalculateNormals(ClickEvent evt)
            {
                Undo.RecordObject(mesh, "Modifying Normals");
                mesh.RecalculateNormals();
                EditorUtility.SetDirty(mesh);
                Log("normals recalculated");
                UpdateFoldouts(mesh);
            }

            void RecalculateTangents(ClickEvent evt)
            {
                Undo.RecordObject(mesh, "Modifying Tangents");
                mesh.RecalculateTangents();
                EditorUtility.SetDirty(mesh);
                Log("tangents recalculated");
                UpdateFoldouts(mesh);
            }

            void FlipNormals(ClickEvent evt)
            {
                mesh.FlipNormals();
                EditorUtility.SetDirty(mesh);
                Log("normals flipped");
                UpdateFoldouts(mesh);
                SceneView.RepaintAll();
            }

            void GenerateSecondaryUVSet(ClickEvent evt)
            {
                mesh.GenerateSecondaryUVSetEditorOnly();
                EditorUtility.SetDirty(mesh);
                Log("secondary UV set generated");
                UpdateFoldouts(mesh);
                SceneView.RepaintAll();
            }

            void ExportMesh(ClickEvent evt)
            {
                sourceMeshFilter.sharedMesh = mesh.ExportMesh();
                mesh = sourceMeshFilter.sharedMesh;
                EditorUtility.SetDirty(mesh);
                UpdateFoldouts(mesh);
                SceneView.RepaintAll();
            }
        }

        //private void UpdateFoldout_importSettings(VisualElement container, Mesh newMesh)
        //{
        //    //importerInfoBox
        //    var importerInfoBox = container.Q<GroupBox>("importerInfoBox");
        //    Label notificationLabel = importerInfoBox.Q<Label>("ImporterNotification");

        //    if (newMesh == null)
        //    {
        //        importerInfoBox.style.display = DisplayStyle.Flex;
        //        notificationLabel.text = "Please select a mesh to show importer settings";
        //        if (autoCloseImporterIfInvalidMesh) importSettingsFoldoutToggle.value = false;
        //        return;
        //    }

        //    if (AssetDatabase.GetAssetPath(newMesh) == null)
        //    {
        //        importerInfoBox.style.display = DisplayStyle.Flex;
        //        notificationLabel.text = "Failed to get mesh asset location from asset database.";
        //        if (autoCloseImporterIfInvalidMesh) importSettingsFoldoutToggle.value = false;
        //        return;
        //    }

        //    importerInfoBox.style.display = DisplayStyle.None;

        //    //Get source asset from mesh path
        //    var sourceAsset = AssetImporter.GetAtPath(AssetDatabase.GetAssetPath(newMesh));

        //    if (sourceAsset is not ModelImporter)
        //    {
        //        if (sourceAssetEditor != null)
        //            DestroyImmediate(sourceAssetEditor);

        //        sourceAssetEditor = null;
        //    }
        //    else
        //    {
        //        //Create editor of the mesh's source asset
        //        if (sourceAssetEditor != null)
        //        {
        //            //sourceAssetEditor.target = sourceAsset;
        //            //sourceAssetEditor.OnEnable();
        //            DestroyImmediate(sourceAssetEditor);
        //        }
        //        //sourceAssetEditor = CreateEditor(sourceAsset);

        //        //sourceAssetEditor = CreateEditor(sourceAsset) as AssetImporterEditor;

        //        sourceAssetEditor = (AssetImporterEditor)AssetImporterEditor.CreateEditor(sourceAsset, Type.GetType("UnityEditor.ModelImporterEditor, UnityEditor"));
        //        MethodInfo dynMethod = Type.GetType("UnityEditor.ModelImporterEditor, UnityEditor")
        //                               .GetMethod("InternalSetAssetImporterTargetEditor",
        //                                          BindingFlags.NonPublic | BindingFlags.Instance);
        //        dynMethod.Invoke(sourceAssetEditor, new object[] { this });
        //    }

        //    if (sourceAssetEditor == null)
        //    {
        //        importerInfoBox.style.display = DisplayStyle.Flex;
        //        notificationLabel.text = "Failed to get mesh importer settings for the selected mesh. \nThis is an expected outcome for built in meshes, procedurally created meshes and local mesh instances that are disconnected from an asset.";
        //        if (autoCloseImporterIfInvalidMesh) importSettingsFoldoutToggle.value = false;
        //        return;
        //    }

        //    //Find the GUI method that is responsible to show apply revert button as did not found direct access
        //    MethodInfo importerApplyGUIMethod = typeof(AssetImporterEditor).GetMethod("OnApplyRevertGUI", BindingFlags.NonPublic | BindingFlags.Instance);

        //    //Create importer settings element

        //    if (importerElement == null)
        //    {
        //        importerElement = new IMGUIContainer();
        //        //Add the importer settings
        //        container.Add(importerElement);
        //    }

        //    importerElement.onGUIHandler += () =>
        //    {
        //        if (sourceAssetEditor)
        //        {

        //            EditorGUI.BeginChangeCheck();

        //            //if(!DarkTheme())
        //            GUI.color = Color.white;
        //            GUILayout.BeginVertical(GUI.skin.box);
        //            //Draw settings
        //            sourceAssetEditor.OnInspectorGUI();
        //            GUILayout.EndVertical();
        //            if (EditorGUI.EndChangeCheck())
        //            {
        //            }

        //            GUILayout.Space(5);
        //            GUILayout.BeginHorizontal();
        //            //Show the apply and revert button
        //            importerApplyGUIMethod.Invoke(sourceAssetEditor, null);
        //            GUILayout.EndHorizontal();
        //        }
        //    };
        //}

        private void UpdateFoldout_InspectorSettings()
        {
            var foldoutToggle = inspectorSettingsFoldout.Q<Toggle>("FoldoutToggle");

            inspectorSettingsFoldout.style.display = DisplayStyle.None;
            inspectorSettingsToggledOff = true;

            foldoutToggle.RegisterValueChangedCallback(ev =>
            {
                if (autoHideSettings)
                {
                    if (ev.newValue)
                    {
                        inspectorSettingsFoldout.style.display = DisplayStyle.Flex;
                        inspectorSettingsToggledOff = false;
                    }
                    else
                    {
                        inspectorSettingsFoldout.style.display = DisplayStyle.None;
                        inspectorSettingsToggledOff = true;
                    }
                }
            });

            var autoHideInspectorSettingsField = inspectorSettingsFoldout.Q<Toggle>("autoHideInspectorSettings");
            autoHideInspectorSettingsField.value = autoHideSettings;
            autoHideInspectorSettingsField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.AutoHideSettingsPref = ev.newValue;
                autoHideSettings = ev.newValue;
            });

            var inspectorColorField = inspectorSettingsFoldout.Q<ColorField>("InspectorColor");
            inspectorColorField.value = inspectorColor;
            UpdateInspectorColor();
            inspectorColorField.RegisterValueChangedCallback(ev =>
            {
                inspectorColor = ev.newValue;
                BetterMeshSettings.instance.EditorColorPref = UnityEngine.ColorUtility.ToHtmlStringRGB(inspectorColor);

                UpdateInspectorColor();
            });

            void UpdateInspectorColor()
            {
                var propertiesGroups = root.Query<GroupBox>(className: "properties-group").ToList();
                foreach (var group in propertiesGroups)
                {
                    group.style.backgroundColor = new Color(inspectorColor.r, inspectorColor.g, inspectorColor.b, inspectorColor.a * 0.1f);
                }

                var myButtons = root.Query<Button>(className: "myButton").ToList();
                foreach (var button in myButtons)
                {
                    button.style.backgroundColor = new Color(inspectorColor.r, inspectorColor.g, inspectorColor.b, inspectorColor.a * 0.1f);
                }
            }

            var resetInspectorSettingsButton = inspectorSettingsFoldout.Q<Button>("ResetInspectorSettings");
            resetInspectorSettingsButton.clicked += ResetInspectorSettings;

            var showMeshPreviewField = inspectorSettingsFoldout.Q<Toggle>("showMeshPreview");
            showMeshPreviewField.value = showMeshPreview;
            showMeshPreviewField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowMeshPreviewPref = ev.newValue;
                showMeshPreview = ev.newValue;

                if (showMeshPreview)
                    UpdateMeshPreview(mesh);
                else
                    HideMeshPreview();
            });

            var meshPreviewHeightField = inspectorSettingsFoldout.Q<FloatField>("meshPreviewHeight");
            meshPreviewHeightField.value = meshPreviewHeight;
            meshPreviewHeightField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.MeshPreviewHeightPref = ev.newValue;
                meshPreviewHeight = ev.newValue;

                if (previewContainer != null)
                {
                    if (meshPreviewHeight == 0)
                        previewContainer.style.height = 2;
                    else
                        previewContainer.style.height = Mathf.Abs(meshPreviewHeight);
                }
            });

            var showInformationFoldoutField = inspectorSettingsFoldout.Q<Toggle>("showInformationFoldout");
            showInformationFoldoutField.value = showInformationFoldout;
            showInformationFoldoutField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowInformationFoldoutPref = ev.newValue;
                showInformationFoldout = ev.newValue;

                if (showInformationFoldout) informationFoldout.style.display = DisplayStyle.Flex;
                else informationFoldout.style.display = DisplayStyle.None;
            });

            var showVertexInformationToggle = inspectorSettingsFoldout.Q<Toggle>("showVertextCount");
            showVertexInformationToggle.value = showVertexInformation;
            showVertexInformationToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowVertexInformationPref = ev.newValue;
                showVertexInformation = ev.newValue;

                updatedInformation = false;
                UpdateFoldout_informations(mesh);
            });

            var showTriangleInformationToggle = inspectorSettingsFoldout.Q<Toggle>("showTriangleCount");
            showTriangleInformationToggle.value = showTriangleInformation;
            showTriangleInformationToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowTriangleInformationPref = ev.newValue;
                showTriangleInformation = ev.newValue;

                updatedInformation = false;
                UpdateFoldout_informations(mesh);
            });

            var showEdgeInformationToggle = inspectorSettingsFoldout.Q<Toggle>("showEdgeCount");
            showEdgeInformationToggle.value = showEdgeInformation;
            showEdgeInformationToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowEdgeInformationPref = ev.newValue;
                showEdgeInformation = ev.newValue;

                updatedInformation = false;
                UpdateFoldout_informations(mesh);
            });

            var showFaceInformationToggle = inspectorSettingsFoldout.Q<Toggle>("showFaceCount");
            showFaceInformationToggle.value = showFaceInformation;
            showFaceInformationToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowFaceInformationPref = ev.newValue;
                showFaceInformation = ev.newValue;

                updatedInformation = false;
                UpdateFoldout_informations(mesh);
            });

            var showTangentInformationToggle = inspectorSettingsFoldout.Q<Toggle>("showTangentCount");
            showTangentInformationToggle.value = showTangentInformation;
            showTangentInformationToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowTangentInformationPref = ev.newValue;
                showTangentInformation = ev.newValue;

                updatedInformation = false;
                UpdateFoldout_informations(mesh);
            });

            var showMeshSizeField = inspectorSettingsFoldout.Q<Toggle>("showMeshSize");
            showMeshSizeField.value = showSizeFoldout;
            showMeshSizeField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowSizeFoldoutPref = ev.newValue;
                showSizeFoldout = ev.newValue;

                if (showSizeFoldout) sizeFoldout.style.display = DisplayStyle.Flex;
                else sizeFoldout.style.display = DisplayStyle.None;
            });

            var showAssetLocationField = inspectorSettingsFoldout.Q<Toggle>("ShowAssetLocation");
            showAssetLocationField.value = showAssetLocation;
            showAssetLocationField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowAssetLocationPref = ev.newValue;
                showAssetLocation = ev.newValue;

                if (showAssetLocation) assetLocationLabel.style.display = DisplayStyle.Flex;
                else assetLocationLabel.style.display = DisplayStyle.None;
            });

            var showDebugGizmoFoldoutField = inspectorSettingsFoldout.Q<Toggle>("showDebugGizmoFoldout");
            showDebugGizmoFoldoutField.value = showDebugGizmoFoldout;
            showDebugGizmoFoldoutField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowDebugGizmoFoldoutPref = ev.newValue;
                showDebugGizmoFoldout = ev.newValue;

                if (showDebugGizmoFoldout) gizmoFoldout.style.display = DisplayStyle.Flex;
                else gizmoFoldout.style.display = DisplayStyle.None;
            });

            var showActionsFoldoutField = inspectorSettingsFoldout.Q<Toggle>("showActionsFoldout");
            showActionsFoldoutField.value = showActionsFoldout;
            showActionsFoldoutField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowActionsFoldoutPref = ev.newValue;
                showActionsFoldout = ev.newValue;

                if (showActionsFoldout) actionsFoldout.style.display = DisplayStyle.Flex;
                else actionsFoldout.style.display = DisplayStyle.None;
            });

            var showImportSettingsField = inspectorSettingsFoldout.Q<Toggle>("showImportSettingsFoldout");
            showImportSettingsField.value = showImportSettings;
            showImportSettingsField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowImportSettingsPref = ev.newValue;
                showImportSettings = ev.newValue;

                if (showImportSettings) importSettings.style.display = DisplayStyle.Flex;
                else importSettings.style.display = DisplayStyle.None;
            });

            var showOptimizeButtonToggle = inspectorSettingsFoldout.Q<Toggle>("OptimizeMesh");
            showOptimizeButtonToggle.value = showOptimizeButton;
            showOptimizeButtonToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowOptimizeButtonPref = ev.newValue;
                showOptimizeButton = ev.newValue;

                UpdateFoldout_actionButtons();
            });

            var recalculateNormalsToggle = inspectorSettingsFoldout.Q<Toggle>("RecalculateNormals");
            recalculateNormalsToggle.value = showRecalculateNormalsButton;
            recalculateNormalsToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowRecalculateNormalsButtonPref = ev.newValue;
                showRecalculateNormalsButton = ev.newValue;

                UpdateFoldout_actionButtons();
            });

            var showRecalculateTangentsButtonToggle = inspectorSettingsFoldout.Q<Toggle>("RecalculateTangents");
            showRecalculateTangentsButtonToggle.value = showRecalculateTangentsButton;
            showRecalculateTangentsButtonToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowRecalculateTangentsButtonPref = ev.newValue;
                showRecalculateTangentsButton = ev.newValue;

                UpdateFoldout_actionButtons();
            });

            var showFlipNormalsToggle = inspectorSettingsFoldout.Q<Toggle>("FlipNormals");
            showFlipNormalsToggle.value = showFlipNormalsButton;
            showFlipNormalsToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowFlipNormalsButtonPref = ev.newValue;
                showFlipNormalsButton = ev.newValue;

                UpdateFoldout_actionButtons();
            });

            var showGenerateSecondaryUVButtonToggle = inspectorSettingsFoldout.Q<Toggle>("GenerateSecondaryUVSet");
            showGenerateSecondaryUVButtonToggle.value = showGenerateSecondaryUVButton;
            showGenerateSecondaryUVButtonToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowGenerateSecondaryUVButtonPref = ev.newValue;
                showGenerateSecondaryUVButton = ev.newValue;

                UpdateFoldout_actionButtons();
            });

            var showSaveMeshButtonAsToggle = inspectorSettingsFoldout.Q<Toggle>("SaveMeshAs");
            showSaveMeshButtonAsToggle.value = showSaveMeshButtonAs;
            showSaveMeshButtonAsToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowSaveMeshAsButtonPref = ev.newValue;
                showSaveMeshButtonAs = ev.newValue;

                UpdateFoldout_actionButtons();
            });

            var showLoadMeshButtonToggle = inspectorSettingsFoldout.Q<Toggle>("LoadMeshFromAsset");
            showLoadMeshButtonToggle.value = showLoadMeshButton;
            showLoadMeshButtonToggle.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.ShowLoadMeshButtonPref = ev.newValue;
                showLoadMeshButton = ev.newValue;

                UpdateFoldout_actionButtons();
            });

            var autoCloseImporterIfInvalidMeshField = inspectorSettingsFoldout.Q<Toggle>("autoCloseImporterIfInvalidMesh");
            autoCloseImporterIfInvalidMeshField.value = autoCloseImporterIfInvalidMesh;
            autoCloseImporterIfInvalidMeshField.RegisterValueChangedCallback(ev =>
            {
                BetterMeshSettings.instance.AutoCloseImporterIfInvalidMeshPref = ev.newValue;
                autoCloseImporterIfInvalidMesh = ev.newValue;
            });

            var scaleSettingsButton = inspectorSettingsFoldout.Q<Button>("ScaleSettingsButton");
            scaleSettingsButton.clicked += () =>
            {
                SettingsService.OpenProjectSettings("Project/Tiny Giant Studio/Scale Settings");
                GUIUtility.ExitGUI();
            };

            void ResetInspectorSettings()
            {
                BetterMeshSettings.instance.AutoHideSettingsPref = true;
                autoHideSettings = true;
                BetterMeshSettings.instance.ShowMeshPreviewPref = true;
                showMeshPreview = true;
                BetterMeshSettings.instance.MeshPreviewHeightPref = 120;
                meshPreviewHeight = 120;
                BetterMeshSettings.instance.ShowInformationFoldoutPref = true;
                showInformationFoldout = true;
                BetterMeshSettings.instance.ShowVertexInformationPref = true;
                showVertexInformation = true;
                BetterMeshSettings.instance.ShowTriangleInformationPref = true;
                showTriangleInformation = true;
                BetterMeshSettings.instance.ShowEdgeInformationPref = false;
                showEdgeInformation = true;
                BetterMeshSettings.instance.ShowFaceInformationPref = true;
                showFaceInformation = true;
                BetterMeshSettings.instance.ShowTangentInformationPref = true;
                showTangentInformation = true;
                BetterMeshSettings.instance.ShowSizeFoldoutPref = true;
                showSizeFoldout = true;
                BetterMeshSettings.instance.ShowDebugGizmoFoldoutPref = true;
                showDebugGizmoFoldout = true;
                BetterMeshSettings.instance.ShowActionsFoldoutPref = true;
                showActionsFoldout = true;
                BetterMeshSettings.instance.ShowOptimizeButtonPref = true;
                showOptimizeButton = true;
                BetterMeshSettings.instance.ShowRecalculateNormalsButtonPref = true;
                showRecalculateNormalsButton = true;
                BetterMeshSettings.instance.ShowRecalculateTangentsButtonPref = false;
                showRecalculateTangentsButton = true;
                BetterMeshSettings.instance.ShowFlipNormalsButtonPref = true;
                showFlipNormalsButton = true;
                BetterMeshSettings.instance.ShowGenerateSecondaryUVButtonPref = true;
                showGenerateSecondaryUVButton = false;
                BetterMeshSettings.instance.ShowSaveMeshAsButtonPref = true;
                showSaveMeshButtonAs = true;
                BetterMeshSettings.instance.ShowLoadMeshButtonPref = true;
                showLoadMeshButton = true;

                BetterMeshSettings.instance.ShowImportSettingsPref = true;
                showImportSettings = true;
                BetterMeshSettings.instance.AutoCloseImporterIfInvalidMeshPref = true;
                autoCloseImporterIfInvalidMesh = true;
                BetterMeshSettings.instance.DoNotApplyActionToAssetPref = true;
                doNotApplyActionToAsset = true;
                BetterMeshSettings.instance.SelectedUnit = 0;
                selectedUnit = 0;

                BetterMeshSettings.instance.EditorColorPref = "3F3F3F";
                ColorUtility.TryParseHtmlString($"#{BetterMeshSettings.instance.EditorColorPref}", out inspectorColor);

                UpdateFoldout_InspectorSettings();
                UpdateInspector(mesh);
            }
        }

        #endregion Foldouts

        private void ToggleInspectorSettings(ClickEvent evt)
        {
            if (inspectorSettingsFoldout == null)
            {
                var propertiesGroups = root.Query<GroupBox>(className: "properties-group").ToList();

                foreach (var propertiesGroup in propertiesGroups)
                {
                    if (propertiesGroup.name == "InspectorSettings")
                    {
                        inspectorSettingsFoldout = propertiesGroup;
                        break;
                    }
                }
            }

            if (inspectorSettingsFoldout == null) return;

            if (inspectorSettingsToggledOff)
            {
                inspectorSettingsFoldout.style.display = DisplayStyle.Flex;
                inspectorSettingsToggledOff = false;
            }
            else
            {
                inspectorSettingsFoldout.style.display = DisplayStyle.None;
                inspectorSettingsToggledOff = true;
            }

            var foldoutToggle = inspectorSettingsFoldout.Q<Toggle>("FoldoutToggle");
            foldoutToggle.value = !inspectorSettingsToggledOff;
        }

        private bool MeshIsAnAsset(Mesh newMesh) => AssetDatabase.Contains(newMesh);

        private Texture2D CreateCheckeredTexture(int width, int height, int checkSize)
        {
            Texture2D texture = new Texture2D(width, height);
            Color color1 = Color.black;
            Color color2 = Color.white;

            // Loop over the width and height.
            for (int y = 0; y < texture.height; y++)
            {
                for (int x = 0; x < texture.width; x++)
                {
                    // Determine which color to use based on the current x and y indices.
                    bool checkX = x / checkSize % 2 == 0;
                    bool checkY = y / checkSize % 2 == 0;
                    Color color = (checkX == checkY) ? color1 : color2;

                    // Set the pixel color.
                    texture.SetPixel(x, y, color);
                }
            }
            texture.Apply();

            return texture;
        }

        private void GetEditorPrefs()
        {
            autoHideSettings = BetterMeshSettings.instance.AutoHideSettingsPref;
            showMeshPreview = BetterMeshSettings.instance.ShowMeshPreviewPref;
            meshPreviewHeight = BetterMeshSettings.instance.MeshPreviewHeightPref;

            showInformationFoldout = BetterMeshSettings.instance.ShowInformationFoldoutPref;
            showVertexInformation = BetterMeshSettings.instance.ShowVertexInformationPref;
            showTriangleInformation = BetterMeshSettings.instance.ShowTriangleInformationPref;
            showEdgeInformation = BetterMeshSettings.instance.ShowEdgeInformationPref;
            showFaceInformation = BetterMeshSettings.instance.ShowFaceInformationPref;
            showTangentInformation = BetterMeshSettings.instance.ShowTangentInformationPref;

            showSizeFoldout = BetterMeshSettings.instance.ShowSizeFoldoutPref;
            showAssetLocation = BetterMeshSettings.instance.ShowAssetLocationPref;
            showDebugGizmoFoldout = BetterMeshSettings.instance.ShowDebugGizmoFoldoutPref;

            showActionsFoldout = BetterMeshSettings.instance.ShowActionsFoldoutPref;
            showOptimizeButton = BetterMeshSettings.instance.ShowOptimizeButtonPref;
            showRecalculateNormalsButton = BetterMeshSettings.instance.ShowRecalculateNormalsButtonPref;
            showRecalculateTangentsButton = BetterMeshSettings.instance.ShowRecalculateTangentsButtonPref;
            showFlipNormalsButton = BetterMeshSettings.instance.ShowFlipNormalsButtonPref;
            showGenerateSecondaryUVButton = BetterMeshSettings.instance.ShowGenerateSecondaryUVButtonPref;
            showSaveMeshButtonAs = BetterMeshSettings.instance.ShowSaveMeshAsButtonPref;
            showLoadMeshButton = BetterMeshSettings.instance.ShowLoadMeshButtonPref;

            ColorUtility.TryParseHtmlString($"#{BetterMeshSettings.instance.EditorColorPref}", out inspectorColor);

            showImportSettings = BetterMeshSettings.instance.ShowImportSettingsPref;
            autoCloseImporterIfInvalidMesh = BetterMeshSettings.instance.AutoCloseImporterIfInvalidMeshPref;

            doNotApplyActionToAsset = BetterMeshSettings.instance.DoNotApplyActionToAssetPref;

            selectedUnit = BetterMeshSettings.instance.SelectedUnit;
        }

        /// <summary>
        /// This is used by actions to create a colorful debug log without having to rewrite the same code
        /// Example result: "Cube mesh action successfully" | "cube mesh shading set to flat successfully"
        /// </summary>
        /// <param name="action">The action performed.</param>
        private void Log(string action) => Debug.Log("<color=gray><b>" + mesh.name + "</b></color> mesh <color=gray><i>" + action + "</i></color> successfully.");

        #region Gizmo

        public bool showNormals = false;
        public float normalLength = 0.1f;
        public float normalWidth = 5;
        public Color normalColor = Color.blue;

        public bool showTangents = false;
        public float tangentLength = 0.1f;
        public float tangentWidth = 5;
        public Color tangentColor = Color.red;

        public bool showUV;
        public Color uvSeamColor = Color.green;
        public float uvWidth = 5;

        private void DrawGizmoSettings(VisualElement container)
        {
            NormalsGizmoSettings(container);

            TangentGizmoSettings(container);

            UVGizmoSettings(container);

            CheckeredUVSettings(container);
        }

        private void CheckeredUVSettings(VisualElement container)
        {
            var setCheckeredUV = container.Q<Button>("setCheckeredUV");
            setCheckeredUV.clickable = null;
            setCheckeredUV.clicked += () => AssignCheckerMaterial();
            //var setCheckerField = container.Q<Toggle>("setChecker");

            //setCheckerField.RegisterValueChangedCallback(ev =>
            //{
            //    if (ev.newValue)
            //    {
            //        AssignCheckerMaterial();
            //    }
            //    else
            //    {
            //        ResetMaterial();
            //    }
            //});
        }

        private void AssignCheckerMaterial()
        {
            Debug.Log("Assigning CheckerMaterial");
            if (checkerMaterial != null)
                ResetMaterial();
            if (sourceMeshFilter.GetComponent<Renderer>() == null)
            {
                Debug.Log("Please assign a material.");
                return;
            }
            Material originalMaterial = sourceMeshFilter.GetComponent<Renderer>().sharedMaterial;
            if (originalMaterial == null)
            {
                Debug.Log("Please assign a material.");
                return;
            }

            if (checkerMaterial != null)
            {
                DestroyImmediate(checkerMaterial);
            }

            checkerMaterial = new Material(originalMaterial);
            checkerMaterial.name = "Checkered Material";

            int width = root.Q<IntegerField>("UVWidth").value;
            int height = root.Q<IntegerField>("UVHeight").value;
            int cellSize = root.Q<IntegerField>("UVCellSize").value;
            checkerMaterial.mainTexture = CreateCheckeredTexture(width, height, cellSize);

            //editorRepainted = false;
            Undo.RecordObject(sourceMeshFilter.GetComponent<Renderer>(), "UV Material apply");
            sourceMeshFilter.GetComponent<Renderer>().sharedMaterial = checkerMaterial;
            //checkerMaterial.SetTexture("Checkered Texture", null);
        }

        private void ResetMaterial()
        {
            //if(!editorRepainted) { editorRepainted = true; return; }

            //Debug.Log(originalMaterial);

            //if (checkerMaterial != null)
            //    if (sourceMeshFilter.GetComponent<MeshRenderer>())
            //        if (sourceMeshFilter.GetComponent<MeshRenderer>().material = checkerMaterial)
            //            if (originalMaterial)
            //                sourceMeshFilter.GetComponent<MeshRenderer>().material = originalMaterial;
        }

        private void UVGizmoSettings(VisualElement container)
        {
            var showUVField = container.Q<Toggle>("showUV");
            var uvWidthField = container.Q<FloatField>("uvWidth");
            var uvColorField = container.Q<ColorField>("uvColor");

            if (!showUVField.value) HideUVGizmoSettings(uvWidthField, uvColorField);

            showUVField.RegisterValueChangedCallback(ev =>
            {
                showUV = ev.newValue;

                if (ev.newValue)
                {
                    uvWidthField.style.display = DisplayStyle.Flex;
                    uvColorField.style.display = DisplayStyle.Flex;
                }
                else
                {
                    HideUVGizmoSettings(uvWidthField, uvColorField);
                }
                SceneView.RepaintAll();
            });
            uvWidthField.RegisterValueChangedCallback(ev =>
            {
                uvWidth = ev.newValue;
                SceneView.RepaintAll();
            });
            uvColorField.RegisterValueChangedCallback(ev =>
            {
                uvSeamColor = ev.newValue;
                SceneView.RepaintAll();
            });
        }

        private void HideUVGizmoSettings(FloatField uvWidthField, ColorField uvColorField)
        {
            uvWidthField.style.display = DisplayStyle.None;
            uvColorField.style.display = DisplayStyle.None;
        }

        private void TangentGizmoSettings(VisualElement container)
        {
            var showTangentsField = container.Q<Toggle>("showTangents");
            var tangentLengthField = container.Q<FloatField>("tangentLength");
            var tangentWidthField = container.Q<FloatField>("tangentWidth");
            var tangentColorField = container.Q<ColorField>("tangentColor");

            if (!showTangentsField.value) HideTangentGizmoSettings(tangentLengthField, tangentWidthField, tangentColorField);

            showTangentsField.RegisterValueChangedCallback(ev =>
            {
                showTangents = ev.newValue;

                if (ev.newValue)
                {
                    tangentLengthField.style.display = DisplayStyle.Flex;
                    tangentWidthField.style.display = DisplayStyle.Flex;
                    tangentColorField.style.display = DisplayStyle.Flex;
                }
                else
                {
                    HideTangentGizmoSettings(tangentLengthField, tangentWidthField, tangentColorField);
                }
                SceneView.RepaintAll();
            });
            tangentLengthField.RegisterValueChangedCallback(ev =>
            {
                tangentLength = ev.newValue;
                SceneView.RepaintAll();
            });
            tangentWidthField.RegisterValueChangedCallback(ev =>
            {
                tangentWidth = ev.newValue;
                SceneView.RepaintAll();
            });
            tangentColorField.RegisterValueChangedCallback(ev =>
            {
                tangentColor = ev.newValue;
                SceneView.RepaintAll();
            });
        }

        private void HideTangentGizmoSettings(FloatField tangentLengthField, FloatField tangentWidthField, ColorField tangentColorField)
        {
            tangentLengthField.style.display = DisplayStyle.None;
            tangentWidthField.style.display = DisplayStyle.None;
            tangentColorField.style.display = DisplayStyle.None;
        }

        private void NormalsGizmoSettings(VisualElement container)
        {
            var showNormalsField = container.Q<Toggle>("showNormals");
            var normalsLengthField = container.Q<FloatField>("normalLength");
            var normalsWidthField = container.Q<FloatField>("normalWidth");
            var normalsColorField = container.Q<ColorField>("normalColor");

            if (!showNormalsField.value) HideNormalsGizmoSettings(normalsLengthField, normalsWidthField, normalsColorField);

            showNormalsField.RegisterValueChangedCallback(ev =>
            {
                showNormals = ev.newValue;

                if (ev.newValue)
                {
                    normalsLengthField.style.display = DisplayStyle.Flex;
                    normalsWidthField.style.display = DisplayStyle.Flex;
                    normalsColorField.style.display = DisplayStyle.Flex;
                }
                else
                {
                    HideNormalsGizmoSettings(normalsLengthField, normalsWidthField, normalsColorField);
                }
                SceneView.RepaintAll();
            });
            normalsLengthField.RegisterValueChangedCallback(ev =>
            {
                normalLength = ev.newValue;
                SceneView.RepaintAll();
            });
            normalsWidthField.RegisterValueChangedCallback(ev =>
            {
                normalWidth = ev.newValue;
                SceneView.RepaintAll();
            });
            normalsColorField.RegisterValueChangedCallback(ev =>
            {
                normalColor = ev.newValue;
                SceneView.RepaintAll();
            });
        }

        private void HideNormalsGizmoSettings(FloatField normalsLengthField, FloatField normalsWidthField, ColorField normalsColorField)
        {
            normalsLengthField.style.display = DisplayStyle.None;
            normalsWidthField.style.display = DisplayStyle.None;
            normalsColorField.style.display = DisplayStyle.None;
        }

        /// <summary>
        /// This can impact performance when there are many vertices in the mesh.
        /// Use this for debugging purposes and remove it or disable it
        /// </summary>

        private void OnSceneGUI()
        {
            if (sourceMeshFilter == null) return;

            Mesh mesh = sourceMeshFilter.sharedMesh;
            if (mesh == null) return;

            Transform transform = sourceMeshFilter.GetComponent<Transform>();

            Vector3[] vertices = mesh.vertices;

            if (showNormals || showTangents)
            {
                Vector3[] normals = mesh.normals;
                Vector4[] tangents = mesh.tangents;
                for (int i = 0; i < vertices.Length; i++)
                {
                    Vector3 worldVertex = transform.TransformPoint(vertices[i]);

                    if (showNormals)
                    {
                        Vector3 worldNormal = transform.TransformDirection(normals[i]);
                        Handles.color = normalColor;
                        Handles.DrawAAPolyLine(normalWidth, worldVertex, worldVertex + worldNormal * normalLength);
                    }

                    if (showTangents)
                    {
                        if (tangents.Length <= i)
                            continue;
                        Vector3 worldTangent = transform.TransformDirection(new Vector3(tangents[i].x, tangents[i].y, tangents[i].z));
                        Handles.color = tangentColor;
                        Handles.DrawAAPolyLine(tangentWidth, worldVertex, worldVertex + worldTangent * tangentLength);
                    }
                }
            }

            if (!showUV)
                return;

            int[] triangles = mesh.triangles;
            Vector2[] uvs = mesh.uv;
            Handles.color = uvSeamColor;
            for (int i = 0; i < triangles.Length; i += 3)
            {
                Vector2 uvA = uvs[triangles[i]];
                Vector2 uvB = uvs[triangles[i + 1]];
                Vector2 uvC = uvs[triangles[i + 2]];

                if (Vector2.Distance(uvA, uvB) > 0.5f || Vector2.Distance(uvB, uvC) > 0.5f || Vector2.Distance(uvC, uvA) > 0.5f)
                {
                    Vector3 worldVertexA = transform.TransformPoint(vertices[triangles[i]]);
                    Vector3 worldVertexB = transform.TransformPoint(vertices[triangles[i + 1]]);
                    Vector3 worldVertexC = transform.TransformPoint(vertices[triangles[i + 2]]);

                    Handles.DrawAAPolyLine(uvWidth, worldVertexA, worldVertexB);
                    Handles.DrawAAPolyLine(uvWidth, worldVertexB, worldVertexC);
                    Handles.DrawAAPolyLine(uvWidth, worldVertexC, worldVertexA);
                }
            }
        }

        #endregion Gizmo
    }
}