import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context_impl.dart';
import 'package:fwc_album_app/app/core/ui/theme/theme_config.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_page.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_route.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_route.dart';
import 'package:fwc_album_app/app/pages/home/home_page.dart';
import 'package:fwc_album_app/app/pages/home/home_route.dart';
import 'package:fwc_album_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:fwc_album_app/app/pages/splash/splash_route.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repository/auth/auth_repository_impl.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>(
          (i) => GlobalContextImpl(
            navigatorKey: navigatorKey,
            authRepository: i(),
          ),
        )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Fifa World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => SplashRoute(),
          '/auth/login': (_) => LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => HomeRoute(),
          '/my-stickers': (_) => MyStickerPage(),
        },
      ),
    );
  }
}
