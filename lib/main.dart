import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FlutterLogo(size: 100),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 200,
                  color: Colors
                      .primaries[index % Colors.primaries.length], //總共有十八個顏色
                );
              },
              childCount: 23
            ),
            //指定一行幾個 SliverGridDelegateWithFixedCrossAxisCount
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 200,
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }),
          ),
        ],
      ),

      // body: CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: FlutterLogo(size:200),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Text("Helllo Sliver"),
      //     )
      //   ],
      // ),
      //
      // body: Center(
      //   child: SizedBox(
      //     width: 300,
      //     height: 450,
      //     child: ListView.builder(
      //       itemBuilder: (BuildContext context, int index) {
      //         return Container(
      //           height: 200,
      //           color: Colors.primaries[index % 18],
      //         );
      //       },
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
