import 'package:flutter/material.dart';
import 'package:plant_diagnosis/routes.dart';

class DetailsDiagnosisPage extends StatefulWidget {
  @override
  _DetailsDiagnosisPageState createState() => _DetailsDiagnosisPageState();
}

class _DetailsDiagnosisPageState extends State<DetailsDiagnosisPage> {
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
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/image.jpeg'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Planta com Leaf Scorch - 99,6%',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Analise feita no dia 14/05/1995',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.mapsPage);
                },
                child: Text('Ver no mapa'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Observações: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
