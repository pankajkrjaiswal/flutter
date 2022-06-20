import 'package:google_sign_in/google_sign_in.dart';
import 'package:youtube_clone/common/model/data_response.dart';

class UserRepository {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  fetchInitialState() {}
  Future<DataResponse> loginWithGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      await _googleSignIn.signOut();
      _googleSignIn.signIn();
      return DataResponse.success(data: true);
    } catch (e) {
      return DataResponse.error(message: e.toString());
    }
  }
}
