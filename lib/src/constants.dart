// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.constants;

const int azimuth              = 0;
const int background           = 1;
const int backgroundAttachment = 2;
const int backgroundColor      = 3;
const int backgroundImage      = 4;
const int backgroundPosition   = 5;
const int backgroundRepeat     = 6;
const int border               = 7;
const int borderCollapse       = 8;
const int borderColor          = 9;
const int borderSpacing        = 10;
const int borderStyle          = 11;
const int borderTop            = 12;
const int borderRight          = 13;
const int borderBottom         = 14;
const int borderLeft           = 15;
const int borderTopColor       = 16;
const int borderRightColor     = 17;
const int borderBottomColor    = 18;
const int borderLeftColor      = 19;
const int borderTopStyle       = 20;
const int borderRightStyle     = 21;
const int borderBottomStyle    = 22;
const int borderLeftStyle      = 23;
const int borderTopWidth       = 24;
const int borderRightWidth     = 25;
const int borderBottomWidth    = 26;
const int borderLeftWidth      = 27;
const int borderWidth          = 28;
const int bottom               = 29;
const int captionSide          = 30;
const int clear                = 31;
const int clip                 = 32;
const int color                = 33;
const int content              = 34;
const int counterIncrement     = 35;
const int counterReset         = 36;
const int cue                  = 37;
const int cueAfter             = 38;
const int cueBefore            = 39;
const int cursor               = 40;
const int direction            = 41;
const int display              = 42;
const int elevation            = 43;
const int emptyCells           = 44;
const int float                = 45;
const int font                 = 46;
const int fontFamily           = 47;
const int fontSize             = 48;
const int fontSizeAdjust       = 49;
const int fontStretch          = 50;
const int fontStyle            = 51;
const int fontVariant          = 52;
const int fontWeight           = 53;
const int height               = 54;
const int left                 = 55;
const int letterSpacing        = 56;
const int lineHeight           = 57;
const int listStyle            = 58;
const int listStyleImage       = 59;
const int listStylePosition    = 60;
const int listStyleType        = 61;
const int margin               = 62;
const int marginTop            = 63;
const int marginRight          = 64;
const int marginBottom         = 65;
const int marginLeft           = 66;
const int markerOffset         = 67;
const int marks                = 68;
const int maxHeight            = 69;
const int maxWidth             = 70;
const int minHeight            = 71;
const int minWidth             = 72;
const int orphans              = 73;
const int outline              = 74;
const int outlineColor         = 75;
const int outlineStyle         = 76;
const int outlineWidth         = 77;
const int overflow             = 78;
const int padding              = 79;
const int paddingTop           = 80;
const int paddingRight         = 81;
const int paddingBottom        = 82;
const int paddingLeft          = 83;
const int page                 = 84;
const int pageBreakAfter       = 85;
const int pageBreakBefore      = 86;
const int pageBreakInside      = 87;
const int pause                = 88;
const int pauseAfter           = 89;
const int pauseBefore          = 90;
const int pitch                = 91;
const int pitchRange           = 92;
const int playDuring           = 93;
const int position             = 94;
const int quotes               = 95;
const int richness             = 96;
const int right                = 97;
const int size                 = 98;
const int speak                = 99;
const int speakHeader          = 100;
const int speakNumeral         = 101;
const int speakPunctuation     = 102;
const int speechRate           = 103;
const int stress               = 104;
const int tableLayout          = 105;
const int textAlign            = 106;
const int textDecoration       = 107;
const int textIndent           = 108;
const int textShadow           = 109;
const int textTransform        = 110;
const int top                  = 111;
const int unicodeBidi          = 112;
const int verticalAlign        = 113;
const int visibility           = 114;
const int voiceFamily          = 115;
const int volume               = 116;
const int whiteSpace           = 117;
const int widows               = 118;
const int width                = 119;
const int wordSpacing          = 120;
const int zIndex               = 121;
const int transition           = 122;
const int boxShadow            = 123;
const int borderRadius         = 124;
const int transitionProperty   = 125;
const int transform            = 126;
const int opacity              = 127;
const int boxSizing            = 128;
const int userSelect           = 129;
const int flex                 = 130;

