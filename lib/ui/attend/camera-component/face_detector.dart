import 'dart:math';

import 'package:attandance_app/utils/google_ml_kit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorComponent {
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(
    FaceDetectorOptions(
      enableClassification: true,
      enableTracking: true,
      enableContours: true,
      enableLandmarks: true,
    ),
  );

  Future<void> detectFaces(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);

    // proses faces nya udh terdeteksi
    for (Face face in faces) {
      // rect : rectangle (buat ngambil posisi wajah)
      // boundingbox : buat ngambil beberapa komponen dri wajah (position)
      final Rect boundingBox = face.boundingBox;

      // untk menghandle posisi wajah secara vertikal
      final double? verticalPosition = face.headEulerAngleY;

      // untk menghandle posisi wajah secara horizontal
      final double? horizontalPosition = face.headEulerAngleZ;

      // perkondisian apabila face landmark sudah aktif, ditandai oleh (mulut, mata, pipi, hidung, dan telinga)
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      // klo pnya kuping dia bakal ngembaliin posisi letak kupingnya
      if (leftEar != null) {
        final Point<int> leftEarPosition = leftEar.position;
        print('Left Ear Position: $leftEarPosition');
        
      }

      // perkondisian apabila wajahnya terdeteksi (ditandai dengan bibir tersenyum)
      if (face.smilingProbability != null) {
        final double? smilingProbability = face.smilingProbability;
        print("Smiling Probability: $smilingProbability");
      }

      //perkondisian apabila fitur tracking wajah sudah aktif
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
        print("Tracking ID: $trackingId");
      }

    }
  }
} 