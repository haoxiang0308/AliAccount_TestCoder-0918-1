package com.example.toastactivity

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class Activity_Cib3dXDN : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main) // You would need to create this layout
        
        // Display a toast message
        val toastMessage = "Hello from Kotlin Android Activity!"
        Toast.makeText(this, toastMessage, Toast.LENGTH_LONG).show()
    }
}