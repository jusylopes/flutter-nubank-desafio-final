import 'package:flutter/material.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/event/event_page_details.dart';

class CardHomePage extends StatelessWidget {
  CardHomePage({super.key});
  final userRepository = SwaggerApiUserRepository();

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Stack(children: [
                        Container(
                          height: 250.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/cardEvent1.jpg'),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Container(
                          height: 250.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                LasColors.colorBackgroundColor,
                                LasColors.txtCardHomePage,
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 250.0,
                          width: 250.0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Text('${snapshot.data[index].name}',
                                      style: LasTextStyle.txtCardHomePageTtile,
                                      textAlign: TextAlign.left),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: Text("Cadastramento liberado",
                                      style:
                                          LasTextStyle.txtCardHomePageSubTtile,
                                      textAlign: TextAlign.left),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30.0, bottom: 7.0),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: LasColors.txtButtonCard,
                                      elevation: 4.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () async {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.eventDetails,
                                        arguments: snapshot.data[index].id,
                                      );
                                      print(snapshot.data[index].id);
                                    },
                                    child: const Text(
                                      'Saiba mais',
                                      style:
                                          LasTextStyle.txtCardHomePageSubTtile,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                    );
                  });
            }
          }),
    );
  }
}
