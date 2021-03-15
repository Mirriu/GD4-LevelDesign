﻿namespace AlexanderElert
{
    public static class SchematicVersionControl
    {
        public static readonly string VERSION = "1.2.1";
        public static readonly string LASTMODIFIED = "12.16.2020";
        public static readonly string CHANGELOG =
            "1.0.0 - 12.01.2020\n" +
            "- Initial release\n" +

            "1.1.0 - 12.01.2020\n" +
            "- Fixed Build Errors\n" +

            "1.1.1 - 12.01.2020\n" +
            "- Created Version Control\n" +

            "1.1.2 - 12.01.2020\n" +
            "- Created new cs for Version Control\n" +
            "- Created MenuItem => \"Window/Alexander Elert/Show Script Changelog\"\n" +
            
            "1.1.3 - 12.01.2020\n" +
            "- Moved AE Version Control\n" +
            "- Renamed MenuItem\n" +
            
            "1.1.9 - 12.16.2020\n" +
            "- AE Manager: Initialized\n" +

            "1.2.0 - 12.16.2020\n" +
            "- AE Manager: CTRL + SHIFT + i => selection changes to DE Environment Path.asset\n" +
            "- AE Manager: Checked 2020.2 compability => OK\n" +

            "1.2.1 - 12.16.2020\n" +
            "- Fixed DE PathManager creation process\n" +
            "- Removed DE Environment related description\n" +
            "- Fixed AE Simplifier not showing up in GameObjects\n";

#if UNITY_EDITOR
        [UnityEditor.MenuItem("Window/Alexander Elert/Show Script Version Control")]
        public static void ShowChangelog()
        {
            UnityEditor.EditorUtility.DisplayDialog(
                "Alexander Elert Script Version Control",
                "Current Version: " + VERSION + "\n\n" +
                "Last Modified: " + LASTMODIFIED + "\n\n" +
                "Changelog:\n" + CHANGELOG,
                "ok"
                );
        }
#endif
    }
}