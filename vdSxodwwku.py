class Dart:
    def __init__(self, brand, year):
        self.brand = brand
        self.year = year

    def __str__(self):
        return f"Dart(brand='{self.brand}', year={self.year})"

    def __repr__(self):
        return self.__str__()