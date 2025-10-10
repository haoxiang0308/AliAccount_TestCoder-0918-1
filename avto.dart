class Avto {
  String marka;
  int god;

  Avto(this.marka, this.god);

  @override
  String toString() {
    return 'Avto(marka: $marka, god: $god)';
  }
}

void main() {
  var moj_avto = Avto('Tesla', 2022);
  print(moj_avto);
}