class User{
  int? id;
  String? name;
  String? contact;
  String? description;
  User({this.id, this.name, this.contact, this.description});

  Map<String ,dynamic> UserMap(){
    var mapping = Map<String ,dynamic>();
    mapping["id"]= id ?? null;
    mapping["name"]= name ?? "";
    mapping["contact"]= contact ?? "";
    mapping["description"]= description ?? "";
    return mapping  ;
  }
}