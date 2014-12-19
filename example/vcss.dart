// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:vcss/vcss.dart' as css;

class OneCss extends css.StyleSheet {
  static final instance = new OneCss();

  build() =>
      css.rule('.one')(
        {css.color: $(#oneColor, '#333')}
      );
}

class TwoCss extends css.StyleSheet {
  static final instance = new TwoCss();

  final vars = {#twoColor: '#999'};

  build() =>
      css.rule('.two')(
        {css.color: $(#twoColor)}
      );
}

Map borderMixin(color) => {css.border: '1px solid $color'};

class ExampleCss extends css.StyleSheet {
  static final instance = new ExampleCss();

  final require = [OneCss.instance, TwoCss.instance];

  build() =>
      css.rule(['.test', '.test2'])([
        {css.background: '#333'},
        borderMixin('#000'),

        css.rule('&.sub')({
          css.top: '10px'
        }),

        css.rule(['.abc', '.def'])({
          css.bottom: '20px',
          css.background: '#999'
        })
      ]);
}

main() {
  final builder = new css.Builder(vars: {#oneColor: '#555'});
  builder.include(ExampleCss.instance);
  print(builder.compilePending());
}
