import 'package:demo_firbase_app/models/member.dart';
import 'package:demo_firbase_app/services/database/database_member_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Member? _userFromFireBaseUser(User? user) {
    return user != null ? Member(uid: user.uid) : null;
  }

  Stream<Member?> get onAuthStateChanged =>
      _auth.authStateChanges().map(_userFromFireBaseUser);

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      await DatabaseMemberService(uid: user?.uid).updateMemberProfileData(
          'dummy name',
          23,
          'https://www.google.com.vn/search?q=image+elden+ring&sca_esv=576723421&hl=vi&tbm=isch&sxsrf=AM9HkKmuaDIVfxwWqq9tiVMrzJQtHbfW_w:1698293920323&source=lnms&sa=X&ved=2ahUKEwjA9uDu7ZKCAxUmtlYBHQxbANkQ_AUoAXoECAEQAw&biw=1512&bih=860&dpr=2#imgrc=n9wYuJA3m9ONgM',
          'dummy description');
      return _userFromFireBaseUser(user);
    } catch (e) {
      print('Cant login anon');
      print(e.toString());
      return null;
    }
  }

  Future signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print('Cant signin email and password');
      print(e.toString());
      return null;
    }
  }

  Future registerEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseMemberService(uid: user?.uid).updateMemberProfileData(
          'dummy name',
          23,
          'https://www.google.com.vn/search?q=image+elden+ring&sca_esv=576723421&hl=vi&tbm=isch&sxsrf=AM9HkKmuaDIVfxwWqq9tiVMrzJQtHbfW_w:1698293920323&source=lnms&sa=X&ved=2ahUKEwjA9uDu7ZKCAxUmtlYBHQxbANkQ_AUoAXoECAEQAw&biw=1512&bih=860&dpr=2#imgrc=n9wYuJA3m9ONgM',
          'dummy description');
      return _userFromFireBaseUser(user);
    } catch (e) {
      print('Cant register email and password');
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
