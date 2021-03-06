// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.src.property;

import 'rule.dart';
import 'builder.dart';

abstract class Property {
  String toCssProperty(Builder builder);
}

const notSelectable = 'user-select: none';


azimuth(value) => 'azimuth: $value';
background(value) => 'background: $value';
backgroundAttachment(value) => 'background-attachment: $value';
backgroundColor(value) => 'background-color: $value';
backgroundImage(value) => 'background-image: $value';
backgroundPosition(value) => 'background-position: $value';
backgroundRepeat(value) => 'background-repeat: $value';
border(value) => 'border: $value';
borderCollapse(value) => 'border-collapse: $value';
borderColor(value) => 'border-color: $value';
borderSpacing(value) => 'border-spacing: $value';
borderStyle(value) => 'border-style: $value';
borderTop(value) => 'border-top: $value';
borderRight(value) => 'border-right: $value';
borderBottom(value) => 'border-bottom: $value';
borderLeft(value) => 'border-left: $value';
borderTopColor(value) => 'border-top-color: $value';
borderRightColor(value) => 'border-right-color: $value';
borderBottomColor(value) => 'border-bottom-color: $value';
borderLeftColor(value) => 'border-left-color: $value';
borderTopStyle(value) => 'border-top-style: $value';
borderRightStyle(value) => 'border-right-style: $value';
borderBottomStyle(value) => 'border-bottom-style: $value';
borderLeftStyle(value) => 'border-left-style: $value';
borderTopWidth(value) => 'border-top-width: $value';
borderRightWidth(value) => 'border-right-width: $value';
borderBottomWidth(value) => 'border-bottom-width: $value';
borderLeftWidth(value) => 'border-left-width: $value';
borderWidth(value) => 'border-width: $value';
bottom(value) => 'bottom: $value';
captionSide(value) => 'caption-side: $value';
clear(value) => 'clear: $value';
clip(value) => 'clip: $value';
color(value) => 'color: $value';
content(value) => 'content: $value';
counterIncrement(value) => 'counter-increment: $value';
counterReset(value) => 'counter-reset: $value';
cue(value) => 'cue: $value';
cueAfter(value) => 'cue-after: $value';
cueBefore(value) => 'cue-before: $value';
cursor(value) => 'cursor: $value';
direction(value) => 'direction: $value';
display(value) => 'display: $value';
elevation(value) => 'elevation: $value';
emptyCells(value) => 'empty-cells: $value';
float(value) => 'float: $value';
font(value) => 'font: $value';
fontFamily(value) => 'font-family: $value';
fontSize(value) => 'font-size: $value';
fontSizeAdjust(value) => 'font-size-adjust: $value';
fontStretch(value) => 'font-stretch: $value';
fontStyle(value) => 'font-style: $value';
fontVariant(value) => 'font-variant: $value';
fontWeight(value) => 'font-weight: $value';
height(value) => 'height: $value';
left(value) => 'left: $value';
letterSpacing(value) => 'letter-spacing: $value';
lineHeight(value) => 'line-height: $value';
listStyle(value) => 'list-style: $value';
listStyleImage(value) => 'list-style-image: $value';
listStylePosition(value) => 'list-style-position: $value';
listStyleType(value) => 'list-style-type: $value';
margin(value) => 'margin: $value';
marginTop(value) => 'margin-top: $value';
marginRight(value) => 'margin-right: $value';
marginBottom(value) => 'margin-bottom: $value';
marginLeft(value) => 'margin-left: $value';
markerOffset(value) => 'marker-offset: $value';
marks(value) => 'marks: $value';
maxHeight(value) => 'max-height: $value';
maxWidth(value) => 'max-width: $value';
minHeight(value) => 'min-height: $value';
minWidth(value) => 'min-width: $value';
orphans(value) => 'orphans: $value';
outline(value) => 'outline: $value';
outlineColor(value) => 'outline-color: $value';
outlineStyle(value) => 'outline-style: $value';
outlineWidth(value) => 'outline-width: $value';
overflow(value) => 'overflow: $value';
padding(value) => 'padding: $value';
paddingTop(value) => 'padding-top: $value';
paddingRight(value) => 'padding-right: $value';
paddingBottom(value) => 'padding-bottom: $value';
paddingLeft(value) => 'padding-left: $value';
page(value) => 'page: $value';
pageBreakAfter(value) => 'page-break-after: $value';
pageBreakBefore(value) => 'page-break-before: $value';
pageBreakInside(value) => 'page-break-inside: $value';
pause(value) => 'pause: $value';
pauseAfter(value) => 'pause-after: $value';
pauseBefore(value) => 'pause-before: $value';
pitch(value) => 'pitch: $value';
pitchRange(value) => 'pitch-range: $value';
playDuring(value) => 'play-during: $value';
position(value) => 'position: $value';
quotes(value) => 'quotes: $value';
richness(value) => 'richness: $value';
right(value) => 'right: $value';
size(value) => 'size: $value';
speak(value) => 'speak: $value';
speakHeader(value) => 'speak-header: $value';
speakNumeral(value) => 'speak-numeral: $value';
speakPunctuation(value) => 'speak-punctuation: $value';
speechRate(value) => 'speech-rate: $value';
stress(value) => 'stress: $value';
tableLayout(value) => 'table-layout: $value';
textAlign(value) => 'text-align: $value';
textDecoration(value) => 'text-decoration: $value';
textIndent(value) => 'text-indent: $value';
textShadow(value) => 'text-shadow: $value';
textTransform(value) => 'text-transform: $value';
top(value) => 'top: $value';
unicodeBidi(value) => 'unicode-bidi: $value';
verticalAlign(value) => 'vertical-align: $value';
visibility(value) => 'visibility: $value';
voiceFamily(value) => 'voice-family: $value';
volume(value) => 'volume: $value';
whiteSpace(value) => 'white-space: $value';
widows(value) => 'widows: $value';
width(value) => 'width: $value';
wordSpacing(value) => 'word-spacing: $value';
zIndex(value) => 'z-index: $value';
transition(value) => 'transition: $value';
boxShadow(value) => 'box-shadow: $value';
borderRadius(value) => 'border-radius: $value';
transitionProperty(value) => 'transition-property: $value';
transform(value) => 'transform: $value';
opacity(value) => 'opacity: $value';
boxSizing(value) => 'box-sizing: $value';
userSelect(value) => '-webkit-user-select: $value';
flex(value) => 'flex: $value';
fill(value) => 'fill: $value';
alignItems(value) => 'align-items: $value';
touchAction(value) => 'touch-action: $value';
justifyContent(value) => 'justify-content: $value';
pointerEvents(value) => 'pointer-events: $value';
willChange(value) => 'will-change: $value';

inputPlaceholder(value) => [
    rule('&:-ms-input-placeholder', [color(value)]),
    rule('&:-webkit-input-placeholder', [color(value)])
  ];

animation(value) => [
    '-webkit-animation: $value',
    'animation: $value'
  ];
