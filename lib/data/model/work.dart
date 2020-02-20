class Work{
  final String type;
  final String name;
  final String date;
  final String moreInfo;
  final int reward;

  Work(this.type,this.name, this.date, this.moreInfo, this.reward);

  factory Work.fromMap(Map<String, dynamic> json) {
    String type =  json['type'];
    String name =  json['name'];
    String date = json['date'];
    String moreInfo = json['moreInfo'];
    int reward = json['reward'];

    return Work(type, name, date, moreInfo, reward);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["type"] = type;
    map["name"] = name;
    map["date"] = date;
    map["moreInfo"] = moreInfo;
    map["reward"] = reward;
    return map;
  }
}