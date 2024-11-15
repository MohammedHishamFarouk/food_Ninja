import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/buttons/green_button_widget.dart';
import 'package:food_ninja/core/style/color_manager.dart';
import 'package:food_ninja/modelView/orderCubit/order_cubit.dart';
import 'package:food_ninja/view/screens/infoScreen/product_screen.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    super.key,
    this.addButtons = false,
    required this.image,
    required this.productName,
    required this.hintText,
    this.notificationLayout = false,
    this.price = -20,
    required this.description,
    this.id,
  });

  final bool addButtons;
  final bool notificationLayout;
  final String image;
  final String productName, hintText, description;
  final double price;
  final int? id;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FilledButton(
        onPressed: () => notificationLayout
            ? null
            : Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    foodImage: image,
                    foodName: productName,
                    description: description,
                    productHinText: hintText,
                    price: price,
                    id: id,
                  ),
                ),
              ),
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 100,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: addButtons ? 65 : 80,
                width: addButtons ? 65 : 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth / 1.9,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: screenWidth <= 390 ? 100 : 150),
                        child: Text(
                          productName,
                          style: TextStyle(
                            fontSize: screenWidth <= 390 ? 13 : 14,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth <= 390 ? 100 : 150,
                      ),
                      child: Text(
                        hintText,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: screenWidth <= 390 ? 13 : 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    if (addButtons)
                      Text(
                        r'$' ' $price',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.blendedGreen,
                        ),
                      ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: addButtons ? 8 : 16),
                child: addButtons
                    ? Row(
                        children: [
                          GreenButtonWidget(
                            text: '-',
                            height: 25,
                            width: 25,
                            fontSize: 16,
                            radius: 8,
                            gradientColor: ColorManager.opacGreenGradient,
                            onTap: () {
                              context.read<OrderCubit>().subTotal();
                              context
                                  .read<OrderCubit>()
                                  .removePrice(id!, price);
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: BlocBuilder<OrderCubit, OrderState>(
                              builder: (context, state) {
                                return Text(
                                  '${context.read<OrderCubit>().changeCount(id!)}',
                                );
                              },
                            ),
                          ),
                          GreenButtonWidget(
                            text: '+',
                            height: 25,
                            width: 25,
                            fontSize: 14,
                            radius: 8,
                            onTap: () {
                              context.read<OrderCubit>().addPrice(price, id!);
                              context.read<OrderCubit>().subTotal();
                            },
                          ),
                        ],
                      )
                    : notificationLayout
                        ? null
                        : Text(
                            r'$' '$price',
                            style: TextStyle(
                              fontSize: screenWidth <= 390 ? 20 : 24,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.yellowTint,
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
