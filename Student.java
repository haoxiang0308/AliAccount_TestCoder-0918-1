import java.util.ArrayList;
import java.util.List;

public class Student {
    private String name;
    private int age;
    private String studentId;
    private List<Double> grades;

    public Student(String name, int age, String studentId) {
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

    // Method to add a grade
    public void addGrade(double grade) {
        if (grade >= 0.0 && grade <= 100.0) {
            grades.add(grade);
        } else {
            System.out.println("Invalid grade. Please enter a value between 0 and 100.");
        }
    }

    // Method to calculate average grade
    public double getAverageGrade() {
        if (grades.isEmpty()) {
            return 0.0;
        }
        double sum = 0.0;
        for (double grade : grades) {
            sum += grade;
        }
        return sum / grades.size();
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", averageGrade=" + getAverageGrade() +
                '}';
    }

    // Main method for testing
    public static void main(String[] args) {
        Student student1 = new Student("Alice", 20, "S001");
        student1.addGrade(85.5);
        student1.addGrade(92.0);
        student1.addGrade(78.3);

        System.out.println(student1);
    }
}