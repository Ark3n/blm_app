//* Firebase auth repo

import 'package:build_launch_monetize_app/features/auth/domain/entities/app_user.dart';
import 'package:build_launch_monetize_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  // access to firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // LOGIN: email & password
  @override
  Future<AppUser?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      // attempt sign in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      // create and return user
      return AppUser(uid: userCredential.user!.uid, email: email);

      // catch any errors...
    } catch (e) {
      throw Exception(
        'Login failed $e',
      );
    }
  }

  // REGISTER: email & password
  @override
  Future<AppUser?> registerWithEmailAndPassword(
      String name, String email, String password) async {
    // attempt sign up
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // return created user.
      return AppUser(uid: userCredential.user!.uid, email: email);

      // catch any errors...
    } catch (e) {
      throw Exception('Registration failed, $e');
    }
  }

  // DELETE ACCOUNT
  @override
  Future<void> deleteUser() async {
    // attempt to delete user
    try {
      final user = firebaseAuth.currentUser;

      // check if there is a logged in user.
      if (user == null) throw Exception('No user logged in');

      // delete account
      await user.delete();

      // logout
      await logout();
    } catch (e) {
      throw Exception('Failed to delete account $e');
    }
  }

  // GET CURRENT USER
  @override
  Future<AppUser?> getCurrentUser() async {
    // get current logged in user from firebase
    final firebaseUser = firebaseAuth.currentUser;

    // no login user
    if (firebaseUser == null) return null;

    // logged in user exists
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }

  // LOGOUT
  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  // RESET PASSWORD
  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Password reset email! Check you inbox';
    } catch (e) {
      return 'An error occured, $e';
    }
  }
}
