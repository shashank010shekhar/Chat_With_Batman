import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'pages.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // just delay for showing this slash page clearer because it too fast
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/app_icon.gif",
              width: 500,
              height:500,
            ),
            SizedBox(height:20),
            Text('Dark Knight Talks',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Container(
              width: 20,
              height: 20,
              child:
                  CircularProgressIndicator(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
