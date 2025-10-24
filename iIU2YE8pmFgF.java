public class iIU2YE8pmFgF {
    // 私有成员变量
    private String name;
    private int age;
    private String studentId;
    private String major;
    private double gpa;

    // 构造函数
    public iIU2YE8pmFgF() {
        this.name = "";
        this.age = 0;
        this.studentId = "";
        this.major = "";
        this.gpa = 0.0;
    }

    public iIU2YE8pmFgF(String name, int age, String studentId, String major, double gpa) {
        this.name = name;
        this.age = age;
        this.studentId = studentId;
        this.major = major;
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

    public String getMajor() {
        return major;
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

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGpa(double gpa) {
        if (gpa >= 0.0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }

    // 业务方法
    public void displayInfo() {
        System.out.println("学生信息:");
        System.out.println("姓名: " + name);
        System.out.println("年龄: " + age);
        System.out.println("学号: " + studentId);
        System.out.println("专业: " + major);
        System.out.println("GPA: " + gpa);
    }

    public boolean isExcellent() {
        return gpa >= 3.5;
    }

    public String getGradeLevel() {
        if (gpa >= 3.7) {
            return "A+";
        } else if (gpa >= 3.3) {
            return "A";
        } else if (gpa >= 3.0) {
            return "B+";
        } else if (gpa >= 2.7) {
            return "B";
        } else if (gpa >= 2.3) {
            return "C+";
        } else if (gpa >= 2.0) {
            return "C";
        } else {
            return "F";
        }
    }

    public void study(int hours) {
        System.out.println(name + " 学习了 " + hours + " 小时");
        if (hours > 5) {
            System.out.println("学习努力，可能提高GPA！");
        }
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", studentId='" + studentId + '\'' +
                ", major='" + major + '\'' +
                ", gpa=" + gpa +
                '}';
    }
}