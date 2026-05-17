// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';
import '../config.dart';
import 'paddle.dart';
import 'play_area.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<BrickBreaker> {
  Ball({required super.position, required double radius, required double speed})
    : _speed = speed,
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

  late double currentSpeed;
  late Vector2 velocity;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    reset();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (game.playState != PlayState.playing) return;

    position += velocity * dt;

    if (position.x < -radius) {
      game.scoreRightPlayer();

      if (game.playState == PlayState.playing) {
        reset();
      }
    } else if (position.x > game.width + radius) {
      game.scoreLeftPlayer();

      if (game.playState == PlayState.playing) {
        reset();
      }
    }
  }

  void reset() {
    position = game.size / 2;
    currentSpeed = _speed;

    final horizontalDirection = _random.nextBool() ? 1.0 : -1.0;
    final verticalDirection = _random.nextBool() ? 1.0 : -1.0;

    velocity = Vector2(
      horizontalDirection * currentSpeed,
      verticalDirection * currentSpeed * 0.5,
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is PlayArea) {
      _handlePlayAreaCollision(intersectionPoints.first);
    } else if (other is Paddle) {
      _handlePaddleCollision(other);
    }
  }

  void _handlePlayAreaCollision(Vector2 collisionPoint) {
    final isTopCollision = collisionPoint.y <= 0;
    final isBottomCollision = collisionPoint.y >= game.height;

    if (isTopCollision && velocity.y < 0) {
      velocity.y = -velocity.y;
      position.y = radius;
    }

    if (isBottomCollision && velocity.y > 0) {
      velocity.y = -velocity.y;
      position.y = game.height - radius;
    }
  }

  void _handlePaddleCollision(Paddle paddle) {
    final isLeftPaddle = paddle.position.x < game.width / 2;

    currentSpeed *= difficultyModifier;

    if (isLeftPaddle && velocity.x < 0) {
      velocity.x = currentSpeed;
      position.x = paddle.position.x + paddle.size.x / 2 + radius;
    } else if (!isLeftPaddle && velocity.x > 0) {
      velocity.x = -currentSpeed;
      position.x = paddle.position.x - paddle.size.x / 2 - radius;
    }

    final hitPosition =
        (position.y - paddle.position.y) / (paddle.size.y / 2);

    velocity.y = hitPosition.clamp(-1.0, 1.0) * currentSpeed * 0.75;
  }
}
