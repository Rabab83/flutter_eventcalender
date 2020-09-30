

class AccountBreif {
  final String name;
  final String email;
  final String id;

  AccountBreif({this.name, this.email, this.id});

  AccountBreif.fromMap(Map<String, dynamic> data, String id)
      : name = data["name"],
        email = data['email'],
        id = id;

  AccountBreif.fromOneMap(Map<String, dynamic> data, String id)
        : name = data["name"],
          email = data['email'],
          id = id;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
    };
  }
}
