// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.rule;

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
