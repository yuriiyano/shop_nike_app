import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'app_state_wrapper.dart';

class ShopNikeApp extends StatelessWidget {
  ShopNikeApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getAppTheme(context),
        builder: (context, child) {
          return AppUpgraderDialog(
            navigatorKey: _appRouter.navigatorKey,
            child: BotToastInit()(context, child),
          );
        },
        routerConfig: _appRouter.config(
          navigatorObservers: () => [RouterObserver(LoggerService.instance)],
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
