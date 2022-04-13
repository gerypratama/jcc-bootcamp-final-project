class CatFact {
  String? fact;

  CatFact({this.fact});

  factory CatFact.throwFact(Map<String, dynamic> object) {
    return CatFact(fact: object['fact']);
  }
}
