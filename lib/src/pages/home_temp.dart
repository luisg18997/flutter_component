import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ["uno", "dos", "tres", "cuatro", "cinco"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Components Temp'),
      ),
      body: ListView(
        // children: _createItems(),
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItems(){

    List<Widget> items = new List<Widget>();

    for(String opt in options){

      final tempWidget = ListTile(
        title: Text(opt)
      );

      items..add(tempWidget)
           ..add(Divider());

    }

    return items;
  }

  List<Widget> _createItemsShort(){

    return options.map((item) => 
      Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Hello'),
            leading: Icon(Icons.check),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      )
    ).toList();

  }

}