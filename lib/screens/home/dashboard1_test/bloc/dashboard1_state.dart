part of 'dashboard1_bloc.dart';

@freezed
sealed class Dashboard1State with _$Dashboard1State {
  const factory Dashboard1State({
    @Default(NetworkStatus.loading) NetworkStatus status,
    @Default([]) List<Product> products,
    String? errorMessage,
  }) = _Dashboard1State;

  factory Dashboard1State.success(List<Product> products) =>
      Dashboard1State(
        status: NetworkStatus.success,
        products: products,
      );
}
