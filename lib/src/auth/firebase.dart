// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'auth.dart';

class FirebaseAuthService implements Auth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> get isSignedIn => _googleSignIn.isSignedIn();

  @override
  Future<FirebaseUser> signIn() async {
    try {
      return await _signIn();
    } on PlatformException {
      throw SignInException();
    }
  }

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount? googleUser;
    if (await isSignedIn) {
      googleUser = await _googleSignIn.signInSilently();
    } else {
      googleUser = await _googleSignIn.signIn();
    }

    var googleAuth = await googleUser!.authentication;

    var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    var authResult = await _auth.signInWithCredential(credential);
    
    return FirebaseUser(authResult.user!.uid, authResult.user!.displayName!); //Cambiado por Jesús
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }
}

class FirebaseUser extends ChangeNotifier  {
  // estado privado del objeto
  @override
  final String uid;

  String _nombre;

  String get nombre => _nombre;

  FirebaseUser(this.uid,this._nombre);

  void updateUser(FirebaseUser newUser){
    // actualizamos el usuario y notificamos a los widgets para que se repinten
   
   _nombre = newUser.nombre; 

    notifyListeners();
  }

}
