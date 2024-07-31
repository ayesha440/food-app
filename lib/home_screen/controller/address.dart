// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class YourWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return
//       StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').doc('your_user_id').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (!snapshot.hasData || !snapshot.data.exists) {
//           return Text('No data available');
//         }
//
//         String address = snapshot.data['address'];
//
//         return Container(
//           height: size.height * 0.05,
//           width: size.width * 0.45,
//           decoration: BoxDecoration(
//             color: Color(0xFFFCE2CF).withOpacity(0.5),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserCurrentLocation()));
//             },
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Image.asset("assets/images/location.png"),
//                   Text(
//                     address,
//                     style: TextStyle(color: Color(0xFFEA985B).withOpacity(0.7)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
