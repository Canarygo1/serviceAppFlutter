import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPresenter{
  final FirebaseAuth auth = FirebaseAuth.instance;
  String email;
  ResetPasswordPresenter(this.email);

  Future<void> changePassword() async {
    try {
      String emailChange = email;
      auth.setLanguageCode("es");
      await auth.sendPasswordResetEmail(
        email: emailChange,
      );
    }catch(e){
      print(e.toString());
    }
  }

}