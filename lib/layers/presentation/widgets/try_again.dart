import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class TryAgain extends StatelessWidget {
  final void Function() onTap;
  const TryAgain({Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TranslationService.translate(context, "tryAgain.title"),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "Akrobat",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: StandardColors.black,
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              TranslationService.translate(context, "tryAgain.subtext"),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Akrobat",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: StandardColors.black,
              ),
            ),
          ),

          const SizedBox(
            height: 64,
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: OutlinedButton(
                onPressed: onTap,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(StandardColors.blueLight),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    TranslationService.translate(context, "tryAgain.textButton"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: "Akrobat",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: StandardColors.white,
                    ),
                  ),
                ),

            ),
          )



        ],
      ),
    );
  }
}
