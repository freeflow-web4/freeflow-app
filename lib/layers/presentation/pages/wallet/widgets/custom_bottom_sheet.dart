import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;
  const CustomBottomSheet({Key? key, required this.child}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 52,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          const Text(
            'OTHER TRANSCRIPTS',
            style: TextStyle(fontSize: 20, fontFamily: 'Akrobat'),
          ),
          widget.child
        ],
      ),
    );
  }
}
