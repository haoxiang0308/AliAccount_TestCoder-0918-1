public class Student2105 {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public Student2105(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
    }
    
    // 获取学生姓名
    public String getName() {
        return name;
    }
    
    // 设置学生姓名
    public void setName(String name) {
        this.name = name;
    }
    
    // 获取学生年龄
    public int getAge() {
        return age;
    }
    
    // 设置学生年龄
    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        }
    }
    
    // 获取学生ID
    public String getStudentId() {
        return studentId;
    }
    
    // 获取GPA
    public double getGpa() {
        return gpa;
    }
    
    // 设置GPA
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }
    
    // 显示学生信息
    public void displayInfo() {
        System.out.println("学生姓名: " + name);
        System.out.println("学生年龄: " + age);
        System.out.println("学生ID: " + studentId);
        System.out.println("学生GPA: " + gpa);
    }
    
    // 判断是否优秀学生 (GPA >= 3.5)
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student2105 student = new Student2105("张三", 20, "S2105001", 3.8);
        
        // 显示学生信息
        student.displayInfo();
        
        // 判断是否为优秀学生
        if (student.isExcellentStudent()) {
            System.out.println(student.getName() + " 是一名优秀学生。");
        } else {
            System.out.println(student.getName() + " 不是优秀学生。");
        }
        
        // 修改GPA
        student.setGpa(3.2);
        System.out.println("\n修改GPA后:");
        student.displayInfo();
        
        // 再次判断是否为优秀学生
        if (student.isExcellentStudent()) {
            System.out.println(student.getName() + " 是一名优秀学生。");
        } else {
            System.out.println(student.getName() + " 不是优秀学生。");
        }
    }
}