library xube;

import 'dart:html';
import 'dart:web_gl' as WebGL;
//import 'package:vector_math/vector_math.dart';
import 'package:dartemis/dartemis.dart';

abstract class Game {
  int _width, _height;
  bool _stop = false;
  int _animFrameId;
  double _elapsedTime;
  World _world;
  CanvasElement _canvas;
  WebGL.RenderingContext _gl;

  int get width => _width;
  int get height => _height;
  WebGL.RenderingContext get gl => _gl;

  Game(canvas) {
    this._canvas = canvas;
    this._gl = this._canvas.getContext("experimental-webgl");
    if (canvas is! CanvasElement || _gl is! WebGL.RenderingContext) {
      print("Failed to load canvas");
    }

    this._gl.clearColor(0, 0, 1, 1.0);
    this._gl.enable(WebGL.RenderingContext.DEPTH_TEST);

    this._world = new World();
    this._world.initialize();
  }

  void resize(int width, int height) {

  }

  void run() {
    this._renderFrame();
  }

  void _renderFrame() {
    if (this._stop) {
      window.cancelAnimationFrame(this._animFrameId);
    } else {
      this._animFrameId = window.requestAnimationFrame((double time) {
        if (this._elapsedTime == null) {
          this._elapsedTime = time;
        }

        this.preRender();
        this.render(time - this._elapsedTime);
        this.postRender();

        this._elapsedTime = time;
        this._renderFrame();
      });
    }
  }

  void preRender() {}

  void render([double time = .0]) {}

  void postRender() {}
}
