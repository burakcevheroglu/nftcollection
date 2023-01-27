import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nftcollection/infopage.dart';

int selectedIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0) + const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore Collections',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 0,
                          color: Colors.red
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/me.jpg'),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined), hintText: 'Search'),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 35,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ChipWidget(selected: true, title: 'Trending'),
                    ChipWidget(selected: false, title: 'Recent'),
                    ChipWidget(selected: false, title: 'Top'),
                    ChipWidget(selected: false, title: '>3 ETH+'),
                    ChipWidget(selected: false, title: '>10 ETH +'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Trendy Collection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    NFTCard(
                        imagePath: 'assets/1.png',
                        title: 'Rainbow Bear',
                        price: '3 ETH'),
                    NFTCard(
                        imagePath: 'assets/2.png',
                        title: 'Businessman',
                        price: '2.37 ETH'),
                    NFTCard(
                        imagePath: 'assets/3.png',
                        title: 'Mia the Marksman',
                        price: '3 ETH'),
                    NFTCard(
                        imagePath: 'assets/4.png',
                        title: 'FROG!!! (L9)',
                        price: '6.743 ETH'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NFTCard extends StatelessWidget {
  const NFTCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.price});

  final String imagePath;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
              color: Colors.red,
            ),
            child: Stack(
              children: [
                Hero(
                  tag: title,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            colors: [
                              Color.fromRGBO(171, 37, 37, 0.2),
                              Color.fromRGBO(255, 250, 250, .6),
                            ])),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 30,
                  left: 30,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    price,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(imagePath: imagePath, title: title, price: price)));
                              },
                              child: Container(
                                height: double.infinity,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black),
                                child: const Center(
                                  child: Icon(Icons.shopping_cart_outlined),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.selected,
    required this.title,
  });

  final bool selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: (selected) ? Colors.black : Colors.white,
            ),
            color: (selected) ? Colors.white : Colors.transparent,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: (selected) ? FontWeight.bold : FontWeight.normal,
                color: (selected) ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
