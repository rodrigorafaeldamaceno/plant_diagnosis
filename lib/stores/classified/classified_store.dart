import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_diagnosis/helpers/camera_helper.dart';
import 'package:plant_diagnosis/helpers/tflite_helper.dart';
import 'package:plant_diagnosis/models/tflite_result.dart';

part 'classified_store.g.dart';

class ClassifiedStore = _ClassifiedStoreBase with _$ClassifiedStore;

abstract class _ClassifiedStoreBase with Store {
  @observable
  bool saveLocation = true;

  @observable
  File image;

  @observable
  ObservableList<TFLiteResult> outputs = ObservableList();

  final descriptionController = TextEditingController();
  final obsController = TextEditingController();

  @action
  Future pickImage({ImageSource source}) async {
    final imageTemp = await CameraHelper.pickImage(source: source);
    if (imageTemp == null) return;

    final outputsTemp = await TFLiteHelper.classifyImage(imageTemp);

    image = imageTemp;

    outputs.clear();
    outputs.addAll(outputsTemp);

    print(outputs);
  }
}
