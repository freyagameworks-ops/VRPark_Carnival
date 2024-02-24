using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace TinyGiantStudio.BetterInspector
{
    public static class ScaleSettingsProvider
    {
        private static int totalUnitCount;
        private static string[] unitNames;
        private static float[] unitValues;

        [SettingsProvider]
        private static SettingsProvider CreateScaleSettingsProvider()
        {
            totalUnitCount = ScaleSettings.GetTotalUnitCount();
            if (totalUnitCount == 0)
            {
                ScaleSettings.ResetSavedUnits();
                ScaleSettings.GetTotalUnitCount();
            }

            GetUnitArray();

            SettingsProvider provider = new SettingsProvider("Project/Tiny Giant Studio/Scale Settings", SettingsScope.Project)
            {
                label = "Scale Settings",
                guiHandler = (searchContext) =>
                {
                    EditorGUI.BeginChangeCheck();

                    GUILayout.BeginVertical(EditorStyles.helpBox, GUILayout.MaxWidth(500)); //full custom unit settings

                    GUILayout.BeginHorizontal(EditorStyles.toolbar);
                    EditorGUILayout.LabelField("Name", EditorStyles.miniLabel, GUILayout.MaxWidth(300));
                    EditorGUILayout.LabelField("Value", EditorStyles.miniLabel, GUILayout.MaxWidth(150));
                    GUILayout.EndHorizontal();

                    for (int i = 0; i < totalUnitCount; i++)
                    {
                        GUILayout.BeginHorizontal();
                        string newName = EditorGUILayout.TextField(unitNames[i], GUILayout.MaxWidth(300));
                        if (newName != unitNames[i])
                        {
                            unitNames[i] = newName;
                            EditorPrefs.SetString(i + " unitName", newName);
                        }

                        float newValue = EditorGUILayout.FloatField(unitValues[i], GUILayout.MaxWidth(150));
                        if (newValue != unitValues[i])
                        {
                            EditorPrefs.SetFloat(i + " unitValue", newValue);
                            GetUnitArray();
                        }

                        if (GUILayout.Button("Remove", GUILayout.MaxWidth(70)))
                        {
                            for (int j = i; j <= totalUnitCount; j++)
                            {
                                EditorPrefs.SetBool(j + " unitExists", EditorPrefs.GetBool((j + 1) + " unitExists"));
                                EditorPrefs.SetString(j + " unitName", EditorPrefs.GetString((j + 1) + " unitName"));
                                EditorPrefs.SetFloat(j + " unitValue", EditorPrefs.GetFloat((j + 1) + " unitValue"));
                            }
                            EditorPrefs.SetBool(totalUnitCount + " unitExists", false);
                            ScaleSettings.GetTotalUnitCount();
                            GetUnitArray();
                        }

                        GUILayout.EndHorizontal();
                    }
                    if (GUILayout.Button("Add new Unit", GUILayout.MaxWidth(500), GUILayout.Height(30)))
                    {
                        totalUnitCount++;
                        EditorPrefs.SetBool(totalUnitCount + " unitExists", true);

                        ScaleSettings.GetTotalUnitCount();
                        GetUnitArray();
                    }
                    GUILayout.Space(30);

                    GUILayout.Space(10);
                    if (GUILayout.Button("Reset to default"))
                    {
                        if (EditorUtility.DisplayDialog("Restore default unit values?", "Are you sure you want to restore default values? This will overwrite all changes to the units.", "Yes", "No"))
                        {
                            ScaleSettings.ResetSavedUnits();
                            ScaleSettings.GetTotalUnitCount();
                            GetUnitArray();
                        }
                    }
                    GUILayout.EndVertical();

                    if (EditorGUI.EndChangeCheck())
                    {
                    }
                },

                keywords = new HashSet<string>(new[] { "Scale", "Settings" })
            };

            return provider;
        }

        private static void GetUnitArray()
        {
            unitNames = new string[totalUnitCount];
            unitValues = new float[totalUnitCount];
            for (int i = 0; i < unitNames.Length; i++)
            {
                unitNames[i] = EditorPrefs.GetString(i + " unitName");
                unitValues[i] = EditorPrefs.GetFloat(i + " unitValue");
            }
        }
    }
}