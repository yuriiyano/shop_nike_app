// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:shop_nike_app/models/index.dart' as _i19;
import 'package:shop_nike_app/screens/auth_screen.dart' as _i1;
import 'package:shop_nike_app/screens/home/dashboard/dashboard_screen.dart'
    as _i5;
import 'package:shop_nike_app/screens/home/dashboard1_test/dashboard1_screen.dart'
    as _i4;
import 'package:shop_nike_app/screens/home/favourites/favourites_screen.dart'
    as _i6;
import 'package:shop_nike_app/screens/home/home_screen.dart' as _i7;
import 'package:shop_nike_app/screens/home/home_wrapper_screen.dart' as _i8;
import 'package:shop_nike_app/screens/home/messages/chats/chats_screen.dart'
    as _i3;
import 'package:shop_nike_app/screens/home/messages/chats/pages/chat_details/chat_details_screen.dart'
    as _i2;
import 'package:shop_nike_app/screens/home/messages/messages_screen.dart'
    as _i10;
import 'package:shop_nike_app/screens/home/messages/posts/posts_screen.dart'
    as _i12;
import 'package:shop_nike_app/screens/home/settings/settings_screen.dart'
    as _i15;
import 'package:shop_nike_app/screens/home/shop/pages/product_details_screen.dart'
    as _i13;
import 'package:shop_nike_app/screens/home/shop/pages/search_modal/search_modal_screen.dart'
    as _i14;
import 'package:shop_nike_app/screens/home/shop/shop_screen.dart' as _i16;
import 'package:shop_nike_app/screens/login/login_screen.dart' as _i9;
import 'package:shop_nike_app/screens/onboarding/onboarding_screen.dart'
    as _i11;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i17.PageRouteInfo<void> {
  const AuthRoute({List<_i17.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatDetailsScreen]
class ChatDetailsRoute extends _i17.PageRouteInfo<ChatDetailsRouteArgs> {
  ChatDetailsRoute({
    _i18.Key? key,
    required _i19.Chat chat,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         ChatDetailsRoute.name,
         args: ChatDetailsRouteArgs(key: key, chat: chat),
         initialChildren: children,
       );

  static const String name = 'ChatDetailsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatDetailsRouteArgs>();
      return _i2.ChatDetailsScreen(key: args.key, chat: args.chat);
    },
  );
}

class ChatDetailsRouteArgs {
  const ChatDetailsRouteArgs({this.key, required this.chat});

  final _i18.Key? key;

  final _i19.Chat chat;

  @override
  String toString() {
    return 'ChatDetailsRouteArgs{key: $key, chat: $chat}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatDetailsRouteArgs) return false;
    return key == other.key && chat == other.chat;
  }

  @override
  int get hashCode => key.hashCode ^ chat.hashCode;
}

/// generated route for
/// [_i3.ChatsScreen]
class ChatsRoute extends _i17.PageRouteInfo<void> {
  const ChatsRoute({List<_i17.PageRouteInfo>? children})
    : super(ChatsRoute.name, initialChildren: children);

  static const String name = 'ChatsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i3.ChatsScreen());
    },
  );
}

/// generated route for
/// [_i4.Dashboard1Screen]
class Dashboard1Route extends _i17.PageRouteInfo<void> {
  const Dashboard1Route({List<_i17.PageRouteInfo>? children})
    : super(Dashboard1Route.name, initialChildren: children);

  static const String name = 'Dashboard1Route';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i4.Dashboard1Screen());
    },
  );
}

/// generated route for
/// [_i5.DashboardScreen]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i5.DashboardScreen());
    },
  );
}

/// generated route for
/// [_i6.FavouritesScreen]
class FavouritesRoute extends _i17.PageRouteInfo<void> {
  const FavouritesRoute({List<_i17.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i6.FavouritesScreen());
    },
  );
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeScreen();
    },
  );
}

/// generated route for
/// [_i8.HomeWrapperScreen]
class HomeRouter extends _i17.PageRouteInfo<void> {
  const HomeRouter({List<_i17.PageRouteInfo>? children})
    : super(HomeRouter.name, initialChildren: children);

  static const String name = 'HomeRouter';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomeWrapperScreen();
    },
  );
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i9.LoginScreen());
    },
  );
}

/// generated route for
/// [_i10.MessagesScreen]
class MessagesRoute extends _i17.PageRouteInfo<void> {
  const MessagesRoute({List<_i17.PageRouteInfo>? children})
    : super(MessagesRoute.name, initialChildren: children);

  static const String name = 'MessagesRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i10.MessagesScreen();
    },
  );
}

/// generated route for
/// [_i11.OnboardingScreen]
class OnboardingRoute extends _i17.PageRouteInfo<void> {
  const OnboardingRoute({List<_i17.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i11.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i12.PostsScreen]
class PostsRoute extends _i17.PageRouteInfo<void> {
  const PostsRoute({List<_i17.PageRouteInfo>? children})
    : super(PostsRoute.name, initialChildren: children);

  static const String name = 'PostsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i12.PostsScreen());
    },
  );
}

/// generated route for
/// [_i13.ProductDetailsScreen]
class ProductDetailsRoute extends _i17.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i18.Key? key,
    required _i19.Product product,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i13.ProductDetailsScreen(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final _i18.Key? key;

  final _i19.Product product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [_i14.SearchModalScreen]
class SearchModalRoute extends _i17.PageRouteInfo<void> {
  const SearchModalRoute({List<_i17.PageRouteInfo>? children})
    : super(SearchModalRoute.name, initialChildren: children);

  static const String name = 'SearchModalRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i14.SearchModalScreen());
    },
  );
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i15.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i16.ShopScreen]
class ShopRoute extends _i17.PageRouteInfo<void> {
  const ShopRoute({List<_i17.PageRouteInfo>? children})
    : super(ShopRoute.name, initialChildren: children);

  static const String name = 'ShopRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return _i17.WrappedRoute(child: const _i16.ShopScreen());
    },
  );
}
