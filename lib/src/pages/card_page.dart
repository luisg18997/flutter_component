import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
          SizedBox(height: 30),
        ]
      ),
    );
  }

  Widget _cardType1(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de  esta Tarjeta'),
            contentPadding: EdgeInsets.all(5),
            subtitle: Text('Aqui estamos con la descripcion de la tarjeta que quiero que ustedes vean para tener una idea de lo que quiero mostrarles'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {},
              )
            ],
          ) 
        ]
      ) ,
    );
  }

  _cardType2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://www.vespa.com/mediaObject/vespa/travel/travel-valle-aosta/01-Cover-Image/cover-image/original/cover-image.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('No tengo idea de que poner'),
          )
        ]
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }
}