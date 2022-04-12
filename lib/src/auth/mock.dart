// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'auth.dart';
import 'firebase.dart';

class MockAuthService implements Auth {
  @override
  Future<bool> get isSignedIn async => false;

  @override
  Future<FirebaseUser> signIn() async {
    return MockUser("123","NOMBRE SIGN IN");
  }

  @override
  Future signOut() async {
    return null;
  }
}

class MockUser extends FirebaseUser {
  
  MockUser(String uid, String nombre) : super(uid, nombre);
}
