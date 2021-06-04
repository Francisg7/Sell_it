
import 'package:shared_preferences/shared_preferences.dart';

class LocalTempDB{
  static Future<List<String>> saveLikeList(String productID,List<String> myLikeList,bool isLikeProduct,String updateType) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> newLikeList = myLikeList;
    if(myLikeList == null) {
      newLikeList = List<String>();
      newLikeList.add(productID);
    }else {
      if (isLikeProduct) {
        myLikeList.remove(productID);
      }else {
        myLikeList.add(productID);
      }
    }
    prefs.setStringList(updateType, newLikeList);
    return newLikeList;
  }
}