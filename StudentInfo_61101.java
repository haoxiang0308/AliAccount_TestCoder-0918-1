public class Student {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    
    // 构造函数
    public Student() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
    }
    
    public Student(String name, int age, String studentId, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
    }
    
    // Getter方法
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
    
    // Setter方法
    public void setName(String name) {
        this.name = name;
    }
    
    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        }
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }
    
    // 显示学生信息的方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
    }
    
    // 判断学生是否为优秀学生（GPA >= 3.5）
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }
    
    // 计算学生的学术等级
    public String getAcademicLevel() {
        if (gpa >= 3.7) {
            return "优秀";
        } else if (gpa >= 3.0) {
            return "良好";
        } else if (gpa >= 2.0) {
            return "及格";
        } else {
            return "不及格";
        }
    }
    
    // 重写toString方法
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                ", academicLevel='" + getAcademicLevel() + '\'' +
                '}';
    }
    
    // 主方法，用于测试
    public static void main(String[] args) {
        // 创建学生对象
        Student student1 = new Student("张三", 20, "2021001", 3.8);
        Student student2 = new Student();
        
        // 设置学生2的信息
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2021002");
        student2.setGpa(2.9);
        
        // 显示学生信息
        student1.displayInfo();
        System.out.println("学术等级: " + student1.getAcademicLevel());
        System.out.println("是否为优秀学生: " + student1.isExcellentStudent());
        System.out.println("\n" + student1.toString());
        
        System.out.println("\n------------------------\n");
        
        student2.displayInfo();
        System.out.println("学术等级: " + student2.getAcademicLevel());
        System.out.println("是否为优秀学生: " + student2.isExcellentStudent());
        System.out.println("\n" + student2.toString());
    }
}