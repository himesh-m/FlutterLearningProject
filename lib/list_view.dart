import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewScreen> {
  Map<String, dynamic> _data = {
    "count": 1425,
    "entries": [
    {
      "API": "AdoptAPet",
      "Description": "Resource to help get pets adopted",
      "Auth": "apiKey",
      "HTTPS": true,
      "Cors": "yes",
      "Link": "https://www.adoptapet.com/public/apis/pet_list.html",
      "Category": "Animals"
    },
    ]
  };

  @override
  void initState() {
    super.initState();
    _getList();
  }

  void _getList() async {
    final response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    final data = json.decode(response.body);
    print("*********"+response.toString());
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: ListView.builder(
        itemCount: _data['entries'].length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data['entries'][index]['API']),
            subtitle: Text(_data['entries'][index]['Description']),
            onTap: () {
              print(_data['entries'][index]['API']);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getList();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

}
