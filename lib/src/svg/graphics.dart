// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.svg.graphics;

import 'dart:svg' as svg;
import 'element.dart';

abstract class SvgGraphics extends SvgElement {
  final String color;
  final String fill;
  final num fillOpacity;
  final num opacity;
  final String stroke;
  final num strokeOpacity;
  final num strokeWidth;

  const SvgGraphics(
      {this.color,
       this.fill,
       this.fillOpacity,
       this.opacity,
       this.stroke,
       this.strokeOpacity,
       this.strokeWidth});

  void setAttributes(svg.SvgElement e) {
    if (color != null) {
      e.setAttribute('color', color);
    }
    if (fill != null) {
      e.setAttribute('fill', fill);
    }
    if (fillOpacity != null) {
      e.setAttribute('fill-opacity', fillOpacity.toString());
    }
    if (opacity != null) {
      e.setAttribute('opacity', opacity.toString());
    }
    if (stroke != null) {
      e.setAttribute('stroke', stroke.toString());
    }
    if (strokeOpacity != null) {
      e.setAttribute('stroke-opacity', strokeOpacity.toString());
    }
    if (strokeWidth != null) {
      e.setAttribute('stroke-width', strokeWidth.toString());
    }
  }
}
