import 'dart:io';

bool isAndroidOrWeb(){
  try{
    return Platform.isAndroid;
  }catch(e){
    return true;
  }
}
