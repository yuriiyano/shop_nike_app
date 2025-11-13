import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'search_modal_bloc.dart';

@RoutePage()
class SearchModalScreen extends StatelessWidget implements AutoRouteWrapper {
  const SearchModalScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchModalBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<SearchModalBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 55),
          Row(
            children: [
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  if (formBloc.searchQuery.value?.isNotEmpty ?? false) {
                    context.router.maybePop(formBloc.searchQuery.value);
                  }
                },
                child: Assets.images.shop.search.svg(width: 24),
              ),
              const SizedBox(width: 21),
              Expanded(
                child: SearchTextInputFormBuilder(
                  fieldBloc: formBloc.searchQuery,
                ),
              ),
              const SizedBox(width: 21),
              InkWell(
                onTap: () => context.router.maybePop(''),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: FontFamily.lato,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color.fromARGB(255, 118, 118, 118),
                  ),
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
          Expanded(
            child: BlocBuilder<ListFieldBloc, ListFieldBlocState>(
              bloc: formBloc.autocomplete,
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 24,
                  ),
                  itemCount: state.value.length,
                  itemBuilder: (context, index) {
                    final autofilledValue = state.value[index]
                        .toString()
                        .toLowerCase();
                    return ListTile(
                      onTap: () => context.router.maybePop(autofilledValue),
                      title: Text(
                        autofilledValue,
                        style: const TextStyle(
                          fontFamily: FontFamily.heebo,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.2,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
