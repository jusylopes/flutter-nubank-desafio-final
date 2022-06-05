import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/eventos/get/get_all_events.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/ui/views/components/custom_appbar.dart';

import '../../../resources/las_strings.dart';
import '../../../resources/las_text_style.dart';
import '../components/app_bar.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final userRepository = SwaggerApiUserRepository();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(180.0),
            child: AppBarWidget(
              back: true,
            ),
          ),
          body: FutureBuilder<List<GetAllEvents>>(
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
                      return Text('${snapshot.data[index].name}');
                    });
              }
            },
          ),

          // body: FutureBuilder<List<GetAllEvents>>(
          //   future: userRepository.getAllEvents(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData == false) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else {
          //       return ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: snapshot.data.length,
          //         itemBuilder: (context, index) => GestureDetector(
          //           onTap: () {
          //             Navigator.pushNamed(context, Routes.editProfile);
          //           },
          //           child: ListTile(
          //             title: Text(snapshot.data[index].name),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          // ),
          backgroundColor: Colors.white,
        ),
        SafeArea(
          child: Center(
            child: Column(children: const [
              SizedBox(height: 27.0),
              SizedBox(
                width: 272.0,
                height: 44.0,
                child: Material(
                  color: Colors.transparent,
                  child: Text('Eventos',
                      style: LasTextStyle.titleAccreditationPage1,
                      textAlign: TextAlign.center),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
