class PaymentResponse {
  bool? ok;
  int? status;
  String? message;
  PaymentStripe? paymentStripe;
  Meta? meta;

  PaymentResponse(
      {this.ok, this.status, this.message, this.paymentStripe, this.meta});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    paymentStripe =
    json['results'] != null ? new PaymentStripe.fromJson(json['results']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['status'] = status;
    data['message'] = message;
    if (paymentStripe != null) {
      data['results'] = paymentStripe!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class PaymentStripe {
  String? url;

  PaymentStripe({this.url});

  PaymentStripe.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Meta {
  String? timestamp;
  int? responseTime;

  Meta({this.timestamp, this.responseTime});

  Meta.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = timestamp;
    data['response_time'] = responseTime;
    return data;
  }
}
