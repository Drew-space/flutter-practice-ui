import 'package:flutter/material.dart';
import 'package:practice_ui/apps/gadgetapp/utils/gadget_header.dart';
import 'package:practice_ui/apps/gadgetapp/utils/gadget_products.dart';
import 'package:practice_ui/apps/gadgetapp/utils/gadget_search.dart';

class GadgetHomeScreen extends StatelessWidget {
  const GadgetHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: 15, left: 15),

          child: Stack(
            children: [
              Column(
                children: [
                  GadgetHeader(),
                  const SizedBox(height: 20),

                  GadgetSearch(),
                  SizedBox(height: 20),
                  GadgetProducts(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
