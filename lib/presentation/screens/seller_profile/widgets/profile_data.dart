// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sellerCubit = SellerProfileCubit.get(context);
    final createChatCubit = CreateChatCubit.get(context);
    final relationshipCubit = RelationshipCubit.get(context);
    final userId = sellerCubit.user!.id;
    return BlocBuilder<SocketCubit, SocketState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: 25.h),
            Align(
              alignment: Alignment.centerLeft,
              child: SimpleText(
                sellerCubit.user!.name,
                textStyle: TextStyleEnum.poppinsMedium,
                fontSize: 18.sp,
              ),
            ),
            // SizedBox(height: 8.h),
            // const UserRating(rating: 5),
            // SizedBox(height: 10.h),
            // SimpleText(
            //   'Member since 2020',
            //   textStyle: TextStyleEnum.poppinsRegular,
            //   fontSize: 13.sp,
            //   color: AppColors.grey3,
            // ),
            SizedBox(height: 40.h),
            if (SocketCubit.get(context).isFriend(userId))
              MyElevatedButton(
                title: AppStrings.chat.tr(context: context),
                icon: ImageAssets.message,
                onPressed: () {
                  createChatCubit.createChat(
                    CreateChatTypes.DIRECT,
                    context,
                    participantId: userId,
                  );
                },
              )
            else if (SocketCubit.get(context).hasSentFriendRequest(userId))
              MyElevatedButton(
                title: AppStrings.removeFriendRequest.tr(context: context),
                backgroundColor: Colors.blue,
                onPressed: () {
                  relationshipCubit.removeRelationship(userId);
                },
              )
            else if (!SocketCubit.get(context).isFriend(userId))
              MyElevatedButton(
                title: AppStrings.sendFriedRequest.tr(context: context),
                backgroundColor: Colors.blue,
                onPressed: () {
                  relationshipCubit.addFriend(userId);
                },
              )
          ],
        );
      },
    );
  }
}
