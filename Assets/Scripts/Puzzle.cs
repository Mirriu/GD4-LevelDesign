using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle : MonoBehaviour
{
    [SerializeField]Interactable doorKey;
    [SerializeField]Interactable door;
    [SerializeField]List<Interactable> generatorKeys;
    [SerializeField]Interactable generator;

    private void Update() 
    {
        if(door.amountOfNeededKeys <= 0)
        {
            for(int i = 0; i < generatorKeys.Count; i++)
            {
                generatorKeys[i].interactable = true;
            }
            generator.interactable = true;
        }
    }
}