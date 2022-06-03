import 'package:flutter/material.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/las_strings.dart';
import '../../../resources/las_text_style.dart';
import '../components/background.dart';
import '../components/custom_appBar.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(180.0),
              child: AppBarWidget(),
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
                  ),
SizedBox(
                  width: 259.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: 
                      //  ? null
                         () => showDialog(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 328.0,
                                    height: 257.0,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                          width: 2.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          style: BorderStyle.solid,
                                        )),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 61.0),
                                        const SizedBox(
                                          width: 280.0,
                                          height: 56.0,
                                          child: Text(
                                            Strings.txtmsgconfirmAccreditation,
                                            style: LasTextStyle
                                                .msgConfirmAccreditation,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(height: 57.0),
                                        SizedBox(
                                          width: 85.0,
                                          height: 37.0,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color(0xff004BA0))),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text(
                                              'OK',
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          
                             // ? const Color(0xFF828282)
                               const Color(0xff004BA0)),
                    ),
                    child: const Text(Strings.txtButtonAccreditation,
                        style: LasTextStyle.buttonAccreditationPage),
                  ),
                )
                ]),
                
              ),
            ))
      ],
    );
  }
}
