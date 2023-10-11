import 'dart:ffi';
import 'package:equatable/equatable.dart';
import '../entry_model.dart';

class ListState extends Equatable {
  const ListState({
   required this.isLoading,
   required this.entries
  });

  final bool isLoading;
  final List<Entry> entries;

  @override
  List<Object> get props =>
      [isLoading, entries];

  ListState copyWith({
    bool? isLoading,
    List<Entry>? entries,
  }) {
    return ListState(
      isLoading: isLoading ?? this.isLoading,
      entries: entries ?? this.entries,
    );
  }

}

