// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'model/product.dart';

// // import 'package:third_cupertino_store/model/product.dart';


// class DocObj {
//   final firestore = FirebaseFirestore.instance;
//   final docRef = firestore.collection('products');

//   docRef.snapshots().listen(
//     (event) => print("current data: ${event.data()}"),
//     onError: (error) => print("Listen failed: $error"),
//   );
// }