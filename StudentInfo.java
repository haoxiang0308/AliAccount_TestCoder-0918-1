import java.util.ArrayList;
import java.util.List;

public class StudentInfo {

    private String name;
    private int age;
    private String studentId;
    private List<Double> grades;

    public StudentInfo(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.grades = new ArrayList<>();
    }

    // Getter methods
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getStudentId() {
        return studentId;
    }

    public List<Double> getGrades() {
        return new ArrayList<>(grades); // Return a copy to maintain encapsulation
    }

    // Setter methods
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        } else {
            System.out.println("Age must be positive.");
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // Method to add a grade
    public void addGrade(double grade) {
        if (grade >= 0.0 && grade <= 100.0) {
            grades.add(grade);
        } else {
            System.out.println("Grade must be between 0.0 and 100.0");
        }
    }

    // Method to calculate average grade
    public double calculateAverageGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        double sum = 0.0;
        for (double grade : grades) {
            sum += grade;
        }
        return sum / grades.size();
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + getName());
        System.out.println("Age: " + getAge());
        System.out.println("ID: " + getStudentId());
        System.out.println("Grades: " + getGrades());
        System.out.println("Average Grade: " + String.format("%.2f", calculateAverageGrade()));
    }

    public static void main(String[] args) {
        // Example usage
        StudentInfo student1 = new StudentInfo("Alice Johnson", 20, "S001");

        student1.addGrade(85.5);
        student1.addGrade(92.0);
        student1.addGrade(78.3);

        student1.displayInfo();

        System.out.println("\n---\n");

        StudentInfo student2 = new StudentInfo("Bob Smith", 22, "S002");
        student2.setAge(-5); // This will trigger an error message
        student2.addGrade(105.0); // This will trigger an error message
        student2.displayInfo(); // Average will be 0.0 as no valid grades were added
    }
}