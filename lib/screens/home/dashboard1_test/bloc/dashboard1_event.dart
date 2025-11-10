part of 'dashboard1_bloc.dart';

@freezed
sealed class Dashboard1Event with _$Dashboard1Event {
  const factory Dashboard1Event.loadProducts({required int limit}) =
      _LoadProducts;
}
