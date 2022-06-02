import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/background.dart';

import 'package:projeto_final/ui/views/components/custom_appbar.dart';

import '../../../resources/las_strings.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
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
                        height: 41.0,
                        width: double.infinity,
                      ),
                      SizedBox(height: 17.0),
                      SizedBox(
                          width: 272.0,
                          height: 44.0,
                          child: Text(Strings.txtTitleEventDetail,
                              style: LasTextStyle.titleAccreditationPage,
                              textAlign: TextAlign.center)),
                    ],
                  ),
                ),
              ),
              leading: Container(
                padding: EdgeInsets.fromLTRB(19.0, 20.17, 86.98, 324.11),
                width: 13.89,
                height: 22.5,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 22.5,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            body: Center(
              child: Card(
                child: Column(children: [
                  Container(
                    width: 315.0,
                    height: 209.42,
                  ),
                  SizedBox(height: 17.0),
                  Container(
                    width: 315.0,
                    height: 20.0,
                  ),
                  SizedBox(height: 14.58),
                  Container(
                    width: 315.0,
                    height: 198.0,
                  )
                ]),
              ),
            ))
      ],
    );
  }
}
