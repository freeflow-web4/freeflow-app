import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:shimmer/shimmer.dart';

import 'controller/edit_profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>  with TextThemes{

  final EditProfileController editController = findEditProfileController();
  TextEditingController controllerName = TextEditingController();



  List<String> images = [
    'https://gizmodo.uol.com.br/wp-content/blogs.dir/8/files/2021/02/nyan-cat-1.gif',
    'https://picsum.photos/250?image=8',
    'https://picsum.photos/250?image=10' ];

  @override
  void initState() {
    super.initState();
    editController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.white,
      key: editController.navigatorKey,
      body: Observer(
        builder: (_) {
          return Container(
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
                            onTapCancel();
                          },
                          child: Text(
                            TranslationService.translate(context, "editProfile.cancel",),
                            style: subtitleTextStyle.copyWith(
                              color: StandardColors.grey79,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          TranslationService.translate(context, "editProfile.editProfile",),
                          style: textH6TextStyle,
                        ),
                        TextButton(
                          onPressed: (){
                            onTapSave();
                          },
                          child: Text(
                            TranslationService.translate(context, "editProfile.save",),
                            style: subtitleTextStyle.copyWith(
                              color: StandardColors.blueLight,
                              fontWeight: FontWeight.bold,
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
                              width: 3,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(64)),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 128.0,
                                  height: 128.0,
                                  child: Shimmer.fromColors(
                                    direction: ShimmerDirection.ltr,
                                    baseColor: StandardColors.baseShimmer,
                                    highlightColor: StandardColors.highlightShimmer,
                                    child: Container(
                                      width: 128.0,
                                      height: 128.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Observer(
                                  builder: (context) {
                                    return imageUser();
                                  },
                                ),
                                Material(
                                  borderRadius: const BorderRadius.all(Radius.circular(64)),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(Radius.circular(64)),
                                    onTap: (){
                                      onTapSelectImage();
                                    },
                                    child: const SizedBox(
                                      height: 122,
                                      width: 122,
                                    ),
                                  ),
                                ),
                              ],
                            ),),
                        ),

                        const SizedBox(
                          height: normalSpacing,
                        ),

                        TextButton(
                          onPressed: (){
                            onTapSelectImage();
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
                          height: editController.invalidName == null ? 47 : 63 ,
                          child: Stack(
                            children: [
                              TextField(
                                key: const ValueKey('key_for_text_field',),
                                enabled: editController.pageState != PageState.loadingSendData,
                                onChanged: (text) {
                                  setState(() {
                                    if(controllerName.text.substring(0,1) == ' '){
                                      controllerName.text = controllerName.text.substring(1);
                                    }
                                  });
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
                                  fontWeight: FontWeight.bold,
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
                                      ),),
                                  ) :  null,
                                ),
                                maxLines: 1,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(1),
                                        ),
                                        gradient: LinearGradient(
                                          colors: getLineColors(),
                                        ),
                                      ),
                                    ),
                                    if(editController.invalidName != null)...[
                                      Text(
                                        editController.invalidName!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Akrobat',
                                          fontWeight: FontWeight.w800,
                                          color: StandardColors.error,
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),


                        if(editController.pageState == PageState.loadingSendData)...[
                          const Padding(
                            padding: EdgeInsets.only(top: mdSpacingx2),
                            child: LoadingWidget(isLoading: true,
                              color: StandardColors.greyCA,
                              size: 33,
                            ),
                          )
                        ]



                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget imageUser() {
    if(editController.user?.profileImageUrl != null && editController.imageBytes == null){
      return Image.network(
        editController.user!.profileImageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, url, error) =>  Container(
          color: StandardColors.grey79,
          child: const Center(
            child: Icon(Icons.error,),
          ),
        ),
      );
    }
    else if(editController.imageBytes != null){
      return Image.memory(
        editController.imageBytes!,
        fit: BoxFit.cover,
      );
    }
    else{
      return Image.asset(
        IconsAsset.backgroundHoroscope,
        fit: BoxFit.cover,
      );
    }
  }

  bool get keyboardIsVisible{
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  void onTapSelectImage() {
    showModalSelectPhoto();
  }

  void onTapCancel() {
    showModalCancel();
  }

  void onTapSave() {
    if(editController.validateName(controllerName.text, context)){
    }
  }

  void showModalCancel(){
    showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 4,
                width: 52,
                margin: const EdgeInsets.symmetric(vertical: 17),
                decoration: const BoxDecoration(
                  color: StandardColors.backgroundDark,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),

              Text(
                TranslationService.translate(context, "editProfile.discardChanges",),
                style: textH6TextStyle,
              ),

              const SizedBox(
                height: 24,
              ),

              Text(
                TranslationService.translate(context, "editProfile.discardChangesText",),
                textAlign: TextAlign.center,
                style: textH6TextStyle.copyWith(
                  fontSize: 20,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                height: 39,
                child: OutlinedButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 100), (){
                      Navigator.of(context).pop();
                      Routes.instance.pop();
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(

                      borderRadius: BorderRadius.all(Radius.circular(19.5),),
                    ),
                    primary: StandardColors.grey79,
                    side: const BorderSide(color: StandardColors.grey79, width: 1),
                  ),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    child: textBold18(
                      context,
                      text:TranslationService.translate(context, "editProfile.discardChangesAccept",),
                      color: StandardColors.grey79,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                height: 39,
                child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(19.5)),
                  color: StandardColors.blueLight,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(19.5)),
                    onTap: (){
                      Future.delayed(const Duration(milliseconds: 100), (){
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 39,
                      width: double.infinity,
                      child: textBold18(
                        context,
                        text:TranslationService.translate(context, "editProfile.keepEdition",),
                        color: StandardColors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),

            ],
          ),
        );
      },);
  }

  void showModalSelectPhoto(){
    showModalBottomSheet(
      isScrollControlled:true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),

      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height*0.8,
          child: StatefulBuilder(builder: (BuildContext context, StateSetter mystate){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 4,
                  width: 52,
                  margin: const EdgeInsets.symmetric(vertical: 17),
                  decoration: const BoxDecoration(
                    color: StandardColors.backgroundDark,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),

                Text(
                  TranslationService.translate(context, "editProfile.gallery",),
                  style: textH6TextStyle,
                ),

                const SizedBox(
                  height: 12,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterBarItem(
                        tabName: TranslationService.translate(context, "editProfile.all",),
                        tabMargin: EdgeInsets.zero,
                        isSelected: editController.photoSelectedState == PhotoSelectedState.all,
                        onTap: () {
                          mystate(() {
                            editController.photoSelectedState = PhotoSelectedState.all;
                          });
                        },
                      ),
                      CustomFilterBarItem(
                        tabName: TranslationService.translate(context, "editProfile.tickets",),
                        tabMargin: EdgeInsets.zero,
                        isSelected: editController.photoSelectedState == PhotoSelectedState.tickets,
                        onTap: () {
                          mystate(() {
                            editController.photoSelectedState = PhotoSelectedState.tickets;
                          });
                        },
                      ),
                      CustomFilterBarItem(
                        tabName: TranslationService.translate(context, "editProfile.badges",),
                        tabMargin: EdgeInsets.zero,
                        isSelected: editController.photoSelectedState == PhotoSelectedState.badges,
                        onTap: () {
                          mystate(() {
                            editController.photoSelectedState = PhotoSelectedState.badges;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                const Divider(
                  color: StandardColors.greyCA,
                  thickness: 1.5,
                  indent: 32,
                  endIndent: 32,
                ),

                const SizedBox(
                  height: 12,
                ),

                if(editController.loadingPhotos)...[
                  gridView(shimmerImages())
                ]else if(images.isEmpty)...[
                  Text(
                    TranslationService.translate(context, "editProfile.noImage",),
                    style: textH6TextStyle.copyWith(
                      color: StandardColors.greyCA,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  SvgPicture.asset(
                    IconsAsset.flowerLogo,
                    height: 107,
                    width: 107,
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56),
                    child: Text(
                      TranslationService.translate(context, "editProfile.noImageText",),
                      textAlign: TextAlign.center,
                      style: textH6TextStyle.copyWith(
                        color: StandardColors.greyCA,
                      ),
                    ),
                  ),
                ]else...[
                  gridView(imagesList()),
                ]
              ],
            );
          },
          ),
        );
      },
    );
  }

  Widget gridView(List<Widget> children) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.8 - 150,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(1),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 3,
        children: children,
      ),
    );
  }

  List<Widget> shimmerImages(){
    List<Widget> list = [];
    for (int i=0; i<27; i++){
      list.add(shimmerItem());
    }
    return list;
  }

  List<Widget> imagesList(){
    List<Widget> list = [];
    for (int i=0; i<images.length; i++){
      list.add(imagesItem(i));
    }
    return list;
  }

  Widget imagesItem(index){
    double size = MediaQuery.of(context).size.width/3;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          shimmerItem(),
          Image.network(
            images[index],
            width: size,
            height: size,
            fit: BoxFit.cover,
            errorBuilder: (context, url, error) =>  Container(
              color: StandardColors.grey79,
              child: const Center(
                child: Icon(Icons.error,),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                Future.delayed(const Duration(milliseconds: 80), () async {
                  editController.onTapToChangePhoto(images[index]);
                  Navigator.of(context).pop();
                });

              },
              child: SizedBox(
                width: size,
                height: size,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget shimmerItem(){
    double size = MediaQuery.of(context).size.width/3;
    return Shimmer.fromColors(
      child: Container(
        width: size,
        height: size,
        color: Colors.white,
      ),
      baseColor: StandardColors.baseShimmer,
      highlightColor: StandardColors.highlightShimmer,
    );
  }

  List<Color> getLineColors() {
    if(editController.invalidName == null){
      return [
        const Color(0XFF29B6B8),
        const Color(0xff6AAD6B)
      ];
    }else{
      return [
        const Color(0XFFB82929),
        const Color(0xffF27070),
      ];
    }

  }






}


class CustomFilterBarItem extends StatelessWidget {
  final EdgeInsets? tabMargin;
  final String tabName;
  final Function onTap;
  final bool isSelected;
  final double? height;
  const CustomFilterBarItem({
    Key? key,
    required this.tabName,
    required this.isSelected,
    required this.onTap,
    this.tabMargin,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: height ?? 25,
        padding: tabMargin ?? const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tabName,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Akrobat',
                fontWeight: FontWeight.w600,
                color: StandardColors.grey69,),
            ),
            customIndicator(isActive: isSelected)
          ],
        ),
      ),
    );
  }

  Widget customIndicator({
    required bool isActive,
    List<Color>? colors,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      height: isSelected ? 3 : 0,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: colors ??
              [
                const Color(0xffDE83E0).withOpacity(0.6),
                const Color(0xff32B4FF).withOpacity(0.6),
              ],
        ),
      ),
    );
  }



}