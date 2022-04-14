import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/layers/presentation/helpers/get_plataform.dart';
import 'package:freeflow/layers/presentation/widgets/scaffold_ff/icon_menu.dart';
import 'package:freeflow/routes/routes.dart';


class ScaffoldFreeFlow extends StatefulWidget {
  final Widget body;

  const ScaffoldFreeFlow({Key? key, required this.body}) : super(key: key);

  @override
  _ScaffoldFreeFlowState createState() => _ScaffoldFreeFlowState();
}

class _ScaffoldFreeFlowState extends State<ScaffoldFreeFlow> {
  bool startedPage = false;
  double position  = 0;
  bool wasOpenMenu = true;
  double iconSize = 34;
  double iconPadding = 12;
  late double height;

  @override
  Widget build(BuildContext context) {
    checkSizeOfPage();
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details){
          setState(() {
            if(details.delta.dy > 0){
              position = position + 30;
              if(position > height){
                position = height;
              }
              wasOpenMenu = true;
            }else{
              position = position - 30;
              if(position < 0 ){
                position = 0;
              }
              wasOpenMenu = false;
            }
          });
        },

        onVerticalDragEnd: (details){
          setState(() {
            if(position != 0) {
              if (details.velocity.pixelsPerSecond.dy < 0 || !wasOpenMenu) {
                closeMenu();
              } else {
                position = height;
              }
            }
          });

        },
        onTap: (){
          if(position != 0) {
            closeMenu();
          }
        },

        child: SafeArea(
          top: isAndroidOrWeb(),
          bottom: position != height,
          child: SizedBox(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [


                Container(
                  child: widget.body,
                ),

                appBar(),

                if(position != 0)...[
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: (position/height),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14.0, sigmaY: 14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                position < 0.8 * height ?
                                StandardColors.white.withOpacity(0.8) :
                                StandardColors.white.withOpacity(0.8),
                                position < 0.8 * height ?
                                StandardColors.white.withOpacity(0.2) :
                                StandardColors.white.withOpacity(0.8)],),),
                          child: appBarOpened(),
                        ),
                      ),
                      duration: const Duration(milliseconds: 100),),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar(){
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: isAndroidOrWeb() ? 50 : 72,
            width: 64,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff40B9C0),
                  Color(0xff34A5A9),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  IconsAsset.menu,
                  width: 21,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            alignment: Alignment.bottomCenter,
            height: 3,
            width: 64,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff40B9C0),
                  Color(0xff34A5A9),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBarOpened() {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: 64,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff2CB6BE),
                Color(0xff2FB6B9),
                Color(0xff39B4AB),
                Color(0xff4AB293),
                Color(0xff60AF72),
                Color(0xff6DAD5F),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: isAndroidOrWeb() ? 12 : 40,
              ),
              IconMenu(
                urlIcon : IconsAsset.user,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                  //TODO REMOVE
                  Routes.instance.goToEditProfilePageRoute();
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.money,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.chat,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.star,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.cloud,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.home,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.tools,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.shoppingCar,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.example,
                iconPadding: iconPadding,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
              IconMenu(
                urlIcon : IconsAsset.example,
                iconPadding: iconPadding,
                hasBottomDivisor: false,
                iconSize: iconSize,
                onTap:(){
                  //TODO ADD ACTION
                },
              ),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 8),
          alignment: Alignment.bottomCenter,
          height: 16,
          width: 64,
          color: const Color(0XFF6DAD5F),
        ),

        Container(
          margin: const EdgeInsets.only(top: 4),
          alignment: Alignment.bottomCenter,
          height: 3,
          width: 64,
          color: const Color(0XFF6DAD5F),
        ),
      ],
    );
  }

  void checkSizeOfPage(){
    height = MediaQuery.of(context).size.height;
    if(height < 666 && !startedPage){
      double pageSize = height - ((isAndroidOrWeb() ? 50 : 72) + 74);
      iconSize = (pageSize/10)* 0.6;
      iconPadding = iconSize * 0.4;
      startedPage = true;
    }

  }

  void closeMenu() {
    double aux = position;
    int auxIncrement = 0 ;
    while(aux > 0){
      auxIncrement = auxIncrement + 100;
      aux = aux - 200.0;
      Future.delayed(Duration(milliseconds: auxIncrement), (){
        setState(() {
          position = position - 200;
          if(position < 0){
            position = 0;
          }
        });
      } );
    }
  }
}
