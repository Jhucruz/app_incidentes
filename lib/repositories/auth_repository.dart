import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;

  bool estaLogeado() {
    return firebaseAuth.currentUser != null ? true : false;
  }
}
