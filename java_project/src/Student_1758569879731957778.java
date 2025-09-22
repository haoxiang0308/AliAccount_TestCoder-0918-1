public class Student {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;

    // 构造函数
    public Student(String name, int age, String studentId) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
    }

    // Getter 和 Setter 方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        }
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    // 公共方法：显示学生信息
    public void displayInfo() {
        System.out.println("Name: " + name + ", Age: " + age + ", Student ID: " + studentId);
    }

    // 公共方法：判断学生是否成年
    public boolean isAdult() {
        return age >= 18;
    }

    // 主方法，用于测试
    public static void main(String[] args) {
        Student student1 = new Student("Alice", 20, "S001");
        Student student2 = new Student("Bob", 17, "S002");

        student1.displayInfo();
        System.out.println("Is " + student1.getName() + " an adult? " + student1.isAdult());

        student2.displayInfo();
        System.out.println("Is " + student2.getName() + " an adult? " + student2.isAdult());
    }
}