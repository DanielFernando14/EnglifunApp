import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Bentuk extends StatefulWidget {
  const Bentuk({super.key});

  @override
  State<Bentuk> createState() => _BentukState();
}

class _BentukState extends State<Bentuk> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> bentukList = [
    'Belah Ketupat',
    'Bintang',
    'Hati',
    'Jajar Genjang',
    'Layang Layang',
    'Lingkaran',
    'Oval',
    'Persegi',
    'Persegi Panjang',
    'Segi Delapan',
    'Segi Enam',
    'Segi Lima',
    'Segi Sembilan',
    'Segi Sepuluh',
    'Segitiga',
    'Segitiga Sama Kaki',
    'Segitiga Sama Sisi',
    'Segitiga Siku Siku',
    'Setengah Lingkaran',
    'Trapesium',
    // ... tambahkan daftar Bentuk hingga Bentuk 20
  ];

  List<String> gambarBentuk = [
    'assets/images/Belah Ketupat.png',
    'assets/images/Bintang.png',
    'assets/images/Hati.png',
    'assets/images/Jajar Genjang.png',
    'assets/images/Layang Layang.png',
    'assets/images/Lingkaran.png',
    'assets/images/Oval.png',
    'assets/images/Persegi.png',
    'assets/images/Persegi Panjang.png',
    'assets/images/Segi Delapan.png',
    'assets/images/Segi Enam.png',
    'assets/images/Segi Lima.png',
    'assets/images/Segi Sembilan.png',
    'assets/images/Segi Sepuluh.png',
    'assets/images/Segitiga.png',
    'assets/images/Segitiga Sama Kaki.png',
    'assets/images/Segitiga Sama Sisi.png',
    'assets/images/Segitiga Siku Siku.png',
    'assets/images/Setengah Lingkaran.png',
    'assets/images/Trapesium.png',
    // ... tambahkan daftar gambar sesuai dengan Bentuk hingga Bentuk 20
  ];

  void showActivityDialog(BuildContext context, int index) {
    List<String> titles = [
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
      'Shape',
    ];
    List<String> shapeList = [
      'Rhombus',
      'Star',
      'Heart',
      'Parallelogram',
      'Kite',
      'Circle',
      'Oval',
      'Square',
      'Rectangle',
      'Octagon',
      'Hexagon',
      'Pentagon',
      'Nonagon',
      'Decagon',
      'Triangle',
      'Isosceles Triangle',
      'Equilateral Triangle',
      'Right Triangle',
      'Semicircle',
      'Trapezium',
    ];
    List<String> phoneticSymbols = [
      '/ˈrɒmbəs/',
      '/stɑːr/',
      '/hɑːrt/',
      '/ˌpærəˈleləɡræm/',
      '/kaɪt/',
      '/ˈsɜːrkəl/',
      '/ˈoʊvəl/',
      '/skwɛr/',
      '/ˈrɛkˌtæŋɡəl/',
      '/ˈɒk.tə.ɡɒn/',
      '/ˈhɛksəɡɒn/',
      '/ˈpɛntəˌɡɒn/',
      '/ˈnɒnəˌɡɒn/',
      '/ˈdɛkəˌɡɒn/',
      '/ˈtraɪˌæŋɡəl/',
      '/ˌaɪˌsɒːˈsiːlz ˈtraɪˌæŋɡəl/',
      '/ɪˌkwɪləˈtɛrəl ˈtraɪˌæŋɡəl/',
      '/raɪt ˈtraɪˌæŋɡəl/',
      '/ˈsɛmɪˌsɜːrkəl/',
      '/ˈtræpɪziəm/',
    ];

    List<String> meanings = [
      'A four-sided polygon with all sides of equal length but opposite angles are not equal.',
      'A shape with typically five or more points, often used in art and design.',
      'A symbol representing affection, love, or emotion.',
      'A quadrilateral with opposite sides parallel and equal in length.',
      'A quadrilateral with two pairs of equal adjacent sides and diagonals that intersect at a right angle.',
      'A perfectly round shape with all points on the boundary equidistant from the center.',
      'A rounded shape that resembles an elongated circle.',
      'A four-sided polygon with all sides and angles of equal length.',
      'A four-sided polygon with opposite sides parallel and four right angles.',
      'A polygon with eight sides and eight angles.',
      'A six-sided polygon.',
      'A five-sided polygon.',
      'A geometric shape with nine sides and nine angles.',
      'A decagon is a polygon with ten sides and ten angles.',
      'A three-sided polygon.',
      'A triangle with at least two sides of equal length.',
      'A triangle with all sides of equal length.',
      'A triangle with a right angle (90-degree angle).',
      'Half of a circle.',
      'A quadrilateral with only one pair of parallel sides.',
    ];

    List<String> examples = [
      'Rhombus-shaped gem that shines.',
      'Star image used in Christmas decorations.',
      'Heart sticker on a greeting card.',
      'Pillow with a parallelogram shape in its design.',
      'The diamond logo on playing cards is a kite.',
      'Circle depicted on a canvas.',
      'Chicken egg with an oval shape.',
      'Square-shaped note paper in a notebook.',
      'Skateboard deck with a rectangular shape.',
      'Some decorative tiles and patterns feature octagonal shapes.',
      'Hexagon-shaped cushion on a sofa.',
      'Traffic warning sign in a pentagon shape.',
      'The playground had a nonagon-shaped sandbox.',
      'The park features a decorative fountain in the shape of a decagon.',
      "Children's storybook with triangular-shaped pages.",
      'Board game piece with an isosceles triangle shape.',
      'Christmas banner with equilateral triangle decorations.',
      'Comb with a handle that forms a right-angle.',
      'Semi-circular shaped bench in the park.',
      'Trapezium-shaped dinner plate in a modern restaurant.',
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
                            bentukList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarBentuk[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(shapeList[index]);
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
                            shapeList[index],
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
                        if (index < bentukList.length - 1) {
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
                      'Shape',
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
              itemCount: (bentukList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleBentuk = bentukList.sublist(
                  startIndex,
                  endIndex > bentukList.length ? bentukList.length : endIndex,
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
                    children: List.generate(visibleBentuk.length, (index) {
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
                                visibleBentuk[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarBentuk[itemIndex],
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
