class Car {
  String make;
  int year;

  Car(this.make, this.year);

  @override
  String toString() {
    return 'Car{make: $make, year: $year}';
  }
}