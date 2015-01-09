// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.src.svg.nodes.circle;

import 'dart:svg' as svg;
import 'shape.dart';

class SvgCircle extends SvgShape {
  final num cx;
  final num cy;
  final num r;

  const SvgCircle(
      {this.cx,
       this.cy,
       this.r,
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
    if (cx != null) {
      e.setAttribute('cx', cx.toString());
    }
    if (cy != null) {
      e.setAttribute('cy', cy.toString());
    }
    if (r != null) {
      e.setAttribute('r', r.toString());
    }
  }
}
