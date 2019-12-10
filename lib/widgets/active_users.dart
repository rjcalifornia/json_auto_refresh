import 'package:flutter/material.dart';
import 'package:json_auto_refresh/api/active_users_api.dart';
import 'package:json_auto_refresh/models/users.dart';
import 'dart:async';
import 'dart:convert';

class ActiveUsersList extends StatefulWidget {
  @override
  createState() => _ActiveUsersListState();
}

class _ActiveUsersListState extends State {
  var activeUsers = new List<UsersModel>();
  Timer timer;
  int counter = 0;

  Future _getFromApi() async {
    UsersList.getActiveUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        activeUsers = list.map((model) => UsersModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getFromApi();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => _getFromApi());

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Active users list'),
        ),
        body: Container(
          
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 28),
              child: new Container(
                  width: 350,
                  child: Column(children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: activeUsers.length,
                        itemBuilder: (BuildContext context, i) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 5),
                                Text(
                                  "id: ${activeUsers[i].id}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Name: ${activeUsers[i].name}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Username: ${activeUsers[i].userName}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 15),
                              ]);
                        },
                      ),
                    ),
                  ])),
            ),
          ),
      
      ),
    );
  }
}
