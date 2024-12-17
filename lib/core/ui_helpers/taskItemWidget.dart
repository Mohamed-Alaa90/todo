import 'package:flutter/material.dart';
import 'package:todo/core/constants/my_colors.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: mediaQuery.width,
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: MyColor.primerColor,
            ),
            width: 6,
            height: 90,
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Play footBall",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.alarm),
                  const SizedBox(height: 6),
                  Text(
                    "10:30 pm",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColor.primerColor,
              ),
             padding: EdgeInsets.symmetric(horizontal: 15),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
