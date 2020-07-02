import 'package:EHotelFlutter/model/hotel.dart';
import 'package:EHotelFlutter/pages/details_screen.dart';
import 'package:EHotelFlutter/pages/hotel_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int _selectedIndex = 0;
  int _currenttab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.purple,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/fahriz.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Fahriz Dimasqy',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'dimasqy.fahriz@gmail.com',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
          ),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              margin: EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Fahriz Dimasqy',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Welcome To E-Hotel :)',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 1, bottom: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Informasi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 8, bottom: 5),
                    child: Text(
                      'Harap Menggunakan Masker dan handsanitaizer di linkungan hotel untuk mencegah penularan virus corona dan hindari kerumunanan.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(left: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Recomended Hotel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HotelList();
                            }));
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.purple,
                                letterSpacing: 1.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 300.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotelList.length - 6,
                itemBuilder: (BuildContext context, int index) {
                  Hotel hotel = hotelList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          hotel: hotel,
                        );
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: 210.0,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                              height: 120.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      hotel.name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Text(
                                      hotel.description,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(28.0),
                                  child: Image(
                                    height: 180.0,
                                    width: 180.0,
                                    image: AssetImage(hotel.imageAsset),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  left: 10.0,
                                  bottom: 10.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        hotel.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            size: 10.0,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            hotel.location,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currenttab,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30.0,
                ),
                onPressed: () {}),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(
                  Icons.list,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HotelList();
                  }));
                }),
            title: Text('List Hotel'),
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

List<Hotel> hotelList = [
  Hotel(
    name: 'Recarlisonse',
    location: 'Central London',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus ',
    rating: '7.8',
    price: 'Rp 50.00000',
    imageAsset: 'images/hotel1.jpg',
  ),
  Hotel(
    name: 'Hotel 2',
    location: 'Chillicothe',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: '7.7',
    price: 'Rp 49.00000',
    imageAsset: 'images/hotel2.jpg',
  ),
  Hotel(
    name: 'Hotel 3',
    location: 'Virginia',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus.',
    rating: '8.8',
    price: 'Rp 250.0000',
    imageAsset: 'images/hotel3.jpg',
  ),
  Hotel(
    name: 'Hotel 4',
    location: 'Westampton',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: 'Open Everyday',
    price: 'Rp 25000',
    imageAsset: 'images/farm-house.jpg',
  ),
  Hotel(
    name: 'Hotel 5',
    location: 'Lembang',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: 'Open Everyday',
    price: 'Rp 25000',
    imageAsset: 'images/farm-house.jpg',
  ),
  Hotel(
    name: 'Hotel 6',
    location: 'Rhode Island',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: 'Open Everyday',
    price: 'Rp 25000',
    imageAsset: 'images/farm-house.jpg',
  ),
  Hotel(
    name: 'Hotel 7',
    location: 'Raleigh',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus.',
    rating: 'Open Everyday',
    price: 'Rp 25000',
    imageAsset: 'images/farm-house.jpg',
  ),
  Hotel(
    name: 'Hotel 8',
    location: 'Belmont',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus?',
    rating: 'Open Everyday',
    price: 'Rp 25000',
    imageAsset: 'images/farm-house.jpg',
  ),
  Hotel(
    name: 'Hotel 9',
    location: 'Raleigh',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus?',
    rating: 'Open Everyday',
    price: 'Rp 25000',
    imageAsset: 'images/farm-house.jpg',
  ),
];
