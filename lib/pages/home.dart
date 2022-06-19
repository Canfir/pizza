import 'package:flutter/material.dart';
import 'package:pizza/pages/Pizza.dart';

List name = [];
List price = [];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    super.initState();
    name.add('Original');
    price.add('8');
    name.add('Buffalo');
    price.add('10');
    name.add('San Marzano');
    price.add('6');
    name.add('Pepperoni');
    price.add('11');
    name.add('Mexican');
    price.add('13');

  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {


    await Navigator.push(context, MaterialPageRoute(builder: (context) => AddPizza()));


    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pizza Market',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            color: Colors.redAccent,
            onPressed: () {
              setState((){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => AddPizza()));
                _awaitReturnValueFromSecondScreen(context);
              });
            },
          ),
        ],
      ),
      body:
          ListView.builder(
          itemCount: name.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: 1000,
                height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                child: Row(
                  children:[Image(image: AssetImage('images/1.png')),
                  Text('    '+name[index])])),
                Text('  \$'+price[index]+'      ',style: TextStyle(color: Colors.redAccent))
                  ]
                ),
                //ListTile(title: Text(name[index]));
            );
          }
      ),
    )
    );
  }
}

class AddPizza extends StatefulWidget {
  const AddPizza({Key? key}) : super(key: key);

  @override
  State<AddPizza> createState() => _AddPizza();
}

class _AddPizza extends State<AddPizza> {

  String ?namePizza;
  String ?pricePizza;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add pizza',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          color: Colors.redAccent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
      Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              child: Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/1.png')),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text('Name'),
                        Container(
                            alignment: Alignment.center,
                            width: 150.0,
                            child: TextField(onChanged: (String value) {
                              namePizza = value;
                            })
                        ),
                        Text('Price'),
                        Container(
                            alignment: Alignment.center,
                            width: 150.0,
                            child: TextField(onChanged: (String value) {
                              pricePizza = value;
                            })
                        )
                      ],
                    ),
                  )
                ],

              ),
            ),
            RaisedButton(
                color: Colors.redAccent,
                onPressed: () {
              setState((){
                name.add(namePizza);
                price.add(pricePizza);
                Navigator.pop(context);
              });
            },child: Text('Save',style: TextStyle(color: Colors.white))
            )
          ]

      ))


    );
  }
}