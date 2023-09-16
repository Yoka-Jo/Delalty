import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/theme/font_size.dart';
import '../../my_text.dart';
import '../liquid_pull_refresh.dart';

class GettingItemsError extends StatelessWidget {
  final dynamic onRefresh;
  final List<dynamic>? params;
  final Color? refreshBg;
  final String error;
  const GettingItemsError({
    Key? key,
    required this.onRefresh,
    required this.error,
    this.params,
    this.refreshBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return LiquidPullRefresh(
        onRefresh: onRefresh,
        params: params,
        refreshBg: refreshBg,
        child: CupertinoScrollbar(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      title: error,
                      color: Colors.black,
                      size: FontSize.large,
                    ),
                    const SizedBox(height: 20.0),
                    MyText(
                      title: AppStrings.pullDownToRefresh.tr(context: context),
                      color: Colors.black,
                      size: FontSize.large,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
