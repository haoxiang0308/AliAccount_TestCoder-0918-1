import kotlinx.coroutines.*
import java.io.File
import java.util.*

/**
 * 使用Kotlin协程发起网络请求的示例
 * 此代码展示了如何使用协程进行异步网络请求并保存到随机命名的.kt文件中
 */
class NetworkRequestHandler {
    
    /**
     * 模拟网络请求函数
     * 在实际应用中，这里会使用HttpClient发起真实的网络请求
     */
    suspend fun makeNetworkRequest(): String = withContext(Dispatchers.IO) {
        // 模拟网络延迟
        delay(1000)
        
        // 模拟网络响应
        val responses = listOf(
            "Response: User data retrieved successfully",
            "Response: Product list loaded",
            "Response: Configuration updated",
            "Response: Authentication successful",
            "Response: Data saved to server"
        )
        
        responses.random()
    }
    
    /**
     * 保存响应数据到随机命名的.kt文件
     */
    fun saveResponseToFile(response: String) {
        val randomFileName = "NetworkResponse_${UUID.randomUUID()}.kt"
        val fileContent = """// Generated file with network response
// Generated at: ${System.currentTimeMillis()}
package generated

object NetworkResponse {
    const val response = "$response"
    val timestamp = ${System.currentTimeMillis()}
    val uuid = "${UUID.randomUUID()}"
}
"""
        
        val file = File(randomFileName)
        file.writeText(fileContent)
        println("Network response saved to: $randomFileName")
    }
    
    /**
     * 执行网络请求并保存结果的主函数
     */
    suspend fun executeNetworkRequest() {
        println("Starting network request...")
        
        try {
            val response = makeNetworkRequest()
            println("Received response: $response")
            
            saveResponseToFile(response)
        } catch (e: Exception) {
            println("Network request failed: ${e.message}")
            // 即使请求失败，也创建一个错误响应文件
            saveResponseToFile("Error: ${e.message}")
        }
    }
}

/**
 * 主函数入口
 */
fun main() = runBlocking {
    val handler = NetworkRequestHandler()
    handler.executeNetworkRequest()
    
    // 演示多个并发请求
    println("\nStarting multiple concurrent requests...")
    val requests = List(3) {
        async { 
            NetworkRequestHandler().executeNetworkRequest() 
        }
    }
    
    // 等待所有请求完成
    requests.awaitAll()
    println("All requests completed!")
}