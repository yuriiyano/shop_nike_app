import 'package:flutter/material.dart';

import 'package:shop_nike_app/app/index.dart';
import 'package:shop_nike_app/localization/index.dart';

void main() async {
  await initializeApp();

  runApp(
    EasyLocalization(
      path: CodegenLoader.path,
      supportedLocales: CodegenLoader.supportedLocales,
      fallbackLocale: CodegenLoader.supportedLocales.last,
      assetLoader: const CodegenLoader(),
      child: ShopNikeApp(),
    ),
  );
}
