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
        val randomNumber = Random.nextInt(100)
        val message = "Hello! Your lucky number is $randomNumber"
        
        // Display the toast message
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }
}