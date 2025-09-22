public class TestStudent {
    public static void main(String[] args) {
        // 使用默认构造函数创建学生对象
        Student798 student1 = new Student798();
        student1.setName("张三");
        student1.setAge(20);
        student1.setStudentId("2023001");
        student1.setMajor("计算机科学");
        student1.setGpa(3.8);
        
        // 使用带参数的构造函数创建学生对象
        Student798 student2 = new Student798("李四", 19, "2023002", "软件工程", 3.2);
        
        // 显示学生信息
        student1.displayInfo();
        System.out.println();
        student2.displayInfo();
        
        System.out.println();
        // 测试其他方法
        System.out.println(student1.getName() + " 是优秀学生吗? " + (student1.isHonorStudent() ? "是" : "否"));
        System.out.println(student2.getName() + " 是优秀学生吗? " + (student2.isHonorStudent() ? "是" : "否"));
        
        System.out.println();
        student2.study(4);
        
        System.out.println();
        // 使用toString方法
        System.out.println("学生1的详细信息: " + student1.toString());
    }
}