import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/core/components/buttons/product_button.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/model/products_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  final List<double> cartProductsPrices = [];
  final Set<Widget> cartProducts = {
    const ProductButton(
      image: AssetFolder.soup,
      productName: 'soup',
      hintText: 'asjkfasjfm',
      price: 27,
      description: 'mkasfnajkfnaf',
      id: 100000,
    )
  };
  final List<int> cartProductsId = [];
  final List<int> cartProductCount = [];

  void addToCart(ProductsModel productsModel) {
    if (!cartProductsId.contains(productsModel.id)) {
      cartProducts.add(
        ProductButton(
          image: productsModel.foodImage.first,
          productName: productsModel.title,
          hintText: productsModel.hintText,
          price: productsModel.price,
          description: productsModel.description,
          addButtons: true,
          clickable: false,
          id: productsModel.id,
        ),
      );
    } else {
      cartProductsPrices.remove(productsModel.price);
      cartProductsId.remove(productsModel.id);
    }
    emit(AddToCartSuccess());
  }

  void addPrice(double price, int id) {
    cartProductsPrices.add(price);
    cartProductsId.add(id);
    emit(ChangeCountState());
  }

  int changeCount(int id) {
    int count = 0;
    for (var i in cartProductsId) {
      if (i == id) {
        count++;
      }
    }
    return count;
  }

  void removePrice(int id, double price) {
    if (changeCount(id) != 1) {
      cartProductsId.remove(id);
      cartProductsPrices.remove(price);
    }
    emit(AddToCartSuccess());
  }

  num subTotal() {
    return cartProductsPrices.fold(0, (p, c) => p + c);
  }
}
