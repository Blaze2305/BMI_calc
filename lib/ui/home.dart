import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'about.dart';

class Home extends StatefulWidget {

  static const routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var weights={
    'Metric':"Kgs",
    'Imperial':"Lbs"
  };
  var heights={
    'Metric':"meters",
    'Imperial':"inches"
  };
  var data={};
  var out={};
  var gender={
    0:"Male",
    1:"Female"
  };
  String dropDropValue = 'Metric';

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List isSelected = <bool>[false,false];
  var radioValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calc"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                  Icons.person,
                color: Colors.black,
                semanticLabel: "My Data",
              ),
              onPressed: ()=>debugPrint('Prev'),
              tooltip: "My Data",
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon:Icon(
              Icons.help_outline,
              color: Colors.black,
              semanticLabel: "About",
            ),
            onPressed: (){
              Navigator.pushNamed(context, About.routeName);
            },
            tooltip: "About",
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Icon
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                        "images/logo.png",
                        height: 128,
                        width: 128
                    ),
                  ),
                ),
                //Age
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.black,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white
                      ),

                      decoration: InputDecoration(

                        hintStyle: TextStyle(
                          color: Colors.white
                        ),

                        fillColor: Colors.white,

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 4.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 4
                          ),
                        ),

                        errorStyle: TextStyle(
                          height: 0,
                          fontSize: 15
                        ),

                          labelText: "Age",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            letterSpacing: 1.5
                          ),

                          border: OutlineInputBorder(
                              gapPadding: 4,
                              borderRadius: BorderRadius.circular(4.2)
                          ),

                      ),
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      validator: (value){
                        if(value.isEmpty){
                          data.remove('age');
                          return "Age is required";
                        }else if(int.tryParse(value)<=0){
                          return "Age cannot be 0 or less";
                        }
                        else{
                          setState(() {
                            data['age']=int.parse(value);
                          });
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                //Weight
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.black,
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white
                      ),

                      decoration: InputDecoration(

                        hintStyle: TextStyle(
                            color: Colors.white
                        ),

                        fillColor: Colors.white,

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 4.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 4
                          ),
                        ),

                        errorStyle: TextStyle(
                          height: 0,
                          fontSize: 15
                        ),

                        labelText: "Weight in ${weights[dropDropValue]}",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            letterSpacing: 1.5
                        ),

                        border: OutlineInputBorder(
                            gapPadding: 4,
                            borderRadius: BorderRadius.circular(4.2)
                        ),

                      ),
                      validator: (value){
                        if(value.isEmpty){
                          data.remove('weight');
                          return "Weight is required";
                        }else if(double.tryParse(value)<=0){
                          return "Weight cannot be 0 or less";
                        }else{
                          setState(() {
                            data['weight']=double.parse(value);
                          });
                          return null;
                        }
                      },
                        keyboardType: TextInputType.number
                    ),
                  ),
                ),
                //height
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.black,
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white
                      ),

                      decoration: InputDecoration(

                        hintStyle: TextStyle(
                            color: Colors.white
                        ),

                        fillColor: Colors.white,

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 4.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 4
                          ),
                        ),

                        errorStyle: TextStyle(
                          height: 0,
                          fontSize: 15
                        ),

                        labelText: "Height in ${heights[dropDropValue]}",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            letterSpacing: 1.5
                        ),

                        border: OutlineInputBorder(
                            gapPadding: 4,
                            borderRadius: BorderRadius.circular(4.2)
                        ),

                      ),
                      validator: (value){
                        if(value.isEmpty){
                          data.remove('height');
                          return "Height is required";
                        }else if(double.tryParse(value)<=0){
                          return "Height cannot be 0 or less";
                        }
                        else{
                          setState(() {
                            data['height']=double.parse(value);
                          });
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                //Gender
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                       Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToggleButtons(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    'images/male.png',
                                    width: 50,
                                    height: 50,
                                  color: Colors.red,
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'images/female.png',
                                  width: 50,
                                  height: 50,
                                  color: Colors.red,
                                ),
                              )
                            ],
                            borderWidth: 18,
                            fillColor: Colors.grey[800],
                            isSelected: isSelected,
                            borderColor: Colors.black,
                            selectedColor: Colors.black,
                            selectedBorderColor: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            onPressed: (index){
                              setState(() {
                                isSelected[index]=!isSelected[index];
                                isSelected[(index+1)%2]=false;
                                if(isSelected[index]){
                                  data['sex']=gender[index];
                                }else if(isSelected[(index+1)%2]){
                                  data['sex']=gender[(index+1)%2];
                                }else{
                                  data.remove('sex');
                                }
                              });
                            },
                          )
                        )
                    ],
                  ),
                ),
                //Submit
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        onPressed: setValues,
                        child: Text(
                            "Submit",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        padding: EdgeInsets.all(6),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }

  setValues() {
    if(_formKey.currentState.validate() && data.keys.contains('sex')){
      debugPrint(data.toString());
      calculateBMI();
      calculateBMR();
      calculateLeanBodyMass();
      debugPrint(out.toString());
    }else{
      var errorList =[];
      ['age','sex','height','weight'].forEach((value){
        if(!data.containsKey(value)){
          errorList.add(value);
        }
      });
      debugPrint(errorList.toString());
      showAlertDialog(context,errorList);
    }
  }

//
//BMI	Weight Status
//Below 18.5	Underweight
//18.5 – 24.9	Normal
//25.0 – 29.9	Overweight
//30.0 and Above	Obese

  calculateBMI(){
      out['BMI']=(data['weight'])/(pow(data['height'],2));
  }

//  LBM (men) = 0.407 * weight [kg] + 0.267 * height [cm] - 19.2
//
//LBM (women) = 0.252 * weight [kg] + 0.473 * height [cm] - 48.3

  calculateLeanBodyMass(){
      if(data['sex']=='Male'){
        out['LBM']=0.407 * data['weight']+0.267*data['height']*100-19.2;
      }else{
        out['LBM']=0.252 * data['weight']+0.473*data['height']*100-48.3;
      }
  }

//  BMR (kcal / day) = 10 * weight (kg) + 6.25 * height (cm) – 5 * age (y) + s (kcal / day),
//
//where s is +5 for males and -161 for females.

  calculateBMR(){
    if(data['sex']=="Male"){
      out["BMR"]=10*data['weight']+6.25*data['height']*100-5*data['age']+5;
    }else{
      out["BMR"]=10*data['weight']+6.25*data['height']*100-5*data['age']-161;
    }
  }


  showAlertDialog(BuildContext context,errors) {
    String msg='Incomplete/wrong fields :';

    errors.forEach((value){
      msg+="\n   -${value[0].toUpperCase()+value.substring(1)}";
    });
    // set up the button
    Widget okButton = Center(
        child:FlatButton(
      child: Text(
          "Go Back",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 20
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
        )
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}



