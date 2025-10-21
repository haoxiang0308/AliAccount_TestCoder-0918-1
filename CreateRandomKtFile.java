import java.io.File;
import java.util.UUID;

public class CreateRandomKtFile {
    public static void main(String[] args) {
        System.out.println("Creating a random .kt file with simulated network response...");
        
        // 生成随机命名的.kt文件并保存响应
        String randomFileName = "RandomFile_" + UUID.randomUUID() + ".kt";
        String fileContent = "// Generated file with simulated network response\n" +
                            "package generated;\n\n" +
                            "object NetworkResponse {\n" +
                            "    const val response = \"Response: Simulated data from server\"\n" +
                            "    val timestamp = " + System.currentTimeMillis() + "\n" +
                            "}\n";
        
        try {
            File file = new File(randomFileName);
            file.createNewFile();
            java.nio.file.Files.write(file.toPath(), fileContent.getBytes());
            System.out.println("Content saved to: " + randomFileName);
            
            // 验证文件内容
            System.out.println("File created successfully with content:");
            System.out.println(fileContent);
        } catch (Exception e) {
            System.err.println("Error saving file: " + e.getMessage());
        }
    }
}