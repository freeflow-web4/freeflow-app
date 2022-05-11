import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/pages/wallet/wallet_page.dart';
import 'package:freeflow/layers/presentation/widgets/scaffold_ff/scaffold_ff.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  ScaffoldFreeFlow(
      body: const SafeArea(bottom: false, child: WalletPage()),
    );
  }
}
