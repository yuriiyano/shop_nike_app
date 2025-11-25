import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/models/receiver/index.dart';
import 'receiver_information_bloc.dart';

@RoutePage()
class ReceiverInformationScreen extends StatelessWidget implements AutoRouteWrapper {
  const ReceiverInformationScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReceiverInformationBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<ReceiverInformationBloc>();

    return CustomFormBlocListener<ReceiverInformationBloc, ReceiverModel>(
      formBloc: formBloc,
      onSuccess: (context, state) => context.router.maybePop(state.response),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Receiver Information',
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
                    TextInputFormBuilder(
                      fieldBloc: formBloc.firstName,
                      label: 'Firstname',
                      hintText: 'e.g. "Yurii"',
                    ),
                    const SizedBox(height: 20),
                    TextInputFormBuilder(
                      fieldBloc: formBloc.lastName,
                      label: 'Lastname',
                      hintText: 'e.g. "Yano"',
                      textInputType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      enableInteractiveSelection: false,
                    ),
                    const SizedBox(height: 20),
                    TextInputFormBuilder(
                      fieldBloc: formBloc.address,
                      label: 'Description',
                      hintText: 'e.g. Stetsenka 7/13',
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
                        text: 'Checkout',
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
