import 'package:coffee_counter_2022/providers/auth_provider.dart';
import 'package:coffee_counter_2022/providers/user_provider.dart';
import 'package:coffee_counter_2022/widgets/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    // FirebaseAuth.instance.signOut();
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: Container(
          child: Text(auth.loggedInUser.displayName ?? "anonymous"),
        ),
      ),
    );
  }
}
