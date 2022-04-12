// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:web_dashboard/src/auth/firebase.dart';

import '../api/api.dart';
import '../app.dart';
import '../widgets/categories_dropdown.dart';
import '../widgets/dialogs.dart';

class ActualizarUserPage extends StatefulWidget {
  const ActualizarUserPage({Key? key}) : super(key: key);

  @override
  _ActualizarUserPageState createState() => _ActualizarUserPageState();
}

class _ActualizarUserPageState extends State<ActualizarUserPage> {
  
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    return Column(
      children: [
        TextFormField(
          controller: myController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
              onChanged: (newValue) {
                
              },
        ),
        ElevatedButton(
          child: Text("Actualizar"),
          onPressed: (){
              Provider.of<FirebaseUser>(context, listen: false).updateUser(new FirebaseUser("123", myController.value.text));
          }), 
      ],
    );
  }
}
