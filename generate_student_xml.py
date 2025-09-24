import xml.etree.ElementTree as ET
import uuid

# Создание корневого элемента
root = ET.Element("student")

# Добавление дочерних элементов с информацией о студенте
name = ET.SubElement(root, "name")
name.text = "Иванов Иван Иванович"

age = ET.SubElement(root, "age")
age.text = "21"

major = ET.SubElement(root, "major")
major.text = "Компьютерные науки"

university = ET.SubElement(root, "university")
university.text = "Технологический университет"

# Генерация случайного имени файла
random_filename = f"student_info_{uuid.uuid4().hex}.xml"

# Создание и запись XML в файл
tree = ET.ElementTree(root)
tree.write(random_filename, encoding="utf-8", xml_declaration=True)

print(f"XML-документ создан и сохранен в файл: {random_filename}")