// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.src.browser;

import 'dart:collection';
import 'dart:svg' as svg;
import 'dart:html' as html;
import 'svg/icon.dart';
import 'stylesheet.dart';
import 'builder.dart';

class StyleSheetElement {
  final StyleSheet styleSheet;

  final html.StyleElement element = new html.StyleElement();
  final HashSet<StyleSheet> required = new HashSet<StyleSheet>();

  bool get disabled => element.disabled;
  set disabled(bool v) { element.disabled = v; }

  StyleSheetElement(this.styleSheet, String rules) {
    _collectDependencies(styleSheet);
    element.append(new html.Text(rules));
  }

  void _collectDependencies(StyleSheet s) {
    for (final d in s.require) {
      _collectDependencies(d);
    }
    required.add(s);
  }

  void enable() { disabled = false; }
  void disable() { disabled = true; }
}

class IconSetElement {
  final element = new svg.SvgSvgElement();
  final defs = new svg.DefsElement();
  final HashMap<String, SvgIcon> icons = new HashMap<String, SvgIcon>();

  IconSetElement() {
    element.append(defs);
  }

  void add(SvgIcon icon) {
    icons.putIfAbsent(icon.id, () {
      defs.append(icon.render());
      return icon;
    });
  }
}

class StyleSheetManager {
  final Builder builder;
  final IconSetElement iconSet = new IconSetElement();

  // mapping between stylesheet objects and stylesheet html elemenets
  final HashMap<StyleSheet, StyleSheetElement> styleSheets =
      new HashMap<StyleSheet, StyleSheetElement>();

  StyleSheetManager([this.builder = const Builder()]) {
    html.document.head.append(iconSet.element);
  }

  void _include(List<StyleSheet> styles) {
    for (final s in styles) {
      final StyleSheetElement e = styleSheets.putIfAbsent(s, () {
        _include(s.require);

        for (final icon in s.icons) {
          iconSet.add(icon);
        }

        final ret = new StyleSheetElement(s, builder.compile(s));
        html.document.head.append(ret.element);
        return ret;
      });
    }
  }

  void include(List<StyleSheet> styles, [bool disableUnused = true]) {
    _include(styles);

    final List<StyleSheetElement> elements = styles.map((s) => styleSheets[s]).toList();

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
