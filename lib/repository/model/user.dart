class NewUser{
  final String name;
  final String surname;
  final String email;
  final String direction;
  final String mobile;
  final String password;

  NewUser(this.name, this.email, this.surname, this.direction, this.mobile, this.password);
}

class LoggingUser{
  final String email;
  final String password;

  LoggingUser(this.email, this.password);
}