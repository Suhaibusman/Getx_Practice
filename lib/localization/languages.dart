import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  
  @override
  Map<String, Map<String, String>> get keys =>{
    "en_US" :{
      "title" : "English",
      "home" : "Home",
      "name" :"Suhaib",
      "message" :"What is Your name?"
    },
 "ur_PK" :{
      "title" : "اردو",
      "home" : "گھر",
      "name" :"صہیب",
      "message" :"آپ کا نام کیا ہے؟"
    }
  };

}