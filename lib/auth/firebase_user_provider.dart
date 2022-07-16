import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TodoAppFirebaseUser {
  TodoAppFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TodoAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TodoAppFirebaseUser> todoAppFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TodoAppFirebaseUser>(
        (user) => currentUser = TodoAppFirebaseUser(user));
