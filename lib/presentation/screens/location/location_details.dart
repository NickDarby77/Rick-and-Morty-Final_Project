import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/locations_model.dart';

class LocationDetailsPage extends StatelessWidget {
  const LocationDetailsPage({super.key, required this.data});

  final LocationResults data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/locations.png',
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      
                      15,
                    ),
                  ),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                    Text(
                      'dsadasdasd',
                      style: TextStyle(fontSize: 69),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
