// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:vcss/browser.dart' as css;

const addIcon = const css.SvgIcon('add', '0 0 24 24',
    const [const css.SvgPath(d: 'M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z')]);

const removeIcon = const css.SvgIcon('remove', '0 0 24 24',
    const [const css.SvgPath(d: 'M19 13H5v-2h14v2z')]);

const oneColor = const css.HexColor('#333');
const twoColor = const css.HexColor('#555');
const xSize = const css.Size.px(10);

borderMixin(color) => [css.border('1px solid $color')];

class OneCss extends css.StyleSheet {
  static final instance = new OneCss();

  final icons = [addIcon];

  build() => [
      css.rule('.one', [
        css.color(oneColor)
      ])
    ];
}

class TwoCss extends css.StyleSheet {
  static final instance = new TwoCss();

  final icons = [removeIcon];

  build() => [
      css.rule('.two', [
        css.color(twoColor)
      ])
    ];
}

class ExampleCss extends css.StyleSheet {
  static final instance = new ExampleCss();

  final require = [OneCss.instance, TwoCss.instance];

  build() => [
      css.rule(['#text'], [
        css.background(twoColor),
        borderMixin(oneColor),

        css.rule('&.sub', [
          css.top(xSize * 2)
        ]),

        css.rule(['.abc', '.def'], [
          css.bottom('20px'),
          css.background('#999')
        ])
      ])
    ];
}

main() {
  final m = new css.StyleSheetManager();
  m.include([ExampleCss.instance]);
}
