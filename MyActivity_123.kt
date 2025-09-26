package com.example.myapp

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MyActivity_123 : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Toast.makeText(this, "Hello from MyActivity_123!", Toast.LENGTH_SHORT).show()
    }
}