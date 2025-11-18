import 'dart:async';

import 'package:flutter/services.dart';

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
      customValidators: {CreateProductValidators.titleMin10Chars},
      data: CreateProductTextFieldExtraData(
        label: 'Title',
        hintText: 'e.g. "Red Ball"',
      ),
    );

    price = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {
        CreateProductValidators.price2Digit,
        CreateProductValidators.priceRange,
      },
      data: CreateProductTextFieldExtraData(
        label: 'Price',
        hintText: 'e.g. 12.99',
        textInputType: const TextInputType.numberWithOptions(decimal: true),
      ),
    );

    description = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {CreateProductValidators.descLen},
      data: CreateProductTextFieldExtraData(
        label: 'Description',
        hintText: 'e.g. size, color, use',
      ),
    );

    imageUrl = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {CreateProductValidators.imageUrl},
      data: CreateProductTextFieldExtraData(
        label: 'Image URL',
        hintText: 'e.g. https://example.com/img.png',
      ),
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
    } catch (e) {
      addError(e);
      emitFailure();
    }
  }

  @override
  FutureOr<void> onSubmit() async {
    try {
      final product = await productsRepository.postProduct(
        Product.idGenerated(
          title: title.value!,
          price: double.parse(price.value!),
          description: description.value!,
          image: imageUrl.value!,
          category: category.value!,
        ),
      );
      
      emitSuccess(product);
    } catch (e) {
      addError(e);
      emitFailure();
    }
  }
}

class CreateProductTextFieldExtraData {
  final String label;
  final String hintText;
  final TextInputType? textInputType;

  CreateProductTextFieldExtraData({
    required this.label,
    required this.hintText,
    this.textInputType,
  });
}
