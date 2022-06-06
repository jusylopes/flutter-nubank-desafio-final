import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';

Map<String, String> contact = {
  'Gabinete do Prefeito': 'Tel: (71) 3202-6000',
  'Gabinete do Vice-Prefeito': 'Tel: (71) 3202-6000',
  'Casa Civil': 'Telefone: 3202-7400',
  'Secretaria Municipal de Cultura e Turismo - SECULT': 'Telefone: 3202-7600',
  'Secretaria Municipal da Fazenda - SEFAZ': 'Telefone: 3202-8200',
  'Secretaria Municipal de Comunicação - SECOM': 'Telefone: (71) 3202-6000',
};

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        const SizedBox(
          height: 100,
        ),
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBarWidget(
              back: true,
            ),
          ),
          body: ListView.builder(
            itemCount: contact.length,
            itemBuilder: (BuildContext context, int index) {
              String key = contact.keys.elementAt(index);
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(key),
                    subtitle: Text('${contact[key]}'),
                  ),
                  const Divider(
                    height: 2.0,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 110.0,
          child: Center(
            child: Text(
              'Contatos',
              style: LasTextStyle.txtTitlePages,
            ),
          ),
        )
      ],
    );
  }
}
