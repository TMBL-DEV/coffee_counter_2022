import 'package:coffee_counter_2022/providers/auth_provider.dart';
import 'package:coffee_counter_2022/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: Container(
          child: TextButton(
            child: Text("github login"),
            onPressed: () => ref.read(authProvider).signInWithGitHub(context),
          ),
        ),
      ),
    );
  }
}
