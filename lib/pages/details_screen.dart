import 'package:EHotelFlutter/model/hotel.dart';
import 'package:EHotelFlutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class DetailScreen extends StatelessWidget {
  final Hotel hotel;
  DetailScreen({@required this.hotel});
  int _selectedIndex = 0;
  int _currenttab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black26,
                  ),
                  height: 400,
                  child: Image.asset(
                    hotel.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          hotel.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 16.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              hotel.rating,
                            ),
                          ),
                          Spacer(),
                          FavoriteButton()
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(32.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.purple,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.purple,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.purple,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.purple,
                                          ),
                                          Icon(
                                            Icons.star_border,
                                            color: Colors.purple,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      hotel.price,
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24),
                                    ),
                                    Text('/per night')
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                color: Colors.purple,
                                textColor: Colors.white,
                                onPressed: () {
                                  Toast.show("Booking Success", context,
                                      duration: Toast.LENGTH_SHORT,
                                      backgroundColor: Colors.greenAccent,
                                      gravity: Toast.BOTTOM);
                                },
                                child: Text('Book Now'),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 32.0),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Description'.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              hotel.description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: AppBar(
                    title: Text(
                      'Detail',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currenttab,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text('Back'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage('images/fahriz.png'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
