abstract class LocalRepositoryInterface{
  Future<User> saveUser(User user);
  Future<bool> removeUser();
  Future<User> getUser();
}