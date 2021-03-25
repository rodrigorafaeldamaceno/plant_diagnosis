import 'package:flutter/material.dart';
import 'package:plant_diagnosis/db/database.dart';
import 'package:plant_diagnosis/helpers/date_helper.dart';
import 'package:plant_diagnosis/routes.dart';
import 'package:plant_diagnosis/stores/classified/classified_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ClassifiedStore();

  @override
  void initState() {
    super.initState();
  }

  Widget cardAnalyze({@required Analyze analyze}) {
    return Card(
      child: ListTile(
        title: Text(analyze.description),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(analyze.species),
            Text(DateHelper.getDateDDMMYYYY(analyze.date.toString()) +
                ' - ' +
                DateHelper.getHourMinute(analyze.date.toString())),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detailsDiagnosis,
            arguments: analyze,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Histórico',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              StreamBuilder(
                stream: controller.find(),
                initialData: <Analyze>[],
                builder: (BuildContext context,
                    AsyncSnapshot<List<Analyze>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return cardAnalyze(
                        analyze: snapshot.data[index],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, Routes.classifiedPage);
        },
      ),
    );
  }
}
