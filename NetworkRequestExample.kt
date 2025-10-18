import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求的函数
suspend fun fetchNetworkData(): String {
    return withContext(Dispatchers.IO) {
        delay(2000) // 模拟网络延迟
        "模拟的网络响应数据"
    }
}

// 保存数据到随机命名的.kt文件
fun saveToRandomKtFile(data: String) {
    val randomName = "RandomFile_${UUID.randomUUID()}.kt"
    val file = File(randomName)
    
    file.writeText("""
        // 随机生成的Kotlin文件
        // 生成时间: ${Date()}
        
        object NetworkData {
            const val responseData = "$data"
            
            fun printData() {
                println("网络请求结果: $responseData")
            }
        }
        
        fun main() {
            NetworkData.printData()
        }
    """.trimIndent())
    
    println("数据已保存到文件: $randomName")
}

// 主函数演示协程网络请求
fun main() = runBlocking {
    println("开始发起网络请求...")
    
    val result = fetchNetworkData()
    println("收到响应: $result")
    
    saveToRandomKtFile(result)
}
    