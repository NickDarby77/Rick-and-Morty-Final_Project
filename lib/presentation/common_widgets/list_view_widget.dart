import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/presentation/screens/characters_screen/chars/character_details.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.dataResults,
    required this.scrollController,
  });

  final List<CharacterResults> dataResults;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetailsPage(
                    data: dataResults[index],
                  ),
                ),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 38,
                  foregroundImage: NetworkImage(
                    dataResults[index].image ?? '',
                  ),
                ),
                const SizedBox(width: 18),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataResults[index].status?.toUpperCase() ?? '',
                        style: AppFonts.s10w500Green.copyWith(
                          color: getColor(
                            dataResults[index].status ?? '',
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        dataResults[index].name ?? '',
                        style: AppFonts.s16w500White,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${dataResults[index].species}, ${dataResults[index].gender}',
                        style: AppFonts.s12w400Gender,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: dataResults.length,
      ),
    );
  }

  Color getColor(String status) {
    if (status == "Alive") {
      return Colors.green;
    } else if (status == 'unknown') {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}
