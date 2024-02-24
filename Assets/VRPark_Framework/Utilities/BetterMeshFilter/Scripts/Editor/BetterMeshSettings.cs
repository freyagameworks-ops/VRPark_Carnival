using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace TinyGiantStudio.BetterInspector
{
    [FilePath("ProjectSettings/BetterMeshSettings.asset", FilePathAttribute.Location.ProjectFolder)]
    public class BetterMeshSettings : ScriptableSingleton<BetterMeshSettings>
    {
        [SerializeField] Theme _theme = Theme.Dark;
        public Theme Theme
        {
            get { return _theme; }
            set 
            {
                _theme = value; 
                Save(true);
            }
        }

        [SerializeField] int _selectedUnit = 0;
        public int SelectedUnit
        {
            get { return _selectedUnit; }
            set
            {
                _selectedUnit = value;
                Save(true);
            }
        }

        [SerializeField] bool _doNotApplyActionToAssetPref = true;
        public bool DoNotApplyActionToAssetPref
        {
            get { return _doNotApplyActionToAssetPref; }
            set
            {
                _doNotApplyActionToAssetPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _autoHideSettingsPref = true;
        public bool AutoHideSettingsPref
        {
            get { return _autoHideSettingsPref; }
            set
            {
                _autoHideSettingsPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showMeshPreviewPref = true;
        public bool ShowMeshPreviewPref
        {
            get { return _showMeshPreviewPref; }
            set
            {
                _showMeshPreviewPref = value;
                Save(true);
            }
        }

        [SerializeField] float _meshPreviewHeightPref = 120;
        public float MeshPreviewHeightPref
        {
            get { return _meshPreviewHeightPref; }
            set
            {
                _meshPreviewHeightPref = value;
                Save(true);
            }
        }

        [SerializeField] string _editorColorPref = "3F3F3F";
        public string EditorColorPref
        {
            get { return _editorColorPref; }
            set
            {
                _editorColorPref = value;
                Save(true);
            }
        }


        [SerializeField] bool _showInformationFoldoutPref = true;
        public bool ShowInformationFoldoutPref
        {
            get { return _showInformationFoldoutPref; }
            set
            {
                _showInformationFoldoutPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showVertexInformationPref = true;
        public bool ShowVertexInformationPref
        {
            get { return _showVertexInformationPref; }
            set
            {
                _showVertexInformationPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showTriangleInformationPref = true;
        public bool ShowTriangleInformationPref
        {
            get { return _showTriangleInformationPref; }
            set
            {
                _showTriangleInformationPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showEdgeInformationPref = false;
        public bool ShowEdgeInformationPref
        {
            get { return _showEdgeInformationPref; }
            set
            {
                _showEdgeInformationPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showFaceInformationPref = true;
        public bool ShowFaceInformationPref
        {
            get { return _showFaceInformationPref; }
            set
            {
                _showFaceInformationPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showTangentInformationPref = true;
        public bool ShowTangentInformationPref
        {
            get { return _showTangentInformationPref; }
            set
            {
                _showTangentInformationPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showSizeFoldoutPref = true;
        public bool ShowSizeFoldoutPref
        {
            get { return _showSizeFoldoutPref; }
            set
            {
                _showSizeFoldoutPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showAssetLocationPref = true;
        public bool ShowAssetLocationPref
        {
            get { return _showAssetLocationPref; }
            set
            {
                _showAssetLocationPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showDebugGizmoFoldoutPref = true;
        public bool ShowDebugGizmoFoldoutPref
        {
            get { return _showDebugGizmoFoldoutPref; }
            set
            {
                _showDebugGizmoFoldoutPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showActionsFoldoutPref = true;
        public bool ShowActionsFoldoutPref
        {
            get { return _showActionsFoldoutPref; }
            set
            {
                _showActionsFoldoutPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showImportSettingsPref = true;
        public bool ShowImportSettingsPref
        {
            get { return _showImportSettingsPref; }
            set
            {
                _showImportSettingsPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showOptimizeButtonPref = true;
        public bool ShowOptimizeButtonPref
        {
            get { return _showOptimizeButtonPref; }
            set
            {
                _showOptimizeButtonPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showRecalculateNormalsButtonPref = true;
        public bool ShowRecalculateNormalsButtonPref
        {
            get { return _showRecalculateNormalsButtonPref; }
            set
            {
                _showRecalculateNormalsButtonPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showRecalculateTangentsButtonPref = false;
        public bool ShowRecalculateTangentsButtonPref
        {
            get { return _showRecalculateTangentsButtonPref; }
            set
            {
                _showRecalculateTangentsButtonPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showFlipNormalsButtonPref = true;
        public bool ShowFlipNormalsButtonPref
        {
            get { return _showFlipNormalsButtonPref; }
            set
            {
                _showFlipNormalsButtonPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showGenerateSecondaryUVButtonPref = false;
        public bool ShowGenerateSecondaryUVButtonPref
        {
            get { return _showGenerateSecondaryUVButtonPref; }
            set
            {
                _showGenerateSecondaryUVButtonPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showSaveMeshAsButtonPref = true;
        public bool ShowSaveMeshAsButtonPref
        {
            get { return _showSaveMeshAsButtonPref; }
            set
            {
                _showSaveMeshAsButtonPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _showLoadMeshButtonPref = true;
        public bool ShowLoadMeshButtonPref
        {
            get { return _showLoadMeshButtonPref; }
            set
            {
                _showLoadMeshButtonPref = value;
                Save(true);
            }
        }

        [SerializeField] bool _autoCloseImporterIfInvalidMeshPref = true;
        public bool AutoCloseImporterIfInvalidMeshPref
        {
            get { return _autoCloseImporterIfInvalidMeshPref; }
            set
            {
                _autoCloseImporterIfInvalidMeshPref = value;
                Save(true);
            }
        }
    }
}