import 'package:flutter/material.dart';

class ShowButton extends StatelessWidget {
  const ShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return oneButton();
  }

  Container oneButton() {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints.expand(),
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Continue >',
            style: TextStyle(fontSize: 25, color: Colors.black),
          )),
    );
  }
}

Container threeButtons() {
  return Container(
    color: Colors.white,
    constraints: BoxConstraints.expand(),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_circle_up,
            size: 30,
          )),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_circle_up,
            size: 30,
          )),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_circle_up,
            size: 30,
          )),
    ]),
  );
}
