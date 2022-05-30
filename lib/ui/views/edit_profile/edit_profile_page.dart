
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:projeto_final/resources/las_colors.dart';
// import 'package:projeto_final/resources/las_strings.dart';
// import 'package:projeto_final/resources/las_text_style.dart';
// import 'package:projeto_final/ui/views/components/custom_appBar.dart';

// class EditProfilePage extends StatelessWidget {
//   const EditProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 200,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         flexibleSpace: ClipPath(
//           clipper: CustomAppbar(),
//           child: Container(
//             height: 150,
//             width: MediaQuery.of(context).size.width,
//             color: LasColors.appBarEditProfile,
//             child: Column(
//               children: const [
//                 SizedBox(
//                   height: 20,
//                   width: double.infinity,
//                 ),
//                 Text(Strings.txtMyHistoric,
//                     style: LasTextStyle.txtEdit, textAlign: TextAlign.center),
//               ],
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: LasColors.textButtonColor,
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Center(
//                 child: SizedBox(
//                     height: 170,
//                     width: 180,
//                     child: SvgPicture.asset('assets/images/Vector1.svg')),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
