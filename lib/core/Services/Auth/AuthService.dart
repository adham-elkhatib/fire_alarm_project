import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Data/Model/App User/app_user.model.dart';
import '../../../Data/Model/gender.enum.dart';
import '../../../Data/Repositories/user.repo.dart';
import '../../../core/utils/SnackBar/snackbar.helper.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String address,
    required GeoPoint homeLocation,
    required Gender gender,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await AppUserRepo().createSingle(
        AppUser(
          id: userCredential.user!.uid,
          email: email,
          name: fullName,
          gender: gender,
          address: address,
          homeLocation: homeLocation,
        ),
        itemId: userCredential.user!.uid,
      );
      return true;
    } catch (e) {
      SnackbarHelper.showTemplated(context,
          content: Text('Error: ${e.toString()}'), title: 'Signup Error');
      return false;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser? user;
      if (userCredential.user != null) {
        user = await AppUserRepo().readSingle(userCredential.user!.uid);
      }
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackbarHelper.showTemplated(context,
            content: const Text('No user found for that email.'),
            title: "Invalid User");
      } else if (e.code == 'wrong-password') {
        SnackbarHelper.showTemplated(context,
            title: 'Wrong password.',
            content: const Text("Wrong password provided for that user."));
      }
      return null;
    } catch (e) {
      print('Sign in failed: $e');
      return null;
    }
  }

  Stream<User?> isUserLoggedIn() {
    return _auth.authStateChanges();
  }

  String getCurrentUserId() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return '';
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out failed: $e');
    }
  }
}
