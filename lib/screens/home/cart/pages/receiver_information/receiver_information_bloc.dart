import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/models/receiver/index.dart';
import 'package:shop_nike_app/core/validators/index.dart';

@Injectable()
class ReceiverInformationBloc extends FormBloc<ReceiverModel, String> {
  late final TextFieldBloc firstName;
  late final TextFieldBloc lastName;
  late final TextFieldBloc address;

  ReceiverInformationBloc() {
    firstName = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {
        (string) => AppValidator.fieldMinChars(string: string, min: 2),
      },
    );

    lastName = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {
        (string) => AppValidator.fieldMinChars(string: string, min: 2),
      },
    );

    address = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
      customValidators: {
        (string) => AppValidator.fieldMinChars(string: string, min: 10),
      },
    );

    addFields([firstName, lastName, address]);
  }
  @override
  FutureOr<void> onSubmit() {
    emitSuccess(
      ReceiverModel(
        firstname: firstName.value!,
        lastname: lastName.value!,
        address: address.value!,
      ),
    );
  }
}
