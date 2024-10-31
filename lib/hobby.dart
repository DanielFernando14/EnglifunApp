import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Hobby extends StatefulWidget {
  const Hobby({super.key});

  @override
  State<Hobby> createState() => _HobbyState();
}

class _HobbyState extends State<Hobby> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> hobiList = [
    'Berenang',
    'Berkebun',
    'Berlari',
    'Bermain bola',
    'Bermain boneka',
    'Bermain musik',
    'Bermain pasir',
    'Bermain peran',
    'Bersepeda',
    'Main teka-teki',
    'Memasak mainan',
    'Membaca buku',
    'Menari',
    'Mendekorasi',
    'Mendengarkan musik',
    'Mengambil foto',
    'Menggambar',
    'Mengumpulkan mainan',
    'Menonton film',
    'Merakit puzzle',
    // ... tambahkan daftar Hobby hingga Hobby 20
  ];

  List<String> gambarHobby = [
    'assets/images/Berenang.png',
    'assets/images/Berkebun.png',
    'assets/images/Hobby Berlari.png',
    'assets/images/Bermain Bola.png',
    'assets/images/Bermain Boneka.png',
    'assets/images/Bermain Musik.png',
    'assets/images/Bermain Pasir.png',
    'assets/images/Bermain Peran.png',
    'assets/images/Bersepeda.png',
    'assets/images/Main Teka Teki.png',
    'assets/images/Memasak Mainan.png',
    'assets/images/Membaca Buku.png',
    'assets/images/Menari.png',
    'assets/images/Mendekorasi.png',
    'assets/images/Mendengarkan Musik.png',
    'assets/images/Mengambil Foto.png',
    'assets/images/Menggambar.png',
    'assets/images/Mengumpulkan Mainan.png',
    'assets/images/Menonton Film.png',
    'assets/images/Merakit Puzzle.png',
    // ... tambahkan daftar gambar sesuai dengan Hobby hingga Hobby 20
  ];

  void showHobbyDialog(BuildContext context, int index) {
    List<String> titles = [
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
      'Hobby',
    ];
    List<String> hobbyList = [
      'Swimming',
      'Gardening',
      'Running',
      'Playing soccer',
      'Playing with dolls',
      'Playing music',
      'Playing with sand',
      'Role-playing',
      'Cycling',
      'Playing puzzles',
      'Cooking with toys',
      'Reading books',
      'Dancing',
      'Decorating',
      'Listening to music',
      'Taking photos',
      'Drawing',
      'Collecting toys',
      'Watching movies',
      'Assembling puzzles',
    ];
    List<String> phoneticSymbols = [
      '/ˈswɪmɪŋ/',
      '/ˈɡɑːrdnɪŋ/',
      '/ˈrʌnɪŋ/',
      '/ˈpleɪɪŋ ˈsɒkər/',
      '/ˈpleɪɪŋ wɪð dɒlz/',
      '/ˈpleɪɪŋ ˈmjuːzɪk/',
      '/ˈpleɪɪŋ wɪð sænd/',
      '/roʊl ˈpleɪɪŋ/',
      '/ˈsaɪklɪŋ/',
      '/ˈpleɪɪŋ ˈpʌzl̩z/',
      '/ˈkʊkɪŋ wɪð tɔɪz/',
      '/ˈriːdɪŋ bʊks/',
      '/ˈdænsɪŋ/',
      '/ˈdekəreɪtɪŋ/',
      '/ˈlɪsənɪŋ tu ˈmjuːzɪk/',
      '/ˈteɪkɪŋ ˈfoʊtoʊz/',
      '/ˈdrɔːɪŋ/',
      '/kəˈlɛktɪŋ tɔɪz/',
      '/ˈwɒtʃɪŋ ˈmuːviz/',
      '/əˈsɛmblɪŋ ˈpʌzl̩z/',
    ];

    List<String> meanings = [
      'Engaging in water-based activities for fun, exercise, or relaxation.',
      'Tending to plants, flowers, or vegetables as a hobby or for relaxation.',
      'Moving rapidly on foot as a form of exercise or for sport.',
      "A team-based game involving kicking a ball into the opposing team's goal.",
      'Interacting and engaging in imaginative play with dolls or figurines.',
      'Creating sounds or melodies using musical instruments or vocal skills.',
      'Using sand to create structures, shapes, or designs for play.',
      'Pretending to be characters and acting out scenarios or stories.',
      'Riding a bicycle for leisure, exercise, or transportation.',
      'Solving puzzles or brainteasers for entertainment or cognitive challenge.',
      'Imaginary cooking using toy kitchen utensils and play food items.',
      'Exploring stories, information, or ideas in written form.',
      'Moving rhythmically to music, often for enjoyment or expression.',
      'Adorning spaces or objects  for aesthetics.',
      'Engaging with auditory stimuli by enjoying and experiencing musical sounds.',
      'Capturing images using a camera or smartphone for documentation or artistic expression.',
      'Creating images or designs using pencils, pens, or other art materials.',
      'Gathering and keeping a variety of toys or objects as a hobby.',
      'Viewing films or videos for entertainment.',
      'Putting together pieces of a puzzle to form a complete image.',
    ];

    List<String> examples = [
      'Splashing and gliding through the pool on a hot summer day.',
      'Planting colorful flowers and caring for them in the backyard.',
      'Racing with friends in the park during a school sports day.',
      'Kicking the ball into the goal and celebrating a winning goal.',
      'Creating imaginary stories and dialogues with toy dolls.',
      'Strumming a guitar and singing along to a favorite song.',
      'Building a sandcastle at the beach and decorating it with seashells.',
      'Pretending to be a brave superhero saving the day from imaginary villains.',
      'Riding a bicycle down a scenic trail with the wind in your hair.',
      'Fitting puzzle pieces together to reveal a picture of a cute animal.',
      'Making a pretend feast using toy pots, pans, and play food.',
      'Exploring a magical world by reading a story about talking animals.',
      'Grooving to the beat of your favorite music at a dance party.',
      'Hanging colorful banners and balloons for a festive birthday party.',
      'Relaxing and swaying to soothing melodies on a lazy afternoon.',
      'Capturing a beautiful sunset with a camera to remember the moment.',
      'Sketching a colorful rainbow and a smiling sun on a piece of paper.',
      'Displaying a collection of action figures neatly arranged on a shelf.',
      'Enjoying a comedy movie with friends and sharing lots of laughter.',
      'Completing a jigsaw puzzle to reveal a picture of a stunning landscape.'
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
                            hobiList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarHobby[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(hobbyList[index]);
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
                            hobbyList[index],
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
                        if (index < hobbyList.length - 1) {
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
                      'Hobby',
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
              itemCount: (hobiList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleHobby = hobiList.sublist(
                  startIndex,
                  endIndex > hobiList.length ? hobiList.length : endIndex,
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
                    children: List.generate(visibleHobby.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showHobbyDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleHobby[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarHobby[itemIndex],
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
