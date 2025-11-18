import 'dart:async';

import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:shop_nike_app/repositories/index.dart';
import 'package:shop_nike_app/models/index.dart';

@Injectable()
class FilterModalBloc extends FormBloc<ProductFilterModel, String> {
  late final SelectFieldBloc<ProductSortOrderType> productSort;
  late final MultiSelectFieldBloc<PriceRange> priceRanges;
  late final MultiSelectFieldBloc<String> categories;
  late final Stream<List<int>> selectedFiltersCountStream;

  final ProductFilterModel? initialFilter;
  final CategoriesRepository categoriesRepository;

  FilterModalBloc({
    @factoryParam this.initialFilter,
    required this.categoriesRepository,
  }) {
    productSort = SelectFieldBloc(
      options: ProductSortOrderType.values,
      initialValue: initialFilter?.productSortOrderType,
    );

    priceRanges = MultiSelectFieldBloc(
      options: [
        const PriceRange(min: 0, max: 25),
        const PriceRange(min: 25, max: 50),
        const PriceRange(min: 50, max: 100),
        const PriceRange(min: 100, max: 150),
        const PriceRange(min: 150),
      ],
      initialValue: initialFilter?.priceRange ?? const [],
    );

    categories = MultiSelectFieldBloc();

    addFields([
      productSort,
      priceRanges,
      categories,
    ]);

    selectedFiltersCountStream = Rx.combineLatestList<int>(
      fields.values
          .whereType<SingleFieldBloc>()
          .map((fieldBloc) {
            return fieldBloc.valueStream.startWith(fieldBloc.value);
          })
          .map((valueStream) {
            return valueStream.map<int>(
              (value) => (value is List)
                  ? value.length
                  : value != null
                  ? 1
                  : 0,
            );
          }),
    );
  }

  @override
  FutureOr<void> onInitialize(Map<String, dynamic> params) async {
    emitLoading();

    try {
      final categoriesData = await categoriesRepository.getCategories();
      categories
        ..changeOptions(categoriesData)
        ..changeValue(initialFilter?.categories ?? []);

      emitInitial();
    } catch (e) {
      addError(e);
      emitFailure();
    }
  }

  @override
  FutureOr<void> onSubmit() {
    emitSuccess(
      ProductFilterModel(
        productSortOrderType: productSort.value,
        priceRange: priceRanges.value,
        categories: categories.value,
      ),
    );
  }

}
