import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求函数
suspend fun makeNetworkRequest(): String {
    // 模拟网络请求 - 在实际应用中，这里会是真正的HTTP请求
    delay(1000) // 模拟网络延迟
    return """{
    "status": "success",
    "data": {
        "message": "Hello from network request!",
        "timestamp": "${Date()}",
        "random_number": ${kotlin.random.Random.nextInt(1000, 9999)}
    }
}"""
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
    val response = withTimeout(5000) { // 设置5秒超时
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
}