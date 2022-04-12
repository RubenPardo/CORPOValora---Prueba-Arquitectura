// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dashboard/src/auth/firebase.dart';

import 'src/app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FirebaseUser("",""),
      child: DashboardApp.mock(),
    )
  );
}
