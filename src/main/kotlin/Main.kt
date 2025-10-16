import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.engine.cio.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.coroutines.Dispatchers
import java.io.File
import java.util.*

suspend fun main() {
    // 创建HTTP客户端
    val client = HttpClient(CIO) {
        install(ContentNegotiation) {
            json()
        }
    }

    try {
        // 使用协程发起网络请求
        val result = withContext(Dispatchers.IO) {
            println("正在发起网络请求...")
            val response: String = client.get("https://httpbin.org/json").body()
            println("网络请求完成")
            response
        }

        // 生成随机文件名
        val randomFileName = "Response_${UUID.randomUUID()}.kt"
        val file = File(randomFileName)

        // 将结果保存到随机命名的.kt文件中
        withContext(Dispatchers.IO) {
            file.writeText("// 网络请求结果保存于: ${Date()}\n")
            file.appendText("val networkResponse = \"\"\"\n")
            file.appendText(result)
            file.appendText("\n\"\"\"")
        }

        println("结果已保存到文件: $randomFileName")
    } catch (e: Exception) {
        println("发生错误: ${e.message}")
        e.printStackTrace()
    } finally {
        client.close()
    }
}