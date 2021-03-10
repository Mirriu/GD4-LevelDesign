/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

using System.IO;

using DEShaders.Utils;
using DEShaders.Containers;
using DEShaders.Setup;

using System.Linq;

[CustomEditor(typeof(DE_PathManager))]
public class DE_ShadersMenuPathInspector : Editor
{
    private string version
    {
        get
        {
            return DEShaders.SchematicVersionControl.VERSION;
        }
    }
    private DE_PathManager menuPath;
    Vector2 scrollView = Vector2.zero;
    private Texture2D logo;

    private SerializedProperty paths;
    private SerializedProperty password;

    private GUILayoutOption ButtonWidth, ButtonHeight, LabelWidth;
    private readonly int size = 20;
    private void OnEnable()
    {
        ButtonWidth = GUILayout.Width(size);
        ButtonHeight = GUILayout.Height(size);
        LabelWidth = GUILayout.Width(size * 7);

        serializedObject.Update();
        paths = serializedObject.FindProperty("Paths");
        password = serializedObject.FindProperty("password");
        logo = GetIcon();
        menuPath = (DE_PathManager)target;

        if(menuPath.publisher == DE_Publisher.DE_Environment)
        {
            if (!EditorPrefs.HasKey(DE_EnvironmentPassword.DE_key))
            {
                password.stringValue = "";
                serializedObject.ApplyModifiedProperties();
            }
        }
        if (menuPath.publisher == DE_Publisher.AlexanderElert)
        {
            if (!EditorPrefs.HasKey(DE_EnvironmentPassword.AE_key))
            {
                password.stringValue = "";
                serializedObject.ApplyModifiedProperties();
            }
        }
    }
    public override void OnInspectorGUI()
    {
        GeneralGUI();
        var key = DE_EnvironmentPassword.DE_key;

        if (menuPath.publisher == DE_Publisher.AlexanderElert)
            key = DE_EnvironmentPassword.AE_key;

            if (!EditorPrefs.HasKey(key))
        {
            password.stringValue = EditorGUILayout.PasswordField("Password:", password.stringValue);
            serializedObject.ApplyModifiedProperties();
            
            if(password.stringValue == DE_EnvironmentPassword.password)
            {
                EditorPrefs.SetString(key, password.stringValue);
            }
            
        }
        EditorGUI.BeginDisabledGroup(!EditorPrefs.HasKey(key));
        try
        {
            PackageSettingsGUI();
            SetupGUI();
        }
        catch
        { 

        }
        EditorGUI.EndDisabledGroup();
    }
    private void GeneralGUI()
    {
        var size = 100;
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField(new GUIContent(logo), GUILayout.Width(size), GUILayout.Height(size));
        EditorGUILayout.LabelField(("Path Setup " + version), EditorStyles.boldLabel);
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.Space();
        
    }
    
