// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.svg.shape;

import 'dart:svg' as svg;
import 'graphics.dart';

abstract class SvgShape extends SvgGraphics {
  final String transform;

  const SvgShape(
      {this.transform,
       String color,
       String fill,
       num fillOpacity,
       num opacity,
       String stroke,
       num strokeOpacity,
       num strokeWidth})
      : super(
          color: color,
          fill: fill,
          fillOpacity: fillOpacity,
          opacity: opacity,
          stroke: stroke,
          strokeOpacity: strokeOpacity,
          strokeWidth: strokeWidth);

  void setAttributes(svg.SvgElement e) {
    super.setAttributes(e);

    if (transform != null) {
      e.setAttribute('transform', transform);
    }
  }
}
