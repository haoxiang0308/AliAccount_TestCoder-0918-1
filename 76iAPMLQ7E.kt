package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import kotlin.random.Random

class MainActivity : AppCompatActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        
        // Generate a random message
        val randomMessages = arrayOf(
            "Hello, World!",
            "Welcome to Kotlin!",
            "Have a great day!",
            "Keep coding!",
            "Android development is fun!"
        )
        
        val randomIndex = Random.nextInt(randomMessages.size)
        val message = randomMessages[randomIndex]
        
        // Display the toast message
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }
}