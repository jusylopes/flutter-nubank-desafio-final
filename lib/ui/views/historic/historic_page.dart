import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/resources/las_strings.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  final userRepository = SwaggerApiUserRepository();
  bool credenciado = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBarWidget(
              back: true,
            ),
          ),
          body: SafeArea(
            child: FutureBuilder<List>(
              future: userRepository.getAllEvents(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 120,
                            child: Lottie.network(
                                'https://assets4.lottiefiles.com/packages/lf20_ddxv3rxw.json'),
                          ),
                          const SizedBox(height: 50),
                          const Text(Strings.alertHistoryc,
                              style: LasTextStyle.txtHistorycDetails,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          '2020',
                          style: LasTextStyle.txtTitleYear,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 1.0),
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://classic.exame.com/wp-content/uploads/2020/07/carnaval-20202-rio-divulgacao-riotur.jpg?quality=70&strip'),
                                    ),
                                    title: Text(
                                      '${snapshot.data[index].name}',
                                      style: LasTextStyle.txtTitlePageHistoryc,
                                    ),
                                    subtitle: Text(
                                        '${snapshot.data[index].description}',
                                        style:
                                            LasTextStyle.txtHistorycDetailsDesc,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip),
                                    onTap: () {
                                      Navigator.of(context).popAndPushNamed(
                                          Routes.historicDetails);
                                    },
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 100.0,
          child: Center(
            child: Text(
              'Meu histórico',
              style: LasTextStyle.txtTitlePages,
            ),
          ),
        )
      ],
    );
  }
}
