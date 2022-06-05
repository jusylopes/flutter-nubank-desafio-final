import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackgroundPage(),
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBarWidget(
              back: true,
            ),
          ),
          body: SafeArea(
            child: Center(),
          ),
        ),
        SizedBox(
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
