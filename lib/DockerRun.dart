import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DockerRun extends StatefulWidget {
  @override
  _DockerRunState createState() => _DockerRunState();
}

class _DockerRunState extends State<DockerRun> {
  var cmd;
  var imagename;
  var expose;
  var sc;
  httpData(cmd, imagename, espose) async {
    print(cmd);
    var url =
        "http://192.168.43.182/cgi-bin/web.py?x=${cmd}&y=${imagename}&z=${expose}";
    var response = await http.get(url);
    var sc = response.body;
    print(sc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launch Container'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue.shade800,
        child: Center(
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Text(
                    'Contianer Name:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: 200,
                      color: Colors.white,
                      child: TextField(
                        onChanged: (val) {
                          cmd = val;
                        },
                        autocorrect: false,
                        decoration: InputDecoration(),
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text('Image Name:',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 30,
                      width: 200,
                      color: Colors.white,
                      child: TextField(
                        onChanged: (val) {
                          imagename = val;
                        },
                        autocorrect: false,
                        decoration: InputDecoration(),
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Expose:',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 30,
                      width: 200,
                      color: Colors.white,
                      child: TextField(
                        onChanged: (val) {
                          expose = val;
                        },
                        autocorrect: false,
                        decoration: InputDecoration(),
                      ),
                    ),
                  ),
                ]),
                Card(
                  child: FlatButton(
                      onPressed: () {
                        httpData(cmd, imagename, expose);
                      },
                      child: Text(
                        'Launch',
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
