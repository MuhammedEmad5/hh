extension BoolExtension on bool {
  String toStringInQuotes() => this ? "'true'" : "'false'";
}