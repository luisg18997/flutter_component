import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
   @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _slider = 100.0;
  bool _blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Slider Page'),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50.0),
         child: Column(
           children: <Widget>[
              _createSlider(),
              _createCheckbox(),
              _createSwitch(),
              Expanded(
               child: _createImage()
              ),
           ],
         ),
       ),
    );
  }

  Widget _createSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: 'tamaño de la imagen',
      // divisions: 20,
      value: _slider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockSlider)? null: (valor) {
        setState(() {
          _slider = valor;
        });
      }
    );
  }

  Widget _createImage() {

    return FadeInImage(
      placeholder: AssetImage('assets/original.gif'),
      image: NetworkImage("http://pluspng.com/img-png/batman-png-batman-png-1404.png"),
      fadeInDuration: Duration(milliseconds: 200),
      width: _slider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {

    /* return Checkbox(
      value: _blockSlider,
      onChanged: (valor){
        setState(() {
          _blockSlider = valor;
        });
      }
    ); */
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
       value: _blockSlider,
      onChanged: (valor){
        setState(() {
          _blockSlider = valor;
        });
      }
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
       value: _blockSlider,
      onChanged: (valor){
        setState(() {
          _blockSlider = valor;
        });
      }
    );
  }
}