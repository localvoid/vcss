// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.src.color;

abstract class Color {
  const Color();
}

class HexColor extends Color {
  final String value;

  const HexColor(this.value);

  String toString() => value;
}

class RgbColor extends Color {
  final num r;
  final num g;
  final num b;
  final num a;

  const RgbColor(this.r, this.g, this.b, [this.a = 1]);

  double get luminance => (0.299 * r + 0.587 * g + 0.114 * b) / 255;

  bool get isLight => 1 - luminance < 0.5;
  bool get isDark => !isLight;

  String toString() => a == 1 ? 'rgb($r, $g, $b)' : 'rgba($r, $g, $b, $a)';
}

class HslColor extends Color {
  final num h;
  final num s;
  final num l;
  final num a;

  const HslColor(this.h, this.s, this.l, [this.a = 1]);

  String toString() => a == 1 ? 'hsl($h, $s, $l)' : 'hsla($h, $s, $l, $a)';
}
