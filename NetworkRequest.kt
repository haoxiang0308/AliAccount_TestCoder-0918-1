import kotlinx.coroutines.*
import java.io.File
import java.util.*

fun main() = runBlocking {
    // 发起网络请求并获取响应
    val response = async(Dispatchers.IO) {
        // 这里使用 curl 命令模拟网络请求，实际项目中应使用 HttpClient
        val url = "https://httpbin.org/get"
        val process = ProcessBuilder("curl", "-s", url).start()
        val result = process.inputStream.bufferedReader().readText()
        process.waitFor()
        result
    }

    // 等待网络请求完成
    val data = response.await()

    // 生成随机文件名
    val randomFileName = "request_result_${UUID.randomUUID()}.kt"

    // 将结果保存到随机命名的 .kt 文件中
    File(randomFileName).writeText(data)

    println("Response saved to $randomFileName")
}