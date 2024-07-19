import 'package:flutter/material.dart';
import 'package:food_app/meal_screen/view/meal_full_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

import '../../home_screen/model/food_model.dart';

Widget buildSigleItem(BuildContext context, FoodModel item) {
  return Column(
    children: [
      SizedBox(
        width: 390,
        height: 99,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 110,
                          ),
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MealFullScreen(),
                                  ),
                                );
                              },
                              child: Icon(Remix.arrow_right_s_line),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$${item.price + 26.07}",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "\$${item.price}",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  color: const Color(0xff28B996),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const Divider(),
    ],
  );
}
