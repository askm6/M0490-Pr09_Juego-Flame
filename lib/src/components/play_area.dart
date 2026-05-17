// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';

class PlayArea extends RectangleComponent with HasGameReference<BrickBreaker> {
  PlayArea()
      : _borderPaint = Paint()
          ..color = const Color(0x66f8f9fa)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4,
        super(
          paint: Paint()
            ..color = const Color(0xff0b132b)
            ..style = PaintingStyle.fill,
          children: [RectangleHitbox()],
        );

  final Paint _borderPaint;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawRect(
      Offset.zero & size.toSize(),
      _borderPaint,
    );
  }
}