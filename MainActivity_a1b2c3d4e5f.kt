package com.example.randomapp

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MainActivity_a1b2c3d4e5f : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Display a toast message
        Toast.makeText(this, "Hello from Kotlin Android!", Toast.LENGTH_SHORT).show()
    }
}