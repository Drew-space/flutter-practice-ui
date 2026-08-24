import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static bool _isInitialized = false;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  static Future<void> initialize() async {
    if (!_isInitialized) {
      await GoogleSignIn.instance.initialize();
      _isInitialized = true;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await initialize();

      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final idToken = googleUser.authentication.idToken;

      const List<String> scopes = ['email', 'profile'];
      final authorization = await googleUser.authorizationClient
          .authorizeScopes(scopes);

      final accessToken = authorization?.accessToken;
      if (accessToken == null) {
        throw Exception('Failed to get access token');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.disconnect();
    await _auth.signOut();
  }
}
