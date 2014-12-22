// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.svg.element;

import 'dart:svg' as svg;

abstract class SvgElement {
  const SvgElement();

  void setAttributes(svg.SvgElement e);

  svg.SvgElement create();

  svg.SvgElement render() {
    final ret = create();
    setAttributes(ret);
    return ret;
  }
}
