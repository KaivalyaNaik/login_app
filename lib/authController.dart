import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  Future<void> _createUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Error :$e");
    } catch (e) {
      print("Error :$e");
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Error:$e");
    } catch (e) {
      print("Error:$e");
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error:$e");
    }
  }
}
