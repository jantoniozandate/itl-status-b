import 'package:flutter/material.dart';
import 'package:itlstatusb/src/models/carga_model.dart';

class ScreenNowCard extends StatelessWidget {
  final Carga carga;
  const ScreenNowCard({Key key, this.carga}) : super(key: key);

  truncateStringOverCharacters(String string, {int characters = 25}) {
    
    if (string.length < characters) return string;
    return string.replaceRange(characters, string.length, '...');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
              colors: [Colors.purple[500], Colors.red],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 35.0,
                  child: Icon(Icons.class__outlined,
                      size: 50, color: Colors.white))),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                carga?.subject?.name,
                // overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 35),
              Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_pin_sharp,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        truncateStringOverCharacters(carga?.professor),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 12.0, color: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        carga?.getTodaySchedule()?.room,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0, color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(carga?.group,
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.white)),
                      Text('Grupo',
                          style:
                              TextStyle(fontSize: 10.0, color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(carga?.subject?.key,
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.white)),
                      Text('Clave',
                          style:
                              TextStyle(fontSize: 10.0, color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(((carga?.students?.length ?? 2) - 1).toString(),
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.white)),
                      Text('+Alumnos',
                          style:
                              TextStyle(fontSize: 10.0, color: Colors.white)),
                    ],
                  )
                ],
              )
            ],
          )),
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    carga.getTodaySchedule().from,
                    style: TextStyle(fontSize: 30.0, color: Colors.white70),
                  ),
                  Text(
                    'Inicio',
                    style: TextStyle(fontSize: 14.0, color: Colors.white70),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
