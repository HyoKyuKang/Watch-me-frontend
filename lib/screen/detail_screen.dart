import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:watchme/model/model_movie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  DetailScreen({required this.movie});

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/' + widget.movie.poster),
                      fit: BoxFit.cover,
                    )),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  height: 300,
                                  child: Image.asset(
                                      'images/' + widget.movie.poster),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    '아무말',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    widget.movie.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.play_arrow),
                                        Text('재생'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //TO DO: display plot here.
                                  padding: EdgeInsets.all(5),
                                  child: Text(widget.movie.toString()),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '출연: 김동건\n제작자:강효규',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            like ? Icon(Icons.check) : Icon(Icons.add),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '내가 찜한 콘텐츠',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '평가',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.send),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '공유',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ],
                ),
              ),
              makeMenuButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeMenuButton() {
  return Container();
}
