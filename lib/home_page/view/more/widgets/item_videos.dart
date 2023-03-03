import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worldcup_app/common/common.dart';

class ItemVideos extends StatelessWidget {
  const ItemVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            height: 120,
            width: 130,
            color: Colors.red,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.6 - 26,
                child: const TextCustom(
                    text: 'Onthis day -24 Sep 2020: Chelsea sign Mendy',
                    fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
