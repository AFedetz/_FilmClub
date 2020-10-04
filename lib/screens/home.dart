import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  Color mainColor = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          '_FILM CLUB',
          style: GoogleFonts.anonymousPro(
            textStyle: TextStyle(color: Colors.white, letterSpacing: .7),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'THIS WEEK',
                          style:  GoogleFonts.anonymousPro(
                            textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 18),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(data['weekofdate'],
                          style:  GoogleFonts.anonymousPro(
                            textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 18),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )
                  ]
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(data['poster']
                      ),
                    ]
                ),
              ),
              Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(data['year'],
                          style:  GoogleFonts.anonymousPro(
                            textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 18),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(data['runtime'],
                          style:  GoogleFonts.anonymousPro(
                            textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 18),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          onPressed: _launchURLGS,
                          child: Text(
                          'Rate This Film',
                          style:  GoogleFonts.anonymousPro(
                            textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 20),
                          ),
                          textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ]
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(data['plot'],
                      style:  GoogleFonts.anonymousPro(
                        textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 17),
                        ),
                      textAlign: TextAlign.left,
                      ),
                  ),
                  ]
                ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Directed by ' + data['director'],
                        style:  GoogleFonts.anonymousPro(
                          textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 17),
                                  ),
                            textAlign: TextAlign.left,
                                ),
                              ),
                  ),
                          ],
                        ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Written by ' + data['writer'],
                        style:  GoogleFonts.anonymousPro(
                          textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 17),
                                    ),
                              textAlign: TextAlign.left,
                                ),
                              ),
                  ),
                          ],
                        ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FlatButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      onPressed: () async {
                        var url = ('https://www.justwatch.com/us/movie/' + data['title'].split(" ").join("-"));
                          if (await canLaunch(url)) {
                        await launch(url);
                        } else {
                        throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                        'Where to Watch',
                        style:  GoogleFonts.anonymousPro(
                          textStyle: TextStyle(color: Colors.white, letterSpacing: .7, fontSize: 20),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}


_launchURLGS() async {
  const url = 'https://docs.google.com/spreadsheets/d/1phlTKpnU_hsecr0xTRU1UfjqUF3LEIkr5rTDP1H1r6g/edit#gid=263963285';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

