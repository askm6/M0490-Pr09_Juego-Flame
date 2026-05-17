// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    super.key,
    required this.score,
  });

  final ValueNotifier<String> score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ValueListenableBuilder<String>(
        valueListenable: score,
        builder: (context, value, child) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'P1   $value   P2',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xfff8f9fa),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          );
        },
      ),
    );
  }
}