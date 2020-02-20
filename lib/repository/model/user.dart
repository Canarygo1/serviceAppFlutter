class NewUser{
  final String name;
  final String surname;
  final String email;
  final String birthDate;
  final String mobile;
  final String password;

  NewUser(this.name, this.surname, this.email, this.birthDate, this.mobile, this.password);

  factory NewUser.fromMap(Map<String, dynamic> json) {
    String name =  json['nombre'];
    String surname = json['apellidos'];
    String email = json['correo'];
    String birthDate = json['fechaNacimiento'];
    String mobile = json['telefono'];
    String password = json['password'];
    return NewUser(name, surname, email, birthDate, mobile, password);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["nombre"] = name;
    map["apellidos"] = surname;
    map["correo"] = email;
    map["fechaNacimiento"] = birthDate;
    map["telefono"] = mobile;
    map["password"] = password;
    return map;
  }
}

class LoggingUser{
  final String email;
  final String password;

  LoggingUser(this.email, this.password);
}