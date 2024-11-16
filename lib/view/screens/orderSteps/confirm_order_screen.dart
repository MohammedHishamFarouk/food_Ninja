import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/background_angled_pattern.dart';
import 'package:food_ninja/core/components/buttons/custom_back_button.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/view/screens/orderSteps/components/bottom_sheet_widget.dart';
import 'package:food_ninja/view/screens/orderSteps/components/order_button_widget.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGroundAngledPattern(),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 38, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomBackButton(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                  child: Text(
                    'Confirm Order',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                OrderButtonWidget(
                  editMode: true,
                  text: AssetFolder.defaultLocation,
                  hintTitle: 'Deliver To',
                  image: AssetFolder.locationImage,
                  imageScale: 0.95,
                ),
                OrderButtonWidget(
                  editMode: true,
                  text: '2121 6352 8465 ****',
                  hintTitle: 'Payment Method',
                  image: AssetFolder.paypal,
                  imageScale: 1.5,
                ),
              ],
            ),
          ),
          BottomSheetWidget(
            routeName: 'start',
          ),
        ],
      ),
    );
  }
}
