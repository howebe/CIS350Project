import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:textbook_sharing_app/constants.dart';
import 'package:textbook_sharing_app/main.dart';
import 'package:textbook_sharing_app/mock.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/screens/auth/auth.dart';
import 'package:textbook_sharing_app/screens/home/home.dart';
import 'package:textbook_sharing_app/screens/home/postbookpage.dart';
import 'package:textbook_sharing_app/screens/home/searchbookdefault.dart';
import 'package:textbook_sharing_app/screens/home/searchbooks.dart';
import 'package:textbook_sharing_app/screens/welcome/general_listing.dart';
import 'package:textbook_sharing_app/screens/welcome/welcomepage.dart';
import 'package:textbook_sharing_app/textbook.dart';

/*
This class contains all the unit tests for the flutter firebase app.
*/
void main() {

  // Create a mock for the firebase app
  setupFirebaseAuthMocks();

  // Setup firebase mock for all tests
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  // Test main.dart
  testWidgets('App contains a Material app widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  // Tests welcome page is opened by default
  testWidgets('MyApp has a WelcomePage as its home',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(WelcomePage), findsOneWidget);
  });

  // Test PostBookPage UI
  testWidgets('Post book page test', (WidgetTester tester) async {
    const PostBookPage widget = PostBookPage();
    await tester.pumpWidget(const MaterialApp(home: widget));

    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(TextButton), findsOneWidget);
  });

  // // Test General Listing Page
  testWidgets('General listing page test', (WidgetTester tester) async {
    const GeneralListing widget = GeneralListing(title: 'General Listing');
    await tester.pumpWidget(const MaterialApp(home: widget));

    expect(find.byType(GeneralListing), findsOneWidget);
    expect(find.byType(StreamBuilder<QuerySnapshot>), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  // Tests that snapshots are grabbed from the textbook catalog
  test('test firebase data grab', () {
    final genList = FirebaseFirestore.instance;
    expect(genList.collection('textbook_catalog').snapshots(), isNotNull);
  });

  // Test Input Box Decoration
  test('input decoration should have the right parameters', () {
    expect(textInputDecoration.fillColor, Colors.white);
    expect(textInputDecoration.filled, true);
    expect(textInputDecoration.enabledBorder?.borderSide.color, Colors.blue);
    expect(textInputDecoration.enabledBorder?.borderSide.width, 2.0);
    expect(textInputDecoration.focusedBorder?.borderSide.color, Colors.black);
    expect(textInputDecoration.focusedBorder?.borderSide.width, 2.0);
  });

  // Test User Class
  test('AppUser should have the right parameters', () {
    AppUser user = AppUser(uid: 'test');
    expect(user.uid, 'test');
  });

  // Test Search Books
  test('Test for searchBooks class', () {
    const searchBooks = SearchBooks();
    expect(searchBooks, isA<SearchBooks>());
  });

  // Test Home Page
  test('Widget test for Home', () {
    final key = UniqueKey();
    final home = Home(key: key);
    expect(home.key, key);
    expect(home.runtimeType, Home);
  });

  // Tests home page is setup the correct way
  testWidgets('Home page UI test', (WidgetTester tester) async{
    await tester.pumpWidget(
      MaterialApp(
        home: Home(),
      ),
    );
    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.text("Post a Book"), findsOneWidget);
    expect(find.text("Search Books"), findsOneWidget);
    expect(find.byIcon(Icons.create_outlined), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(3));
  });

  // Test Post a Book
  test('Press post a book button', () {
    final key = UniqueKey();
    final home = Home(key: key);
    expect(home.key, key);
    expect(home.runtimeType, Home);

    expect(const PostBookPage(), isNotNull);
    expect(const PostBookPage(), isInstanceOf<PostBookPage>());
  });

  // Checks input fields are not empty
  test('Check input values should return false if input fields are empty', () {
    List<TextEditingController> controller = [
      TextEditingController(),
      TextEditingController()
    ];
    String a = controller[0].text = '';
    String b = controller[1].text = '';
    expect(const PostBookPage().checkInputValues(a), false);
    expect(const PostBookPage().checkInputValues(b), false);
  });

  // Tests input fields get filled correctly
  test('Check input values should return true if input fields are filled', () {
    List<TextEditingController> controller0 = [
      TextEditingController(),
      TextEditingController()
    ];
    String a = controller0[0].text = 'input1';
    String b = controller0[1].text = 'input2';
    expect(const PostBookPage().checkInputValues(a), true);
    expect(const PostBookPage().checkInputValues(b), true);
  });

  // Tests search book is setup properly
  test('Press search books button', () {
    final key = UniqueKey();
    final home = Home(key: key);
    expect(home.key, key);
    expect(home.runtimeType, Home);

    expect(const SearchBooks(), isNotNull);
    expect(const SearchBooks(), isInstanceOf<SearchBooks>());
  });

// Tests search book UI
testWidgets('SearchBooks widget test', (WidgetTester tester) async {
    
    const SearchBooks widget = SearchBooks();
    await tester.pumpWidget(const MaterialApp(home: widget));
    
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(SearchDefault), findsOneWidget);
  });

// Test toggle views in authentication
  test('Auth screen has sign in and register view when initialized', () {
    final auth = Auth();
    expect(auth.showSignIn, true);
  });

  // Test sign in page is set to false
  test('Toggle view changes the view from sign in to register', () {
    final auth = Auth();
    auth.toggleView();
    expect(auth.showSignIn, false);
  });

  // Test Textbook Class
   test('Textbook instantiation', () {
    final Textbook textbook = Textbook('Engineering', 'Textbook for engineering 101');
    expect(textbook.name, 'Engineering');
    expect(textbook.description, 'Textbook for engineering 101');
  });

}
