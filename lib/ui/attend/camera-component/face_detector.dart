import 'package:attandance_app/utils/google_ml_kit.dart';
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
}