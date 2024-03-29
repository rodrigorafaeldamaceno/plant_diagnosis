import 'dart:async';
import 'dart:io';
import 'package:plant_diagnosis/models/examples/examples.dart';
import 'package:plant_diagnosis/models/tflite_result.dart';
import 'package:tflite_maven/tflite.dart';

class TFLiteHelper {
  static Future loadModel(Examples examples) async {
    await Tflite.loadModel(
      model: "assets/${examples.location}/model_unquant.tflite",
      labels: "assets/${examples.location}/labels.txt",
      numThreads: 1,
    );
  }

  static void dispose() {
    Tflite.close();
  }

  static Future<List<TFLiteResult>?> classifyImage(File image) async {
    try {
      List<TFLiteResult> outputs = [];

      final output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 5,
        threshold: 0.01,
        asynch: true,
      );

      final element = TFLiteResult.fromJson(output!.first);

      print(element.toJson());

      // outputs.addAll(output.map((e) => TFLiteResult.fromJson(e)).toList());

      // print(outputs.length);

      output.forEach((value) {
        final element = TFLiteResult.fromJson(value);
        outputs.add(element);
      });

      print(outputs);

      return outputs;
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  static Future<List<TFLiteResult>?> classifyImages(List<File> images) async {
    try {
      List<TFLiteResult> outputs = [];

      for (var image in images) {
        final result = await classifyImage(image);

        if (result == null) {
          return [];
        }

        outputs.addAll(result);
      }
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
