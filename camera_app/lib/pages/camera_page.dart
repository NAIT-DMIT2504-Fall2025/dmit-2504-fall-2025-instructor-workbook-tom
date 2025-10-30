import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.cameraDescription});
  final CameraDescription cameraDescription;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.cameraDescription,
      ResolutionPreset.max,
    );

    _controller
        .initialize()
        .then((_) {
          // Once the controller is initialized it's good practice to rerender the screen to avoid any wonkiness
          setState(() {});
          // This is also where you could set camera presets if you wanted
        })
        .catchError((e) {
          // Here is where you handle errors with the camera (permission denied)
          if (e is CameraException) {
            if (e.code == "CameraAccessDenied") {
              // If the user doesn't give you permissions, here is where you handle that
              // remprompt, shut down app, don't do camera things, etc.
            }
          }
          // Handle other exceptions here
        });
  }

  Future<XFile?> takePicture() async {
    // First we make sure we're not currently in the process of taking a picture
    if (_controller.value.isTakingPicture) return null;

    try {
      var file = await _controller.takePicture();
      return file;
    } catch (e) {
      // If something goes wrong you can decide how to handle that, tell the user, crash the app, etc.
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera Page")),
      body: Center(
        child: Column(children: [Expanded(child: CameraPreview(_controller))]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          takePicture();
          // TODO: save the picture that we take
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
