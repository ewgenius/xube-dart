import 'dart:html';
import 'package:xube_dart/xube.dart';

void main() {
  CanvasElement canvas = querySelector('#canvas');
  XubeGame game = new XubeGame(canvas);
  game.run();
}
