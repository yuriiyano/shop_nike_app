class CreateProductValidators {
  CreateProductValidators._();

  static final _imageUrlRegExp = RegExp(
    r'^(https?:\/\/)?'
    r'([\w\-]+\.)+[\w]{2,}'
    r'(\/[\w\-./?%&=]*)?'
    r'\.(?:jpg|jpeg|png|gif|webp|bmp|svg)$',
    caseSensitive: false,
  );

  static String? titleMin10Chars(String? string) {
    if (string == null || string.isEmpty || string.length >= 10) {
      return null;
    }
    return CreateProductValidatorsErrors._titleMin10Chars;
  }

  static String? price2Digit(String? string) {
    final priceRegExp = RegExp(r'^(0|[1-9]\d*)(\.\d{1,2})?$');
    if (string == null || string.isEmpty || priceRegExp.hasMatch(string)) {
      return null;
    }
    return CreateProductValidatorsErrors._price2Digit;
  }

  static String? priceRange(String? string) {
    if (string != null && string.isNotEmpty) {
      final price = double.tryParse(string);
      if (price != null && price >= 1 && price <= 10000) {
        return null;
      }
    }
    return CreateProductValidatorsErrors._priceRange;
  }

  static String? descLen(String? string) {
    if (string == null ||
        string.isEmpty ||
        string.length >= 20 && string.length <= 200) {
      return null;
    }
    return CreateProductValidatorsErrors._descLen;
  }

  static String? imageUrl(String? string) {
    if (string == null || string.isEmpty || _imageUrlRegExp.hasMatch(string)) {
      return null;
    }
    return CreateProductValidatorsErrors._imageUrl;
  }
}

class CreateProductValidatorsErrors {
  CreateProductValidatorsErrors._();

  static const _titleMin10Chars = 'Title length must be at least 10 characters';
  static const _price2Digit =
      'Price is allowed with only up to 2 decimal places';
  static const _priceRange = 'Price must be between 1 and 10000';
  static const _descLen =
      'Description length must be between 20 to 200 characters';
  static const _imageUrl = 'Please, enter valid image url';
}
