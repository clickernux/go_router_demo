
import 'package:flutter/material.dart';
import 'package:go_router_demo/app_cache.dart';

class AppState extends ChangeNotifier{
  bool _isLoggedIn = true;
  bool get isLoggedIn => _isLoggedIn;
  final _appCache = AppCache();

  Future<void> initializeApp() async{
    _isLoggedIn = await _appCache.isLoggedIn();
    notifyListeners();
  }

  void login() async{
    _isLoggedIn = true;
    await _appCache.cacheUser();
    print('isLoggedIn: $isLoggedIn');
    notifyListeners();
  }

  void logout() async{
    _isLoggedIn = false;
    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
}