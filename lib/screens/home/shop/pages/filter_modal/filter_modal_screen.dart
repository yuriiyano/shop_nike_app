import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/buttons/index.dart';
import 'package:shop_nike_app/widgets/form_builder/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'filter_modal_bloc.dart';
import 'widgets/index.dart';

@RoutePage()
class FilterModalScreen extends StatelessWidget implements AutoRouteWrapper {
  const FilterModalScreen({super.key, required this.initialFilter});

  final ProductFilterModel? initialFilter;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FilterModalBloc>(param1: initialFilter)..initialize(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 24;

    final formBloc = context.read<FilterModalBloc>();

    return CustomFormBlocListener<FilterModalBloc, ProductFilterModel>(
      formBloc: formBloc,
      onSuccess: (context, state) {
        context.router.maybePop(state.response);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 36,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Filter',
                            style: TextStyle(
                              fontFamily: FontFamily.heebo,
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.router.maybePop(
                                ProductFilterModel.empty(),
                              );
                            },
                            icon: const Icon(
                              Icons.cancel,
                              size: 34,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FilterSection(
                      name: 'Sort By',
                      child: RadioSelectFormBuilder<ProductSortOrderType>(
                        fieldBloc: formBloc.productSort,
                        optionLabel: (orderType) {
                          return orderType.label;
                        },
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 228, 228, 228),
                      height: 2,
                    ),
                    FilterSection(
                      name: 'Shop By Price',
                      child: MultiSelectFormBuilder<PriceRange>(
                        fieldBloc: formBloc.priceRanges,
                        optionLabel: (priceRange) {
                          return priceRange.label;
                        },
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 228, 228, 228),
                      height: 2,
                    ),
                    FilterSection(
                      name: 'Shop By Categoty',
                      child: MultiSelectFormBuilder<String>(
                        fieldBloc: formBloc.categories,
                        optionLabel: (category) {
                          return category;
                        },
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
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
                      const SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomOutlinedButton(
                                text: 'Reset',
                                onPressed: formBloc.clear,
                                width: double.infinity,
                                textColor: Colors.black,
                                backgroundColor: Colors.white,
                                borderColor: const Color.fromARGB(
                                  255,
                                  228,
                                  228,
                                  228,
                                ),
                              ),
                            ),
                            const SizedBox(width: 9),
                            Expanded(
                              child: StreamBuilder(
                                stream: formBloc.selectedFiltersCountStream,
                                builder: (context, snapshot) {
                                  final appliedFiltersNumber =
                                      (snapshot.data ?? []).sum;
                                  return CustomOutlinedButton(
                                    text:
                                        'Apply ${appliedFiltersNumber > 0 ? '($appliedFiltersNumber)' : ''}',
                                    onPressed: formBloc.submit,
                                    width: double.infinity,
                                    backgroundColor: Colors.black,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
