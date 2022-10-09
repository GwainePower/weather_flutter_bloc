// Данное расширение позволяет озаглавить строку
extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}

// Расширение конвертирует число в строчные градусы
extension NumExtension on num {
  String degreefy() => '${toStringAsFixed(0)}°';
}
