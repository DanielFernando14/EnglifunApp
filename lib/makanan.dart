import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Makanan extends StatefulWidget {
  const Makanan({super.key});

  @override
  State<Makanan> createState() => _MakananState();
}

class _MakananState extends State<Makanan> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> makananList = [
    'Ayam goreng',
    'Bakso',
    'Buah-buahan potong',
    'Daging Panggang',
    'Ikan stick',
    'Keju',
    'Kentang goreng',
    'Kentang tumbuk',
    'Keripik kentang',
    'Makaroni keju',
    'Mie instan',
    'Nasi goreng',
    'Nugget',
    'Pancake',
    'Pizza',
    'Roti bakar',
    'Sandwich',
    'Sereal',
    'Spaghetti',
    'Telur dadar',
    // ... tambahkan daftar Makanan hingga Makanan 20
  ];

  List<String> gambarMakanan = [
    'assets/images/Ayam Goreng.png',
    'assets/images/Bakso.png',
    'assets/images/Buah Buahan Potong.png',
    'assets/images/Daging Panggang.png',
    'assets/images/Ikan Stik.png',
    'assets/images/Keju.png',
    'assets/images/Kentang Goreng.png',
    'assets/images/Kentang Tumbuk.png',
    'assets/images/Keripik Kentang.png',
    'assets/images/Makaroni Keju.png',
    'assets/images/Mie Instant.png',
    'assets/images/Nasi Goreng.png',
    'assets/images/Nuggets.png',
    'assets/images/Pancake.png',
    'assets/images/Pizza.png',
    'assets/images/Roti Bakar.png',
    'assets/images/Sandwich.png',
    'assets/images/Sereal.png',
    'assets/images/Spagethi.png',
    'assets/images/Telur Dadar.png',
    // ... tambahkan daftar gambar sesuai dengan Makanan hingga Makanan 20
  ];

  void showFoodDialog(BuildContext context, int index) {
    List<String> titles = [
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
      'Food',
    ];
    List<String> foodList = [
      'Fried Chicken',
      'Meatballs',
      'Sliced Fruits',
      'Steak',
      'Fish Sticks',
      'Cheese',
      'French Fries',
      'Mashed Potatoes',
      'Potato Chips',
      'Macaroni and Cheese',
      'Instant Noodles',
      'Fried Rice',
      'Nuggets',
      'Pancakes',
      'Pizza',
      'Toast',
      'Sandwich',
      'Cereal',
      'Spaghetti',
      'Scrambled Eggs',
    ];
    List<String> phoneticSymbols = [
      "/fraɪd ˈʧɪk.ɪn/",
      "/ˈmiːt.bɔːlz/",
      "/slaɪst fruːts/",
      "/steɪk/",
      "/fɪʃ stɪks/",
      "/ʧiːz/",
      "/frentʃ fraɪz/",
      "/mæʃt pəˈteɪ.toʊz/",
      "/pəˈteɪ.toʊ ʧɪps/",
      "/ˌmæk.əˈroʊ.ni ənd ʧiːz/",
      "/ˈɪn.stənt ˈnuːdəlz/",
      "/fraɪd raɪs/",
      "/ˈnʌɡ.ɪts/",
      "/ˈpæn.keɪks/",
      "/ˈpiːtsə/",
      "/toʊst/",
      "/ˈsæn.dwɪʧ/",
      "/ˈsɪr.iəl/",
      "/spəˈɡɛ.ti/",
      "/ˈskræm.bəld ɛɡz/",
    ];

    List<String> meanings = [
      'Chicken that is fried, typically with crispy skin.',
      'Small, round portions of minced or ground meat, often fried or boiled.',
      'Pieces of fruit that have been cut into slices.',
      'A piece of meat, typically beef, that is cooked by grilling, frying, or broiling.',
      'Pieces of fish that are coated in batter and fried.',
      'A dairy product, often yellow or white, made from milk.',
      'Slices of potatoes that have been deep-fried until crispy.',
      'Potatoes that have been boiled and mashed.',
      'Thin slices of potatoes that are fried until crispy.',
      'Macaroni pasta served with a cheese sauce.',
      'Pre-cooked noodles that are typically boiled for a short time.',
      'Cooked rice that is stir-fried with various ingredients and seasonings.',
      'Small pieces of meat, usually fried or baked, often in a square shape.',
      'Thin, flat cakes made from batter and fried or cooked on a griddle.',
      'Flatbread topped with tomato sauce, cheese, and various toppings.',
      'Bread that has been browned by exposure to heat, usually through toasting.',
      'Food consisting of one or more fillings between slices of bread.',
      'A breakfast food made from processed grains.',
      'Long, thin pasta.',
      'Eggs that have been beaten and cooked until just set.',
    ];

    List<String> examples = [
      'I had a delicious dinner of fried chicken and mashed potatoes.',
      'She served a plate of spaghetti with savory meatballs on top.',
      'The fruit platter included a variety of sliced fruits like watermelon, pineapple, and grapes.',
      'The steak was marinated in a delicious sauce.',
      'The kids enjoyed crispy fish sticks with tartar sauce for lunch.',
      'The cheese board had a selection of different types of cheese - cheddar, brie, and blue cheese.',
      'We ordered a burger with a side of French fries at the restaurant.',
      "Thanksgiving dinner wouldn't be complete without creamy mashed potatoes.",
      'She snacked on a bag of salty potato chips while watching a movie.',
      "The kids' favorite comfort food is definitely macaroni and cheese.",
      "When I'm in a hurry, I often prepare instant noodles for a quick meal.",
      'The fried rice at restaurant is always flavorful and delicious.',
      'The party platter was filled with crispy chicken nuggets and dipping sauces.',
      'Sunday mornings are meant for enjoying fluffy pancakes with maple syrup.',
      'We ordered a large pepperoni and mushroom pizza.',
      'I had a couple of slices of whole wheat toast with butter and jam.',
      'He made a classic turkey and cheese sandwich for his lunchbox.',
      'She prefers to start her day with a bowl of healthy whole grain cereal.',
      'The restaurant served generous portions of flavorful tomato sauce over a bed of spaghetti.',
      'She prepared a hearty breakfast of scrambled eggs and toast before heading out.',
    ];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF07553B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Color.fromARGB(255, 206, 212, 106),
                  width: 5.0,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titles[index],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 206, 212, 106),
                      fontFamily: 'Dinofont',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            makananList[index],
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarMakanan[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(foodList[index]);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFF07553B),
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 212, 106),
                            ),
                            child: const Text('Play'),
                          ),
                          const SizedBox(height: 0),
                          Text(
                            foodList[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          Text(
                            phoneticSymbols[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Meaning:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 22,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    meanings[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 16,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Example:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 22,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    examples[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 14,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (index > 0) {
                          setState(() {
                            index--;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF07553B),
                        backgroundColor:
                            const Color.fromARGB(255, 206, 212, 106),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back),
                          Text(
                            'Previous',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Wigglye',
                              color: Color(0xFF07553B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (index < makananList.length - 1) {
                          setState(() {
                            index++;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF07553B),
                        backgroundColor:
                            const Color.fromARGB(255, 206, 212, 106),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Wigglye',
                              color: Color(0xFF07553B),
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 206, 212, 106),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(208, 216, 175, 7),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Food',
                      style: TextStyle(
                        color: Color(0xFF07553B),
                        fontSize: 32,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Membuat 20 kotak yang tersusun atas 5 slide secara horizontal
          Positioned.fill(
            top: 85,
            child: PageView.builder(
              controller: PageController(viewportFraction: 1.3),
              itemCount: (makananList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleMakanan = makananList.sublist(
                  startIndex,
                  endIndex > makananList.length ? makananList.length : endIndex,
                );
                return Container(
                  padding:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    children: List.generate(visibleMakanan.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showFoodDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleMakanan[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarMakanan[itemIndex],
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
