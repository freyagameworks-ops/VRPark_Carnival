#if UNITY_EDITOR
using UnityEditor;

namespace TinyGiantStudio.BetterInspector
{
    public static class ScaleSettings
    {
        private static int totalUnitCount;

        public static string[] GetAvailableUnits()
        {
            int total = GetTotalUnitCount();
            string[] availableUnits = new string[total];
            for (int i = 0; i < availableUnits.Length; i++)
            {
                availableUnits[i] = EditorPrefs.GetString(i + " unitName");
            }
            return availableUnits;
        }


        public static int GetTotalUnitCount()
        {
            totalUnitCount = 0;
            for (int i = 0; i < 100; i++)
            {
                if (EditorPrefs.GetBool(i + " unitExists"))
                    totalUnitCount = i;
                else
                    break;
            }
            return totalUnitCount;
        }

        public static float CurrentUnitValue(int index) => EditorPrefs.GetFloat(index + " unitValue");

        public static void ResetSavedUnits()
        {
            EditorPrefs.SetInt("TGS_betterMesh_selectedUnitIndex", 0);

            for (int i = 11; i < 100; i++)
            {
                EditorPrefs.SetString(i + " unitName", string.Empty);
                EditorPrefs.SetFloat(i + " unitValue", 0);
                EditorPrefs.SetBool(i + " unitExists", false);
            }

            EditorPrefs.SetString(0 + " unitName", "Meter");
            EditorPrefs.SetFloat(0 + " unitValue", 1);
            EditorPrefs.SetBool(0 + " unitExists", true);

            EditorPrefs.SetString(1 + " unitName", "Kilometer");
            EditorPrefs.SetFloat(1 + " unitValue", 0.001f);
            EditorPrefs.SetBool(1 + " unitExists", true);

            EditorPrefs.SetString(2 + " unitName", "Centimeter");
            EditorPrefs.SetFloat(2 + " unitValue", 100);
            EditorPrefs.SetBool(2 + " unitExists", true);

            EditorPrefs.SetString(3 + " unitName", "Millimetre");
            EditorPrefs.SetFloat(3 + " unitValue", 1000);
            EditorPrefs.SetBool(3 + " unitExists", true);

            EditorPrefs.SetString(4 + " unitName", "Feet");
            EditorPrefs.SetFloat(4 + " unitValue", 3.28084f);
            EditorPrefs.SetBool(4 + " unitExists", true);

            EditorPrefs.SetString(5 + " unitName", "Inch");
            EditorPrefs.SetFloat(5 + " unitValue", 39.3701f);
            EditorPrefs.SetBool(5 + " unitExists", true);

            EditorPrefs.SetString(6 + " unitName", "Yards");
            EditorPrefs.SetFloat(6 + " unitValue", 1.09f);
            EditorPrefs.SetBool(6 + " unitExists", true);

            EditorPrefs.SetString(7 + " unitName", "Miles");
            EditorPrefs.SetFloat(7 + " unitValue", 0.00062f);
            EditorPrefs.SetBool(7 + " unitExists", true);

            EditorPrefs.SetString(8 + " unitName", "NauticalMile");
            EditorPrefs.SetFloat(8 + " unitValue", 0.000539957f);
            EditorPrefs.SetBool(8 + " unitExists", true);

            EditorPrefs.SetString(9 + " unitName", "Banana");
            EditorPrefs.SetFloat(9 + " unitValue", 5.618f);
            EditorPrefs.SetBool(9 + " unitExists", true);
        }
    }
}
#endif