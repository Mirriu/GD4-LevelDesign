using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour
{
    public string name;
    public bool pickup;

    public int amountOfNeededKeys;

    public bool interactable;
    public bool endState;

    public Light l;

    [SerializeField] private AudioClip soundEffect;
    private Animator animator;

    private void Start()
    {
        animator = GetComponent<Animator>();
        if(animator != null) animator.enabled = false;
        if(l == null)
        {
            l = GetComponent<Light>();
        }
        l.enabled = interactable;
    }

    public void UseKey(ref Interactable interactable, ref int key)
    {
        if(endState)
        {
            amountOfNeededKeys--;
            return;
        }
        if(!pickup && key > 0)
        {
            key--;
            amountOfNeededKeys--;
            if(amountOfNeededKeys <= 0)
            {
                //gameObject.SetActive(false);
                interactable = null;
            }
        }
        else
        {
            key++;
            gameObject.SetActive(false);
            interactable = null;
        }
        if(soundEffect != null)
        {
            SoundEffectPlayer.PlaySound(soundEffect, 1f, transform);
        }
        if(animator != null)
        {
            animator.enabled = true;
            var col = GetComponent<Collider>();
            if (col != null) col.enabled = false; 
        }
        else
        {
            gameObject.SetActive(false);
        }
    }
}

