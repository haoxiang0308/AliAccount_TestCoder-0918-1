package com.example.mytoastapp

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MainActivity_928374 : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // A simple activity that displays a toast message on creation.
        Toast.makeText(this, "Hello from Kotlin Activity!", Toast.LENGTH_SHORT).show()
    }
}