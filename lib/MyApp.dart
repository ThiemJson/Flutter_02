import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  String _email = '';
  String _pass = '';
  final emailEditingController = TextEditingController();
  final passEditingController = TextEditingController();


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      print("Background Mode");
    }
    else if(state == AppLifecycleState.resumed){
      print("Foreground Mode");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    print("Initing...");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    passEditingController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("Disposing...");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "This is my first StateFulWidget",
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                //How to get value
                controller: emailEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _email = text;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(38)),
                    ),
                    labelText: 'Enter your email'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                //How to get value
                controller: passEditingController,
                onChanged: (text) {
                  this.setState(() {
                    _pass = text;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(38)),
                    ),
                    labelText: 'Enter your password'),
              ),
            ),
            Text(
              'Tài khoản : '+_email,
              style:
                  TextStyle(fontSize: 20, color: Color.fromRGBO(1, 1, 1, 100)),
            ),
            Text(
              'Mật khẩu : ' + _pass,
              style:
              TextStyle(fontSize: 20, color: Color.fromRGBO(1, 1, 1, 100)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                label: Text(
                  "Call",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 100),
                    fontSize: 30
                  ),
                ),
                icon: Icon(Icons.add_call, color: Color.fromRGBO(255, 255, 255, 100),),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: (){
                  if( _email.length < 10 && _pass.length < 10){
                    print("Pass and user so short");
                  }
                },
              ),
            ),
            Image.network("https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
          ],
        )),
      ),
    );
  }
}
