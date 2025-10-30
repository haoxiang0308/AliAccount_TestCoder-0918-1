import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class ExceptionToFile {
    public static void main(String[] args) {
        try {
            // Lançando uma exceção artificialmente
            throw new IllegalArgumentException("Esta é uma exceção lançada propositalmente para demonstração");
        } catch (IllegalArgumentException e) {
            // Capturando a exceção
            System.out.println("Exceção capturada: " + e.getMessage());
            
            // Gerando um nome de arquivo aleatório
            String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder fileName = new StringBuilder();
            Random random = new Random();
            
            // Criando um nome com 10 caracteres aleatórios
            for (int i = 0; i < 10; i++) {
                fileName.append(chars.charAt(random.nextInt(chars.length())));
            }
            fileName.append(".txt");
            
            String randomFileName = fileName.toString();
            System.out.println("Salvando informações da exceção no arquivo: " + randomFileName);
            
            // Salvando informações da exceção no arquivo
            try (FileWriter writer = new FileWriter(randomFileName)) {
                writer.write("Exceção capturada: " + e.getClass().getSimpleName() + "\n");
                writer.write("Mensagem: " + e.getMessage() + "\n");
                writer.write("StackTrace:\n");
                
                // Escrevendo o stack trace no arquivo
                for (StackTraceElement element : e.getStackTrace()) {
                    writer.write("  at " + element.toString() + "\n");
                }
                
                System.out.println("Arquivo salvo com sucesso!");
            } catch (IOException ioException) {
                System.err.println("Erro ao salvar o arquivo: " + ioException.getMessage());
            }
        }
    }
}