// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.stylesheet;

import 'svg_icon.dart';

abstract class StyleSheet {
  static int __nextId = 0;

  final int id = __nextId++;

  List<StyleSheet> get require => const [];
  List<SvgIcon> get icons => const [];
  List<String> get media => const [];

  build();
}