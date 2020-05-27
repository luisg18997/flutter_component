import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name='';
  String _email='';
  String _password = '';
  String _date = ''; 
  String _optionSelected = 'Volar';
  List<String> _powers = ['volar','rayos X', 'Super Aliento', 'Super Fuerza'];
  
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Pages'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInputs(),
          Divider(),
          _createEmail(),
           Divider(),
          _createPassword(),
           Divider(),
          _createDate(context),
           Divider(),
          _createDropdown(),
          Divider(),
          _createPerson()
        ]
      ),
    );
  }

  Widget _createInputs() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _name.length}'),
        hintText:'Person name',
        labelText: 'name',
        helperText: 'Only name',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor){
        setState((){
           _name = valor;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText:'Email address',
        labelText: 'email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) => 
        setState((){
           _email = valor;
        })
      ,
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText:'Password',
        labelText: 'password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) => 
        setState((){
           _password = valor;
        })
      ,
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText:'Birth date',
        labelText: 'Birth date',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      controller: _inputFieldDateController,
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2040),
      locale: Locale('es', 'Spanish')
    );
    if(picked != null){
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _createDropdown() {
  
    return  Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            items: getoptionMenu(),
            value: _optionSelected,
            onChanged: (opt){
              setState(() {
                _optionSelected = opt;
              });
            },
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getoptionMenu() {
    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((power) {
    list.add(
      DropdownMenuItem(
        child: Text(power),
        value: power,
      )
    );
  });

  return list;
}

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('email: $_email'),
      trailing: Text(_optionSelected),
    );
  }

}

