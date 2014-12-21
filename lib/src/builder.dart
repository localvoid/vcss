// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.builder;

import 'rule.dart';
import 'stylesheet.dart';

class Builder {
  const Builder();

  List<String> compile(StyleSheet styleSheet) {
    final List<String> result = [];

    final rules = styleSheet.build();
    if (rules is List) {
      for (final rule in rules) {
        result.addAll(compileRule(rule));
      }
    } else {
      result.addAll(compileRule(rules));
    }

    return result;
  }

  List<String> compileRule(Rule rule, [List parentSelectors = const []]) {
    final List<String> result = [];

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

    final StringBuffer out = new StringBuffer();
    if (rule.properties != null) {
      out.write(selectors.join(', '));
      out.write(' {\n');
      out.write(rule.properties.join(';\n'));
      out.write('\n}');
    }
    result.add(out.toString());

    if (rule.children != null) {
      for (final c in rule.children) {
        result.addAll(compileRule(c, selectors));
      }
    }

    return result;
  }
}

String _expandSelector(String selector, String parent) {
  if (selector.contains(r'&')) {
    return selector.replaceAll(r'&', parent);
  }
  return '$parent $selector';
}
