// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.rule;

import 'property.dart';

void _includeProperties(Iterable v, List properties, List children) {
  for (final i in v) {
    if (i is String || i is Property) {
      properties.add(i);
    } else if (i is Iterable) {
      _includeProperties(i, properties, children);
    } else {
      assert(i is Rule);
      children.add(i);
    }
  }
}

Rule rule(selectors, Iterable v) {
  selectors = selectors is String ? [selectors] : selectors;

  final properties = [];
  final children = [];

  _includeProperties(v, properties, children);

  return new Rule(selectors,
      properties: properties,
      children: children);
}

class Rule {
  List<String> selectors;
  List<String> properties;
  List<Rule> children;

  Rule(this.selectors, {this.properties, this.children});
}
