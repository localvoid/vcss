// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.base;

import 'package:vcss/src/constants.dart' as constants;

Rule rule(selectors,
          {Map<int, String> properties,
           List<Rule> children}) {
  selectors = selectors is String ? [selectors] : selectors;
  return new Rule(selectors,
      properties: properties,
      children: children);
}

class Rule {
  List<String> selectors;
  Map<int, String> properties;
  List<Rule> children;

  Rule(this.selectors, {this.properties, this.children});

  Rule call(v) {
    assert(v is List || v is Map<int, String>);
    if (v is Map<int, String>) {
      properties = v;
    } else {
      for (final i in v) {
        assert(i is Map<int, String> || i is Rule);
        if (i is Map<int, String>) {
          if (properties == null) {
            properties = {};
          }
          properties.addAll(i);
        } else {
          if (children == null) {
            children = [];
          }
          children.add(i);
        }
      }
    }
    return this;
  }
}

abstract class StyleSheet {
  build();
}

class StyleSheetBuilder {
  StringBuffer result = new StringBuffer();

  void compile(StyleSheet styleSheet) {
    final rules = styleSheet.build();
    if (rules is List) {
      for (final rule in rules) {
        compileRule(rule);
      }
    } else {
      compileRule(rules);
    }
  }

  void compileRule(Rule rule, [List parentSelectors = const []]) {
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
      result.write(selectors.join(', '));
      result.write(' {\n');
      rule.properties.forEach((k, v) {
        result.write('  ${constants.propertyNames[k]}: $v;\n');
      });
      result.write('}\n\n');
    }

    if (rule.children != null) {
      for (final c in rule.children) {
        compileRule(c, selectors);
      }
    }
  }
}

String _expandSelector(String selector, String parent) {
  if (selector.contains(r'&')) {
    return selector.replaceAll(r'&', parent);
  }
  return '$parent $selector';
}
