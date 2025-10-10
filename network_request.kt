import kotlinx.coroutines.*
import java.io.File
import java.util.*

suspend fun fetchAndSaveToFile() {
    val urlString = "https://httpbin.org/get"
    val response = try {
        // 使用 Kotlin 协程和原生 API 模拟网络请求
        // **注意：此代码仅作示意，实际协程网络请求通常需要 OkHttp 或 Ktor 等库**
        println("Fetching data from $urlString...")
        kotlinx.coroutines.delay(1000) // 模拟网络延迟
        "{\n  \"url\": \"$urlString\",\n  \"args\": {},\n  \"headers\": {\"User-Agent\": \"ktor-client\"}\n}"
    } catch (e: Exception) {
        e.printStackTrace()
        return
    }

    // 生成随机文件名
    val fileName = "network_response_${UUID.randomUUID()}.json"

    // 将响应保存到文件
    File(fileName).writeText(response)
    println("Response saved to $fileName")
}

fun main() = runBlocking {
    fetchAndSaveToFile()
}