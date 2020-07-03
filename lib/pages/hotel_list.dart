import 'package:EHotelFlutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:EHotelFlutter/model/hotel.dart';
import 'package:EHotelFlutter/pages/details_screen.dart';

class HotelList extends StatefulWidget {
  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  int _currenttab = 0;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Colors.purple,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Fahriz Dimasqy',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Find Your Hotel',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for Hotels',
                          icon: Icon(Icons.search, color: Colors.grey[400]),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (string) {
                          setState(() {
                            filteredHotels = hotelList
                                .where((element) => element.name
                                    .toLowerCase()
                                    .contains(string.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Container(
                margin: EdgeInsets.only(bottom: 150),
                child: ListView.builder(
                  itemCount: filteredHotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    Hotel hotel = filteredHotels[index];

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
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: MediaQuery.of(context).size.height / 3,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(hotel.imageAsset),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 16,
                                      top: 16,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 19,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              color: Colors.purple,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.star,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  '4.75',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 16,
                                      top: 16,
                                      child: Container(
                                        height: 42,
                                        width: 42,
                                        decoration: BoxDecoration(
                                          color: Colors.purple,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    )),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      top: 20,
                                      child: Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(16),
                                            topLeft: Radius.circular(16),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(left: 16),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              hotel.price,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 16,
                                      top: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            hotel.name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            hotel.location,
                                            style: TextStyle(
                                              color: Colors.purpleAccent,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currenttab,
        onTap: (int value) {
          setState(() {
            _currenttab = value;
          });
        },
        backgroundColor: Colors.white,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
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
    price: 'Rp 50.00000',
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
    rating: '7.6',
    price: 'Rp 25000',
    imageAsset: 'images/hotel4.jpg',
  ),
  Hotel(
    name: 'Hotel 5',
    location: 'Newyork',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: '7.6',
    price: 'Rp 25000',
    imageAsset: 'images/hotel5.jpeg',
  ),
  Hotel(
    name: 'Hotel 6',
    location: 'Rhode Island',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: '7.6',
    price: 'Rp 25000',
    imageAsset: 'images/hotel6.jpg',
  ),
  Hotel(
    name: 'Hotel 7',
    location: 'Raleigh',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus.',
    rating: '7.9',
    price: 'Rp 25000',
    imageAsset: 'images/hotel7.jpg',
  ),
  Hotel(
    name: 'Hotel 8',
    location: 'Belmont',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus?',
    rating: '7.9',
    price: 'Rp 25000',
    imageAsset: 'images/hotel8.jpg',
  ),
  Hotel(
    name: 'Hotel 9',
    location: 'Raleigh',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus?',
    rating: '7.8',
    price: 'Rp 25000',
    imageAsset: 'images/hotel9.jpeg',
  ),
];

List<Hotel> filteredHotels = [
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
    price: 'Rp 50.00000',
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
    rating: '7.6',
    price: 'Rp 25000',
    imageAsset: 'images/hotel4.jpg',
  ),
  Hotel(
    name: 'Hotel 5',
    location: 'Newyork',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: '7.6',
    price: 'Rp 25000',
    imageAsset: 'images/hotel5.jpeg',
  ),
  Hotel(
    name: 'Hotel 6',
    location: 'Rhode Island',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus',
    rating: '7.6',
    price: 'Rp 25000',
    imageAsset: 'images/hotel6.jpg',
  ),
  Hotel(
    name: 'Hotel 7',
    location: 'Raleigh',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus.',
    rating: '7.9',
    price: 'Rp 25000',
    imageAsset: 'images/hotel7.jpg',
  ),
  Hotel(
    name: 'Hotel 8',
    location: 'Belmont',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus?',
    rating: '7.9',
    price: 'Rp 25000',
    imageAsset: 'images/hotel8.jpg',
  ),
  Hotel(
    name: 'Hotel 9',
    location: 'Raleigh',
    description:
        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nemo iusto ratione at, molestiae atque obcaecati eaque nostrum inventore. Illum cumque reiciendis corporis facilis quasi dolore numquam ab qui aperiam delectus?',
    rating: '7.8',
    price: 'Rp 25000',
    imageAsset: 'images/hotel9.jpeg',
  ),
];