const Map<int, String> propertyNames = const {
  azimuth: 'azimuth',
  background: 'background',
  backgroundAttachment: 'background-attachment',
  backgroundColor: 'background-color',
  backgroundImage: 'background-image',
  backgroundPosition: 'background-position',
  backgroundRepeat: 'background-repeat',
  border: 'border',
  borderCollapse: 'border-collapse',
  borderColor: 'border-color',
  borderSpacing: 'border-spacing',
  borderStyle: 'border-style',
  borderTop: 'border-top',
  borderRight: 'border-right',
  borderBottom: 'border-bottom',
  borderLeft: 'border-left',
  borderTopColor: 'border-top-color',
  borderRightColor: 'border-right-color',
  borderBottomColor: 'border-bottom-color',
  borderLeftColor: 'border-left-color',
  borderTopStyle: 'border-top-style',
  borderRightStyle: 'border-right-style',
  borderBottomStyle: 'border-bottom-style',
  borderLeftStyle: 'border-left-style',
  borderTopWidth: 'border-top-width',
  borderRightWidth: 'border-right-width',
  borderBottomWidth: 'border-bottom-width',
  borderLeftWidth: 'border-left-width',
  borderWidth: 'border-width',
  bottom: 'bottom',
  captionSide: 'caption-side',
  clear: 'clear',
  clip: 'clip',
  color: 'color',
  content: 'content',
  counterIncrement: 'counter-increment',
  counterReset: 'counter-reset',
  cue: 'cue',
  cueAfter: 'cue-after',
  cueBefore: 'cue-before',
  cursor: 'cursor',
  direction: 'direction',
  display: 'display',
  elevation: 'elevation',
  emptyCells: 'empty-cells',
  float: 'float',
  font: 'font',
  fontFamily: 'font-family',
  fontSize: 'font-size',
  fontSizeAdjust: 'font-size-adjust',
  fontStretch: 'font-stretch',
  fontStyle: 'font-style',
  fontVariant: 'font-variant',
  fontWeight: 'font-weight',
  height: 'height',
  left: 'left',
  letterSpacing: 'letter-spacing',
  lineHeight: 'line-height',
  listStyle: 'list-style',
  listStyleImage: 'list-style-image',
  listStylePosition: 'list-style-position',
  listStyleType: 'list-style-type',
  margin: 'margin',
  marginTop: 'margin-top',
  marginRight: 'margin-right',
  marginBottom: 'margin-bottom',
  marginLeft: 'margin-left',
  markerOffset: 'marker-offset',
  marks: 'marks',
  maxHeight: 'max-height',
  maxWidth: 'max-width',
  minHeight: 'min-height',
  minWidth: 'min-width',
  orphans: 'orphans',
  outline: 'outline',
  outlineColor: 'outline-color',
  outlineStyle: 'outline-style',
  outlineWidth: 'outline-width',
  overflow: 'overflow',
  padding: 'padding',
  paddingTop: 'padding-top',
  paddingRight: 'padding-right',
  paddingBottom: 'padding-bottom',
  paddingLeft: 'padding-left',
  page: 'page',
  pageBreakAfter: 'page-break-after',
  pageBreakBefore: 'page-break-before',
  pageBreakInside: 'page-break-inside',
  pause: 'pause',
  pauseAfter: 'pause-after',
  pauseBefore: 'pause-before',
  pitch: 'pitch',
  pitchRange: 'pitch-range',
  playDuring: 'play-during',
  position: 'position',
  quotes: 'quotes',
  richness: 'richness',
  right: 'right',
  size: 'size',
  speak: 'speak',
  speakHeader: 'speak-header',
  speakNumeral: 'speak-numeral',
  speakPunctuation: 'speak-punctuation',
  speechRate: 'speech-rate',
  stress: 'stress',
  tableLayout: 'table-layout',
  textAlign: 'text-align',
  textDecoration: 'text-decoration',
  textIndent: 'text-indent',
  textShadow: 'text-shadow',
  textTransform: 'text-transform',
  top: 'top',
  unicodeBidi: 'unicode-bidi',
  verticalAlign: 'vertical-align',
  visibility: 'visibility',
  voiceFamily: 'voice-family',
  volume: 'volume',
  whiteSpace: 'white-space',
  widows: 'widows',
  width: 'width',
  wordSpacing: 'word-spacing',
  zIndex: 'z-index',
  transition: 'transition',
  boxShadow: 'box-shadow',
  borderRadius: 'border-radius',
  transitionProperty: 'transition-property',
  transform: 'transform',
  opacity: 'opacity',
  boxSizing: 'box-sizing',
  userSelect: '-webkit-user-select',
  flex: 'flex'
};
