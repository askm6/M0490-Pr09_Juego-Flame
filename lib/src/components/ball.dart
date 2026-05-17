// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';
import 'paddle.dart';
import 'play_area.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<BrickBreaker> {
  Ball({
    required super.position,
    required double radius,
    required double speed,
  }) : _speed = speed,
       super(
         radius: radius,
         anchor: Anchor.center,
         paint: Paint()
           ..color = const Color(0xff1e6091)
           ..style = PaintingStyle.fill,
         children: [CircleHitbox()],
       );

  final double _speed;
  final _random = math.Random();

  late Vector2 velocity;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    reset();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }

  void reset() {
    position = game.size / 2;

    final horizontalDirection = _random.nextBool() ? 1.0 : -1.0;
    final verticalDirection = _random.nextBool() ? 1.0 : -1.0;

    velocity = Vector2(
      horizontalDirection * _speed,
      verticalDirection * _speed * 0.5,
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is PlayArea) {
      if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y;
      } else if (intersectionPoints.first.y >= game.height) {
        velocity.y = -velocity.y;
      }
    } else if (other is Paddle) {
      velocity.x = -velocity.x;
    }
  }
}