import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/data_repository.dart';
import '../entry_model.dart';
import 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit(this._dataRepository) : super(ListState(isLoading: true, entries: [])) {
    getList();
  }

  final DataRepository _dataRepository;

  void isLoadingChanged(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  void entriesChanged(List<Entry> value) {
    emit(state.copyWith(entries: value));
  }

  Future<void> getList() async {
    var entries = await _dataRepository.fetchEntries();
    entriesChanged(entries as List<Entry>);
  }

}
