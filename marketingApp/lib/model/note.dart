class Note {
  final String title;
  final String description;
  final String id;
  final String userId;

  Note({this.title, this.description, this.id, this.userId});

  Note.fromMap(Map<String, dynamic> data, String id)
      : title = data["title"],
        description = data['description'],
        userId = data["userId"],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "userId": userId,
    };
  }
}
