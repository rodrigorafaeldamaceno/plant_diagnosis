import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_diagnosis/db/database.dart';
import 'package:plant_diagnosis/helpers/camera_helper.dart';
import 'package:plant_diagnosis/helpers/tflite_helper.dart';
import 'package:plant_diagnosis/models/tflite_result.dart';

part 'classified_store.g.dart';

class ClassifiedStore = _ClassifiedStoreBase with _$ClassifiedStore;

abstract class _ClassifiedStoreBase with Store {
  final _dao = MyDatabase.instance.analysisDAO;

  @observable
  bool saveLocation = true;

  @observable
  File? image;

  @observable
  ObservableList<TFLiteResult> outputs = ObservableList();

  final descriptionController = TextEditingController();
  final obsController = TextEditingController();

  String getSpecieName({required String defaultName}) {
    return getDiseaseName(
      defaultName: defaultName
          .replaceAll('Apple___', 'Maçã: ')
          .replaceAll('Potato___', 'Batata: ')
          .replaceAll('Tomato___', 'Tomate: ')
          .replaceAll('Corn___', 'Milho: ')
          .replaceAll('Grape___', 'Uva: '),
    );
  }

  String getDiseaseName({required String defaultName}) {
    return defaultName
        .replaceAll('healthy', 'Saudável')
        .replaceAll('Apple_scab', 'Crosta de maçã')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável')
        .replaceAll('healthy', 'Saudável');

    // return label;
  }

  Stream<List<Analyze>> find() {
    return _dao.find();
  }

  Future addAnalyze(Analyze analyze) {
    return _dao.addAnalyze(
      analyze.copyWith(
        species: getSpecieName(defaultName: analyze.result ?? ''),
      ),
    );
  }

  Future removeAnalyze(int id) {
    return _dao.removeAnalyze(id);
  }

  @action
  Future pickImage({required ImageSource source}) async {
    final imageTemp = await CameraHelper.pickImage(source: source);
    if (imageTemp == null) return;

    final outputsTemp = await TFLiteHelper.classifyImage(imageTemp);

    image = imageTemp;

    outputs.clear();
    outputs.addAll(outputsTemp!);

    print(outputs);
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
