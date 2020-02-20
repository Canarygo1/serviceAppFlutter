import 'package:shared_preferences/shared_preferences.dart';
import 'local_repository_interface.dart';

class PreferencesLocalRepository implements LocalRepositoryInterface {

  @override
  Future<String> getToken() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    print('Hola sharedPrefs ' + _sharedPrefs.getString('tokenRegistered'));
    print("entro");
    if (_sharedPrefs.containsKey('tokenRegistered')) {
      print("entro");
      String token = _sharedPrefs.getString('tokenRegistered');
      return token;
    } else
      return null;
  }

  @override
  Future<bool> removeToken() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    return await _sharedPrefs.remove('tokenRegistered');
  }

  @override
  Future<String> saveToken(String token) async {
    removeToken();
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();

    if (await _sharedPrefs.setString('tokenRegistered', token)) {
      return token;
    } else
      return null;
  }
}