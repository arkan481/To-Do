class namemodel {
  String name;
  int id;
  namemodel(this.name);
  namemodel.withid(this.id,this.name);
  String getname() {
    return this.name;
  }
  int getid() {
    return this.id;
  }
  void setname(String name) {
    this.name=name;
  }
  // Convert this name object into a map object (from flutter to sql)
  Map<String,dynamic> toMap() {
    var map = Map<String,dynamic>();
    if (this.id!=null) {
      map['id']=this.id;
    }
    map['name']=this.name;

    return map;
  }

  // Convert map object into name object (from sql to flutter)
  namemodel.frommapobject(Map<String,dynamic> map){
    this.id= map['id'];
    this.name= map['name'];
  }

}