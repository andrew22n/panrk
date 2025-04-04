import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenceHelper{
  static String useridKey="USERKEY";
  static String userNameKey="USERNAMEKEY";  
  static String userEmailKey="USEREMAILKEY";
  static String userPicKey="USERPICKEY";
  static String userDisplayKey="USERDISPLAYKEY";
  Future<bool>saveUserid(String getUserId)async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    return prefs.setString(useridKey, getUserId);
  }
  Future<bool>saveUserEmail(String getUserEmail)async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }
  Future<bool>saveUserName(String getUserName)async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }
  Future<bool>saveUserPic(String getUserPic)async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    return prefs.setString(userPicKey, getUserPic);
  }
  Future<bool>saveUserDisplayName(String getUserDisplayName)async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    return prefs.setString(userDisplayKey, getUserDisplayName);
  }
  Future<String?> getUserId()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString(useridKey);

  }
  Future<String?> getUserName()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);

  }
  Future<String?> getUserEmail()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);

  }
  Future<String?> getUserDisplayName()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getString(userDisplayKey);

  }
  
}