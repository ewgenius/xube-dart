import 'dart:html';
import 'dart:web_gl' as WebGL;
import 'package:dartemis/dartemis.dart';



void main() {
  CanvasElement canvas = querySelector('#canvas');
  WebGL.RenderingContext gl = canvas.getContext("experimental-webgl");
  if (canvas is! CanvasElement || gl is! WebGL.RenderingContext) {
    print("Failed to load canvas");
    return;
  }

  World world = new World();
  Entity entity = world.createEntity();
}
