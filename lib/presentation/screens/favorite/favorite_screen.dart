// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:delalty/presentation/screens/favorite/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/common/components/widgets/centered_circular_progress_indicator.dart';
import 'package:delalty/core/common/components/widgets/product_card/product_card_widget.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/presentation/screens/favorite/cubit/favorite_cubit.dart';

import '../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../core/common/components/widgets/form_fields_icons/search_icon.dart';
import '../../../core/resources/colors_manager.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBarWidget(
          title: AppStrings.favorite.tr(context: context),
          iconColor: AppColors.grey3,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              DefaultTextFormField(
                inputType: TextInputType.text,
                enableColor: AppColors.searchFormFieldBorderColor,
                focusColor: AppColors.searchFormFieldBorderColor,
                textInputAction: TextInputAction.done,
                filledColor: AppColors.searchFormFieldColor,
                hintTxt: AppStrings.search.tr(context: context),
                prefixIcon: const SearchIcon(),
                onChangedFunction: FavoriteCubit.get(context).searchedFavorites,
              ),
              SizedBox(height: 17.h),
              BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if (state is GetFavoritesLoading) {
                    return const Expanded(
                        child: CenteredCircularProgressIndicaotr());
                  }

                  if (state is GetFavoritesFailure) {
                    return Expanded(
                      child: Center(
                        child: SimpleText(state.message,
                            textStyle: TextStyleEnum.montserratMedium,
                            fontSize: 20.sp),
                      ),
                    );
                  }
                  final products = state is GetSearchedFavoritesSuccess
                      ? FavoriteCubit.get(context).searchedProducts
                      : FavoriteCubit.get(context).products;
                  if (products.isEmpty &&
                      state is! GetSearchedFavoritesSuccess) {
                    return const NoFavoriteWidget();
                  }
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 30.h),
                      itemBuilder: (context, i) {
                        return AspectRatio(
                          aspectRatio: 1.7,
                          child: ProductCardWidget(
                            product: products[i],
                            isFavorite: true,
                            onFavoriteIconTap: () => FavoriteCubit.get(context)
                                .toggleFavorite(products[i]),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      itemCount: products.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
