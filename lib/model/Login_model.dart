class Loginresponsemodel {
  final String token;
  final String error;
  Loginresponsemodel({this.token, this.error});

  factory Loginresponsemodel.fromjson(Map<String, dynamic> json) {
    return Loginresponsemodel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class Loginrequestmodel {
  String email;
  String password;
  Loginrequestmodel({this.email, this.password});

  Map<String, dynamic> tojson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim()
    };

    return map;
  }
}
