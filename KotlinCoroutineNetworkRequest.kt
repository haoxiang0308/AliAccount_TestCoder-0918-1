import kotlinx.coroutines.*
import java.io.File
import java.util.Random
import java.net.URL
import java.net.HttpURLConnection

/**
 * 使用Kotlin协程发起网络请求，并保存到随机命名的.kt文件中
 * 此代码展示了如何使用Kotlin协程进行异步网络请求
 */
class NetworkRequestWithCoroutines {
    
    /**
     * 执行网络请求的挂起函数
     */
    suspend fun performNetworkRequest() {
        withContext(Dispatchers.IO) {
            try {
                // 发起网络请求
                val response = makeHttpRequest("https://httpbin.org/get")
                
                // 生成随机文件名
                val randomFileName = generateRandomKotlinFileName()
                val file = File(randomFileName)
                
                // 将响应保存到随机命名的.kt文件
                file.writeText("// 网络请求响应\nval response = \"\"\"$response\"\"\"")
                
                println("响应已保存到文件: $randomFileName")
            } catch (e: Exception) {
                println("网络请求失败: ${e.message}")
                e.printStackTrace()
            }
        }
    }
    
    /**
     * 实际执行HTTP请求的函数
     */
    private fun makeHttpRequest(urlString: String): String {
        val url = URL(urlString)
        val connection = url.openConnection() as HttpURLConnection
        connection.requestMethod = "GET"
        connection.connectTimeout = 5000 // 5秒超时
        connection.readTimeout = 5000   // 5秒读取超时
        
        return connection.inputStream.bufferedReader().readText().also {
            connection.disconnect()
        }
    }
    
    /**
     * 生成随机的Kotlin文件名
     */
    private fun generateRandomKotlinFileName(): String {
        val random = Random()
        val fileName = "RequestResponse_${random.nextInt(100000)}.kt"
        return fileName
    }
}

/**
 * 主函数 - 程序入口点
 */
fun main() = runBlocking {
    val networkRequest = NetworkRequestWithCoroutines()
    networkRequest.performNetworkRequest()
}