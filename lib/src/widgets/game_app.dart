// Copyright 2023 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pong_game.dart';
import '../config.dart';
import 'overlay_screen.dart';
import 'score_card.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final BrickBreaker game;

  @override
  void initState() {
    super.initState();
    game = BrickBreaker();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff0b132b),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  ScoreCard(score: game.score),
                  Expanded(
                    child: FittedBox(
                      child: SizedBox(
                        width: gameWidth,
                        height: gameHeight,
                        child: GameWidget(
                          game: game,
                          overlayBuilderMap: {
                            PlayState
                                .welcome
                                .name: (context, game) => const OverlayScreen(
                              title: 'P O N G',
                              subtitle:
                                  'Jugador 1: W/S o A/D\nJugador 2: ↑/↓ o ←/→\n\nPulsa Enter, espacio o click para empezar',
                            ),

                            PlayState
                                .gameOver
                                .name: (context, game) => const OverlayScreen(
                              title: 'F I N   D E   P A R T I D A',
                              subtitle:
                                  'Pulsa Enter, espacio o click para jugar otra vez',
                            ),

                            PlayState.won.name: (context, game) {
                              final brickBreaker = game as BrickBreaker;

                              return OverlayScreen(
                                title: brickBreaker.winnerText,
                                subtitle:
                                    'Pulsa Enter, espacio o click para jugar otra vez',
                              );
                            },
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
