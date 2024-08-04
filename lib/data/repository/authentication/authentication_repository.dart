import 'package:ecomerence_app/data/repository/user/user_repository.dart';
import 'package:ecomerence_app/features/authentication/screens/loginScreen/login.dart';
import 'package:ecomerence_app/features/authentication/screens/onBoardingScreen/onboarding_screen.dart';
import 'package:ecomerence_app/features/authentication/screens/sign_up_Screen/verify_email.dart';
import 'package:ecomerence_app/navigation_menu.dart';
import 'package:ecomerence_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecomerence_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecomerence_app/utils/exceptions/format_exceptions.dart';
import 'package:ecomerence_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Get Authenticate User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show Relevant screens
  screenRedirect() async {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenuBar());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /*-----------------------Email & Password sign-in-------------------------*/
  /// [Email Authentication] sign-in & log-in
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  /// [Email Authentication] Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  ///[Email Authentication] Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  /// [Email Authentication] forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  /*-----------------------Social Sign-in-------------------------*/
  ///[GoogleAuthentication] Google
  Future<UserCredential?> signinWithGoogle() async {
    try {
      // trigger authentication flex
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      //Auth the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once Signin , return credential
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  /// [FacebookAuthentication] Facebook

  /*-----------------------End Social Sign-in-------------------------*/
  /// [GoogleAuthentication] Log-Out
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  /// [FacebookAuthentication] Delete Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.deleteUserRecord(_auth.currentUser!.uid);
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  reAuthWithEmailAndPassword(String trim, String trim2) {}
}
