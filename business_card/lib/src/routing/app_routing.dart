import 'package:business_card/src/features/landing_page/landing_page.dart';
import 'package:business_card/src/features/login/login_page.dart';
import 'package:business_card/src/features/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
        routes: [
          GoRoute(
            path: 'login',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const LoginPage(),
            ),
          ),
          GoRoute(
            path: 'register',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const RegisterPage(),
            ),
          )
        ])
  ],
);
