class CurrentBookingList {
  CurrentBookingList({
      this.code, 
      this.status, 
      this.message, 
      this.response,});

  CurrentBookingList.fromJson(dynamic json) {
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
      this.fromDate, 
      this.fromTime, 
      this.toDate, 
      this.toTime,});

  Response.fromJson(dynamic json) {
    title = json['title'];
    fromDate = json['from_date'];
    fromTime = json['from_time'];
    toDate = json['to_date'];
    toTime = json['to_time'];
  }
  String? title;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['from_date'] = fromDate;
    map['from_time'] = fromTime;
    map['to_date'] = toDate;
    map['to_time'] = toTime;
    return map;
  }

}