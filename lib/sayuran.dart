import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Sayuran extends StatefulWidget {
  const Sayuran({super.key});

  @override
  State<Sayuran> createState() => _SayuranState();
}

class _SayuranState extends State<Sayuran> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> sayuranList = [
    'Bawang Merah',
    'Bawang Putih',
    'Bayam',
    'Brokoli',
    'Jagung',
    'Jamur',
    'Kacang Panjang',
    'Kacang Polong',
    'Kembang Kol',
    'Kentang',
    'Kubis',
    'Labu',
    'Lobak',
    'Mentimun',
    'Paprika',
    'Selada',
    'Terong',
    'Tomat',
    'Ubi Jalar',
    'Wortel',
    // ... tambahkan daftar Sayuran hingga Sayuran 20
  ];

  List<String> gambarSayuran = [
    'assets/images/Bawang Merah.png',
    'assets/images/Bawang Putih.png',
    'assets/images/Bayam.png',
    'assets/images/Brokoli.png',
    'assets/images/Jagung.png',
    'assets/images/Jamur.png',
    'assets/images/Kacang Panjang.png',
    'assets/images/Kacang Polong.png',
    'assets/images/Kembang Kol.png',
    'assets/images/Kentang.png',
    'assets/images/Kubis.png',
    'assets/images/Labu.png',
    'assets/images/Lobak.png',
    'assets/images/Mentimun.png',
    'assets/images/Paprika.png',
    'assets/images/Selada.png',
    'assets/images/Terong.png',
    'assets/images/Tomat.png',
    'assets/images/Ubi Jalar.png',
    'assets/images/Wortel.png',
    // ... tambahkan daftar gambar sesuai dengan Sayuran hingga Sayuran 20
  ];

  void showVegetablesDialog(BuildContext context, int index) {
    List<String> titles = [
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
      'Vegetables',
    ];
    List<String> vegetablesListt = [
      'Red Onion',
      'Garlic',
      'Spinach',
      'Broccoli',
      'Corn',
      'Mushroom',
      'Green Beans',
      'Peas',
      'Cauliflower',
      'Potato',
      'Cabbage',
      'Pumpkin',
      'Radish',
      'Cucumber',
      'Bell Pepper',
      'Lettuce',
      'Eggplant',
      'Tomato',
      'Sweet Potato',
      'Carrot',
    ];
    List<String> phoneticSymbols = [
      '/rɛd ˈʌn.jən/',
      '/ˈɡɑr.lɪk/',
      '/ˈspɪn.ɪtʃ/',
      '/ˈbrɒk.ə.li/',
      '/kɔrn/',
      '/ˈmʌʃ.ruːm/',
      '/ɡriːn biːnz/',
      '/piːz/',
      '/ˈkɒl.ɪ.faʊ.ər/',
      '/pəˈteɪ.toʊ/',
      '/ˈkæb.ɪdʒ/',
      '/ˈpʌmp.kɪn/',
      '/ˈræd.ɪʃ/',
      '/ˈkjuː.kʌm.bər/',
      '/bɛl ˈpɛp.ər/',
      '/ˈlɛt.ɪs/',
      '/ˈɛɡ.plænt/',
      '/təˈmeɪ.toʊ/',
      '/swiːt pəˈteɪ.toʊ/',
      '/ˈkær.ət/',
    ];

    List<String> meanings = [
      'A type of onion with a reddish-purple skin and a mild flavor.',
      'A strong-smelling bulb used as a seasoning in cooking.',
      'Leafy green vegetable that is rich in nutrients.',
      'A green vegetable with a flowering head, often used in cooking.',
      'A type of cereal crop with kernels on a cob, commonly eaten as a vegetable.',
      'A fungus with a fleshy cap, commonly used in cooking.',
      'Long, slender beans that are usually cooked or eaten as a side dish.',
      'Small, round green seeds that grow in a pod and are often eaten as a vegetable.',
      'A white vegetable with a compact head of undeveloped flowers.',
      'An edible starchy tuber widely used in cooking.',
      'Leafy vegetable with dense leaves used in various dishes.',
      'A large round vegetable with orange flesh often used in pies or soups.',
      'A small root vegetable with a crisp texture and peppery taste.',
      'A long, green vegetable with a mild flavor, often eaten raw.',
      'A type of pepper with a sweet taste and crisp texture.',
      'Leafy vegetable commonly used as the base for salads.',
      'A purple-skinned vegetable with a spongy texture, often used in dishes.',
      'A red or yellow fruit commonly used as a vegetable in cooking.',
      'A starchy root vegetable with a sweet taste, often roasted or mashed.',
      'An orange root vegetable with a sweet taste, commonly eaten raw or cooked.',
    ];

    List<String> examples = [
      'I added some sliced red onion to the salad for extra flavor.',
      'The pasta sauce is infused with the aroma of fresh garlic.',
      'Spinach is a great addition to smoothies for added nutrients.',
      'My mom steamed some broccoli to serve with dinner.',
      'We enjoyed grilled corn on the cob at the summer barbecue.',
      'The pizza is topped with mushrooms and cheese.',
      'I like to sauté green beans with garlic and olive oil.',
      "The shepherd's pie is filled with ground meat and peas.",
      'We made a creamy cauliflower soup for lunch.',
      "I'm making mashed potatoes to go with the roasted chicken.",
      'Coleslaw is a classic side dish made with shredded cabbage.',
      'Pumpkin pie is a traditional dessert during Thanksgiving.',
      'The radish adds a refreshing crunch to the salad.',
      'I enjoy cucumber slices with hummus as a healthy snack.',
      'Stuffed bell peppers are a delicious dinner option.',
      'The sandwich is filled with turkey, lettuce, and tomato.',
      "We're making eggplant parmesan for dinner tonight.",
      'Fresh tomatoes are essential for making a good salsa.',
      'Baked sweet potatoes are a nutritious side dish.',
      'I like to snack on baby carrots with a yogurt dip.',
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
                            sayuranList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarSayuran[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(vegetablesListt[index]);
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
                            vegetablesListt[index],
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
                              fontSize: 18,
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
                      fontSize: 14,
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
                        if (index < sayuranList.length - 1) {
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
                      'Vegetables',
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
              itemCount: (sayuranList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleSayuran = sayuranList.sublist(
                  startIndex,
                  endIndex > sayuranList.length ? sayuranList.length : endIndex,
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
                    children: List.generate(visibleSayuran.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showVegetablesDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleSayuran[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarSayuran[itemIndex],
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
