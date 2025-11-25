typedef DynamicMap = Map<String, dynamic>;
typedef StringMap = Map<String, String>;

enum AuthStatus {
  initial,
  onboarding,
  unauthenticated,
  authenticated;

  bool get isInitial => this == initial;
  bool get isOnboarding => this == onboarding;
  bool get isUnauthenticated => this == unauthenticated;
  bool get isAuthenticated => this == authenticated;
}

class NumberRange {
  final int min;
  final int max;

  const NumberRange({required this.min, required this.max});
}
