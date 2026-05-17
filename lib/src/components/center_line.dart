// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class CenterLine extends PositionComponent {
  CenterLine() : super(priority: 1);

  final _paint = Paint()
    ..color = const Color(0x66f8f9fa)
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    const dashHeight = gameHeight * 0.04;
    const dashGap = gameHeight * 0.025;
    const lineWidth = gameWidth * 0.006;

    var y = 0.0;

    while (y < gameHeight) {
      canvas.drawRect(
        Rect.fromLTWH(
          gameWidth / 2 - lineWidth / 2,
          y,
          lineWidth,
          dashHeight,
        ),
        _paint,
      );

      y += dashHeight + dashGap;
    }
  }
}