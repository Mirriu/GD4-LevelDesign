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
    public int rotationSpeed;

    private void Start() 
    {
        instance = this;
        transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z );


        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        
    }

    private void Update() 
    {
        //if(Input.GetKey(KeyCode.LeftArrow))
        
        {
           Rotate(Input.GetAxis("Mouse X") * rotationSpeed, Input.GetAxis("Mouse Y") * rotationSpeed);
           


            //    Rotate(rotationSpeed);
            //    rotationSideways+= rotationSpeed;
            //}
            //else if(Input.GetKey(KeyCode.RightArrow))
            //{
            //    Rotate(-rotationSpeed);
            //    rotationSideways-= rotationSpeed;
        }
        transform.position = new Vector3(transform.position.x, player.transform.position.y + height, transform.position.z);
    }
    void Rotate(float x, float y)
    {

        y = Mathf.Clamp(y,-90f, 90f);

        //transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.up, x);
        transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.right, y);
        player_model.transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.up, x);


        

        //transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.up, speed);
        //player_model.transform.RotateAround(new Vector3(player.transform.position.x, 0, player.transform.position.z), Vector3.up, speed);
    }
    public static Quaternion GetCameraDirection()
    {
        return Quaternion.Euler(0, GetInstance().transform.rotation.eulerAngles.y, 0);
    }
}