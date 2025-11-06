// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:shop_nike_app/models/index.dart' as _i14;
import 'package:shop_nike_app/screens/auth_screen.dart' as _i1;
import 'package:shop_nike_app/screens/home/dashboard/dashboard_screen.dart'
    as _i4;
import 'package:shop_nike_app/screens/home/home_screen.dart' as _i5;
import 'package:shop_nike_app/screens/home/home_wrapper_screen.dart' as _i6;
import 'package:shop_nike_app/screens/home/messages/chats/chats_screen.dart'
    as _i3;
import 'package:shop_nike_app/screens/home/messages/chats/pages/chat_details/chat_details_screen.dart'
    as _i2;
import 'package:shop_nike_app/screens/home/messages/messages_screen.dart'
    as _i8;
import 'package:shop_nike_app/screens/home/messages/posts/posts_screen.dart'
    as _i10;
import 'package:shop_nike_app/screens/home/settings/settings_screen.dart'
    as _i11;
import 'package:shop_nike_app/screens/login/login_screen.dart' as _i7;
import 'package:shop_nike_app/screens/onboarding/onboarding_screen.dart' as _i9;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute({List<_i12.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatDetailsScreen]
class ChatDetailsRoute extends _i12.PageRouteInfo<ChatDetailsRouteArgs> {
  ChatDetailsRoute({
    _i13.Key? key,
    required _i14.Chat chat,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         ChatDetailsRoute.name,
         args: ChatDetailsRouteArgs(key: key, chat: chat),
         initialChildren: children,
       );

  static const String name = 'ChatDetailsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatDetailsRouteArgs>();
      return _i2.ChatDetailsScreen(key: args.key, chat: args.chat);
    },
  );
}

class ChatDetailsRouteArgs {
  const ChatDetailsRouteArgs({this.key, required this.chat});

  final _i13.Key? key;

  final _i14.Chat chat;

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
class ChatsRoute extends _i12.PageRouteInfo<void> {
  const ChatsRoute({List<_i12.PageRouteInfo>? children})
    : super(ChatsRoute.name, initialChildren: children);

  static const String name = 'ChatsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i3.ChatsScreen());
    },
  );
}

/// generated route for
/// [_i4.DashboardScreen]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeWrapperScreen]
class HomeRouter extends _i12.PageRouteInfo<void> {
  const HomeRouter({List<_i12.PageRouteInfo>? children})
    : super(HomeRouter.name, initialChildren: children);

  static const String name = 'HomeRouter';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeWrapperScreen();
    },
  );
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i7.LoginScreen());
    },
  );
}

/// generated route for
/// [_i8.MessagesScreen]
class MessagesRoute extends _i12.PageRouteInfo<void> {
  const MessagesRoute({List<_i12.PageRouteInfo>? children})
    : super(MessagesRoute.name, initialChildren: children);

  static const String name = 'MessagesRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.MessagesScreen();
    },
  );
}

/// generated route for
/// [_i9.OnboardingScreen]
class OnboardingRoute extends _i12.PageRouteInfo<void> {
  const OnboardingRoute({List<_i12.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i10.PostsScreen]
class PostsRoute extends _i12.PageRouteInfo<void> {
  const PostsRoute({List<_i12.PageRouteInfo>? children})
    : super(PostsRoute.name, initialChildren: children);

  static const String name = 'PostsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i10.PostsScreen());
    },
  );
}

/// generated route for
/// [_i11.SettingsScreen]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsScreen();
    },
  );
}
