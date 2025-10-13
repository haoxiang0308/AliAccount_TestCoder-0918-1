import java.util.ArrayList;
import java.util.List;

public class StudentInfo {

    private String name;
    private int age;
    private String studentId;
    private List<String> courses;

    // Constructor
    public StudentInfo(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.courses = new ArrayList<>();
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

    public List<String> getCourses() {
        return new ArrayList<>(courses); // Return a copy for encapsulation
    }

    // Method to add a course
    public void addCourse(String courseName) {
        if (!courses.contains(courseName)) {
            courses.add(courseName);
        }
    }

    // Method to remove a course
    public void removeCourse(String courseName) {
        courses.remove(courseName);
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Student ID: " + studentId);
        System.out.println("Enrolled Courses: " + courses);
    }

    // Main method for testing
    public static void main(String[] args) {
        StudentInfo student = new StudentInfo("Alice Johnson", 20, "S001");

        student.addCourse("Mathematics");
        student.addCourse("Physics");
        student.displayInfo();

        student.removeCourse("Physics");
        student.displayInfo();
    }
}