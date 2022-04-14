import 'dart:async';
import 'package:coffee_counter_2022/providers/user_provider.dart';
import 'package:coffee_counter_2022/routes.dart';
import 'package:coffee_counter_2022/screens/account_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_sign_in/github_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return user.when(
      data: (user) {
        return MaterialApp(
          routes: appRoutes,
        );
      },
      error: (e, s) => Text("error"),
      loading: () => Text("loading"),
    );
  }
}
