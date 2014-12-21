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
    _collectDependencies(styleSheet);
    element.append(new html.Text(rules.join('\n')));
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
      assert(() {
        element.setAttribute('disabled', '');
        return true;
      });
      element.disabled = false;
    }
  }

  void disable() {
    if (!disabled) {
      disabled = true;
      assert(() {
        element.setAttribute('disabled', 'true');
        return true;
      });
      element.disabled = true;
    }
  }
}

class StyleSheetManager {
  final Builder builder;
  final HashMap<int, StyleSheetElement> styleSheets =
      new HashMap<int, StyleSheetElement>();

  StyleSheetManager([this.builder = const Builder()]);

  void _include(List<StyleSheet> styles) {
    for (final s in styles) {
      final StyleSheetElement e = styleSheets.putIfAbsent(s.id, () {
        _include(s.require);
        final ret = new StyleSheetElement(s, builder.compile(s));
        html.document.head.append(ret.element);
        return ret;
      });
    }
  }

  void include(List<StyleSheet> styles, [bool disableUnused = true]) {
    _include(styles);

    final List<StyleSheetElement> elements = styles.map((s) => styleSheets[s.id]).toList();

    styleSheets.forEach((k, v) {
      final e = elements.firstWhere((e) => e.required.contains(k), orElse: () => null);
      if (e == null) {
        v.disable();
      } else {
        v.enable();
      }
    });
  }
}
