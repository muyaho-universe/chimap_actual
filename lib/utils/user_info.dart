class UInfo {


  String userName = "";
  late DateTime birthDay;
  String userPhoneNum = "";
  int userType = -1;

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
}