import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitcycle/models/ejercise.dart';

import '../models/user.dart' as UserApp;

class FirebaseAppi {
  Future<String?> createUser(String emailAddress, String password) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String?> signInUser(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException ${e.code}");
      return e.code;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }
  Future<String> createUserInDB(UserApp.User user) async{
    try{
      var db=FirebaseFirestore.instance;
      final document = await db.collection('users').doc(user.uid).set(user.toJson());
      return user.uid;
    }
    on FirebaseException catch (e){
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }
  Future<String> createEjercise(Ejercise ejercise, File? image) async{
    try{
      final uid = FirebaseAuth.instance.currentUser?.uid;
      var db = FirebaseFirestore.instance;
      final document = await db
          .collection('users')
          .doc(uid)
          .collection('ejercise')
          .doc();
      ejercise.id = document.id;

      final storageRef = FirebaseStorage.instance.ref();
      if (image != null) {
        final ejercisePictureRef = storageRef.child('ejercises').child("${ejercise.id}.jpg");
        await ejercisePictureRef.putFile(image);
        ejercise.urlPicture = await ejercisePictureRef.getDownloadURL();
      } else {
        ejercise.urlPicture = '';
      }

      await db
          .collection('users')
          .doc(uid)
          .collection('ejercises')
          .doc(document.id)
          .set(ejercise.toJson());

      await db
          .collection('ejercises')
          .doc(document.id)
          .set(ejercise.toJson());

      return document.id;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

  Future<String> deleteEjercise(QueryDocumentSnapshot ejercise) async{
    try{
      final uid = FirebaseAuth.instance.currentUser?.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('ejercises')
          .doc(ejercise.id)
          .delete();

      await FirebaseFirestore.instance
          .collection('ejercises')
          .doc(ejercise.id)
          .delete();

      return uid!;
    } on FirebaseException catch (e) {
      print("FirebaseException ${e.code}");
      return e.code;
    }
  }

}
