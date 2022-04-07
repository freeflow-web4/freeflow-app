import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/edit_profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>  with TextThemes{

  final editController = findEditProfileController();
  TextEditingController controllerName = TextEditingController();
  bool hasImage = true;
  bool invalidName = false;



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.white,

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IconsAsset.backgroundHoroscope),
            opacity: 0.15,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: mdSpacing),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        TranslationService.translate(context, "editProfile.cancel",),
                        style: subtitleTextStyle.copyWith(
                            color: StandardColors.grey79,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Text(
                      TranslationService.translate(context, "editProfile.editProfile",),
                      style: textH6TextStyle,
                    ),
                    TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        TranslationService.translate(context, "editProfile.save",),
                        style: subtitleTextStyle.copyWith(
                            color: StandardColors.blueLight,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [

                    const SizedBox(
                      height: hugeSpacing,
                    ),

                    Container(
                      height: 128,
                      width: 128,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(64)),
                          border: Border.all(
                              color: StandardColors.backgroundDark,
                              width: 3
                          )
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(64)),
                          child: imageUser('https://picsum.photos/250?image=9')),
                    ),

                    const SizedBox(
                      height: normalSpacing,
                    ),

                    TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        TranslationService.translate(context, "editProfile.changeProfilePhoto",),
                        style: const TextStyle(
                          color: StandardColors.blueLight,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: mdSpacing,
                    ),

                    const Divider(
                      color: StandardColors.greyCA,
                      thickness: 1.5,
                      endIndent: 32,
                      indent: 32,
                    ),

                    const SizedBox(
                      height: mdSpacing,
                    ),


                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      height: 50,
                      child: Stack(
                        children: [
                          TextFormField(
                            key: const ValueKey('key_for_text_field',),
                            onChanged: (text) {
                              setState(() {
                                if(controllerName.text.substring(0,1) == ' '){
                                  controllerName.text = controllerName.text.substring(1);
                                }
                              });
                            },
                            validator: (text){
                              if(text!.length > 60){
                                return TranslationService.translate(context, "editProfile.maximum60Characters",).replaceFirst('70', '${text.length}');
                              }else if(text.isEmpty){
                                return TranslationService.translate(context, "editProfile.pleaseEnterYourName",);
                              }
                              return null;
                            },
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.go,
                            style: TextStyle(
                                color: keyboardIsVisible ?
                                StandardColors.backgroundDark :
                                StandardColors.grey69,
                                fontFamily: 'Akrobat',
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                            controller: controllerName,
                            decoration:  InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              labelText: TranslationService.translate(context, "editProfile.name",),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                color: StandardColors.grey79,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                              suffixIcon: controllerName.text.isNotEmpty ? IconButton(
                                onPressed: (){
                                  setState(() {
                                    controllerName.text = '';
                                  });
                                },
                                icon: const Material(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    color: StandardColors.grey69,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    )),
                              ) :  null,
                            ),
                            maxLines: 1,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 3,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(1),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0XFF29B6B8),
                                    Color(0xff6AAD6B)                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )



                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageUser( String? urlImage) {
    if(urlImage != null){
      return Image.network(
        urlImage,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          //if (loadingProgress == null) return child;
          return  SizedBox(
            width: 128.0,
            height: 128.0,
            child: Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Container(
                  width: 128.0,
                  height: 128.0,
                color: Colors.white,
              ),
            ),
          );
        },
        errorBuilder: (context, url, error) =>  const Icon(Icons.error),
      );
    }else{
      return Image.asset(
        IconsAsset.backgroundHoroscope,
        fit: BoxFit.cover,
      );
    }
  }

  bool get keyboardIsVisible{
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

}
