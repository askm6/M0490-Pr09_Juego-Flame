# M0490 - Pr09 Juego Flame

Proyecto realizado usando **Flutter** y la librería **Flame** para crear un videojuego 2D.

El juego final es una versión personalizada del clásico **Pong** para dos jugadores, desarrollada a partir de la base del Codelab oficial de Flutter/Flame basado en Brick Breaker.

## Descripción del juego

El proyecto consiste en un juego tipo Pong en el que dos jugadores controlan una pala cada uno.

El objetivo es evitar que la pelota salga por tu lado del campo y conseguir que el rival falle. Cuando la pelota sale por un lateral, el jugador contrario suma un punto.

Gana el primer jugador que llega a **7 puntos**.

## Controles

### Jugador 1

- `W` o `A`: subir la pala
- `S` o `D`: bajar la pala

### Jugador 2

- `Flecha arriba` o `Flecha derecha`: subir la pala
- `Flecha abajo` o `Flecha izquierda`: bajar la pala

### Controles generales

- `Enter`: iniciar o reiniciar partida
- `Espacio`: iniciar o reiniciar partida
- `Click`: iniciar o reiniciar partida

## Funcionalidades implementadas

- Juego creado con Flutter y Flame.
- Dos jugadores en el mismo teclado.
- Pelota con movimiento automático.
- Rebotes contra paredes superior e inferior.
- Rebotes contra las palas.
- Ángulo de rebote según la zona de impacto en la pala.
- Sistema de puntuación para ambos jugadores.
- Victoria al llegar a 7 puntos.
- Reinicio de partida.
- Dificultad progresiva: la pelota aumenta su velocidad al rebotar en una pala.
- Diseño adaptado a formato horizontal.
- Interfaz visual personalizada estilo arcade.
- Marcador responsive.
- Pantallas de inicio y victoria mediante overlays.

## Cambios respecto al Brick Breaker original

El proyecto parte de la estructura del Codelab de Brick Breaker, pero se ha transformado en un juego Pong.

Cambios principales:

- Se eliminó la lógica de ladrillos.
- Se eliminó la victoria por destruir ladrillos.
- Se reemplazó la pala horizontal por dos palas verticales.
- Se añadieron controles para dos jugadores.
- Se modificó la pelota para funcionar como pelota de Pong.
- Se añadió puntuación para jugador izquierdo y jugador derecho.
- Se añadió condición de victoria a 7 puntos.
- Se añadió dificultad progresiva.
- Se modificaron los elementos visuales del juego.

## Estructura principal del proyecto

```txt
lib/
 ├─ main.dart
 └─ src/
    ├─ brick_breaker.dart
    ├─ config.dart
    ├─ components/
    │  ├─ ball.dart
    │  ├─ center_line.dart
    │  ├─ components.dart
    │  ├─ paddle.dart
    │  └─ play_area.dart
    └─ widgets/
       ├─ game_app.dart
       ├─ overlay_screen.dart
       └─ score_card.dart
```