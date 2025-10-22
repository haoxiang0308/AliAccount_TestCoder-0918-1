import kotlinx.coroutines.*
import java.io.File
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.URI
import java.util.*
import java.net.http.HttpResponse

suspend fun performNetworkRequest(): String = withContext(Dispatchers.IO) {
    try {
        val client = HttpClient.newHttpClient()
        val request = HttpRequest.newBuilder()
            .uri(URI.create("https://httpbin.org/get?test=kotlin_coroutine"))
            .GET()
            .build()
        
        val response = client.send(request, HttpResponse.BodyHandlers.ofString())
        response.body()
    } catch (e: Exception) {
        // 如果网络请求失败，返回错误信息
        """{"error": "${e.message}", "status": "failed"}"""
    }
}

fun generateRandomFileName(): String {
    val chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    val random = Random()
    val fileName = StringBuilder()
    
    for (i in 0 until 10) {
        fileName.append(chars[random.nextInt(chars.length)])
    }
    
    return "/workspace/${fileName}.kt"
}

fun main() = runBlocking {
    println("发起网络请求...")
    
    // 执行网络请求
    val response = withTimeout(5000) { // 设置5秒超时
        performNetworkRequest()
    }
    
    // 生成随机文件名
    val randomFileName = generateRandomFileName()
    println("随机生成的文件名: $randomFileName")
    
    // 将响应保存到随机命名的.kt文件中
    File(randomFileName).writeText("""
        // 网络请求结果 - 保存于 ${Date()}
        
        val networkResponse = ${response.replace("\n", "\n        ")}
        
        fun getNetworkResponse(): String {
            return networkResponse
        }
        
        // 随机文件名: ${randomFileName}
    """.trimIndent())
    
    println("网络请求结果已保存到: $randomFileName")
    println("文件内容预览:")
    println(File(randomFileName).readText())
}