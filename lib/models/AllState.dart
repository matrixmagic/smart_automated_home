class AllState {
  bool ledState;

  AllState({this.ledState});

  AllState.fromJson(Map<String, dynamic> json) {
    ledState = json['ledState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ledState'] = this.ledState;
    return data;
  }
}
