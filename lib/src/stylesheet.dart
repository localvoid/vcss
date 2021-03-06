// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.src.stylesheet;

import 'builder.dart';
import 'svg/icon.dart';

abstract class StyleSheet {
  const StyleSheet();

  List<StyleSheet> get require => const [];
  List<SvgIcon> get icons => const [];
  List<String> get media => const [];

  List build(Builder builder);
}