import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delivery_item.dart';

class BottamScreen extends StatefulWidget {
  const BottamScreen({super.key});

  @override
  State<BottamScreen> createState() => _BottamScreenState();
}

class _BottamScreenState extends State<BottamScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(30)),
        child: InkWell(
            onTap: () {
              showEditAddressSheet(context);
            },
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
            )));
  }
}

showEditAddressSheet(BuildContext context) {
  final FocusNode snode = FocusNode();
  final FocusNode somnode = FocusNode();
  final TextEditingController scontroller = TextEditingController();
  final TextEditingController somcontroller = TextEditingController();

  bool issFocused = false;
  bool issomFocused = false;
  return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: const Color(0xffFFFFFF),
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Back",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Edit Address",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21, right: 21),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const SizedBox(
                    height: 210,
                  ),
                  Container(
                      height: 193,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/Map.png"))),
                      child: const SizedBox(
                          height: 51,
                          width: 46,
                          child: Image(
                            image: AssetImage(
                              "assets/images/maphome.png",
                            ),
                          ))),
                  Positioned(
                    bottom: 3,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 194,
                        height: 48,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(14),
                            border:
                            Border.all(color: Colors.black, width: 1.5)),
                        child: Center(
                            child: Text(
                              "Pin Location",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Apt / Suite / Floor",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                focusNode: snode,
                controller: scontroller,
                onChanged: (value) {
                  // if (value.isNotEmpty) {
                  //   setState(() {
                  //     issFocused = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     issFocused = false;
                  //   });
                  // }
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xffEFF2F5),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  constraints: const BoxConstraints(maxHeight: 51),
                  filled: true,
                  hintText: 'Type Something Here',
                  hintStyle: GoogleFonts.inter(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffB3BFCB),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.black, width: 1)),
                  suffixIcon: issFocused
                      ? InkWell(
                      onTap: () {
                        scontroller.text = '';
                      },
                      child: const Icon(Icons.cancel))
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Business / Building Name",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                focusNode: somnode,
                controller: somcontroller,
                onChanged: (value) {
                  // if (value.isNotEmpty) {
                  //   setState(() {
                  //     issomFocused = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     issomFocused = false;
                  //   });
                  // }
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xffEFF2F5),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  constraints: const BoxConstraints(maxHeight: 51),
                  filled: true,
                  hintText: 'Type Something Here',
                  hintStyle: GoogleFonts.inter(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffB3BFCB),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(color: Colors.black, width: 1)),
                  suffixIcon: issomFocused
                      ? InkWell(
                      onTap: () {
                        somcontroller.text = '';
                      },
                      child: const Icon(Icons.cancel))
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Delivery details",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: DeliveryItem(
                  text: "Leave at Doorstep",
                  text1: "In-Person Handoff",
                  text2: "Meet the Person"),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                      const MaterialStatePropertyAll(Color(0xff28B996)),
                      minimumSize:
                      const MaterialStatePropertyAll(Size(340, 59))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: GoogleFonts.inter(
                        color: const Color(0xffFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      });
}
