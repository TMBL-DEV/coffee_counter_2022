import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:github_sign_in/github_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void setUser(User user) {
    loggedInUser = user;
  }

  Stream<User?> get firebaseUser {
    return _auth.authStateChanges();
  }

  Stream<bool> get loggedIn {
    return firebaseUser.map((user) {
      return user != null;
    });
  }

  Future<UserCredential> signInWithGitHub(BuildContext context) async {
    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: dotenv.env["GITHUB_CLIENT_ID"] ?? "",
      clientSecret: dotenv.env["GITHUB_CLIENT_SECRET"] ?? "",
      redirectUrl: dotenv.env["GITHUB_REDIRECT_URL"] ?? "",
    );

    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);

    // Create a credential from the access token
    final githubAuthCredential =
        GithubAuthProvider.credential(result.token ?? "");

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(githubAuthCredential);
  }
}
