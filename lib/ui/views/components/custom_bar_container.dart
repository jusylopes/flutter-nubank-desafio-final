import 'package:flutter/material.dart';

import '../../../resources/las_colors.dart';
import 'custom_appbar.dart';

// Para ampliar a imagem de fundo do background cobrindo ate o appbar na tela de historico
// appbar das telas de historic e historic detalhes
class CustomBarContainer extends StatelessWidget {
  final String titleappbarhistoric;

  const CustomBarContainer({Key? key, required this.titleappbarhistoric})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppbar(),
      child: Container(
        alignment: Alignment.center,
        height: 160,
        width: MediaQuery.of(context).size.width,
        color: LasColors.appBarEditProfile,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pushNamed(Routes.historic);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: LasColors.txtAppBarProfile,
                )),
            const Spacer(),
            Text(
              titleappbarhistoric,
              style: const TextStyle(
                  color: LasColors.txtAppBarProfile,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Container()),
          ],
        ),
      ),
    );
  }
}
