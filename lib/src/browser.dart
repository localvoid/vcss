// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.src.browser;

import 'dart:collection';
import 'dart:svg' as svg;
import 'dart:html' as html;
import 'svg_icon.dart';
import 'stylesheet.dart';
import 'builder.dart';

class StyleSheetElement {
  final StyleSheet styleSheet;
  final html.StyleElement element = new html.StyleElement();
  final HashSet<int> required = new HashSet<int>();
  bool disabled = false;
  int _index = 0;

  StyleSheetElement(this.styleSheet, String rules) {
    _collectDependencies(styleSheet);
    element.append(new html.Text(rules));
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
  final HashMap<int, StyleSheetElement> styleSheets =
      new HashMap<int, StyleSheetElement>();

  StyleSheetManager([this.builder = const Builder()]) {
    html.document.head.append(iconSet.element);
  }

  void _include(List<StyleSheet> styles) {
    for (final s in styles) {
      final StyleSheetElement e = styleSheets.putIfAbsent(s.id, () {
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
