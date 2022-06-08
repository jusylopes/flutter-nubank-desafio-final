import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/accreditation/get/get_details.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoricDetailsPage extends StatefulWidget {
  const HistoricDetailsPage({
    super.key,
  });

  @override
  State<HistoricDetailsPage> createState() => _HistoricDetailsPageState();
}

class _HistoricDetailsPageState extends State<HistoricDetailsPage> {
  final userRepository = SwaggerApiUserRepository();

  String name = 'CARREGANDO...';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    Future<void> getAll() async {
      final user = await userRepository.getUserDetails();
      name = user.fullName;
    }

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
                Expanded(
                  child: FutureBuilder<List<GetAccreditadedDetails>>(
                      future: userRepository.accreditadedDetails(id),
                      builder: (context, AsyncSnapshot snapshot) {
                        getAll();

                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          getAll();
                          return ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              String? local = snapshot.data[index].location;

                              return Column(
                                children: [
                                  const SizedBox(height: 25.0),
                                  Container(
                                    height: 250.0,
                                    width: 350.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${snapshot.data[index].event.imageUrl}'),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '${snapshot.data[index].event.name}'
                                          .toUpperCase(),
                                      style: LasTextStyle.txtHistorycDetails,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 25.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('NOME:',
                                                style: LasTextStyle
                                                    .txtHistorycDetailsTitleRow),
                                            const SizedBox(width: 50),
                                            Text(name.toUpperCase(),
                                                style: LasTextStyle
                                                    .txtHistorycDetailsBody),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('LOCAL:',
                                                style: LasTextStyle
                                                    .txtHistorycDetailsTitleRow),
                                            const SizedBox(width: 50),
                                            Text(local != null ? local : '',
                                                style: LasTextStyle
                                                    .txtHistorycDetailsBody),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text('STATUS:',
                                                style: LasTextStyle
                                                    .txtHistorycDetailsTitleRow),
                                            SizedBox(width: 50),
                                            Text('LICENCIADO',
                                                style: LasTextStyle
                                                    .txtHistorycDetailsBody),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 130),
                                  ButtonWidget(
                                      colorButton: LasColors.buttonColor,
                                      textButton: 'BAIXAR',
                                      onPressed: () async {
                                        const url =
                                            'http://www.africau.edu/images/default/sample.pdf';
                                        launch(url);
                                      }),
                                ],
                              );
                            },
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 110.0,
          child: Center(
            child: Text(
              'Histórico Detalhado',
              style: LasTextStyle.txtTitlePages,
            ),
          ),
        )
      ],
    );
  }
}
