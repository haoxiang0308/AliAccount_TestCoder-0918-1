import 'dart:io';

class Car {
  String make;
  int year;

  Car(this.make, this.year);

  @override
  String toString() {
    return 'Car{make: $make, year: $year}';
  }
}

void main() {
  var myCar = Car('Toyota', 2020);
  print(myCar);
  // Write the car details to a file
  var file = File('car_details_${DateTime.now().millisecondsSinceEpoch}.dart');
  file.writeAsStringSync('''
// This file was generated with car details.
${myCar.toString()}
''');
  print('Car details written to \${file.path}');
}