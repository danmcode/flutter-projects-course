import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyA1UtwhuCjdf9J5m_pPhtae9hHIIWsinas';
  //Guardar el token
  final storage = const FlutterSecureStorage();

  //Si retornamos algo es un error
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      //Hay que guardar el token en un lugar seguro.
      await storage.write(key: 'idToken', value: decodeResp['idToken']);

      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      //Hay que guardar el token en un lugar seguro.
      await storage.write(key: 'idToken', value: decodeResp['idToken']);

      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'idToken');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'idToken') ?? '';
  }
}
