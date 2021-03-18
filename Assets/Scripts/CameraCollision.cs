using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraCollision : MonoBehaviour
{
    public float minDistance = 1.0f;
    public float maxDistance = 4.0f;
    public float smooth = 10.0f;
    Vector3 pattyDir;
    public Vector3 pattyDirAdjusted;
    public float distance;

    // Start is called before the first frame update
    void Awake()
    {
        distance = transform.localPosition.magnitude;
    }

    // Update is called once per frame
    void Update()
    {
        pattyDir = transform.localPosition.normalized;
        Vector3 desiredCameraPos = transform.parent.TransformPoint(pattyDir * maxDistance);
        RaycastHit hit;
        if (Physics.Linecast(transform.parent.position, desiredCameraPos, out hit))
        {
            distance = Mathf.Clamp((hit.distance * 0.9f), minDistance, maxDistance);

        }
        else
        {
            distance = maxDistance;
        }
        //if(Physics.Raycast(transform.position, -transform.forward, maxDistance))
        transform.localPosition = Vector3.Lerp(transform.localPosition, pattyDir * distance, Time.deltaTime * smooth);
    }
}
