// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.svg_icon;

import 'dart:svg' as svg;
import 'svg.dart';

class SvgIcon {
  final String id;
  final String viewBox;
  final List<SvgShape> shapes;

  const SvgIcon(this.id, this.viewBox, this.shapes);

  svg.GElement render() {
    final sym = new svg.GElement()
      ..id = id;
      //..setAttribute('viewBox', viewBox);

    for (final shape in shapes) {
      sym.append(shape.render());
    }

    return sym;
  }
}
