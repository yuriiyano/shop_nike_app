import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shop_nike_app/repositories/index.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/core/validators/index.dart';
import 'package:shop_nike_app/models/index.dart';

@Injectable()
class AddToCartBloc extends FormBloc<CartProduct, String> {
  late final NumberFieldBloc itemsCount;

  final Product product;
  final CartRepository cartRepository;

  AddToCartBloc(
    @factoryParam this.product,
    @factoryParam int? cartCountInitial,
    this.cartRepository,
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
  FutureOr<void> onSubmit() async {
    try {
      emitLoading();

      final productId = product.id;
      final cartCount = itemsCount.value!;

      final int cartCountNew;
      if (isEditing) {
        cartCountNew = await cartRepository.updateProductInCart(
          productId: productId,
          cartCount: cartCount,
        );
      } else {
        cartCountNew = await cartRepository.addProductInCart(
          productId: productId,
          cartCount: cartCount,
        );
      }

      emitSuccess(CartProduct(product: product, cartCount: cartCountNew));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emitFailure();
    }
  }
}
