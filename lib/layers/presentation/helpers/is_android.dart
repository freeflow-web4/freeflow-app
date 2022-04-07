import 'dart:io';

bool isAndroid(){
  try{
    return Platform.isAndroid;
  }catch(e){
    return true;
  }
}
