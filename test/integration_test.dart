import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:textbook_sharing_app/mock.dart';
import 'package:textbook_sharing_app/screens/auth/auth.dart';
import 'package:textbook_sharing_app/services/auth.dart';
import 'package:textbook_sharing_app/services/database.dart';

class MockAuth extends Mock implements AuthService {}

class MockDatabase extends Mock implements DatabaseService {}

/*
This class contains integration tests for the flutter firebase app.
*/
void main() {

  // Setup firebase mock
  setupFirebaseAuthMocks();

  // Create firebase app for all tests
  setUpAll(() async {
    await Firebase.initializeApp();
  });
 

  // Test toggle between all auth screens
 test('toggleView() toggles showSignIn', () {
    final auth = Auth();
    expect(auth.getShowSignIn(), true);
    auth.toggleView();
    expect(auth.getShowSignIn(), false);
  });
}