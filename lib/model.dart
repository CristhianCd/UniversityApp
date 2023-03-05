class TodoModel {
  final int? id;
  final String? title;
  final String? desc;
  final String? deteandtime;

  TodoModel({this.id, this.title, this.desc, this.deteandtime});

  TodoModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        desc = res['desc'],
        deteandtime = res['dateandtime'];

        Map<String, Object?> toMap() {
          return {
            "id": id,
            "title": title,
            "desc": desc,
            "dateandtime": deteandtime,
          };
        }
}