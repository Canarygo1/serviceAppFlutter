class JsonPostLogin {
  String email;
  String password;

  JsonPostLogin(this.email, this.password);

  toMap() {
    Map<String, String> data = {"email": email, "password": password};
    return data;
  }
}
