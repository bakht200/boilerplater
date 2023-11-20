import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarInitial());

  bool search = false;

  updateSearchBarStatus(bool value) {
    if (value) {
      search = true;
      emit(SearchBarOpended());
    } else {
      search = false;
      emit(SearchBarClosed());
    }
  }
}
