import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.http.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.Serializable

@Serializable
data class Post(val id: Int, val title: String, val body: String, val userId: Int)

suspend fun main() {
    val client = HttpClient {
        install(ContentNegotiation) {
            json()
        }
    }

    try {
        val response: List<Post> = client.get("https://jsonplaceholder.typicode.com/posts").body()
        println("Received ${response.size} posts. First post title: ${response.first().title}")
    } catch (e: Exception) {
        println("An error occurred: ${e.message}")
    } finally {
        client.close()
    }
}