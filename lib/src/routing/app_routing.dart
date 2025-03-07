import 'package:business_card/src/features/design_card/fill_info_page.dart';
import 'package:business_card/src/features/design_card/preview_page.dart';
import 'package:business_card/src/features/landing_page/landing_page.dart';
import 'package:business_card/src/features/login/login_page.dart';
import 'package:business_card/src/features/register/register_page.dart';
import 'package:business_card/src/features/design_card/select_design_page.dart';
import 'package:business_card/src/features/scan_card/scan_page.dart';
import 'package:business_card/src/models_classes/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home_page/home_page.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Auth().checkUser(),
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
            child: LoginPage(),
          ),
        ),
        GoRoute(
          path: 'register',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const RegisterPage(),
          ),
        ),
        GoRoute(
            path: 'design',
            builder: (context, state) => const SelectDesignPage(),
            routes: [
              GoRoute(
                  path: 'modify',
                  builder: (context, state) => const DesignCardPage(),
                  routes: [
                    GoRoute(
                      path: "preview",
                      builder: (context, state) => const PreviewCardPage(),
                    )
                  ])
            ]),
      ],
    ),
    GoRoute(
        path: "/home",
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: "scan",
            pageBuilder: (context, state) => MaterialPage(
              child: const ScanQrPage(),
              key: state.pageKey,
              fullscreenDialog: true,
            ),
          )
        ])
  ],
);
