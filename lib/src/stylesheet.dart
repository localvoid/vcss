// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.stylesheet;

import 'builder.dart';

abstract class StyleSheet {
  static int __nextId = 0;

  final int id = __nextId++;
  Builder builder;

  Map<Symbol, dynamic> get vars => const {};
  List<StyleSheet> get require => const [];
  List<String> get media => const [];

  build();

  $(Object key, [defaultValue]) {
    assert(builder != null);
    final val = builder.get(key);
    return val == null ? defaultValue : val;
  }
}