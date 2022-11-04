import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wildersmerch/navigation/navigators.dart';
import 'package:wildersmerch/navigation/routes.dart';

import '../models/shop_user.dart';

class UserProvider extends ChangeNotifier {
  ShopUser user = ShopUser(
      name: 'null',
      email: 'null',
      address: 'null',
      number: 00000,
      seller: false,
      id: 'null');
  final FirebaseAuth _firebaseAuth;
  UserProvider(this._firebaseAuth);
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future login({user, password}) async {
    try {
      final res = await _firebaseAuth.signInWithEmailAndPassword(
          email: user, password: password);
      print(res.user?.uid);
      String? uid = res.user?.uid.toString();

      final url =
          'https://weebstore-77611-default-rtdb.asia-southeast1.firebasedatabase.app/users/$uid.json';

      final response = await http.get(Uri.parse(url));
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData['name']);
      this.user.id = extractedData['id'];
      this.user.name = extractedData["name"];
      this.user.email = extractedData['email'];
      this.user.number = extractedData['number'];
      this.user.seller = extractedData['seller'];
      this.user.address = extractedData['address'];

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<bool> register(ShopUser newUser, String password) async {
    user = newUser;
    var userId;
    try {
      var res = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: password);

      userId = res.user!.uid;
      final _body = json.encode({
        'id': userId,
        'address': newUser.address,
        'email': newUser.email,
        'order': [""],
        'name': newUser.name,
        'number': newUser.number,
        'seller': false
      });
      print(_body);

      Uri url = Uri.parse(
          'https://weebstore-77611-default-rtdb.asia-southeast1.firebasedatabase.app/users/$userId.json');
      final response = await http.patch(url, body: _body);

      print(json.decode(response.body));
      notifyListeners();
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
      // TODO
    }
  }

  void logout(context) async {
    try {
      await _firebaseAuth.signOut();
      user.id = 'null';
      push(context, NamedRoute.homeScreen);
    } catch (e) {
      print(e);
    }
  }
}
