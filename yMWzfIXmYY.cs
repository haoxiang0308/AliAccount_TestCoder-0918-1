using UnityEngine;

public class MoveForwardScript : MonoBehaviour
{
    public float speed = 5.0f; // Speed of movement

    void Update()
    {
        // Move the object forward along its Z-axis
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}