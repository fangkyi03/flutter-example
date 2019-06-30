import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import './utli.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  renderSwiper () {
    return Container(
      color: Colors.blue,
      height: 150,
      child: new Swiper(
      itemBuilder: (BuildContext context,int index){
        return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
      },
      itemCount: 3,
    )
    );
  }

  renderText () {
    return new Text('1231',style:new TextStyle(decoration: TextDecoration.none) ,);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        new SliverPadding(padding:const EdgeInsets.all(29.0),sliver: new SliverList(delegate:new SliverChildListDelegate(<Widget>[
          this.renderSwiper(),
          this.renderText(),
          this.renderText(),
          this.renderIconGroup()
        ])),)
      ]);
  }

  renderIconGroup() {
    final Util list = new Util(List(100)).fill('1230');
	final listData = List(100).map((e){
		debugPrint('${e}');
	});
	print(listData);
	// final listData = list.map((e,i){
	// 	debugPrint('1313${e}:${i}');
	// 	return Text('123');
	// });
	// final listData = list.map((e,i)=> Text(('测试:${e}').toString(),style: TextStyle(decoration: TextDecoration.none),));
    return Column(children:[]);
  }
}
