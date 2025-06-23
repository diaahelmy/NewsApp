// import 'package:flutter/material.dart';
// import 'package:news/Models/CategoryM.dart';
//
// import '../Models/CategoryModel.dart';
//
// class Categoryview extends StatelessWidget {
//   Categoryview({super.key});
//
//   List<CategoryM> Categories =const [
//     CategoryM(image: 'assets/business.avif', Categoryname: 'Business'),
//     CategoryM(image: 'assets/entertaiment.avif', Categoryname: 'Entertaiment'),
//     CategoryM(image: 'assets/general.avif', Categoryname: 'General'),
//     CategoryM(image: 'assets/health.avif', Categoryname: 'Health'),
//     CategoryM(image: 'assets/science.avif', Categoryname: 'Science'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150,
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return Categorymodel(category: Categories[index],);
//         },
//         scrollDirection: Axis.horizontal,
//         itemCount: Categories.length,
//       ),
//
//     );
//   }
// }
