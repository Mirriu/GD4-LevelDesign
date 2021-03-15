/*  
    © by Daniel Wipf, 09 November 2020
    support: daniel@twigly.ch
    https://www.youtube.com/watch?v=4nC8WjPFnGU
*/
#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;

using System.IO;
using System.Collections.Generic;

using DEShaders.Containers;

namespace DEShaders.Setup
{
    public class DE_PathManager : ScriptableObject
    {
        public string password;
        public DE_Publisher publisher;
        public List<MenuPaths> Paths = new List<MenuPaths>();
        public int Count
        {
            get
            {
                return Paths.Count;
            }
        }
        [MenuItem("Assets/DE Environment/Setup/Lock Path Files")]
        public static void LockFile()
        {
            EditorPrefs.DeleteKey(DE_EnvironmentPassword.DE_key);
            EditorPrefs.DeleteKey(DE_EnvironmentPassword.AE_key);
        }
    }
    public static class DE_EnvironmentPassword
    {
        public static string password = "DE_PATHMANAGER";
        public static string DE_key = "DE_MANAGER_KEY";
        public static string AE_key = "AE_MANAGER_KEY";
    }
    public static class MenuExtention
    {
        public static void LoadScene(this string name)
        {
            EditorSceneManager.OpenScene(name);
        }
        public static Object[] GetAssetsOfType(this System.Type type, string fileExtension)
        {
            List<Object> tempObjects = new List<Object>();
            DirectoryInfo directory = new DirectoryInfo(Application.dataPath);
            FileInfo[] goFileInfo = directory.GetFiles("*" + fileExtension, SearchOption.AllDirectories);

            int i = 0; int goFileInfoLength = goFileInfo.Length;
            FileInfo tempGoFileInfo; string tempFilePath;
            Object tempGO;
            for (; i < goFileInfoLength; i++)
            {
                tempGoFileInfo = goFileInfo[i];
                if (tempGoFileInfo == null)
                    continue;

                tempFilePath = tempGoFileInfo.FullName;
                tempFilePath = tempFilePath.Replace(@"\", "/").Replace(Application.dataPath, "Assets");

                Debug.Log(tempFilePath + "\n" + Application.dataPath);

                tempGO = AssetDatabase.LoadAssetAtPath(tempFilePath, typeof(Object)) as Object;
                if (tempGO == null)
                {
                    Debug.LogWarning("Skipping Null");
                    continue;
                }
                else if (tempGO.GetType() != type)
                {
                    Debug.LogWarning("Skipping " + tempGO.GetType().ToString());
                    continue;
                }

                tempObjects.Add(tempGO);
            }

            return tempObjects.ToArray();
        }
    }

}
#endif
