import 'package:flutter/material.dart';

import '../components/custom_bar_container.dart';

class HistoricDetalhes extends StatelessWidget {
  const HistoricDetalhes({Key? key}) : super(key: key);

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
                    'assets/images/festa.jpg',
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
            Container(
              color: const Color.fromARGB(255, 26, 3, 156),
              child: ListTile(
                  title: const Text('Baixar'),
                  onTap: () {},
                  leading: const Icon(
                    Icons.download,
                  )),
            )

            //...getSections(accreditations)
            // .map((e) => buildListView(e.accreditations, e.title))
          ],
        ),
      ),
    );
  }
}
