abstract final class AppValidator {
  static String? fieldMinChars({required String? string, required int min}) {
    if (string == null ||
        string.trim().isEmpty ||
        string.trim().length >= min) {
      return null;
    }
    return 'Field length must be at least $min character${min == 1 ? '' : 's'}';
  }

  static String? validateNoLeadingZeros(String? string) {
    final value = string?.trim();
    if (value == null || value.isEmpty) {
      return 'Number must not contain leading zeros';
    }

    final noLeadingZeroRegExp = RegExp(r'^(0([.,]\d+)?|[1-9]\d*([.,]\d+)?)$');

    if (!noLeadingZeroRegExp.hasMatch(value)) {
      return 'Number must not contain leading zeros';
    }
    return null;
  }

  static String? validateDecimalPlaces({
    required String? string,
    int maxDecimals = 2,
  }) {
    final decimalPlacesRegExp = RegExp(
      r'^\d+([.,](\d{1,' + maxDecimals.toString() + r'}))?$',
    );

    if (string == null ||
        string.isEmpty ||
        !decimalPlacesRegExp.hasMatch(string)) {
      return 'Maximum $maxDecimals decimal places allowed';
    }
    return null;
  }

  static String? numbersRange({
    required String? string,
    required int min,
    required int max,
  }) {
    if (string != null && string.isNotEmpty) {
      print(string);
      final number = double.tryParse(string.replaceAll(',', '.'));
      print(number);
      if (number != null && number >= min && number <= max) {
        return null;
      }
    }
    return 'Number must be between $min and $max';
  }

  static String? charsRange({
    required String? string,
    required int min,
    required int max,
  }) {
    if (string == null ||
        string.trim().isEmpty ||
        string.trim().length >= min && string.trim().length <= max) {
      return null;
    }
    return 'Field length must be between $min and $max chars';
  }

  static String? imageUrl(String? string) {
    final imageUrlRegExp = RegExp(
      r'^(https?:\/\/)?'
      r'([\w\-]+\.)+[\w]{2,}'
      r'(\/[\w\-./?%&=]*)?'
      r'\.(?:jpg|jpeg|png|gif|webp|bmp|svg)$',
      caseSensitive: false,
    );

    if (string == null || string.isEmpty || imageUrlRegExp.hasMatch(string)) {
      return null;
    }
    return 'Enter valid image URL';
  }
}
