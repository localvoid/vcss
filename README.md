# vcss [EXPERIMENTAL]

## Usage

```dart
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
  const OneCss();

  static const instance = const OneCss();

  final icons = const [addIcon];

  build(_) => [
      css.rule('.one', [
        css.color(oneColor)
      ])
    ];
}

class TwoCss extends css.StyleSheet {
  const TwoCss();

  static const instance = const TwoCss();

  final icons = const [removeIcon];

  build(_) => [
      css.rule('.two', [
        css.color(twoColor)
      ])
    ];
}

class ExampleCss extends css.StyleSheet {
  const ExampleCss();

  static const instance = const ExampleCss();

  final require = const [OneCss.instance, TwoCss.instance];

  build(_) => [
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
      ]),

      css.keyframes('anim', [
        css.rule('0%', [
          css.bottom('20px'),
        ]),
        css.rule('100%', [
          css.bottom('40px'),
        ])
      ])
    ];
}

main() {
  final m = new css.StyleSheetManager();
  m.include([ExampleCss.instance]);
}
```
