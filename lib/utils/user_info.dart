class UInfo {


  String userName = "";
  late DateTime birthDay;
  String userPhoneNum = "";
  int userType = -1;
  bool auth =false;
  String address = "";
  String id = "";
  String password = "";
  String gender = "";
  bool idChecked =false;

  void setUserName(String name){
    userName = name;
  }

  void setBirthdy(DateTime birthday){
    birthDay = birthday;
  }

  void setPhoneNumber(String phoneNumber){
    userPhoneNum = phoneNumber;
  }

  void setType(int type){
    userType = type;
  }

  void setAuth(bool auth){
    this.auth = auth;
  }

  void setAddress(String address){
    this.address = address;
  }

  void setID(String id){
    this.id = id;
  }

  void setPassword(String password){
    this.password = password;
  }

  void setGender(String gender){
    this.gender = gender;
  }

  void setIdCheck(bool check){
    this.idChecked = check;
  }
}