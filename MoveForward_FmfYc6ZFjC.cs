using UnityEngine;

public class MoveForward_FmfYc6ZFjC : MonoBehaviour
{
    public float speed = 5.0f;

    void Update()
    {
        // Move the object forward along its local z-axis
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}