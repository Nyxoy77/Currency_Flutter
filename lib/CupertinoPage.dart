import 'package:flutter/cupertino.dart';

class CupertinoPageDart extends StatefulWidget {
  const CupertinoPageDart({super.key});

  @override
  State<CupertinoPageDart> createState() => _CupertinoPageDartState();
}

class _CupertinoPageDartState extends State<CupertinoPageDart> {

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  CupertinoPageScaffold(
        backgroundColor: CupertinoColors.inactiveGray,
        navigationBar: const CupertinoNavigationBar(
          middle:  Text('Currency Converter '),
        ),
        child :  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.money_dollar_circle,
                    size: 40,
                  ),
                  Flexible(

                      child: Text(result !=0 ? result.toStringAsFixed(2):result.toStringAsFixed(0), style :  const TextStyle(fontSize: 50, fontWeight: FontWeight.bold))),
                ],

              ),
              Padding(
                padding:const  EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  controller: textEditingController ,
                  style: const TextStyle(
                      color: CupertinoColors.black,
                  ),
                  decoration:  BoxDecoration(
                   borderRadius:  const BorderRadius.all(Radius.circular(40)),
                    border: Border.all(

                      color: CupertinoColors.extraLightBackgroundGray,
                      style: BorderStyle.solid,
                      width: 2.0,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    // label: Text(
                    //   'Please Enter the Amount in USD',style: TextStyle(color: Colors.white),
                    // ) // either use this
                    // labelText: 'Please Enter the Amount in USD',
                  ),
                  placeholder: 'Enter the amount in USD',
                  prefix: const Icon(CupertinoIcons.money_dollar_circle),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),

                  // focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              // TextButton(onPressed: (){}, child:Text("Click me ") ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(onPressed: (){

                  setState(() { //Notify the framework that the internal state of this object has changed.
                    result = double.parse(textEditingController.text)*83.36;
                  }) ;

                },
                    child: const Text("Convert")
                ),
              ),

            ],
          ),
        ));
  }
}
