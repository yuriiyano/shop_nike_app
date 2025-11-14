// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:shop_nike_app/blocs/auth/auth_bloc.dart' as _i641;
import 'package:shop_nike_app/blocs/auth/onboarding_state_storage.dart'
    as _i454;
import 'package:shop_nike_app/repositories/auth_repository.dart' as _i380;
import 'package:shop_nike_app/repositories/chats_repository.dart' as _i970;
import 'package:shop_nike_app/repositories/favorite_products/favorite_products_repository.dart'
    as _i990;
import 'package:shop_nike_app/repositories/favorite_products/favorite_products_storage.dart'
    as _i552;
import 'package:shop_nike_app/repositories/index.dart' as _i893;
import 'package:shop_nike_app/repositories/posts_repository.dart' as _i399;
import 'package:shop_nike_app/repositories/products_repository.dart' as _i616;
import 'package:shop_nike_app/repositories/user_repository.dart' as _i447;
import 'package:shop_nike_app/screens/home/dashboard/dashboard_bloc.dart'
    as _i260;
import 'package:shop_nike_app/screens/home/dashboard1_test/bloc/dashboard1_bloc.dart'
    as _i392;
import 'package:shop_nike_app/screens/home/messages/chats/bloc/chats_bloc.dart'
    as _i468;
import 'package:shop_nike_app/screens/home/messages/posts/posts_bloc.dart'
    as _i53;
import 'package:shop_nike_app/screens/home/shop/bloc/shop_bloc.dart' as _i711;
import 'package:shop_nike_app/screens/home/shop/pages/search_modal/search_modal_bloc.dart'
    as _i720;
import 'package:shop_nike_app/screens/login/login_form_bloc.dart' as _i1015;
import 'package:shop_nike_app/services/http/http_client.dart' as _i776;
import 'package:shop_nike_app/services/http/index.dart' as _i892;
import 'package:shop_nike_app/services/index.dart' as _i869;
import 'package:shop_nike_app/services/message/implementation/toast_message_service.dart'
    as _i1050;
import 'package:shop_nike_app/services/message/index.dart' as _i301;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i720.SearchModalBloc>(() => _i720.SearchModalBloc());
    gh.factory<_i552.FavoriteProductsStorage>(
      () => _i552.FavoriteProductsStorage(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i990.FavoriteProductsRepository>(
      () => _i990.FavoriteProductsRepository(
        favoriteProductsStorage: gh<_i552.FavoriteProductsStorage>(),
      ),
    );
    gh.factory<_i970.ChatsRepository>(
      () => _i970.ChatsRepository(gh<_i892.HttpClient>()),
    );
    gh.factory<_i399.PostsRepository>(
      () => _i399.PostsRepository(gh<_i892.HttpClient>()),
    );
    gh.factory<_i616.ProductsRepository>(
      () => _i616.ProductsRepository(gh<_i869.HttpClient>()),
    );
    gh.lazySingleton<_i260.DashboardBloc>(
      () => _i260.DashboardBloc(
        productsRepository: gh<_i893.ProductsRepository>(),
      ),
    );
    gh.lazySingleton<_i392.Dashboard1Bloc>(
      () => _i392.Dashboard1Bloc(
        productsRepository: gh<_i893.ProductsRepository>(),
      ),
    );
    gh.lazySingleton<_i711.ShopBloc>(
      () => _i711.ShopBloc(
        productsRepository: gh<_i893.ProductsRepository>(),
        favoriteProductsRepository: gh<_i893.FavoriteProductsRepository>(),
      ),
    );
    gh.lazySingleton<_i468.ChatsBloc>(
      () => _i468.ChatsBloc(chatsRepository: gh<_i893.ChatsRepository>()),
    );
    gh.lazySingleton<_i53.PostsBloc>(
      () => _i53.PostsBloc(postsRepository: gh<_i893.PostsRepository>()),
    );
    return this;
  }

  // initializes the registration of auth-scope dependencies inside of GetIt
  _i174.GetIt initAuthScope({_i174.ScopeDisposeFunc? dispose}) {
    return _i526.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i526.GetItHelper gh) {
        gh.singleton<_i301.MessageService>(() => _i1050.ToastMessageService());
        gh.factory<_i454.OnboardingStateStorage>(
          () => _i454.OnboardingStateStorage(gh<_i460.SharedPreferences>()),
        );
        gh.singleton<_i776.HttpClient>(
          () => _i776.HttpClient(messageService: gh<_i869.MessageService>()),
        );
        gh.factory<_i380.AuthRepository>(
          () => _i380.AuthRepository(gh<_i892.HttpClient>()),
        );
        gh.factory<_i447.UserRepository>(
          () => _i447.UserRepository(gh<_i892.HttpClient>()),
        );
        gh.factory<_i1015.LoginFormBloc>(
          () =>
              _i1015.LoginFormBloc(authRepository: gh<_i380.AuthRepository>()),
        );
        gh.singleton<_i641.AuthBloc>(
          () => _i641.AuthBloc(
            authRepository: gh<_i893.AuthRepository>(),
            userRepository: gh<_i893.UserRepository>(),
            onboardingStorage: gh<_i454.OnboardingStateStorage>(),
          ),
        );
      },
    );
  }
}
