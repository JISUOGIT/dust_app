import 'package:dust_app/model/stat_model.dart';
import 'package:dust_app/model/status_model.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/data_utils.dart';

class MainAppBar extends StatelessWidget {


  final String region;
  final StatusModel status;

  // api에서 받아오는 실제 값
  final StatModel stat;

  const MainAppBar({
    required this.region,
    required this.status,
    required this.stat,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    );

    return SliverAppBar(
      backgroundColor: status.primaryColor,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            // kToolbarHeight : toolbar 높이 공간
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  region,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DataUtils.getTimeFromDateTime(dateTime: stat.dataTime),
                  style: ts.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  status.label,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  status.comment,
                  style: ts.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
