import 'api_historic_cred.dart';

// List<Accreditation> getDate(List<Accreditation> list, int year) {
//   List<Accreditation> finalList = [];

//   for (var element in list) {
//     if (element.date.year == year) {
//       finalList.add(element);
//     }
//   }

//   return finalList;
// }

//List<HistoricSection> getSections(List<Accreditation> list) {
  // List<HistoricSection> finalList = [];
  // for (var element in list) {
  //   if (finalList
  //       .any((section) => section.title == element.date.year.toString())) {
  //     final section = finalList.firstWhere(
  //         (section) => section.title == element.date.year.toString());
  //     section.accreditations.add(element);
  //   } else {
  //     final section = HistoricSection(
  //         accreditations: [element], title: element.date.year.toString());
  //     finalList.add(section);
  //   }
  // }

//   return finalList;
// }

// class HistoricSection {
//   List<Accreditation> accreditations;
//   String title;
//   HistoricSection({
//     required this.accreditations,
//     required this.title,
//   });
// }