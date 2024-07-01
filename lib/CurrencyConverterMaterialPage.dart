

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// createState Method
// The createState method is called when a StatefulWidget is created. It must return an instance of a class that extends State<YourWidget>.
// The purpose of this method is to associate a State object with the StatefulWidget.
// The Role of the State Object
// The State object holds the mutable state and the build method, which returns the widget tree that this stateful widget represents.
// Whenever the state changes, the build method is called again to rebuild the widget tree with the new state.
// Why Return a State Object Instead of a Widget?
// The createState method should return a State object because the state object manages the state for the widget and provides the build method to construct the widget.
// Returning a widget directly from createState would not work because it bypasses the state management that State provides.
//

class Currency extends StatefulWidget{ // These classes are mutable!
  const Currency({super.key});
  @override
  State<Currency> createState() => _CurrencyConverterPageState();
}



class _CurrencyConverterPageState extends State<Currency> {
  // why am i keeping it private? its because it should not be accessible
  //by other files and should only be extended to createState in gratefullest vala class
  String str = "";
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  // If we want something to be processed before the build function is called we use
  // void initState

  @override
  void dispose()
  {
    textEditingController.dispose(); // To avoid memory leaks !
    super.dispose();
  }


  // Your build function should be as less expensive as it can be as
  // it can be called multiple times throughout the program so make it
  // less expensive by not including extra variables or controller init
  // use them under class as it is mutable now being stateful
  // do not put any asynchronous task in it

  // if we are not able to load the build function in the given time frame it
  // causes frame drops and lag

  @override
  Widget build(BuildContext context) {
    const  border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        borderSide : BorderSide(
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        )
    );
    return  Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Currency Converter'),
          elevation: 0,
        ),
        body:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Icon(
                 Icons.currency_rupee,
                   size: 40,
                 ),
                 Flexible(

                     child: Text(result !=0 ? result.toStringAsFixed(2):result.toStringAsFixed(0), style :  const TextStyle(fontSize: 50, fontWeight: FontWeight.bold))),
               ],

             ),
              Padding(
                padding:const  EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController ,
                  style: const TextStyle(
                      color: Colors.black
                  ),
                  decoration: const InputDecoration(
                    // label: Text(
                    //   'Please Enter the Amount in USD',style: TextStyle(color: Colors.white),
                    // ) // either use this
                    // labelText: 'Please Enter the Amount in USD',
                    hintText: 'Please Enter the Amount in USD',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),

                  // focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              // TextButton(onPressed: (){}, child:Text("Click me ") ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(onPressed: (){
                  // if(kDebugMode)
                  //   {
                  //     print(textEditingController);
                  //   }
                  // result = double.parse(textEditingController.text)*81; // Instead of doing this do this
                  setState(() { //Notify the framework that the internal state of this object has changed.
                    result = double.parse(textEditingController.text)*83.36;
                  });
                  // print(result);
                },
                  // style: ButtonStyle(
                  //     backgroundColor:MaterialStateProperty.all(Colors.black),
                  //     foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  //     minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50))), // Instead of doing all this
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Convert"),
                ),
              ),

            ],
          ),
        ));
  }

}








