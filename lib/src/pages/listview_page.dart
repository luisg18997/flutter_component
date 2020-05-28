import 'dart:async';

import 'package:flutter/material.dart';

class ListViewsPage extends StatefulWidget {
  @override
  _ListViewsPageState createState() => _ListViewsPageState();
}

class _ListViewsPageState extends State<ListViewsPage> {

  List<int> _listnumbers = new List();
  int _finishItem =0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agg10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agg10();

        fecthData();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('List view Page'),
       ),
       body: Stack(
         children: <Widget>[
           _createListView(),
           _createLoading(),
         ],
       ),
       
    );
  }

  Widget _createListView(){

    return RefreshIndicator(
      onRefresh:_getPage1,
      child: ListView.builder(
        itemCount: _listnumbers.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index){
          final image = _listnumbers[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$image/500/400.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          );
        },
      ),
    );
  }

  Future<Null> _getPage1()async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listnumbers.clear();
      _finishItem++;
      _agg10();
    });

    return Future.delayed(duration);
  }

  Widget _createLoading() {

    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height:15.0),
        ],
      );
    } else {
      return Container();
    }
  }

  void _agg10(){
    for(var i =1; i< 10; i++){
      _finishItem++;
      _listnumbers.add(_finishItem);
    }

    setState(() {
      
    });
  }

  Future<Null> fecthData()async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds:2);
    return new Timer(duration, responseHttp);
  }


  void responseHttp() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );
    _agg10();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

}