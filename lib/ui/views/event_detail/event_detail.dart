import 'package:flutter/material.dart';
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
        )
      ],
    );
  }
}
