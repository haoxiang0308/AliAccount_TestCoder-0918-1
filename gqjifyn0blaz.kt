import kotlinx.coroutines.*
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import kotlin.io.println

// 网络请求函数，使用Kotlin协程
suspend fun makeNetworkRequest(urlString: String): String = withContext(Dispatchers.IO) {
    try {
        val url = URL(urlString)
        val connection = url.openConnection() as HttpURLConnection
        connection.requestMethod = "GET"
        connection.connectTimeout = 5000 // 5秒超时
        connection.readTimeout = 5000
        
        val responseCode = connection.responseCode
        println("Response Code: $responseCode")
        
        val response = StringBuilder()
        val reader = BufferedReader(InputStreamReader(connection.inputStream))
        reader.use { it ->
            var line: String?
            while (it.readLine().also { line = it } != null) {
                response.append(line)
            }
        }
        
        connection.disconnect()
        response.toString()
    } catch (e: Exception) {
        "Error: ${e.message}"
    }
}

fun main() = runBlocking {
    println("发起网络请求示例...")
    
    // 使用协程发起网络请求
    val deferredResponse = async {
        makeNetworkRequest("https://httpbin.org/get")
    }
    
    // 等待结果
    val result = deferredResponse.await()
    println("请求结果:")
    println(result)
    
    println("\n程序执行完成")
}