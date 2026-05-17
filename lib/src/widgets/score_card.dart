// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.score});

  final ValueNotifier<String> score;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 24,
      left: 0,
      right: 0,
      child: ValueListenableBuilder<String>(
        valueListenable: score,
        builder: (context, value, child) {
          return Text(
            'P1   $value   P2',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          );
        },
      ),
    );
  }
}
