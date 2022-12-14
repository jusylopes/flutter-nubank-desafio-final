import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/eventos/get/get_events.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/alert_dialog.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({
    super.key,
  });

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final userRepository = SwaggerApiUserRepository();
  late bool profileCompleted;

  void showAlertError() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Alert(
            bodyAlert: Strings.eventAlertDialog, txtButton: Strings.buttonOk));
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
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
                  child: FutureBuilder<GetEvent>(
                      //RETORNAR APENAS UM EVENTO ESPECIFICO
                      future: userRepository.getSpecificEvent(id),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Column(
                            children: [
                              const SizedBox(height: 20.0),
                              Container(
                                height: 250.0,
                                width: 350.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${snapshot.data.imageUrl}'),
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
                                  '${snapshot.data.name}',
                                  style: LasTextStyle.txteventCardTitle,
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${snapshot.data.description}',
                                    style: LasTextStyle.txteventCardBody,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Container(
                                padding: const EdgeInsets.only(top: 30),
                                alignment: Alignment.bottomCenter,
                                child: ButtonWidget(
                                  colorButton: LasColors.buttonColor,
                                  textButton: 'CREDENCIAR',
                                  onPressed: () async {
                                    final userDetails =
                                        await userRepository.getUserDetails();
                                    if (userDetails.rg != null) {
                                    } else {
                                      showAlertError();
                                    }
                                    Navigator.of(context).pushNamed(
                                      Routes.accreditation,
                                      arguments: snapshot.data.id as int,
                                    );
                                  },
                                ),
                              ),
                            ],
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
              'Detalhes do Evento',
              style: LasTextStyle.txtTitlePages,
            ),
          ),
        )
      ],
    );
  }
}
