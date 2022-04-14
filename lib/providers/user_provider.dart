import 'package:coffee_counter_2022/providers/auth_provider.dart';
import 'package:coffee_counter_2022/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    StreamProvider<User?>((ref) => ref.watch(authProvider).firebaseUser);
