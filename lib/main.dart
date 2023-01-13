import 'package:flutter/material.dart';
import 'package:logindice/dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus(); //빈공간 누르면 키보드가 내려감
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                Center(
                  child: Image(
                    image: AssetImage('image/chef.gif'),
                    width: 170,
                    height: 190,
                  ),
                ),
                Form(
                    child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.teal,
                            inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(
                              color: Colors.teal,
                              fontSize: 15,
                            ))),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              TextField(
                                autofocus: true,

                                controller: controller,
                                decoration:
                                    InputDecoration(labelText: 'Enter dice'),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextField(
                                controller: controller2,
                                decoration:
                                    InputDecoration(labelText: 'Enter password'),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ButtonTheme(
                                  minWidth: 100,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orangeAccent),
                                    child: Icon(
                                      Icons.login,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      if (controller.text == 'dice' &&
                                          controller2.text == '1234') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    Dice()));
                                      } else if (controller.text != 'dice' &&
                                          controller2.text == '1234') {
                                        showSnackBar3(context);
                                      } else if (controller.text == 'dice' &&
                                          controller2.text != '1234') {
                                        showSnackBar2(context);
                                      } else {
                                        showSnackBar(context);
                                      }
                                    },
                                  ))
                            ],
                          ),
                        )))
              ],
            ),
          ),
        );
      }),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Input Error Account'),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Input Error PW'),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('wrong spelling of dice'),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
  ));
}
