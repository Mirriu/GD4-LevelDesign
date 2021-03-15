using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class Flicker : MonoBehaviour
{
    public int flickerFrequency;
    int flickerTimer;

    float nextIntensity;
    float meanIntensity;

    public float intensityVariation;
    public float speed;
    Light light;

    private void Start() 
    {
        flickerTimer = 0;
        light = GetComponent<Light>();
        nextIntensity = light.intensity;
        meanIntensity = light.intensity;
    }

    private void Update() 
    {
        light.intensity = Mathf.Lerp(light.intensity, nextIntensity, speed);
    }
    private void FixedUpdate() 
    {
        flickerTimer++;
        if(flickerTimer >= flickerFrequency)
        {
            nextIntensity = Random.Range(meanIntensity - intensityVariation, meanIntensity + intensityVariation);
            flickerTimer = 0;
        }
    }
}
