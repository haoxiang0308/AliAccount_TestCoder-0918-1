import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import java.util.*

val client = HttpClient(CIO) {
    engine {
        requestTimeout = 5000 // 5秒超时
    }
}

suspend fun makeNetworkRequest(): String {
    return try {
        val response: HttpResponse = client.get("https://httpbin.org/get") {
            headers.append("User-Agent", "Kotlin Client")
        }
        response.bodyAsText()
    } catch (e: Exception) {
        """{
    "error": "${e.message}",
    "timestamp": "${Date()}",
    "status": "failed"
}"""
    }
}

fun generateRandomFileName(): String {
    val random = Random()
    val chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    val name = StringBuilder()
    for (i in 0 until 8) {
        name.append(chars[random.nextInt(chars.length)])
    }
    return "${name}.kt"
}

fun main() = runBlocking {
    println("发起网络请求...")
    
    // 发起网络请求
    val response = withTimeout(10000) { // 设置10秒超时
        makeNetworkRequest()
    }
    
    // 生成随机文件名
    val randomFileName = generateRandomFileName()
    val filePath = "/workspace/$randomFileName"
    
    // 将响应内容保存到随机命名的.kt文件中
    File(filePath).writeText("""
        // 网络请求结果 - 生成时间: ${Date()}
        val networkResponse = \"\"\"$response\"\"\"
        
        fun printNetworkResponse() {
            println("网络请求结果:")
            println(networkResponse)
        }
    """.trimIndent())
    
    println("网络请求完成！响应已保存到: $filePath")
    println("响应内容:")
    println(response)
    
    client.close()
}