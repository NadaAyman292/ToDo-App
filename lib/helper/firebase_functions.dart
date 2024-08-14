import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

class FireBaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (taskModel, _) {
        return taskModel.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel model) async {
    var collection = getTasksCollection();
    //auto id
    var docRef = collection.doc();

    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    var collection = getTasksCollection();
    return collection
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> upDateTask(TaskModel taskModel) {
    return getTasksCollection().doc(taskModel.id).update(taskModel.toJson());
  }

  static createAccountAuth(String email, String password,
      {required Function onSuccess,
      required Function onError,
      required int age,
      required String userName,
      required String phone}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        email: email,
        age: age,
        userName: userName,
        phone: phone,
      );
      addUser(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  static loginUser(String email, String password,
      {required Function onSuccess, required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      onSuccess(credential.user?.displayName ?? "");
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());

      print(e.toString());
    }
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) {
              return UserModel.fromJson(snapshot.data()!);
            },
            toFirestore: (userModel, _) => userModel.toJson());
  }

  static Future<void> addUser(UserModel userModel) {
    var collection = getUserCollection();
    var docRef = collection.doc(userModel.id);
    return docRef.set(userModel);
  }

  static Future<UserModel?> readUser() async {
    DocumentSnapshot<UserModel> docRef = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return docRef.data();
  }
}
