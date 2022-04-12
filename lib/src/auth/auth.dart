// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'firebase.dart';

abstract class Auth {
  Future<bool> get isSignedIn;
  Future<FirebaseUser> signIn();
  Future signOut();
}

abstract class User {
  String get uid;
}

class SignInException implements Exception {}
