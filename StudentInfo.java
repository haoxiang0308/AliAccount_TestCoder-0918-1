public class StudentInfo {

    // Private fields to store student information
    private String name;
    private int age;
    private String studentId;
    private double gpa;

    // Constructor to initialize the student object
    public StudentInfo(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
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

    public double getGpa() {
        return gpa;
    }

    // Setter methods
    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        if (age > 0) { // Basic validation
            this.age = age;
        }
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) { // Basic GPA validation
            this.gpa = gpa;
        }
    }

    // Method to display student information
    public void displayInfo() {
        System.out.println("Student Information:");
        System.out.println("Name: " + this.name);
        System.out.println("Age: " + this.age);
        System.out.println("Student ID: " + this.studentId);
        System.out.println("GPA: " + this.gpa);
    }

    // Main method for testing the StudentInfo class
    public static void main(String[] args) {
        // Create a new student object
        StudentInfo student1 = new StudentInfo("Alice Johnson", 20, "S12345678", 3.75);

        // Display the student's information
        student1.displayInfo();

        // Modify some information using setters
        student1.setGpa(3.9);
        student1.setAge(21);

        System.out.println("\nAfter updating GPA and Age:");
        student1.displayInfo();
    }
}
