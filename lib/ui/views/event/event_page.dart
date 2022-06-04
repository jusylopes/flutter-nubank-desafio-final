import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/eventos/get/get_all_events.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/custom_appbar.dart';

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
          body: FutureBuilder<List<GetAllEvents>>(
            future: userRepository.getAllEvents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.editProfile);
                    },
                    child: ListTile(
                      title: Text(snapshot.data[index].name),
                    ),
                  ),
                );
              }
            },
          ),
          backgroundColor: Colors.white,
        )
      ],
    );
  }
}
