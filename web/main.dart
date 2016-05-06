import 'dart:html';
import 'dart:web_gl' as WebGL;
import 'package:dartemis/dartemis.dart';
//import 'package:xube_dart/xube.dart';
//import 'package:dartemis_toolbox/system_transform.dart';

class Transform extends Component {
  num x, y, z;
  Transform(this.x, this.y, this.z);
}

class TransformSystem extends EntityProcessingSystem {
  TransformSystem(): super(Aspect.getAspectForAllOf([Transform]));

  void initialize() {

  }

  void processEntity(Entity entity) {
    print(entity);
  }
}

void main() {
  CanvasElement canvas = querySelector('#canvas');
  WebGL.RenderingContext gl = canvas.getContext("experimental-webgl");
  if (canvas is! CanvasElement || gl is! WebGL.RenderingContext) {
    print("Failed to load canvas");
    return;
  }

  World world = new World();
  world.addSystem(new TransformSystem());

  Entity entity = world.createEntity();
  entity.addComponent(new Transform(0, 0, 0));

  world.initialize();
  world.process();
}
