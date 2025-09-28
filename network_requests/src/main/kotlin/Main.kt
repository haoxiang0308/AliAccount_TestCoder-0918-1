import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import java.util.UUID

suspend fun performNetworkRequestAndSaveToFile() {
    val client = HttpClient(CIO)

    try {
        val response: HttpResponse = client.get("https://httpbin.org/get")
        val responseBody = response.bodyAsText()

        val fileName = "${'$'}{UUID.randomUUID()}.kt"
        val file = File(fileName)
        file.writeText(responseBody)

        println("Response saved to file: ${'$'}fileName")

    } catch (e: Exception) {
        e.printStackTrace()
    } finally {
        client.close()
    }
}

fun main() = runBlocking {
    performNetworkRequestAndSaveToFile()
}