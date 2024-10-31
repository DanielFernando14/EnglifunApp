import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Hewan extends StatefulWidget {
  const Hewan({super.key});

  @override
  State<Hewan> createState() => _HewanState();
}

class _HewanState extends State<Hewan> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> hewanList = [
    'Anjing',
    'Ayam',
    'Babi',
    'Bebek',
    'Beruang',
    'Burung',
    'Gajah',
    'Ikan',
    'Jerapah',
    'Kambing',
    'Kucing',
    'Kuda',
    'Kura-kura',
    'Laba-laba',
    'Kelinci',
    'Monyet',
    'Sapi',
    'Semut',
    'Singa',
    'Ular',
    // ... tambahkan daftar Hewan hingga Hewan 20
  ];

  List<String> gambarHewan = [
    'assets/images/Anjing.png',
    'assets/images/Ayam.png',
    'assets/images/Babi.png',
    'assets/images/Bebek.png',
    'assets/images/Beruang.png',
    'assets/images/Burung.png',
    'assets/images/Gajah.png',
    'assets/images/Ikan.png',
    'assets/images/Jerapah.png',
    'assets/images/Kambing.png',
    'assets/images/Kucing.png',
    'assets/images/Kuda.png',
    'assets/images/Kura - Kura.png',
    'assets/images/Laba - Laba.png',
    'assets/images/Kelinci.png',
    'assets/images/Monyet.png',
    'assets/images/Sapi.png',
    'assets/images/Semut.png',
    'assets/images/Singa.png',
    'assets/images/Ular.png',
    // ... tambahkan daftar gambar sesuai dengan Hewan hingga Hewan 20
  ];

  void showHewanDialog(BuildContext context, int index) {
    List<String> titles = [
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
      'Animal',
    ];
    List<String> animalList = [
      'Dog',
      'Chicken',
      'Pig',
      'Duck',
      'Bear',
      'Bird',
      'Elephant',
      'Fish',
      'Giraffe',
      'Goat',
      'Cat',
      'Horse',
      'Turtle',
      'Spider',
      'Rabbit',
      'Monkey',
      'Cow',
      'Ant',
      'Lion',
      'Snake',
    ];
    List<String> phoneticSymbols = [
      "/'dɒg'/",
      "/'ʧɪkɪn'/",
      "/'pɪg'/",
      "/'dʌk'/",
      "/'bɛər'/",
      "/'bɜ:rd'/",
      "/'ɛlɪfənt'/",
      "/'fɪʃ'/",
      "/'dʒɪ'ræf'/",
      "/'goʊt'/",
      "/'kæt'/",
      "/'hɔ:rs'/",
      "/'tɜ:rtl'/",
      "/'spaɪdər'/",
      "/'ræbɪt'/",
      "/'mʌŋki'/",
      "/'kaʊ'/",
      "/'ænt'/",
      "/'laɪən'/",
      "/'sneɪk'/",
    ];

    List<String> meanings = [
      'An animal that is commonly kept as a pet or used for various purposes, known for its loyalty and diverse breeds.',
      'A domesticated bird raised for meat and eggs.',
      'A mammal often raised for its meat, also known as pork.',
      'A waterfowl bird commonly found near water bodies.',
      'A large mammal with a heavy body, typically found in forests.',
      'A warm-blooded vertebrate with feathers, beaks, and the ability to fly.',
      'A large herbivorous mammal known for its trunk and tusks, found in Africa and Asia.',
      'Aquatic animals with gills and fins, living in water.',
      'A tall, long-necked mammal with distinctive patches of color on its body, found in Africa.',
      'A mammal often domesticated for its milk, meat, and wool.',
      'A small carnivorous mammal often kept as a pet, known for its agility and independent nature.',
      'A large mammal domesticated for riding, racing, and other activities.',
      'A reptile with a hard shell that provides protection, often found in water.',
      'An arachnid with eight legs that often spins webs to catch prey.',
      'A small mammal with long ears and a fluffy tail, often kept as a pet.',
      'A primate known for its intelligence and dexterity, found in various regions.',
      'A domesticated mammal primarily raised for its milk and meat.',
      ' A small insect known for its social behavior and ability to work together in colonies.',
      'A large carnivorous mammal known for its strength and leadership in the animal kingdom.',
      'A long reptile without legs, often recognized for its slithering movement.',
    ];

    List<String> examples = [
      'Dogs are loyal pets.',
      'Chickens roam around the yard.',
      'Pigs like to dig the ground to find food.',
      'Ducks often swim in the lake.',
      'Bears live in the forest and have thick fur.',
      'Birds fly high in the blue sky.',
      'Elephants have long trunks.',
      'Fish swim in the water.',
      'Giraffes have long necks.',
      'Goats are often owned by farmers.',
      'Cats like to sleep and play with yarn balls.',
      'Horses can be used as transportation.',
      'Turtles walk slowly and have shells.',
      'Spiders create webs to catch their prey.',
      'Rabbits have long and soft ears.',
      'Monkeys like to play and climb on trees.',
      'Cows are known as livestock that produce milk.',
      'Ants work together in colonies.',
      'Lions are the powerful kings of the jungle.',
      'Snakes slither on the ground and have scales.'
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
                            hewanList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarHewan[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(animalList[index]);
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
                            animalList[index],
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
                        if (index < hewanList.length - 1) {
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
                      'Animal',
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
            top: 70,
            child: PageView.builder(
              controller: PageController(viewportFraction: 1.3),
              itemCount: (hewanList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleHewan = hewanList.sublist(
                  startIndex,
                  endIndex > hewanList.length ? hewanList.length : endIndex,
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
                    children: List.generate(visibleHewan.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showHewanDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleHewan[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarHewan[itemIndex],
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
