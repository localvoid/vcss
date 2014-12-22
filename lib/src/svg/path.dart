// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.svg.path;

import 'dart:svg' as svg;
import 'shape.dart';

class SvgPath extends SvgShape {
  final String d;

  const SvgPath(
      {this.d,
       String transform,
       String color,
       String fill,
       num fillOpacity,
       num opacity,
       String stroke,
       num strokeOpacity,
       num strokeWidth})
      : super(
          transform: transform,
          color: color,
          fill: fill,
          fillOpacity: fillOpacity,
          opacity: opacity,
          stroke: stroke,
          strokeOpacity: strokeOpacity,
          strokeWidth: strokeWidth);

  svg.PathElement create() => new svg.PathElement();

  void setAttributes(svg.PathElement e) {
    super.setAttributes(e);
    if (d != null) {
      e.setAttribute('d', d);
    }
  }
}
