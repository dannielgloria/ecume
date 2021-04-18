class RecoverPwdResponseModel {
  final String password;
  final String error;

  RecoverPwdResponseModel({this.password, this.error});

  factory RecoverPwdResponseModel.fromJson(Map<String, dynamic> json) {
    return RecoverPwdResponseModel(
      password: json["Password"] != null ? json["Password"] : "",
      error: json["Error"] != null ? json["Error"] : "",
    );
  }
}

class RecoverPwdRequestModel {
  String phone;

  RecoverPwdRequestModel({this.phone});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "Phone": phone.trim(),
    };

    return map;
  }
}
