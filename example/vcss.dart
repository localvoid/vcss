// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:vcss/vcss.dart' as css;

Map borderMixin(color) => {css.border: '1px solid $color'};

class ExampleStyleSheet extends css.StyleSheet {
  build() =>
      css.rule(['.test', '.test2'])([
        {css.background: '#333'},
        borderMixin('#000'),

        css.rule('&.sub')({
          css.top: '10px'
        }),

        css.rule(['.abc', '.def'])({
          css.bottom: '20px',
          css.background: '30px'
        })
      ]);
}

main() {
  final cssBuilder = new css.StyleSheetBuilder();
  final styleSheet = new ExampleStyleSheet();
  cssBuilder.compile(styleSheet);
  print(cssBuilder.result.toString());
}
