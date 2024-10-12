import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami_app/tabs/hadeth/hadrth.dart';
import 'package:islami_app/widgets/loading_indecator.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) loadAhadethFile();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "الأحاديث",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? LoaingIndecator()
              : ListView.separated(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      HadethContentScreen.routeName,
                      arguments: ahadeth[index],
                    ),
                    child: Text(
                      ahadeth[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12,
                  ),
                ),
        )
      ],
    );
  }

  void loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/data/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split('#');
    ahadeth = ahadethStrings.map((ahadethString) {
      List<String> hadethLines = ahadethString.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}
