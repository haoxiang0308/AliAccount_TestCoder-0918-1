package com.example.myapp

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MyActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Display a toast message
        Toast.makeText(this, "Hello from Kotlin!", Toast.LENGTH_SHORT).show()
    }
}