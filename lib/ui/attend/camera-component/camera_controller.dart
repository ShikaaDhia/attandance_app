import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraControllerComponent {
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isBusy = false;

  Future<void> loadCameras() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller!.initialize();
      
    }
  }

  Widget buildCameraPreview() {
    // !. bang operator -> nullable, ! diikutin method -> not (negasi, berada di awal method)
    if (controller == null || !controller!.value.isInitialized) {
      // aksi apabila kondisi bernilai negatif
     return const Center(child: CircularProgressIndicator());
    } 
    // aksi apabila kondisi bernilai positif
    return CameraPreview(controller!);
  }
}