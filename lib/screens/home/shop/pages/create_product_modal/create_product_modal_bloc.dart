import 'dart:async';

import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/core/validators/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

@Injectable()
class CreateProductModalBloc extends FormBloc<Product, String> {
  late TextFieldBloc title;
  late TextFieldBloc price;
  late TextFieldBloc description;
  late TextFieldBloc imageUrl;
  late SelectFieldBloc<String> category;

  final CategoriesBloc categoriesBloc;
  final ProductsRepository productsRepository;

  CreateProductModalBloc({
    required this.categoriesBloc,
    required this.productsRepository,
  }) {
    title = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {
        (value) => AppValidator.fieldMinChars(string: value, min: 10),
      },
    );

    price = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {
        (value) => AppValidator.numbersRange(string: value, min: 10, max: 1000),
        AppValidator.validateNoLeadingZeros,
        (value) => AppValidator.validateDecimalPlaces(string: value),
      },
    );

    description = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {
        (value) => AppValidator.charsRange(string: value, min: 20, max: 200),
      },
    );

    imageUrl = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {AppValidator.imageUrl},
    );

    category = SelectFieldBloc(
      required: true,
    );

    addFields([
      title,
      price,
      description,
      imageUrl,
      category,
    ]);
  }

  @override
  FutureOr<void> onInitialize(Map<String, dynamic> params) async {
    emitLoading();

    try {
      final state = await categoriesBloc.loadAsyncFuture();
      final categoriesList = state.data;

      category
        ..changeOptions(categoriesList)
        ..changeValue(categoriesList.first);
      emitInitial();
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emitFailure();
    }
  }

  @override
  FutureOr<void> onSubmit() async {
    try {
      final product = await productsRepository.createProduct(
        Product(
          title: title.value!,
          price: double.parse(price.value!),
          description: description.value!,
          image: imageUrl.value!,
          category: category.value!,
        ),
      );

      emitSuccess(product);
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emitFailure();
    }
  }
}
