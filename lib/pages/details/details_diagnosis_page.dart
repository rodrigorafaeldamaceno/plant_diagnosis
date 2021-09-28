import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:plant_diagnosis/db/database.dart';
import 'package:plant_diagnosis/helpers/date_helper.dart';
import 'package:plant_diagnosis/routes.dart';

class DetailsDiagnosisPage extends StatefulWidget {
  final Analyze analyze;

  DetailsDiagnosisPage({Key? key, required this.analyze}) : super(key: key);

  @override
  _DetailsDiagnosisPageState createState() => _DetailsDiagnosisPageState();
}

class _DetailsDiagnosisPageState extends State<DetailsDiagnosisPage> {
  openMapsSheet() async {
    try {
      final coords =
          Coords(widget.analyze.latitude!, widget.analyze.longitude!);
      final title = widget.analyze.description;
      final availableMaps = await MapLauncher.installedMaps;

      if (availableMaps.length == 1) {
        return availableMaps.first.showMarker(
          // coords: coords,
          coords: Coords(-24.982547, -53.268553),
          title: title,
        );
      }

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(widget.analyze.imageDir),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.analyze.species} - ${(widget.analyze.percentage * 100).toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Análise feita no dia: ${DateHelper.getDateDDMMYYYY(widget.analyze.date.toString()) + ' - ' + DateHelper.getHourMinute(widget.analyze.date.toString())}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: widget.analyze.latitude != null &&
                    widget.analyze.longitude != null,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   Routes.mapsPage,
                    //   arguments: LatLng(
                    //     widget.analyze.latitude ?? 0,
                    //     widget.analyze.longitude ?? 0,
                    //   ),
                    // );
                    openMapsSheet();
                  },
                  child: Text('Ver no mapa'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (widget.analyze.note?.isNotEmpty == true)
                Text(
                  'Observações: ${widget.analyze.note}',
                  textAlign: TextAlign.justify,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
