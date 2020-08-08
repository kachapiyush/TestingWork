import 'dart:ui';
import 'package:flutter/material.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String imagepath =
        'https://previews.123rf.com/images/nerthuz/nerthuz1804/nerthuz180400209/100139212-wrong-cross-symbol-isolated.jpg';
    return Scaffold(
      body: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber,
                    Colors.teal,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(6),
                //color: Colors.green,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                        ),
                      ),
                      height: 50,
                      width: 90,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                        height: 50,
                        width: 90,
                      ),
                    ),
                    Card(
                      //color: Colors.pink[100],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      margin: EdgeInsets.all(6.0),
                      child: ListTile(
                        leading: Image.network(
                          dummyData[index]['Pic'] != ''
                              ? dummyData[index]['Pic']
                              : imagepath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {},
                        trailing: Icon(
                          Icons.arrow_forward,
                          size: 30.0,
                          color: Colors.green,
                        ),
                        isThreeLine: true,
                        // title: Text(widget.tender.name,
                        //     style: TextStyle(
                        //         color: Theme.of(context).primaryColor, fontSize: 20)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              dummyData[index]['Khabar_Title'],
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              dummyData[index]['Khabar_Date']
                                  .split("T")
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
