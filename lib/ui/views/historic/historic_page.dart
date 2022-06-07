import 'package:flutter/material.dart';
import 'package:projeto_final/ui/router/routers.dart';

import '../../../data/repositories/swagger_api_user_repository.dart';
import '../../../pasta_teste_historic/model_teste.dart';
import '../components/custom_bar_container.dart';

// final accreditations = [
//   Accreditation(
//       id: 1,
//       name: 'Carnaval',
//       description: 'Carnaval dos carnavais',
//       imageUrl: 'imageUrl',
//       date: DateTime(2020, 03, 17)),
//   Accreditation(
//       id: 1,
//       name: 'Carnaval em Recife',
//       description: 'O melhor carnaval do mundo é por aqui, e café é muito bom.',
//       imageUrl: 'imageUrl',
//       date: DateTime(2020, 03, 17)),
//   Accreditation(
//       id: 2,
//       name: 'Carnaval em Narnia ',
//       description: 'O melhor carnaval do mundo é por aqui, e café é muito bom.',
//       imageUrl: 'imageUrl',
//       date: DateTime(2020, 02, 17)),
//   Accreditation(
//       id: 3,
//       name: 'Carnaval em Salvador',
//       description: 'O melhor carnaval do mundo é por aqui,',
//       imageUrl: 'imageUrl',
//       date: DateTime(2019, 03, 17)),
// ];

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
          children: const [
            CustomBarContainer(titleappbarhistoric: 'Meu Histórico'),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 7,
              ),
            ),
            
            // ...getSections(accreditations)
            //     .map((e) => buildListView(e.accreditations, e.title))
            ScrowViewBlocoHistoric(),
          ],
        ),
      ),
    );
  }
}

class ScrowViewBlocoHistoric extends StatelessWidget {
  const ScrowViewBlocoHistoric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 300,
      color: Colors.pink,
      child: ReturnHistoryPage(),
    );
  }
}

ReturnHistoryPage() {
  final returnHistory = ReturnHistory();
  Future<List<AcredHistory>?> acredHistory = returnHistory.getAcredHistory();
  return FutureBuilder(
    future: acredHistory,
    builder: (context, AsyncSnapshot<dynamic> snapshot) {
      List<AcredHistory>? acredHistory = snapshot.data;
      return listView(acredHistory);
    },
  );
}

listView(List? acredHistory) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: acredHistory?.length ?? 0,
    itemBuilder: (context, index) {
      AcredHistory c = acredHistory?[index];
      return Column(
        children: [
          ReturnTeste(
            date: "${c.accreditedAt}",
            title: "${c.event?.name}",
            description: "${c.event?.description}",
          ),
        ],
      );
    },
  );
}

class ReturnTeste extends StatelessWidget {
  ReturnTeste(
      {Key? key,
      // required this.imageUrl,
      required this.date,
      required this.title,
      required this.description})
      : super(key: key);

  String date;
  //String imageUrl;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(date),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.historicDetails);
          },
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
                        title,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 5),
                      Text(description)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// buildListView(List<Accreditation> list, String year) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Padding(
//       padding: const EdgeInsets.all(3.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(year, style: const TextStyle(fontWeight: FontWeight.w500)),
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: list.length,
//             itemBuilder: (BuildContext context, index) {
//               final accreditation = list[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).pushNamed(Routes.historicDetails);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
//                   child: Card(
//                     margin: EdgeInsets.zero,
//                     elevation: 0,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 20,
//                             backgroundImage: NetworkImage(
//                                 'https://images.pexels.com/photos/8104206/pexels-photo-8104206.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
//                           ),
//                           const SizedBox(width: 10),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Titulo",
//                                 style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                               SizedBox(height: 5),
//                               Text("Descrição")
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }
