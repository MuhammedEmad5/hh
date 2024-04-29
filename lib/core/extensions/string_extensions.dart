extension StringExtension on String {
  bool isValidName() {
    //withoutNumber
    return RegExp(r'^[\sa-zA-Z\u0621-\u064A]{3,}$').hasMatch(this);
  }

  bool isValidNumber() {
    return double.tryParse(this) != null;
  }
}
