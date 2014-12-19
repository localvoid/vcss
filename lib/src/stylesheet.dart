// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.stylesheet;

import 'builder.dart';

abstract class StyleSheet {
  Builder owner;

  Map<Symbol, dynamic> get vars => null;
  List<StyleSheet> get require => null;

  build();

  $(Object key, [defaultValue]) {
    assert(owner != null);
    final val = owner.get(key);
    return val == null ? defaultValue : val;
  }
}