import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/data_repository.dart';
import '../bloc/list_cubit.dart';
import 'list_form.dart';

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListCubit(DataRepository()),
      child: ListForm(),
    );
  }
}
