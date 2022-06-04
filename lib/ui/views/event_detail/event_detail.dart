import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/eventos/get/get_all_events.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';

import 'package:projeto_final/ui/views/components/custom_appbar.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  final userRepository = SwaggerApiUserRepository();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 200.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: CustomAppbar(),
              child: Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 44.0,
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            ),
          ),

          body: FutureBuilder(
            future: userRepository.getAllEvents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data[index]),
                  ),
                );
              }
            },
          ),

          // body: FutureBuilder(
          //   future: userRepository.getAllEvents(),
          //   builder: (BuildContext context, AsyncSnapshot<List<GetAllEvents>> snapshot) {
          //     if(snapshot.hasData) {
          //       List<GetAllEvents>? events = snapshot.data;
          //       return ListView(
          //         children: [
          //           events!.map(
          //           (GetAllEvents post) => ListTile(
          //             title: Text(post.description.toString()),
          //             subtitle: Text("${post.name}"),
          //           ),
          //         )
          //         .toList(),
          //         ],

          //       );
          //     } else {
          //       throw 'Erro no List View';
          //     }
          //   },
          // ),
        )
      ],
    );
  }
}
