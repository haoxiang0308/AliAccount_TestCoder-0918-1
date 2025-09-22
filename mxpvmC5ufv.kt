package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton

class MainActivity : AppCompatActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Creating a button programmatically to trigger the toast
        val button = AppCompatButton(this).apply {
            text = "Show Toast"
            setOnClickListener {
                showToast()
            }
        }
        
        setContentView(button)
    }
    
    private fun showToast() {
        Toast.makeText(
            this,
            "Hello from Kotlin Android Activity!",
            Toast.LENGTH_SHORT
        ).show()
    }
}