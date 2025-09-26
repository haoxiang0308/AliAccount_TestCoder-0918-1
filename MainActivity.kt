package com.example.randomactivity

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(android.R.layout.activity_main) // Use a generic layout or set content view as needed

        // Display a toast message
        Toast.makeText(this, "Hello from Kotlin Android Activity!", Toast.LENGTH_SHORT).show()
    }
}