import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Olahraga extends StatefulWidget {
  const Olahraga({super.key});

  @override
  State<Olahraga> createState() => _OlahragaState();
}

class _OlahragaState extends State<Olahraga> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> olahragaList = [
    'Angkat Berat',
    'Baseball',
    'Basket',
    'Bersepeda',
    'Bulutangkis',
    'Gulat',
    'Hoki',
    'Judo',
    'Karate',
    'Lari',
    'Lompat Tali',
    'Panahan',
    'Panjat Tebing',
    'Renang',
    'Seluncur Es',
    'Senam',
    'Sepak Bola',
    'Skateboard',
    'Tenis',
    'Voli',
    // ... tambahkan daftar Olahraga hingga Olahraga 20
  ];

  List<String> gambarOlahraga = [
    'assets/images/Angkat Berat.png',
    'assets/images/Baseball.png',
    'assets/images/Basket.png',
    'assets/images/Olahraga Bersepeda.png',
    'assets/images/Bulutangkis.png',
    'assets/images/Gulat.png',
    'assets/images/Hoki.png',
    'assets/images/Judo.png',
    'assets/images/Karate.png',
    'assets/images/Lari.png',
    'assets/images/Lompat Tali.png',
    'assets/images/Panahan.png',
    'assets/images/Panjat Tebing.png',
    'assets/images/Renang.png',
    'assets/images/Seluncur Es.png',
    'assets/images/Senam.png',
    'assets/images/Sepak Bola.png',
    'assets/images/Skateboard.png',
    'assets/images/Tennis.png',
    'assets/images/Voli.png',
    // ... tambahkan daftar gambar sesuai dengan Olahraga hingga Olahraga 20
  ];

  void showSportDialog(BuildContext context, int index) {
    List<String> titles = [
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
      'Sport',
    ];
    List<String> sportList = [
      'Weightlifting',
      'Baseball',
      'Basketball',
      'Cycling',
      'Badminton',
      'Wrestling',
      'Hockey',
      'Judo',
      'Karate',
      'Running',
      'Jump Rope',
      'Archery',
      'Rock Climbing',
      'Swimming',
      'Ice Skating',
      'Gymnastics',
      'Soccer',
      'Skateboarding',
      'Tennis',
      'Volleyball',
    ];
    List<String> phoneticSymbols = [
      '/ˈweɪtˌlɪftɪŋ/',
      '/ˈbeɪsˌbɔl/',
      '/ˈbæsˌkɪtˌbɔl/',
      '/ˈsaɪklɪŋ/',
      '/ˈbædmɪntən/',
      '/ˈrɛslɪŋ/',
      '/ˈhɒki/',
      '/ˈdʒuːdoʊ/',
      '/kəˈrɑːti/',
      '/ˈrʌnɪŋ/',
      '/dʒʌmp roʊp/',
      '/ˈɑːrtʃəri/',
      '/rɒk ˈklaɪmɪŋ/',
      '/ˈswɪmɪŋ/',
      '/aɪs ˈskeɪtɪŋ/',
      '/dʒɪmˈnæstɪks/',
      '/ˈsɒkər/',
      '/ˈskeɪtbɔːrdɪŋ/',
      '/ˈtɛnɪs/',
      '/ˈvɒliˌbɔːl/',
    ];

    List<String> meanings = [
      'Lifting heavy weights for strength and fitness.',
      'Bat-and-ball game played with bases and runs.',
      'Team sport played by shooting a ball through hoops.',
      'Riding bicycles for exercise or competition.',
      'Hitting a shuttlecock back and forth over a net with rackets.',
      'Physical combat sport involving grappling techniques.',
      'Team sport played on ice or field with sticks and puck/ball.',
      'Martial art focused on throws and holds to control opponents.',
      'Martial art emphasizing strikes, blocks, and self-defense.',
      'Moving swiftly on foot for exercise or competition.',
      'Skipping over a rope swung over the ground.',
      'Sport of shooting arrows with a bow at a target.',
      'Scaling natural rock formations using hands and feet.',
      'Moving through water using arms and legs.',
      'Gliding on ice using ice skates on rinks or frozen bodies of water.',
      'Performing acrobatics and exercises for flexibility and strength.',
      "Team sport played by kicking a ball into the opponent's goal.",
      'Riding and performing tricks on a skateboard.',
      'Racket sport played by hitting a ball over a net.',
      'Team sport played by hitting a ball over a net with hands.',
    ];

    List<String> examples = [
      'Lifting heavy barbells at the gym to build strength.',
      'Swinging the bat and hitting the ball to run around bases.',
      'Shooting hoops with friends at the local court.',
      'Riding a bike around the park for exercise.',
      'Hitting the shuttlecock back and forth with a friend.',
      'Practicing wrestling moves with a training partner.',
      'Skating on the ice and scoring goals with a hockey stick.',
      'Learning throws and holds in a judo class.',
      'Practicing punches and kicks in karate lessons.',
      'Jogging in the morning to stay fit.',
      'Skipping rope in the backyard for fun.',
      'Aiming and shooting arrows at a target.',
      'Climbing a wall at an indoor climbing gym.',
      'Swimming laps in the pool to improve stamina.',
      'Gliding on the ice at the local ice rink.',
      'Performing flips and somersaults in gymnastics class.',
      'Kicking the soccer ball during a friendly match.',
      'Doing tricks on a skateboard at the skate park.',
      'Rallying the ball with a partner on the tennis court.',
      'Spiking the ball over the net in a volleyball game.',
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
                            olahragaList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarOlahraga[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(sportList[index]);
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
                            sportList[index],
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
                        if (index < olahragaList.length - 1) {
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
                      'Sport',
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
              itemCount: (olahragaList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleOlahraga = olahragaList.sublist(
                  startIndex,
                  endIndex > olahragaList.length
                      ? olahragaList.length
                      : endIndex,
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
                    children: List.generate(visibleOlahraga.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showSportDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleOlahraga[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarOlahraga[itemIndex],
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
