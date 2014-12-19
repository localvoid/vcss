// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.size;

class Size {
  final String type;
  final num value;

  const Size(this.type, this.value);

  const Size.em(this.value)   : type = 'em';
  const Size.ex(this.value)   : type = 'ex' ;
  const Size.pct(this.value)  : type = '%';
  const Size.px(this.value)   : type = 'px';
  const Size.cm(this.value)   : type = 'cm';
  const Size.mm(this.value)   : type = 'mm';
  const Size.inch(this.value) : type = 'inch';
  const Size.pt(this.value)   : type = 'pt';
  const Size.pc(this.value)   : type = 'pc' ;
  const Size.ch(this.value)   : type = 'ch' ;
  const Size.rem(this.value)  : type = 'rem' ;
  const Size.vh(this.value)   : type = 'vh' ;
  const Size.vw(this.value)   : type = 'vw' ;
  const Size.vmin(this.value) : type = 'vmin' ;
  const Size.vmax(this.value) : type = 'vmax' ;

  Size operator +(other) {
    if (other is num) {
      return new Size(type, value + other);
    }
    assert(other is Size);
    return new Size(type, value + other.value);
  }

  Size operator -(other) {
    if (other is num) {
      return new Size(type, value - other);
    }
    assert(other is Size);
    return new Size(type, value - other.value);
  }

  Size operator *(other) {
    if (other is num) {
      return new Size(type, value * other);
    }
    assert(other is Size);
    return new Size(type, value * other.value);
  }

  Size operator /(other) {
    if (other is num) {
      return new Size(type, value / other);
    }
    assert(other is Size);
    return new Size(type, value / other.value);
  }

  Size operator ~/(other) {
    if (other is num) {
      return new Size(type, value ~/ other);
    }
    assert(other is Size);
    return new Size(type, value ~/ other.value);
  }

  bool operator ==(Size other) =>
      value == other.value && type == other.type;
}
