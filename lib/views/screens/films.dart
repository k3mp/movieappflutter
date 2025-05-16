import 'package:flutter/material.dart';
import 'package:trialnderror/configs/colours.dart';

class Films extends StatelessWidget {
  const Films({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> movies = const [
    {
      'image': 'assets/images/oh.png',
      'description':
          "During World War II, Lt. Gen. Leslie Groves Jr. appoints physicist J. Robert Oppenheimer to work on the top-secret Manhattan Project. Oppenheimer and a team of scientists work for years in a secret laboratory in Los Alamos, New Mexico, developing the first nuclear weapons.",
    },
    {
      'image': 'assets/images/gOt.png',
      'description':
          "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.",
    },
    {
      'image': 'assets/images/barbie.jpeg',
      'description':
          "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
    },
    {
      'image': 'assets/images/SR.jpeg',
      'description':
          "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                movie['image'],
                height: 200,
                width: 250,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie['description'],
                      style: TextStyle(color: backgroundColor),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0XFF2b334b),
                              Color(0xff627891),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Review",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
