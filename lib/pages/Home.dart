import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  Widget build(BuildContext context) {
    //we receive passed vars

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print(data);
    //set background
    String bgImage = data['isDayTime']? 'day.jpg': 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue:Colors.indigo[700];
    Color textColor = data['isDayTime'] ? Colors.indigo[900] : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'date': result['date'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: textColor,
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: textColor,
                      ),
                    )
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  data['date'],
                  style: TextStyle(
                    fontSize: 40.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
