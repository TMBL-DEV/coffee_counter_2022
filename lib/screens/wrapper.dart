import 'package:coffee_counter_2022/providers/auth_provider.dart';
import 'package:coffee_counter_2022/providers/user_provider.dart';
import 'package:coffee_counter_2022/screens/home_screen.dart';
import 'package:coffee_counter_2022/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final auth = ref.watch(authProvider);
    return user.when(
        data: (value) {
          if (value != null) {
            auth.setUser(value);
            return HomeScreen();
          }

          return LoginScreen();
        },
        error: (e, s) => Text(e.toString()),
        loading: () => const Text("loading"));
  }
}
