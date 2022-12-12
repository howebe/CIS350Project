// ignore: depend_on_referenced_packages
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

import 'package:flutter/services.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

/*
Used to setup a mock firebase app for running the
app during testing.
*/

typedef Callback = void Function(MethodCall call);

// Create firebase mock to simulate firebase
void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseCoreMocks();
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}
