import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import kotlinx.coroutines.*

/**
 * This file demonstrates making a network request using Kotlin Coroutines and Ktor.
 * It is saved with a random name as requested.
 */
suspend fun main() {
    // Create an HTTP client using the CIO engine
    val client = HttpClient(CIO)

    try {
        // Launch a coroutine to perform the network request
        val response: HttpResponse = client.get("https://httpbin.org/get") {
            headers.append("User-Agent", "Ktor Client")
        }

        println("Status: ${"$"}{response.status}")
        println("Response Body: ${"$"}{response.bodyAsText()}")
    } catch (e: Exception) {
        println("An error occurred: ${"$"}{e.message}")
    } finally {
        // Always close the client to free resources
        client.close()
    }
}