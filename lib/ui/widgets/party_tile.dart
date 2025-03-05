import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/ui/widgets/fest_button.dart';

// ignore: must_be_immutable
class PartyTile extends StatelessWidget {
  String title;
  DateTime date;
  Function()? onPressed;
  PartyTile(
      {super.key,
      required this.title,
      required this.date,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Pallete.primaryColor[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: Text(
                  title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                DateFormat('dd/MM/yyyy').format(date),
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FestButton(onPressed: onPressed),
            ],
          )
        ],
      ),
    );
  }
}
