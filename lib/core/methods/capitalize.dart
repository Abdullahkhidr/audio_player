extension Capitalize on String {
  String get capitalize {
    return split(' ').map((e) => e[0].toUpperCase() + e.substring(1)).join(' ');
  }
}
