public class Student1761739960 {
    // 私有属性
    private String name;
    private int age;
    private String studentId;
    private double gpa;
    private String major;

    // 构造函数
    public Student1761739960() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.gpa = 0.0;
        this.major = "";
    }

    public Student1761739960(String name, int age, String studentId, double gpa, String major) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.gpa = gpa;
        this.major = major;
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

    public String getMajor() {
        return major;
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

    public void setMajor(String major) {
        this.major = major;
    }

    // 计算成绩等级的方法
    public String getGradeLevel() {
        if (gpa >= 3.7) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B";
        } else if (gpa >= 2.0) {
            return "C";
        } else if (gpa >= 1.0) {
            return "D";
        } else {
            return "F";
        }
    }

    // 检查是否为优秀学生
    public boolean isExcellentStudent() {
        return gpa >= 3.5;
    }

    // 显示学生信息
    public void displayInfo() {
        System.out.println("=== 学生信息 ===");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("GPA: " + gpa);
        System.out.println("专业: " + major);
        System.out.println("成绩等级: " + getGradeLevel());
        System.out.println("是否为优秀学生: " + (isExcellentStudent() ? "是" : "否"));
        System.out.println("================");
    }

    // 重写toString方法
    @Override
    public String toString() {
        return "Student1761739960{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", gpa=" + gpa +
                ", major='" + major + '\'' +
                '}';
    }

    // 主方法用于测试
    public static void main(String[] args) {
        // 创建一个学生对象
        Student1761739960 student1 = new Student1761739960("张三", 20, "2023001", 3.8, "计算机科学");

        // 显示学生信息
        student1.displayInfo();

        // 创建另一个学生对象
        Student1761739960 student2 = new Student1761739960();
        student2.setName("李四");
        student2.setAge(19);
        student2.setStudentId("2023002");
        student2.setGpa(3.2);
        student2.setMajor("数学");

        System.out.println("\n学生2信息:");
        student2.displayInfo();

        // 测试getter方法
        System.out.println("\n学生1的姓名: " + student1.getName());
        System.out.println("学生1的成绩等级: " + student1.getGradeLevel());
        System.out.println("学生1是否为优秀学生: " + student1.isExcellentStudent());
    }
}