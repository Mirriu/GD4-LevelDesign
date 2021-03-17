using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class Puzzle : MonoBehaviour
{
    [SerializeField]Interactable doorKey;
    [SerializeField]Interactable door;
    [SerializeField]List<Interactable> generatorKeys;
    [SerializeField]Interactable generator;
    [SerializeField]Interactable door_2;

    [SerializeField]Volume volume;

    ColorAdjustments colorAdjustment;

    [SerializeField]PlayerController Player;

    private void Start() 
    {
        ColorAdjustments cA;
        if(volume.profile.TryGet<ColorAdjustments>(out cA))
        {
            colorAdjustment = cA;
        }
    }
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
        if(generator.amountOfNeededKeys <= 0)
        {
            door_2.interactable = true;
        }
    }
    private void FixedUpdate() 
    {
        if(door_2.amountOfNeededKeys <= 0)
        {
            Player.enabled = false;
            colorAdjustment.colorFilter.Interp(colorAdjustment.colorFilter.value, Color.black, 0.02f);
        }
    }
}