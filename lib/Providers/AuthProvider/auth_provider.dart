import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ekahi/Constans/url.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final requestBaseUrl = AppUrl.baseUrl;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';
  // Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void registerUser({
    required String name,
    required String email,
    required String password,
    required String confirm_password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/register";

    final body = {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirm_password
    };

    print(body);

    try {
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));
        print('here');
      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print('here');
        _isLoading = false;
        _resMessage = res['message'];
        notifyListeners();
      } else {
        final res = json.decode(req.body);

        print(res.body);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet Connection is Unavailable';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Something error occurred';
      notifyListeners();
    }
  }

  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/login";

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final request = jsonDecode(body);

    try {
      http.Response req = await http.post(Uri.parse(url), body: request);
      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = jsonDecode(req.body);
        print(res);
        _isLoading = false;
        _resMessage = res['token'];
        notifyListeners();
      } else {
        print(req.body);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet Connection is Unavailable';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Something error occurred';
      notifyListeners();

      print(':::: $e');
    }
  }

  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}
