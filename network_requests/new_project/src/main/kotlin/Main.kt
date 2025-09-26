import kotlinx.coroutines.*
import okhttp3.*
import java.io.IOException
import java.util.*

// Generates a random string to be used as a filename.
fun generateRandomFilename(): String {
    val chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    return "request_" + (1..8).map { chars.random() }.joinToString("") + ".kt"
}

// Performs the network request and saves the response.
suspend fun performNetworkRequestAndSave() {
    val client = OkHttpClient()

    val request = Request.Builder()
        .url("https://httpbin.org/get") // Example GET request
        .build()

    try {
        val response = client.newCall(request).await()
        val responseBody = response.body?.string() ?: "No body"

        val randomFilename = generateRandomFilename()
        println("Saving response to: $randomFilename")

        // Save the response to a file with the random name
        java.io.File(randomFilename).writeText(responseBody)

        println("Response saved successfully.")
    } catch (e: IOException) {
        e.printStackTrace()
    }
}

fun main() = runBlocking {
    performNetworkRequestAndSave()
}