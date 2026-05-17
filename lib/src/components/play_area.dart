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
      : _fillPaint = Paint()
          ..color = const Color(0xff0b132b)
          ..style = PaintingStyle.fill,
        _borderPaint = Paint()
          ..color = const Color(0xccf8f9fa)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4,
        _innerBorderPaint = Paint()
          ..color = const Color(0x3300ffff)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10,
        super(
          paint: Paint()..color = Colors.transparent,
          children: [RectangleHitbox()],
        );

  final Paint _fillPaint;
  final Paint _borderPaint;
  final Paint _innerBorderPaint;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }

  @override
  void render(Canvas canvas) {
    final area = Offset.zero & size.toSize();
    final roundedArea = RRect.fromRectAndRadius(
      area.deflate(2),
      const Radius.circular(18),
    );

    canvas.drawRRect(roundedArea, _fillPaint);
    canvas.drawRRect(roundedArea, _innerBorderPaint);
    canvas.drawRRect(roundedArea, _borderPaint);
  }
}