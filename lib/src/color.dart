// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.color;

import 'value.dart';

abstract class Color implements Value {
  const Color();
}

class HexColor extends Color {
  final String value;

  const HexColor(this.value);

  String toCssValue() => value;
}

class RgbColor extends Color {
  final num r;
  final num g;
  final num b;
  final num a;

  const RgbColor(this.r, this.g, this.b, [this.a = 0]);

  String toCssValue() => a == 0 ? 'rgb($r, $g, $b)' : 'rgba($r, $g, $b, $a)';
}

class HslColor extends Color {
  final num h;
  final num s;
  final num l;
  final num a;

  const HslColor(this.h, this.s, this.l, [this.a = 0]);

  String toCssValue() => a == 0 ? 'hsl($h, $s, $l)' : 'hsla($h, $s, $l, $a)';
}
