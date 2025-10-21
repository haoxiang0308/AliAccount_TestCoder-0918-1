import java.io.File;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;

public class SimpleCoroutineExample {
    public static void main(String[] args) {
        System.out.println("Initiating network request (simulated)...");
        
        // 模拟协程的异步行为
        CompletionStage<String> responseFuture = CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(1000); // 模拟网络延迟
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            return "Response: Data retrieved from server";
        });
        
        CompletableFuture<Void> future = responseFuture.thenApply(response -> {
            System.out.println("Received response: " + response);
            
            // 生成随机命名的.kt文件并保存响应
            String randomFileName = "RandomFile_" + UUID.randomUUID() + ".kt";
            String fileContent = "// Generated file with network response\n" +
                                "package generated;\n\n" +
                                "object NetworkResponse {\n" +
                                "    const val response = \"" + response + "\"\n" +
                                "    val timestamp = " + System.currentTimeMillis() + "\n" +
                                "}\n";
            
            try {
                File file = new File(randomFileName);
                file.createNewFile();
                java.nio.file.Files.write(file.toPath(), fileContent.getBytes());
                System.out.println("Content saved to: " + randomFileName);
            } catch (Exception e) {
                System.err.println("Error saving file: " + e.getMessage());
            }
            return null;
        });
        
        future.join(); // 等待完成
    }
}