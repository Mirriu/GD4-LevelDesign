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
    public GameObject player_model;

    public float height;
    public float rotationSpeed;

    private void Start() 
    {
        instance = this;
        transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z );


        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        
    }

    private void Update() 
    {
        Rotate(Input.GetAxis("Mouse X") * rotationSpeed, Input.GetAxis("Mouse Y") * rotationSpeed);
        transform.position = new Vector3(transform.position.x, player.transform.position.y + height, transform.position.z);
    }
    void Rotate(float x, float y)
    {
        Vector3 temp = Quaternion.Euler(transform.localEulerAngles) * Vector3.right;
        transform.RotateAround(transform.position, temp, y * -0.2f);
        transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.up, x);
        player_model.transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.up, x);
        float clamp = transform.localEulerAngles.x < 180 ? Mathf.Clamp(transform.localRotation.eulerAngles.x, 0,30) : Mathf.Clamp(transform.localRotation.eulerAngles.x, 330,360);
        transform.localEulerAngles = new Vector3(clamp, transform.localEulerAngles.y, 0);
    }
    public static Quaternion GetCameraDirection()
    {
        return Quaternion.Euler(0, GetInstance().transform.rotation.eulerAngles.y, 0);
    }
}