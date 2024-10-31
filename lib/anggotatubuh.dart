import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AnggotaTubuh extends StatefulWidget {
  const AnggotaTubuh({super.key});

  @override
  State<AnggotaTubuh> createState() => _AnggotaTubuhState();
}

class _AnggotaTubuhState extends State<AnggotaTubuh> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> anggotatubuhList = [
    'Bibir',
    'Dada',
    'Dagu',
    'Gigi',
    'Hidung',
    'Jari kaki',
    'Jari tangan',
    'Kaki',
    'Kepala',
    'Leher',
    'Lengan',
    'Lidah',
    'Lutut',
    'Mata',
    'Mulut',
    'Perut',
    'Punggung',
    'Rambut',
    'Tangan',
    'Telinga',
    // ... tambahkan daftar Anggota Tubuh hingga Anggota Tubuh 20
  ];

  List<String> gambarAnggotaTubuh = [
    'assets/images/Bibir.png',
    'assets/images/Dada.png',
    'assets/images/Dagu.png',
    'assets/images/Gigi.png',
    'assets/images/Hidung.png',
    'assets/images/Jari Kaki.png',
    'assets/images/Jari Tangan.png',
    'assets/images/Kaki.png',
    'assets/images/Kepala.png',
    'assets/images/Leher.png',
    'assets/images/Lengan.png',
    'assets/images/Lidah.png',
    'assets/images/Lutut.png',
    'assets/images/Mata.png',
    'assets/images/Mulut.png',
    'assets/images/Perut.png',
    'assets/images/Punggung.png',
    'assets/images/Rambut.png',
    'assets/images/Tangan.png',
    'assets/images/Telinga.png',
    // ... tambahkan daftar gambar sesuai dengan Anggota Tubuh hingga Anggota Tubuh 20
  ];

  void showActivityDialog(BuildContext context, int index) {
    List<String> titles = [
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
      'Body Parts',
    ];
    List<String> bodypartsList = [
      'Lips',
      'Chest',
      'Chin',
      'Teeth',
      'Nose',
      'Toes',
      'Fingernails',
      'Feet',
      'Head',
      'Neck',
      'Arms',
      'Tongue',
      'Knees',
      'Eyes',
      'Mouth',
      'Stomach',
      'Back',
      'Hair',
      'Hands',
      'Ears',
    ];
    List<String> phoneticSymbols = [
      '/lɪps/',
      '/tʃɛst/',
      '/ˈcin/',
      '/tiːθ/',
      '/noʊz/',
      '/toʊz/',
      '/ˈfɪŋɡərneɪlz/',
      '/fiːt/',
      '/hɛd/',
      '/nɛk/',
      '/ɑːrmz/',
      '/tʌŋ/',
      '/niːz/',
      '/dʒʌmp/',
      '/ɪkˈstɪŋɡwɪʃ/',
      '/wɛr/',
      '/beɪk/',
      '/kʊk/',
      '/ˈɛntər/',
      '/breɪk/',
    ];

    List<String> meanings = [
      'The soft part around the mouth that is used for talking, eating, and kissing.',
      'The front part of the body between the neck and the abdomen.',
      'a part of the human body located below the mouth and above the neck.',
      'Hard parts that grow in the mouth and are used for chewing food.',
      'The part of the body on the face that is used for smelling and breathing.',
      'The digits on the foot.',
      'The digits on the hand.',
      'The part of the body below the knee that is used for walking or running.',
      'The top part of the body that is above the neck and contains the brain, eyes, nose, mouth, etc',
      'The part that connects the head to the body.',
      'The part of the body between the shoulder and the wrist.',
      'The soft part inside the mouth that is used for tasting and helping with speaking.',
      'The joint that connects the thigh with the shinbone in the leg.',
      'The sensory organs used for seeing.',
      'The part of the body that is used for eating, speaking, and expressing emotions.',
      'The part of the body between the chest and the pelvis that is used for digesting food.',
      'The rear part of the body that is between the neck and the hips',
      'The filamentous part that grows on the scalp and human body',
      'The part of the body at the end of the arm that is used for grasping, touching, etc. ',
      'The sensory organs used for hearing.',
    ];

    List<String> examples = [
      "Mother gently kissed the baby's lips.",
      'When scared, the heart beats fast and hard in the chest.',
      'He pulled his chin with his right hand.',
      'The dentist recommends brushing teeth twice a day.',
      'When hit by flu, the nose keeps running constantly.',
      'She tripped on a stone and injured her right toe.',
      'She has a special ability to dance with her fingers.',
      'She runs fast using both her legs.',
      'She shook her head to reject the offer.',
      'She wore a beautiful necklace around her neck.',
      'She lifted the item with her strong left arm.',
      'The taste was so spicy that her tongue felt burned.',
      'After falling off the bike, her knees were bleeding.',
      'Her eyes sparkled when she saw the surprise.',
      'She smiled widely with her gleaming mouth.',
      'After eating a lot, her stomach felt full.',
      'She felt pain in her back after lifting a heavy load.',
      'She has long, beautiful, and shiny hair.',
      "She reached out for her friend's hand to offer support.",
      'When listening to loud music, she pinched her ears as they hurt.',
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
                            anggotatubuhList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarAnggotaTubuh[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(bodypartsList[index]);
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
                            bodypartsList[index],
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
                        if (index < anggotatubuhList.length - 1) {
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
                      'Body Parts',
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
              itemCount: (anggotatubuhList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleAktivitas = anggotatubuhList.sublist(
                  startIndex,
                  endIndex > anggotatubuhList.length
                      ? anggotatubuhList.length
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
                    children: List.generate(visibleAktivitas.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showActivityDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleAktivitas[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarAnggotaTubuh[itemIndex],
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
