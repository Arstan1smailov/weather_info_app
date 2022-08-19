import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final String hint;
  final double width, height;
  final Color color;
  final Function(String) city;

  const BorderBox(
      {super.key,
      required this.hint,
      required this.width,
      required this.height,
      required this.color, required this.city});

  @override
  Widget build(BuildContext context) {
    const Color COLOR_GREY2 = Color(0xFF6D6D6D);
    return SizedBox(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              blurRadius: 6,
              offset: Offset(3, 7), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Row(
            children: [
              Flexible(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: TextField(
                  cursorColor: COLOR_GREY2,
                  onSubmitted: (value){
                    city(value);
                  },
                    decoration: InputDecoration.collapsed(
                      hintText: hint,
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                ),
              )),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.search),
              )
            ],
          ),
        ),
      ),
    );
  }
}
