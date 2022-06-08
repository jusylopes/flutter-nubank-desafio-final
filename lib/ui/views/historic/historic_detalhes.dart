import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/las_colors.dart';
import '../components/custom_bar_container.dart';

class HistoricDetailsPage extends StatelessWidget {
  final int eventId;

  const HistoricDetailsPage({super.key, required this.eventId});

  //Falta pouco pra terminar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/backgroundPage.png',
                ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBarContainer(titleappbarhistoric: 'Hstórico Detalhado'),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/cardEvent1.jpg',
                    fit: BoxFit.cover,
                    height: 209,
                    width: 315,
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Carnaval',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              children: const [],
            ),
            Row(
              children: const [],
            ),
            Row(
              children: const [],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 259,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      const url =
                          'http://www.africau.edu/images/default/sample.pdf';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: LasColors.buttonColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.download),
                        const Center(
                          child: Text('BAIXAR',
                              style: TextStyle(
                                  color: LasColors.txtAppBarProfile,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(),
                      ],
                    )),
              ),
            )
            

            //...getSections(accreditations)
            // .map((e) => buildListView(e.accreditations, e.title))
          ],
        ),
      ),
    );
  }
}
