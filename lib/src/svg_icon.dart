// Copyright (c) 2014, the vcss project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library vcss.svg_icon;

class SvgIcon {
  final SvgIconSet set;
  final String iconId;
  final String path;

  String get id => '${set.id}:$iconId';

  const SvgIcon(this.set, this.iconId, this.path);

  String toSvgGroup() => '<g id="$iconId"><path d="$path"/></g>';

}

class SvgIconSet {
  final String id;
  final int size;

  const SvgIconSet(this.id, this.size);
}
