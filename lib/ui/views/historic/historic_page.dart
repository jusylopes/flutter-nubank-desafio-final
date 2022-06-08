import 'package:flutter/material.dart';
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
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: FutureBuilder<List>(
                    future: userRepository.getUserAccreditation(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                            child: Text(Strings.alertHistoryc,
                                style: LasTextStyle.txtHistorycError));
                      } else {
                        return Padding(
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
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${snapshot.data[index].event.imageUrl}'),
                                    ),
                                    title: Text(
                                      '${snapshot.data[index].event.name}',
                                      style: LasTextStyle.txtTitlePageHistoryc,
                                    ),
                                    subtitle: Text(
                                        '${snapshot.data[index].event.description}',
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
                        );
                      }
                    },
                  ),
                ),
              ],
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
