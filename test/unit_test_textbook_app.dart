import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:textbook_sharing_app/constants.dart';
import 'package:textbook_sharing_app/main.dart';
import 'package:textbook_sharing_app/models/user.dart';
import 'package:textbook_sharing_app/screens/auth/auth.dart';
import 'package:textbook_sharing_app/screens/auth/register.dart';
import 'package:textbook_sharing_app/screens/home/home.dart';
import 'package:textbook_sharing_app/screens/home/postbookpage.dart';
import 'package:textbook_sharing_app/screens/home/searchbooks.dart';
import 'package:textbook_sharing_app/screens/welcome/general_listing.dart';
import 'package:textbook_sharing_app/screens/welcome/welcomepage.dart';

void main() {

  // Test main.dart
  testWidgets('MyApp has a MaterialApp as its root',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('MyApp has a WelcomePage as its home',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(WelcomePage), findsOneWidget);
  });

  // Test PostBookPage.dart
  testWidgets('Post book page test', (WidgetTester tester) async {
    dynamic widget = const PostBookPage();
    await tester.pumpWidget(widget);

    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(TextButton), findsOneWidget);

    expect(widget._controller[0].text, isEmpty);
    expect(widget._controller[1].text, isEmpty);

    expect(widget.checkInputValues(), isFalse);

    widget._controller[0].text = "Book Name";
    widget._controller[1].text = "Book Descripton";

    expect(widget._controller[1].text, "Book Name");
    expect(widget._controller[1].text, "Book Description");
  });

  // Test General Listing Page
  testWidgets('General listing page test', (WidgetTester tester) async {
    const widget = GeneralListing(title: 'Test');
    await tester.pumpWidget(widget);

    expect(find.text('Test'), findsOneWidget);
    expect(find.byType(StreamBuilder), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
  });

  test('test firebase data grab', () {
    final genList = FirebaseFirestore.instance;
    expect(genList.collection('textbook_catalog').snapshots(), isNotNull);
  });

  test('test card display of firebase data', () async {
    final genList =
        await FirebaseFirestore.instance.collection('textbook_catalog').get();
    expect(
        ListView(
          children: genList.docs.map((doc) {
            return Card(
              child: ListTile(title: Text(doc["Name"]), onTap: () {}),
            );
          }).toList(),
        ),
        isNotNull);
  });

  // Test Input Boxes
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
  group('SearchBooks Tests', () {
    test('Test for searchBooks class', () {
      const searchBooks = SearchBooks();
      expect(searchBooks, isA<SearchBooks>());
    });

    test('Test for initSearchBooks', () {
      dynamic searchBooks = const SearchBooks();
      expect(searchBooks.initSearchBooks('text'), isA<Future<QuerySnapshot>>());
    });

    test('Test for userText', () {
      dynamic searchBooks = const SearchBooks();
      expect(searchBooks.userText, isA<String>());
    });
  });

  // Test Home Page
  test('Widget test for Home', () {
    final key = UniqueKey();
    final home = Home(key: key);
    expect(home.key, key);
    expect(home.runtimeType, Home);
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

  test('Check input values should return false if input fields are empty', (){
    List<TextEditingController> _controller = [TextEditingController(), TextEditingController()];
    _controller[0].text = '';
    _controller[1].text = '';
    expect(checkInputValues(), false);
  });

  test('Check input values should return true if input fields are filled', (){
    List<TextEditingController> _controller = [TextEditingController(), TextEditingController()];
    _controller[0].text = 'input1';
    _controller[1].text = 'input2';
    expect(checkInputValues(), true);
  });


  test('Press search books button', () {
    final key = UniqueKey();
    final home = Home(key: key);
    expect(home.key, key);
    expect(home.runtimeType, Home);

    expect(const SearchBooks(), isNotNull);
    expect(const SearchBooks(), isInstanceOf<SearchBooks>());
  });

test('Auth screen has sign in and register view when initialized', () {
    const auth = Auth();
    expect(auth.showSignIn, true);
  });

  test('Toggle view changes the view from sign in to register', () {
    const auth = Auth();
    auth.toggleView();
    expect(auth.showSignIn, false);
  });

}
