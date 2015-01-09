// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.src.rule;

import 'property.dart';

abstract class Rule<T extends Rule> {
  List<T> children;

  Rule(this.children);
}

class SelectorRule extends Rule<SelectorRule> {
  List<String> selectors;
  List<String> properties;

  SelectorRule(this.selectors, {this.properties, List<SelectorRule> children})
      : super(children);
}

class MediaRule extends Rule<SelectorRule> {
  String conditions;

  MediaRule(this.conditions, {List<SelectorRule> children})
      : super(children);
}

class KeyframesRule extends Rule<SelectorRule> {
  String identifier;

  KeyframesRule(this.identifier, {List<SelectorRule> children})
      : super(children);
}

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

SelectorRule rule(selectors, Iterable v) {
  selectors = selectors is String ? [selectors] : selectors;

  final properties = [];
  final children = [];

  _includeProperties(v, properties, children);

  return new SelectorRule(selectors,
      properties: properties,
      children: children);
}

MediaRule media(String condition, Iterable v) {
  return new MediaRule(condition, children: v.toList());
}

KeyframesRule keyframes(String identifier, Iterable v) {
  return new KeyframesRule(identifier, children: v.toList());
}
