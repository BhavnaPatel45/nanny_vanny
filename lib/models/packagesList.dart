class PackagesList {
  PackagesList({
      this.code, 
      this.status, 
      this.message, 
      this.response,});

  PackagesList.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(Response.fromJson(v));
      });
    }
  }
  String? code;
  String? status;
  String? message;
  List<Response>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    map['message'] = message;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Response {
  Response({
      this.title, 
      this.price, 
      this.desc,});

  Response.fromJson(dynamic json) {
    title = json['title'];
    price = json['price'];
    desc = json['desc'];
  }
  String? title;
  String? price;
  String? desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['price'] = price;
    map['desc'] = desc;
    return map;
  }

}