using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    new Rigidbody rigidbody;
    public Vector2 movementDirection;
    public int speed;

    public float jumpStrength;

    public Interactable currentInteractable;

    int keys;

    bool jumping;

    Text text;

    private void Start() 
    {
        movementDirection = Vector2.zero;
        rigidbody = GetComponent<Rigidbody>();
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
        }
        else if(Input.GetKey(KeyCode.S))
        {
            movementDirection.y = -1;
        }
        if(Input.GetKey(KeyCode.D))
        {
            movementDirection.x = 1;
        }
        else if(Input.GetKey(KeyCode.A))
        {
            movementDirection.x = -1;
        }
        movementDirection.Normalize();
        if(Input.GetKeyDown(KeyCode.Space) && Grounded())
        {
            jumping = true;
        }
        if(Input.GetKeyUp(KeyCode.Space))
        {
            jumping = false;
        }
    }
    private void FixedUpdate() 
    {
        Vector3 force = CameraMovement.GetCameraDirection() * new Vector3(movementDirection.x * speed, 0, movementDirection.y * speed);
        rigidbody.velocity = new Vector3(force.x, rigidbody.velocity.y, force.z);
        movementDirection = Vector2.zero;
        if(jumping)
        {
            rigidbody.velocity = new Vector3(rigidbody.velocity.x, jumpStrength, rigidbody.velocity.z);
        }
    }

    private void OnCollisionEnter(Collision other) 
    {
        if(other.gameObject.GetComponent<Interactable>() && other.gameObject.GetComponent<Interactable>().interactable)
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
        if(other.gameObject.GetComponent<Interactable>() && other.gameObject.GetComponent<Interactable>().interactable)
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
        return Physics.Raycast(transform.position, Vector3.down, 1);
    }
}
