import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/repositories/index.dart';

part 'dashboard1_event.dart';
part 'dashboard1_state.dart';
part 'dashboard1_bloc.freezed.dart';

@lazySingleton
class Dashboard1Bloc extends Bloc<Dashboard1Event, Dashboard1State> {
  final ProductsRepository productsRepository;

  Dashboard1Bloc({
    required this.productsRepository,
  }) : super(const Dashboard1State()) {
    on<_LoadProducts>(_loadProducts);
  }

  FutureOr<void> _loadProducts(
    _LoadProducts event,
    Emitter<Dashboard1State> emit,
  ) async {
    emit(state.copyWith(status: NetworkStatus.loading));

    try {
      final products = await productsRepository.getProducts(limit: event.limit);

      emit(Dashboard1State.success(products));
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }

}
