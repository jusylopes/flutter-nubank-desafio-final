import 'package:flutter/material.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';

import '../components/alert_dialog.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final userRepository = SwaggerApiUserRepository();
  bool loading = true;

  void completedPerfil() async {
    //implementar logica de perfil completo
  }

  void showAlertError() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Alert(
            bodyAlert: Strings.eventAlertDialog, txtButton: Strings.buttonOk));
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FutureBuilder<List>(
                      future: userRepository.getAllEvents(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                // retorna os eventos
                                return Column(
                                  children: [
                                    const SizedBox(height: 20.0),
                                    Container(
                                      height: 250.0,
                                      width: 350.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/cardEvent1.jpg'),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      padding: const EdgeInsets.only(left: 30),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${snapshot.data[index].name}',
                                        style: LasTextStyle.txteventCardTitle,
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 5),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data[index].description}',
                                          style: LasTextStyle.txteventCardBody,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Container(
                                      padding: const EdgeInsets.only(right: 30),
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary: LasColors.txtEventPage,
                                          textStyle:
                                              LasTextStyle.txteventCardButton,
                                        ),
                                        //IR PARA DETALHES DO EVENTO
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              Routes.eventDetails,
                                              arguments: {
                                                'id': 2,
                                              });
                                        },
                                        child: const Text('DETALHAR'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 130.0,
          child: Center(
            child: Text(
              'Eventos',
              style: LasTextStyle.txtTitlePages,
            ),
          ),
        )
      ],
    );
  }
}
