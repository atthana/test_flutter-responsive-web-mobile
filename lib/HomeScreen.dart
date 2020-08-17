import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:web_portfolio/VideoScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Method
  Widget inputField(String hintText, prefixIcon, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      autocorrect: true,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }

  // Widget button() {
  //   return FlatButton.icon(
  //     onPressed: () {
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => VideoScreen()));
  //     },
  //     icon: Icon(Icons.video_library),
  //     label: Text("See all Videos"),
  //     color: Colors.grey[800],
  //     textColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(32))),
  //   );
  // }
  alert() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            'END !!!',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          content: Container(
            height: 500,
            width: 600,
            child: Column(
              children: [
                Text(
                  'Thank you everyone for this session.\n\nDo you have any questions?\n\n',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    "assets/norak.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text(
                "No, I don't have.",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text(
                "I don't either.",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget button() {
    return Container(
      height: 50.0,
      child: InkWell(
        onTap: () {
          print('Alert was pressed');
          alert();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.green,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "LOGIN to CODIUM Kingdom",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: <Widget>[
            //make curves for desgining

            ClipPath(
              child: Container(
                color: Colors.blue[400],
                height: 140,
                width: screenSize.width,
              ),
              clipper: WaveClipperOne(),
            ),

            ClipPath(
              child: Container(
                color: Colors.blue[600],
                height: 120,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),

            //curves for bottom
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[400],
                  height: 80,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),

            //lets make content
            //lets first make content for small screens that is less than 580

            screenSize.width < 580
                ? Container(
                    //for small
                    width: screenSize.width,
                    height: screenSize.height,
                    child: Column(
                      children: <Widget>[
                        //Lets make container for picture

                        Container(
                          margin: EdgeInsets.only(top: 64),
                          height: 200,
                          width: 300,
                          child: Image.asset(
                            "assets/codium.png",
                            fit: BoxFit.contain,
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 64),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "RELEVANCE\nDELIVERED.",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey[900]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "We are your digital transformation engine.\n"
                                  "difficult problems can be solve.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.0,
                                      color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                inputField('Enter Your Email Here...',
                                    Icon(Icons.email), false),
                                SizedBox(
                                  height: 20,
                                ),
                                inputField('Enter Your Password Here...',
                                    Icon(Icons.vpn_key), true),
                                SizedBox(
                                  height: 20,
                                ),
                                button(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    //for large screens
                    height: screenSize.height,
                    width: screenSize.width,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 64),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "RELEVANCE.\nDELIVERED.",
                                        style: TextStyle(
                                            fontSize: 64,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blueGrey[900]),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "We are your digital transformation engine.\n"
                                        "difficult problems can be solve.",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.0,
                                            color: Colors.grey[800]),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      inputField('Enter Your Email Here...',
                                          Icon(Icons.email), false),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      inputField('Enter Your Password Here...',
                                          Icon(Icons.vpn_key), true),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      button(),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 150, right: 150, bottom: 150),
                                  child: Container(
                                    // child: Image.asset("assets/codium2.png", fit: BoxFit.fitWidth,),
                                    child: Image.asset(
                                      "assets/codium2.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
