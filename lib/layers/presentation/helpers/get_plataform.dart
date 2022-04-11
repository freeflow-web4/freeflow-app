import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

bool isAndroidOrWeb(){
  try{
    return isAndroid() || isWeb();
  }catch(e){
  return false;
  }
}


bool isWeb(){
  try{
    return kIsWeb;
  }catch(e){
    return false;
  }

}

bool isAndroid(){
  try{
    return Platform.isAndroid;
  }catch(e){
    return false;
  }
}