
import 'package:flutter/material.dart';
import 'CupertinoPage.dart';
import 'CurrencyConverterMaterialPage.dart';
import 'package:flutter/cupertino.dart';

void main(){
  runApp(const CupertinoApp1()); // Const makes it such that it wont need to be compiled again and
                         // is not to be reconstructed and it wont change through the lifetime
                         // Thus create one copy of it and reference it back don't create new one
}

class Myapp extends StatelessWidget{  // state change nahi hoga!
  const Myapp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // This gives us the playground for everything
      //including navigation and stuff
      home:  Currency() ,

    );
  }
}
class CupertinoApp1 extends StatelessWidget {
  const CupertinoApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home : CupertinoPageDart(),
    );
  }
}
