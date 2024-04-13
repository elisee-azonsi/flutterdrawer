import 'package:drawer/home_view.dart';
import 'package:drawer/menu_item.dart';
import 'package:drawer/real_view.dart';
import 'package:flutter/material.dart';

class AppController extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<AppController> {
  int index = 0;
  List<MenuItem> items = [
    MenuItem(name: "Accueil", body:HomeView()),
    MenuItem(name: "Realisations", body: RealView())
  ];
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Mon Jardin idéal",
            style:TextStyle(
              color: Colors.white
            )
        )
        ),
        drawer:  Drawer(
          child: ListView.builder(
            itemCount: items.length + 1,
              itemBuilder: (context, index) {
                return(index == 0)
                    ? drawerHeader()
                    :tileFromIndex(index);
              }),
        ),
        body: items[index].body,

      );
  }

  ListTile tileFromIndex(int index) {
    final int newIndex = index -1;
    final MenuItem item = items[newIndex];
    final String name = item.name;
    return ListTile(title: Text(name),
    onTap: () {
      setState(() {
      this.index = newIndex;
      Navigator.pop(context);
      });
      
    },);
  }

  DrawerHeader drawerHeader() {
    return DrawerHeader(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.pool),
              Text("data")
            ],
          ) ,
        ));
  }
}