    private void PackageSettingsGUI()
    {
        EditorGUILayout.LabelField("Package Installer", EditorStyles.miniBoldLabel);
        if(GUILayout.Button("Add new Package"))
        {
            menuPath.Paths.Add(new MenuPaths());
            if (Event.current == null)
                GUIUtility.ExitGUI();
        }
    }
    private void SetupGUI()
    {
        
        scrollView = EditorGUILayout.BeginScrollView(scrollView, GUIStyle.none, GUIStyle.none);

        for (int i = 0; i < paths.arraySize; i++)
        {
            var path = paths.GetArrayElementAtIndex(i);
            var pname = path.FindPropertyRelative("name");
            var pipeline = path.FindPropertyRelative("renderPipeline");

            var package = path.FindPropertyRelative("packagePaths");

            var scenes2018 = path.FindPropertyRelative("scenePaths2018");
            var names2018 = path.FindPropertyRelative("names2018");
            var scenes2019 = path.FindPropertyRelative("scenePaths2019");
            var names2019 = path.FindPropertyRelative("names2019");

            var p = menuPath.Paths[i];

            EditorGUILayout.BeginVertical("box");

            PackageGUI(i, pname, pipeline, package, p);
            Unity2018ScenesGUI(scenes2018, names2018, package, p);
            Unity2019ScenesGUI(scenes2019, names2019, package, p);
            
            EditorGUILayout.EndVertical();

            EditorGUILayout.Space();
        }
        serializedObject.ApplyModifiedProperties();
        serializedObject.Update();
        menuPath.Paths = menuPath.Paths.OrderBy(x => x.renderPipeline).ToList();

        EditorGUILayout.EndScrollView();
    }
    /// <summary>
    /// Package and Package Paths GUI
    /// </summary>
    /// <param name="i">Current path</param>
    /// <param name="PackageName">Package Name</param>
    /// <param name="SRPType">Type of SRP</param>
    /// <param name="Package">All Packages</param>
    /// <param name="currentMenu">Current Menu Path</param>
    public void PackageGUI(int i, SerializedProperty PackageName, SerializedProperty SRPType, SerializedProperty Package, MenuPaths currentMenu)
    {
        EditorGUILayout.BeginHorizontal();

        if (GUILayout.Button(new GUIContent("-", "Remove package"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
        {
            paths.DeleteArrayElementAtIndex(i);
            return;
        }

        if (i > 0)
            if (GUILayout.Button(new GUIContent("↑", "Move Up"), ButtonWidth, ButtonHeight))
                menuPath.Paths.Move(i, Mathf.Clamp(i - 1, 0, paths.arraySize));
        if (i < paths.arraySize - 1)
            if (GUILayout.Button(new GUIContent("↓", "Move Down"), ButtonWidth, ButtonHeight))
                menuPath.Paths.Move(i, Mathf.Clamp(i + 1, 0, paths.arraySize));

        EditorGUILayout.PropertyField(PackageName, new GUIContent("Package Name"));
        EditorGUILayout.PropertyField(SRPType, GUIContent.none, GUILayout.Width(80));

        EditorGUILayout.EndHorizontal();

        EditorGUILayout.Space();

        EditorGUILayout.BeginHorizontal();

        EditorGUILayout.LabelField("Unity Package Paths", EditorStyles.miniBoldLabel);
        if (GUILayout.Button(new GUIContent("+", "Add"), ButtonAddGUI(), ButtonWidth, ButtonHeight))
            currentMenu.packagePaths.Add("");

        EditorGUILayout.EndHorizontal();

        for (int j = 0; j < Package.arraySize; j++)
        {
            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.LabelField(new GUIContent("Package Path " + j + ":", Package.GetArrayElementAtIndex(j).stringValue), EditorStyles.miniLabel, LabelWidth);
            EditorGUILayout.PropertyField(Package.GetArrayElementAtIndex(j), GUIContent.none);
            if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
                currentMenu.packagePaths.Remove(currentMenu.packagePaths[j]);
            if (j > 0)
                if (GUILayout.Button(new GUIContent("↑", "Move Up"), ButtonWidth, ButtonHeight))
                    currentMenu.packagePaths.Move(j, Mathf.Clamp(j - 1, 0, Package.arraySize));
            if (j < Package.arraySize - 1)
                if (GUILayout.Button(new GUIContent("↓", "Move Down"), ButtonWidth, ButtonHeight))
                    currentMenu.packagePaths.Move(j, Mathf.Clamp(j + 1, 0, Package.arraySize));

            EditorGUILayout.EndHorizontal();
        }

    }
    /// <summary>
    /// All 2018 Scenes
    /// </summary>
    /// <param name="Scenes2018">2018 Scenes</param>
    /// <param name="SceneNames2018">2018 Scene Names</param>
    /// <param name="Package">All Packagrs</param>
    /// <param name="currentMenu">curent Menu Path</param>
    public void Unity2018ScenesGUI(SerializedProperty Scenes2018, SerializedProperty SceneNames2018, SerializedProperty Package, MenuPaths currentMenu)
    {
        EditorGUILayout.BeginHorizontal();

        EditorGUILayout.LabelField("Unity 2018 Scenes", EditorStyles.miniBoldLabel);
        if (GUILayout.Button(new GUIContent("+", "Add"), ButtonAddGUI(), ButtonWidth, ButtonHeight))
        {
            currentMenu.scenePaths2018.Add("");
            currentMenu.names2018.Add("");
        }

        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();

        EditorGUILayout.LabelField(new GUIContent("Scene Name"), EditorStyles.miniLabel, LabelWidth);
        EditorGUILayout.LabelField(new GUIContent("Scene Path"), EditorStyles.miniLabel, LabelWidth);
        GUILayout.Space(size);

        EditorGUILayout.EndHorizontal();

        for (int j = 0; j < Scenes2018.arraySize; j++)
        {
            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.PropertyField(SceneNames2018.GetArrayElementAtIndex(j), GUIContent.none, LabelWidth);
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(Scenes2018.GetArrayElementAtIndex(j), new GUIContent("", Scenes2018.GetArrayElementAtIndex(j).stringValue));
            if (EditorGUI.EndChangeCheck())
            {
                SceneNames2018.GetArrayElementAtIndex(j).stringValue = Path.GetFileNameWithoutExtension(Scenes2018.GetArrayElementAtIndex(j).stringValue).AddSpacesToSentence();
            }
            if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
            {
                currentMenu.scenePaths2018.Remove(currentMenu.scenePaths2018[j]);
                currentMenu.names2018.Remove(currentMenu.names2018[j]);
            }
            if (j > 0)
                if (GUILayout.Button(new GUIContent("↑", "Move Up"), ButtonWidth, ButtonHeight))
                {
                    currentMenu.scenePaths2018.Move(j, Mathf.Clamp(j - 1, 0, Scenes2018.arraySize));
                    currentMenu.names2018.Move(j, Mathf.Clamp(j - 1, 0, Scenes2018.arraySize));
                }
            if (j < Package.arraySize - 1)
                if (GUILayout.Button(new GUIContent("↓", "Move Down"), ButtonWidth, ButtonHeight))
                {
                    currentMenu.scenePaths2018.Move(j, Mathf.Clamp(j + 1, 0, Scenes2018.arraySize));
                    currentMenu.names2018.Move(j, Mathf.Clamp(j + 1, 0, Scenes2018.arraySize));
                }

            EditorGUILayout.EndHorizontal();
        }

        EditorGUILayout.BeginHorizontal();
    }
    /// <summary>
    /// All 2019+ Scenes
    /// </summary>
    /// <param name="Scenes2019">2019+ Scenes</param>
    /// <param name="SceneNames2019">2019+ Scene Names</param>
    /// <param name="Package">All Packagrs</param>
    /// <param name="currentMenu">curent Menu Path</param>
    public void Unity2019ScenesGUI(SerializedProperty Scenes2019, SerializedProperty SceneNames2019, SerializedProperty Package, MenuPaths currentMenu)
    {
        EditorGUILayout.LabelField("Unity 2019 and newer Scenes", EditorStyles.miniBoldLabel);
        if (GUILayout.Button(new GUIContent("+", "Add"), ButtonAddGUI(), ButtonWidth, ButtonHeight))
        {
            currentMenu.scenePaths2019.Add("");
            currentMenu.names2019.Add("");
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.BeginHorizontal();

        EditorGUILayout.LabelField(new GUIContent("Scene Name"), EditorStyles.miniLabel, LabelWidth);
        EditorGUILayout.LabelField(new GUIContent("Scene Path"), EditorStyles.miniLabel, LabelWidth);
        GUILayout.Space(size);

        EditorGUILayout.EndHorizontal();

        for (int j = 0; j < Scenes2019.arraySize; j++)
        {
            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.PropertyField(SceneNames2019.GetArrayElementAtIndex(j), GUIContent.none, LabelWidth);
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(Scenes2019.GetArrayElementAtIndex(j), new GUIContent("", Scenes2019.GetArrayElementAtIndex(j).stringValue));
            if (EditorGUI.EndChangeCheck())
            {
                SceneNames2019.GetArrayElementAtIndex(j).stringValue = Path.GetFileNameWithoutExtension(Scenes2019.GetArrayElementAtIndex(j).stringValue).AddSpacesToSentence();
            }
            if (GUILayout.Button(new GUIContent("-", "Remove"), ButtonRemoveGUI(), ButtonWidth, ButtonHeight))
            {
                currentMenu.scenePaths2019.Remove(currentMenu.scenePaths2019[j]);
                currentMenu.names2019.Remove(currentMenu.names2019[j]);
            }
            if (j > 0)
                if (GUILayout.Button(new GUIContent("↑", "Move Up"), ButtonWidth, ButtonHeight))
                {
                    currentMenu.scenePaths2019.Move(j, Mathf.Clamp(j - 1, 0, Scenes2019.arraySize));
                    currentMenu.names2019.Move(j, Mathf.Clamp(j - 1, 0, Scenes2019.arraySize));
                }
            if (j < Package.arraySize - 1)
                if (GUILayout.Button(new GUIContent("↓", "Move Down"), ButtonWidth, ButtonHeight))
                {
                    currentMenu.scenePaths2019.Move(j, Mathf.Clamp(j + 1, 0, Scenes2019.arraySize));
                    currentMenu.names2019.Move(j, Mathf.Clamp(j + 1, 0, Scenes2019.arraySize));
                }

            EditorGUILayout.EndHorizontal();
        }
    }
        
    /// <summary>
    /// DE Environment Logo
    /// </summary>
    /// <param name="logo">logo</param>
    /// <returns></returns>
    private Texture2D GetIcon()
    {
        string[] filePaths = System.IO.Directory.GetFiles(@Application.dataPath, "*.png", System.IO.SearchOption.AllDirectories);

        foreach (var f in filePaths)
        {
            if (!f.Contains(".meta"))
            {
                if (f.Contains("T_Emissive 04_E DE"))
                {
                    var dataPath = Application.dataPath.Remove(Application.dataPath.Length - 6);
                    return (Texture2D)AssetDatabase.LoadAssetAtPath(f.Replace(dataPath, ""), typeof(Texture2D));
                }
            }
        }
        return null;
    }
    private GUIStyle ButtonRemoveGUI()
    {
        var gs = new GUIStyle(GUI.skin.button);
        gs.alignment = TextAnchor.MiddleCenter;
        gs.fontStyle = FontStyle.Bold;
        gs.normal.textColor = Color.red;
        gs.fontSize = 16;
        return gs;
    }
    private GUIStyle ButtonAddGUI()
    {
        var gs = new GUIStyle(GUI.skin.button);
        gs.alignment = TextAnchor.MiddleCenter;
        gs.fontStyle = FontStyle.Bold;
        gs.normal.textColor = Color.green;
        gs.fontSize = 16;
        return gs;
    }
}
#endif