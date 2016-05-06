import 'dart:html';
import 'package:xube_dart/game.dart';
import 'dart:web_gl' as WebGL;

class MyGame extends Game {
  MyGame(canvas): super(canvas);

  void render([double time = .0]) {
    this.gl.clear(WebGL.RenderingContext.COLOR_BUFFER_BIT |
        WebGL.RenderingContext.DEPTH_BUFFER_BIT);
  }
}

void main() {
  CanvasElement canvas = querySelector('#canvas');
  MyGame game = new MyGame(canvas);
  game.run();
}
