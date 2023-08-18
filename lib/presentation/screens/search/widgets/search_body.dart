part of 'widgets.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SearchFormField(),
                SizedBox(height: 30.h),
                if (cubit.isUserSearching) const SearchResult(),
                if (!cubit.isUserSearching) ...[
                  const SearchLatestResearch(),
                  SizedBox(height: 40.h),
                  const SearchProposed()
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
