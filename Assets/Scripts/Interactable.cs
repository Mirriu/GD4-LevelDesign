using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour
{
    public string name;
    public bool pickup;

    public int amountOfNeededKeys;

    public bool interactable;

    public void UseKey(ref Interactable interactable, ref int key)
    {
        if(!pickup && key > 0)
        {
            key--;
            amountOfNeededKeys--;
            if(amountOfNeededKeys <= 0)
            {
                gameObject.SetActive(false);
                interactable = null;
            }
        }
        else
        {
            key++;
            gameObject.SetActive(false);
            interactable = null;
        }
    }
}
