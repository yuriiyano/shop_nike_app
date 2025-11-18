import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'create_product_modal_bloc.dart';

@RoutePage()
class CreateProductModalScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const CreateProductModalScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateProductModalBloc>()..initialize(),
      child: this,
    );
  }

  @override
  State<CreateProductModalScreen> createState() =>
      _CreateProductModalScreenState();
}

class _CreateProductModalScreenState extends State<CreateProductModalScreen> {
  late List<FocusNode> fieldFocusNodes = [];

  @override
  void initState() {
    super.initState();
    context
        .read<CreateProductModalBloc>()
        .fields
        .values
        .whereType<TextFieldBloc>()
        .forEach((fieldBloc) {
          fieldFocusNodes.add(FocusNode(debugLabel: fieldBloc.name));
        });
  }

  @override
  void dispose() {
    for (final focusNode in fieldFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<CreateProductModalBloc>();

    return CustomFormBlocListener<CreateProductModalBloc, Product>(
      formBloc: formBloc,
      onSuccess: (context, state) => context.router.maybePop(state.response),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Create Product',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: FontFamily.heebo,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
            ),
          ),
          leading: IconButton(
            onPressed: () => context.router.maybePop(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            iconSize: 24,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...formBloc.fields.values
                        .whereType<TextFieldBloc>()
                        .toList()
                        .asMap()
                        .entries
                        .map(
                          (entry) {
                            final idx = entry.key;
                            final fieldBloc = entry.value;
                            return [
                              TextInputFormBuilder(
                                fieldBloc: fieldBloc,
                                fieldFocusNode: fieldFocusNodes[idx],
                                nextFieldFocusNode:
                                    idx < fieldFocusNodes.length - 1
                                    ? fieldFocusNodes[idx + 1]
                                    : null,
                                hintText:
                                    (fieldBloc.data
                                            as CreateProductTextFieldExtraData)
                                        .hintText,
                                label:
                                    (fieldBloc.data
                                            as CreateProductTextFieldExtraData)
                                        .label,
                                textInputType:
                                    (fieldBloc.data
                                            as CreateProductTextFieldExtraData)
                                        .textInputType,
                              ),
                              const SizedBox(height: 20),
                            ];
                          },
                        )
                        .flattened,
                    FormFieldSection(
                      name: 'Category',
                      horizontalPadding: 0,
                      child: RadioSelectFormBuilder<String>(
                        fieldBloc: formBloc.category,
                        optionLabel: (category) => category,
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ColoredBox(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(
                      color: Color.fromARGB(255, 228, 228, 228),
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
                      child: CustomOutlinedButton(
                        text: 'Create',
                        onPressed: formBloc.submit,
                        width: double.infinity,
                        backgroundColor: Colors.black,
                        borderColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
