// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.browser;

import 'dart:collection';
import 'dart:html' as html;
import 'stylesheet.dart';
import 'builder.dart';

class StyleSheetElement {
  final StyleSheet styleSheet;
  final html.StyleElement element = new html.StyleElement();
  final HashSet<int> required = new HashSet<int>();
  bool disabled = false;
  int _index = 0;

  StyleSheetElement(this.styleSheet, List<String> rules) {
    element.append(new html.Text(''));
    html.document.head.append(element);
    final sheet = element.sheet;
    for (final rule in rules) {
      sheet.insertRule(rule, _index++);
    }
    _collectDependencies(styleSheet);
  }

  void _collectDependencies(StyleSheet s) {
    for (final d in s.require) {
      _collectDependencies(d);
    }
    required.add(s.id);
  }

  void enable() {
    if (disabled) {
      disabled = false;
      element.disabled = false;
    }
  }

  void disable() {
    if (!disabled) {
      disabled = true;
      element.disabled = true;
    }
  }
}

class StyleSheetManager {
  final Builder builder;
  final HashMap<int, StyleSheetElement> styleSheets =
      new HashMap<int, StyleSheetElement>();

  StyleSheetManager([Builder builder])
      : builder = builder == null ? new Builder() : builder;

  void include(StyleSheet s, [bool disableUnused = true]) {
    final StyleSheetElement e = styleSheets.putIfAbsent(s.id, () {
      for (final r in s.require) {
        include(r);
      }
      return new StyleSheetElement(s, builder.compile(s));
    });

    styleSheets.forEach((k, v) {
      if (e.required.contains(k)) {
        v.enable();
      } else {
        v.disable();
      }
    });
  }
}
