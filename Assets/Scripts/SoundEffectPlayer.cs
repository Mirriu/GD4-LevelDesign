using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundEffectPlayer : MonoBehaviour
{
    public static void PlaySound(AudioClip clip, float volume = 1f, Transform t = null)
    {
        var audio = new GameObject("sfx", typeof(AudioSource)).GetComponent<AudioSource>();
        audio.transform.position = t == null ? Vector3.zero : t.position;
        audio.clip = clip;
        audio.Play();
        Destroy(audio.gameObject, clip.length);
    }
}
