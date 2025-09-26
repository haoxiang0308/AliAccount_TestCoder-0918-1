package com.example.randomactivity

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MyToastActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // This activity doesn't have a UI, it just shows a toast and finishes.
        Toast.makeText(this, "Hello from a randomly named Kotlin file!", Toast.LENGTH_LONG).show()
        finish() // Close the activity immediately after showing the toast
    }
}