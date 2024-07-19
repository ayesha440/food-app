
import 'package:flutter/material.dart';
import 'package:food_app/resturant_screen/widgets/single_item.dart';

import '../../home_screen/model/food_model.dart';

Widget buildItemList(BuildContext context, List<FoodModel> categories) {
  return Column(
    children: categories.map((item) => buildSigleItem(context, item)).toList(),
  );
}
