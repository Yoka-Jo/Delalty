import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  bool isUserSearching = false;
  String searchStr = "";

  void onSearchChange(String search) {
    searchStr = search;
  }

  void manipulateUserIsSearching(bool isSearching) {
    emit(SearchInitial());
    if (!isSearching && searchStr.isNotEmpty) {
      return;
    }
    isUserSearching = isSearching;
    emit(UserIsSearching());
  }
}
