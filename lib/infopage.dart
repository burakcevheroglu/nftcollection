import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String imageText = "Introducing our exclusive NFT collection, featuring a curated selection of one-of-a-kind digital art pieces from some of the most talented artists in the industry. Each piece in this collection is a unique and authenticated digital asset, stored on the blockchain for secure ownership verification.\n\nExplore a wide range of styles and mediums, from mesmerizing 3D animations to thought-provoking illustrations and beyond. Whether you're a seasoned collector or just starting to explore the world of NFTs, our collection has something for everyone.\n\nOur NFTs are available for purchase on the Ethereum blockchain, and are easily transferable and tradeable. Each piece comes with a certificate of authenticity, guaranteeing that you are the sole owner of a one-of-a-kind digital masterpiece.\n\nDon't miss out on this opportunity to own a piece of the digital art revolution. Browse our collection today and discover the future of art ownership.";

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key, required this.imagePath, required this.title, required this.price}) : super(key: key);

  final String imagePath;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Hero(
            tag: title,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
              ),
              child: Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                      gradient:  LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Color.fromRGBO(171, 37, 37, 0.2),
                            Color.fromRGBO(255, 250, 250, .6),
                          ])
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0) + const EdgeInsets.only(top: 10),
            child: Container(
              width: double.infinity,
              height: 400,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:  [
                          Text(title ,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                          const SizedBox(width: 5,),
                          const Icon(Icons.verified_user_rounded,color: Colors.green,),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/eth.png',width: 20,color: Colors.yellow,),
                          const SizedBox(width: 5,),
                          Text(price ,style: const TextStyle(fontSize: 20,color: Colors.yellow),),
                        ],
                      )

                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 1,
                                color: Colors.red
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/me.jpg'),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          const SizedBox(width: 10,),
                          const Text('burak_taha',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w300),)
                        ],
                      ),
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text('16:17:33',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 200,
                    child:  SingleChildScrollView(
                      child: Text(imageText,
                        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red
                      ),
                      child: Center(child: Text('BUY IT FOR $price', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
