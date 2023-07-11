import 'package:flutter/material.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF272727) : Color(0xFFFFE400),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage('assets/welcome.png'), height: height * 0.6,),
            Column(
              children: [
                Text(
                  'WELCOME',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'We are here to serve you and esnure you recieve a good treat',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        // Navigate to the next page.
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
                        // );
                      },

                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor: Color(0xFF272727),
                          backgroundColor: Color(0xFFFFE400),
                          side: BorderSide(color: Color(0xffffffff)),
                        padding: EdgeInsets.symmetric(vertical: 30.0)
                      ),
                      child: Text('Login'.toUpperCase())),),

                const SizedBox(
                  width: 10.0,
                ),

                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next page.
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                          shape: RoundedRectangleBorder(),
                          foregroundColor: Color(0xffffffff),
                          backgroundColor: Color(0xFF272727),
                          side: BorderSide(color: Color(0xFFFFE400)),
                          padding: EdgeInsets.symmetric(vertical: 30.0)
                      ),


                      child: Text('Signup'.toUpperCase())),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
