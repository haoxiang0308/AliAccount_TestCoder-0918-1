import java.util.ArrayList;
import java.util.List;

public class StudentClass {
    // 学生属性
    private String name;
    private int age;
    private String studentId;
    private List<String> courses;
    private double gpa;
    
    // 构造函数
    public StudentClass(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.courses = new ArrayList<>();
        this.gpa = 0.0;
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
    
    // 添加课程
    public void addCourse(String course) {
        if (!courses.contains(course)) {
            courses.add(course);
            System.out.println("已添加课程: " + course);
        } else {
            System.out.println("课程已存在: " + course);
        }
    }
    
    // 移除课程
    public void removeCourse(String course) {
        if (courses.remove(course)) {
            System.out.println("已移除课程: " + course);
        } else {
            System.out.println("未找到课程: " + course);
        }
    }
    
    // 获取课程列表
    public List<String> getCourses() {
        return new ArrayList<>(courses); // 返回副本以保护内部数据
    }
    
    // 设置GPA
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        } else {
            System.out.println("GPA必须在0.0到4.0之间");
        }
    }
    
    // 获取GPA
    public double getGpa() {
        return gpa;
    }
    
    // 显示学生信息
    public void displayInfo() {
        System.out.println("=== 学生信息 ===");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
        System.out.println("课程数量: " + courses.size());
        System.out.print("课程列表: ");
        if (courses.isEmpty()) {
            System.out.println("无");
        } else {
            System.out.println(String.join(", ", courses));
        }
        System.out.println("================");
    }
    
    // 重写toString方法
    @Override
    public String toString() {
        return "StudentClass{name='" + name + "', age=" + age + ", studentId='" + studentId + "', gpa=" + gpa + "}";
    }
    
    // 主方法用于测试
    public static void main(String[] args) {
        // 创建学生对象
        StudentClass student = new StudentClass("张三", 20, "2023001");
        
        // 显示初始信息
        student.displayInfo();
        
        // 添加课程
        student.addCourse("Java编程");
        student.addCourse("数据结构");
        student.addCourse("算法分析");
        student.addCourse("Java编程"); // 重复添加
        
        // 设置GPA
        student.setGpa(3.75);
        
        // 显示更新后的信息
        student.displayInfo();
        
        // 移除课程
        student.removeCourse("算法分析");
        
        // 显示最终信息
        student.displayInfo();
        
        // 测试toString方法
        System.out.println("toString输出: " + student.toString());
    }
}