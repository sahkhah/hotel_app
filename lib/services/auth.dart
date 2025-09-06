import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    User? user = await auth.currentUser;
    return user;
  }

  Future signOut() async {
    return await auth.signOut();
  }

  Future<String?> getUserName() async {
    String? user = await auth.currentUser!.displayName;
    return user;
  }

  Future<String?> getUserEmail() async {
    String? email = await auth.currentUser!.email;
    return email;
  }

  Future deleteUser() async {
    User? user = getCurrentUser();
    user!.delete();
  }
}
