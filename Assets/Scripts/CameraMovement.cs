using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMovement : MonoBehaviour
{
    static CameraMovement instance;
    static CameraMovement GetInstance()
    {
        return instance;
    }
    public GameObject player;

    public float height;
    public float rotationSideways;
    public int rotationSpeed;

    private void Start() 
    {
        instance = this;
        transform.position = new Vector3(transform.position.x, transform.position.y, player.transform.position.z - 6);
    }

    private void Update() 
    {
        if(Input.GetKey(KeyCode.LeftArrow))
        {
            Rotate(rotationSpeed);
            rotationSideways+= rotationSpeed;
        }
        else if(Input.GetKey(KeyCode.RightArrow))
        {
            Rotate(-rotationSpeed);
            rotationSideways-= rotationSpeed;
        }
        transform.position = new Vector3(transform.position.x, player.transform.position.y + height, transform.position.z);
    }
    void Rotate(float speed)
    {
        transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.up, speed);
    }
    public static Quaternion GetCameraDirection()
    {
        return Quaternion.Euler(0, GetInstance().transform.rotation.eulerAngles.y, 0);
    }
}