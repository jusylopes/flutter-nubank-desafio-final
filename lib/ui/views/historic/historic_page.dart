import 'package:flutter/material.dart';

import '../components/custom_bar_container.dart';
import 'api_historic_cred.dart';
import 'function_historic.dart';

final accreditations = [
  Accreditation(
      id: 1,
      name: 'Carnaval',
      description: 'Carnaval dos carnavais',
      imageUrl: 'imageUrl',
      date: DateTime(2020, 03, 17)),
  Accreditation(
      id: 1,
      name: 'Carnaval em Recife',
      description: 'O melhor carnaval do mundo é por aqui, e café é muito bom.',
      imageUrl: 'imageUrl',
      date: DateTime(2020, 03, 17)),
  Accreditation(
      id: 2,
      name: 'Carnaval em Narnia ',
      description: 'O melhor carnaval do mundo é por aqui, e café é muito bom.',
      imageUrl: 'imageUrl',
      date: DateTime(2020, 02, 17)),
  Accreditation(
      id: 3,
      name: 'Carnaval em Salvador',
      description: 'O melhor carnaval do mundo é por aqui,',
      imageUrl: 'imageUrl',
      date: DateTime(2019, 03, 17)),
];

class HistoricPage extends StatefulWidget {
  const HistoricPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    // final list2019 = getDate(accreditations, 2019);
    // final list2020 = getDate(accreditations, 2020);
    // final list2021 = getDate(accreditations, 2021);

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
            const CustomBarContainer(titleappbarhistoric: 'Meu Histórico'),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 7,
              ),
            ),
            // buildListView(list2019, '2019'),
            // buildListView(list2020, '2020'),
            // buildListView(list2021, '2021'),
            ...getSections(accreditations)
                .map((e) => buildListView(e.accreditations, e.title))
          ],
        ),
      ),
    );
  }
}

buildListView(List<Accreditation> list, String year) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(year, style: const TextStyle(fontWeight: FontWeight.w500)),
          ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, index) {
                final accreditation = list[index];
                return GestureDetector(
                  onTap: () {
                    
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/8104206/pexels-photo-8104206.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  accreditation.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 5),
                                Text(accreditation.description)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    ),
  );
}
