class Work{
  final String type;
  final String date;
  final String moreInfo;
  final double reward;

  Work(this.type, this.date, this.moreInfo, this.reward);

  factory Work.fromMap(Map<String, dynamic> json) {
    String name =  json['type'];
    String date = json['date'];
    String moreInfo = json['moreInfo'];
    double reward = json['reward'];

    return Work(name, date, moreInfo, reward);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = type;
    map["date"] = date;
    map["moreInfo"] = moreInfo;
    map["reward"] = reward;
    return map;
  }
}