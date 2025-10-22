import kotlinx.coroutines.*
import java.io.File
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.URI
import kotlin.random.Random

fun generateRandomFileName(): String {
    val chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    val sb = StringBuilder()
    repeat(10) {
        sb.append(chars[Random.nextInt(chars.length)])
    }
    return "/workspace/${sb}.kt"
}

suspend fun performNetworkRequest(): String = withContext(Dispatchers.IO) {
    try {
        val client = HttpClient.newHttpClient()
        val request = HttpRequest.newBuilder()
            .uri(URI.create("https://httpbin.org/get?test=kotlin_coroutine"))
            .GET()
            .build()
        
        val response = client.send(request, java.net.http.HttpResponse.BodyHandlers.ofString())
        response.body()
    } catch (e: Exception) {
        """{"error": "${e.message}", "status": "failed"}"""
    }
}

fun main() = runBlocking {
    println("发起网络请求...")
    
    val response = try {
        withTimeout(10000) { // 10秒超时
            performNetworkRequest()
        }
    } catch (e: TimeoutCancellationException) {
        """{"error": "Request timed out", "status": "timeout"}"""
    }
    
    val randomFileName = generateRandomFileName()
    println("随机生成的文件名: $randomFileName")
    
    File(randomFileName).writeText("""
        /*
         * 网络请求结果
         * 时间戳: ${System.currentTimeMillis()}
         */
        
        val networkResponse = ${
            // 格式化响应内容，使其成为有效的Kotlin代码
            response.replace("\n", "\n        ").replace("\"", "\\\"")
        }
        
        fun getNetworkResponse(): String {
            return networkResponse
        }
    """.trimIndent())
    
    println("网络请求结果已保存到: $randomFileName")
    println("文件内容预览:")
    println(File(randomFileName).readText())
}

main()