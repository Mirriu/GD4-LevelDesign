using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerController : MonoBehaviour
{
    new Rigidbody rigidbody;
    public Vector2 movementDirection;
    public int speed;
    public float maxSpeed;

    public float jumpStrength;

    public bool moving;

    public Interactable currentInteractable;

    int keys;

    Text text;

    private void Start() 
    {
        movementDirection = Vector2.zero;
        rigidbody = GetComponent<Rigidbody>();
        moving = false;
        text = GetComponentInChildren<Text>();
        keys = 0;
    }
    private void Update() 
    {
        text.text = currentInteractable ? currentInteractable.name: "";
        if(currentInteractable)
        {
            if(Input.GetKeyDown(KeyCode.Q) && (currentInteractable.pickup || (!currentInteractable.pickup && keys > 0)))
            {
                currentInteractable.UseKey(ref currentInteractable, ref keys);
            }
        }
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
        if(Input.GetKeyDown(KeyCode.Space) && Grounded())
        {
            rigidbody.velocity = new Vector3(rigidbody.velocity.x, jumpStrength, rigidbody.velocity.z);
        }
    }

    private void OnCollisionEnter(Collision other) 
    {
        if(other.gameObject.GetComponent<Interactable>())
        {
            currentInteractable = other.gameObject.GetComponent<Interactable>();
        }
    }
    private void OnCollisionExit(Collision other) 
    {
        if(other.gameObject.GetComponent<Interactable>())
        {
            currentInteractable = null;
        }
    }
    private void OnTriggerEnter(Collider other) 
    {
        if(other.gameObject.GetComponent<Interactable>())
        {
            currentInteractable = other.gameObject.GetComponent<Interactable>();
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if(other.gameObject.GetComponent<Interactable>())
        {
            currentInteractable = null;
        }
    }

    private bool Grounded()
    {
        return Physics.Raycast(transform.position, Vector3.down, .7f);
    }
}
