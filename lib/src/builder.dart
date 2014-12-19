// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.builder;

import 'dart:collection';
import 'constants.dart' as constants;
import 'rule.dart';
import 'stylesheet.dart';

class Builder {
  HashMap<Symbol, dynamic> vars = new HashMap<Symbol, dynamic>();

  List<StyleSheet> _pending = [];

  Builder({this.vars});

  get(Symbol key) => vars[key];

  void include(StyleSheet styleSheet) {
    if (styleSheet.owner == null) {
      styleSheet.owner = this;
      final require = styleSheet.require;
      if (require != null) {
        for (final s in require) {
          include(s);
        }
      }
      final newVars = styleSheet.vars;
      if (newVars != null) {
        newVars.forEach((k, v) {
          vars.putIfAbsent(k, () => v);
        });
      }
      _pending.add(styleSheet);
    }
  }

  String compilePending() {
    final StringBuffer out = new StringBuffer();

    for (final s in _pending) {
      out.write(compile(s));
    }

    return out.toString();
  }

  String compile(StyleSheet styleSheet) {
    final StringBuffer out = new StringBuffer();

    final rules = styleSheet.build();
    if (rules is List) {
      for (final rule in rules) {
        out.write(compileRule(rule));
      }
    } else {
      out.write(compileRule(rules));
    }

    return out.toString();
  }

  String compileRule(Rule rule, [List parentSelectors = const []]) {
    final StringBuffer out = new StringBuffer();

    List<String> selectors;
    if (parentSelectors.isEmpty) {
      selectors = rule.selectors;
    } else {
      selectors = [];
      for (final parent in parentSelectors) {
        selectors.addAll(rule.selectors.map((s) =>
            _expandSelector(s, parent)));
      }
    }

    if (rule.properties != null) {
      out.write(selectors.join(', '));
      out.write(' {\n');
      rule.properties.forEach((k, v) {
        out.write('  ${constants.propertyNames[k]}: $v;\n');
      });
      out.write('}\n\n');
    }

    if (rule.children != null) {
      for (final c in rule.children) {
        compileRule(c, selectors);
      }
    }

    return out.toString();
  }
}

String _expandSelector(String selector, String parent) {
  if (selector.contains(r'&')) {
    return selector.replaceAll(r'&', parent);
  }
  return '$parent $selector';
}
