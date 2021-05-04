import 'package:covidtracker/models/global_model.dart';
import 'package:covidtracker/services/api_manager.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Welcome> _model;

  @override
  void initState() {
    _model = Api_Manager().getGlobalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracker'),
        centerTitle: true,
      ),
      body: FutureBuilder<Welcome>(
        future: _model,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.id.length,
              itemBuilder: (context, index) {
                var _data = snapshot.data;
                return Card(
                  child: Column(
                    children: [Text("${_data.global.date}")],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
