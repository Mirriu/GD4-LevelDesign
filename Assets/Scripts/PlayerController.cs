using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    new Rigidbody rigidbody;
    public Vector2 movementDirection;
    public int speed;
    public float maxSpeed;

    public bool moving;

    private void Start() 
    {
        movementDirection = Vector2.zero;
        rigidbody = GetComponent<Rigidbody>();
        moving = false;
    }
    private void Update() 
    {
        if(Input.GetKey(KeyCode.W))
        {
            movementDirection.y = 1;
            moving = true;
        }
        else if(Input.GetKey(KeyCode.S))
        {
            movementDirection.y = -1;
            moving = true;
        }
        if(Input.GetKey(KeyCode.D))
        {
            movementDirection.x = 1;
            moving = true;
        }
        else if(Input.GetKey(KeyCode.A))
        {
            movementDirection.x = -1;
            moving = true;
        }
        movementDirection.Normalize();
    }
    private void FixedUpdate() 
    {
        if(moving)
        {
            Vector3 force = CameraMovement.GetCameraDirection() * new Vector3(movementDirection.x * speed, 0, movementDirection.y * speed);
            if(rigidbody.velocity.magnitude + force.magnitude <= maxSpeed)
            {
                rigidbody.AddForce(force);
            }
            moving = false;
            movementDirection = Vector2.zero;
        }
    }
}
