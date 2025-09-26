import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import java.util.UUID

suspend fun main() {
    val client = HttpClient()

    try {
        val response: HttpResponse = client.get("https://httpbin.org/get")
        val responseBody = response.bodyAsText()

        val fileName = "${'$'}{UUID.randomUUID()}.kt"
        val file = File(fileName)
        file.writeText(responseBody)

        println("Response saved to file: ${'$'}fileName")

    } catch (e: Exception) {
        println("An error occurred: ${'$'}{e.message}")
        e.printStackTrace()
    } finally {
        client.close()
    }
}