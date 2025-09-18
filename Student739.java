public class Student739 {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public Student739() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
    }
    
    public Student739(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
    }
    
    // getter方法
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
    
    // setter方法
    public void setName(String name) {
        this.name = name;
    }
    
    public void setAge(int age) {
        this.age = age;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        } else {
            System.out.println("GPA必须在0.0到4.0之间");
        }
    }
    
    // 其他方法
    public void displayInfo() {
        System.out.println("学生姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
    }
    
    public String getGradeLevel() {
        if (age <= 18) {
            return "本科生";
        } else {
            return "研究生";
        }
    }
    
    public boolean isHonorStudent() {
        return gpa >= 3.5;
    }
    
    // toString方法
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                '}';
    }
}