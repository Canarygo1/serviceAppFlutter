import 'package:serviceapp/repository/model/user.dart';

import 'local_repository_interface.dart';

class PreferencesLocalRepository implements LocalRepositoryInterface {
  @override
  Future<LoggingUser> getUser() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    print('Hola sharedPrefs ' + _sharedPrefs.getString('userRegistered'));
    if (_sharedPrefs.containsKey('userRegistered')) {
      String userName = _sharedPrefs.getString('userRegistered');
      return User.fromMap(json.decode(userName));
    } else
      return null;
  }

  @override
  Future<bool> removeUser() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    return await _sharedPrefs.remove('name');
  }

  @override
  Future<User> saveUser(User user) async {
    removeUser();
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    String userName = json.encode(user.toMap());

    if (await _sharedPrefs.setString('userRegistered', userName)) {

      return user;
    } else
      return null;
  }
}