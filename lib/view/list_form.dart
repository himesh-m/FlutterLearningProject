import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/data_repository.dart';
import 'package:flutter_projects/entry_model.dart';
import '../bloc/list_cubit.dart';
import '../bloc/list_state.dart';

class ListForm extends StatefulWidget {

  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListForm> {
  // Map<String, dynamic> _data = {
  //   "count": 1425,
  //   "entries": [
  //   {
  //     "API": "AdoptAPet",
  //     "Description": "Resource to help get pets adopted",
  //     "Auth": "apiKey",
  //     "HTTPS": true,
  //     "Cors": "yes",
  //     "Link": "https://www.adoptapet.com/public/apis/pet_list.html",
  //     "Category": "Animals"
  //   },
  //   ]
  // };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(builder: (context, state)
    {
      return StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              appBar: AppBar(
                title: Text('List'),
              ),
              body: ListView.builder(
                itemCount: state.entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.entries[index].category),
                    subtitle: Text(state.entries[index].description),
                    onTap: () {
                      print(state.entries[index].api);
                    },
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.read<ListCubit>().getList();
                },
                child: Icon(Icons.refresh),
              ),
            );
          }
      );
    }
    );
  }

}
