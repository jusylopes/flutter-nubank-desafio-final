// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_final/ui/views/components/background_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../resources/las_strings.dart';
import '../../../resources/las_text_style.dart';
import '../components/custom_appBar.dart';

var url = 'http://www.africau.edu/images/default/sample.pdf';

class AccreditationPage extends StatefulWidget {
  const AccreditationPage({super.key});

  @override
  State<AccreditationPage> createState() => _AccreditationPageState();
}

class _AccreditationPageState extends State<AccreditationPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundPage(),
      Scaffold(
          appBar: AppBar(
            toolbarHeight: 200,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: CustomAppbar(),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 44,
                      width: double.infinity,
                    ),
                    SizedBox(
                      width: 272.0,
                      height: 44.0,
                      child: Text(Strings.txtTitleAccreditation,
                          style: LasTextStyle.titleAccreditationPage,
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
            leading: Container(
              padding: EdgeInsets.fromLTRB(22.0, 35.17, 86.98, 324.11),
              width: 13.89,
              height: 22.5,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22.5,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          body: Column(children: [
            Container(
              height: 102.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color(0xFF979797), width: 0.2)),
              width: 237.2,
              height: 126.0,
              child: Column(
                children: [
                  SizedBox(
                    width: 237.2,
                    height: 85.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 38.4,
                          height: 48,
                          padding: EdgeInsets.only(left: 16),
                          child: Icon(
                            Icons.insert_drive_file,
                            color: Color(0xFF555770),
                            size: 48.0,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 34.0, top: 8),
                            child: Text(Strings.txtTermAccreditation,
                                style: LasTextStyle.termAccreditationPage)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFF979797), width: 0.2)),
                    width: 237.2,
                    height: 40.0,
                    child: TextButton(
                        child: Text(Strings.txtButtonPdfAccreditation,
                            style: LasTextStyle.buttonPdfAccreditationPage,
                            textAlign: TextAlign.center),
                        onPressed: () => {launch(url)}),
                  )
                ],
              ),
            ),
            Container(
              height: 236.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF2977E1),
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                  child: Checkbox(
                      shape: CircleBorder(),
                      side: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                          style: BorderStyle.solid),
                      activeColor: Colors.transparent,
                      checkColor: const Color(0XFF5FD855),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                ),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 189.0,
                  height: 16.0,
                  child: Text(
                    Strings.txtcheckAccreditation,
                    style: LasTextStyle.checkAccreditationPage,
                  ),
                ),
              ],
            ),
            Container(
              height: 33.0,
            ),
            SizedBox(
              width: 259.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: (isChecked == false)
                    ? null
                    : () => showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Container(
                                alignment: Alignment.center,
                                width: 328.0,
                                height: 257.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Color(0xFFFFFFFF),
                                    border: Border.all(
                                      width: 2.0,
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      style: BorderStyle.solid,
                                    )),
                                child: Column(
                                  children: [
                                    SizedBox(height: 61.0),
                                    SizedBox(
                                      width: 280.0,
                                      height: 56.0,
                                      child: const Text(
                                        Strings.txtmsgconfirmAccreditation,
                                        style: LasTextStyle
                                            .msgConfirmAccreditation,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 57.0),
                                    SizedBox(
                                      width: 85.0,
                                      height: 37.0,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff004BA0))),
                                        onPressed: () => Navigator.pop(context),
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
                      (isChecked == false)
                          ? Color(0xFF828282)
                          : Color(0xff004BA0)),
                ),
                child: Text(Strings.txtButtonAccreditation,
                    style: LasTextStyle.buttonAccreditationPage),
              ),
            )
          ])),
    ]);
  }
}
