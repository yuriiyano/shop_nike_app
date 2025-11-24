import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/core/validators/index.dart';
import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';

@Injectable()
class AddToCartBloc extends FormBloc<String, String> {
  late final NumberFieldBloc itemsCount;

  final Product product;
  final CartBloc cartBloc;

  AddToCartBloc(
    @factoryParam this.product,
    @factoryParam int? cartCountInitial,
    this.cartBloc,
  ) : super(isEditing: cartCountInitial != null) {
    const minValue = 1;
    final maxValue = product.rating.count;

    itemsCount = NumberFieldBloc(
      initialValue: cartCountInitial ?? 1,
      rules: {ValidationType.onChange},
      customValidators: {
        (number) => AppValidator.numbersRange(
          string: number.toString(),
          min: minValue,
          max: maxValue,
        ),
      },
      extraData: NumberRange(min: minValue, max: maxValue),
    );

    addField(itemsCount);
  }

  @override
  FutureOr<void> onSubmit() {
    final cartProduct = CartProduct(
      product: product,
      cartCount: itemsCount.value!,
    );

    cartBloc.add(
      isEditing
          ? CartEventEditProductInCart(cartProduct: cartProduct)
          : CartEventAddProductToCart(cartProduct: cartProduct),
    );
  }
}

class NumberRange {
  final int min;
  final int max;

  const NumberRange({required this.min, required this.max});
}
