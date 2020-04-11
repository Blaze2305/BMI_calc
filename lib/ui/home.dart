import 'package:flutter/material.dart';

class Home extends StatefulWidget {
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
        leading: AppBar(
          backgroundColor: Colors.blue[300],
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.help_outline,
                color: Colors.black,
              ),
              onPressed: ()=>debugPrint("ASDASd"),
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon:Icon(
                Icons.settings,
                color: Colors.black,
                semanticLabel: "Settings",
              ),
              onPressed: ()=>debugPrint("Button Pressed"),
              tooltip: "Settings",
            ),
          )
        ],
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

                      validator: (value){
                        if(value.isEmpty){
                          data.remove('age');
                          return "Age is required";
                        }else if(int.tryParse(value)<=0){
                          return "Age cannot be 0 or less";
                        }
                        else{
                          setState(() {
                            data['age']=value;
                          });
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
               //Unit
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Units :  ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 22,
                              color: Colors.white
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Theme(
                            data: ThemeData(
                              canvasColor: Colors.black
                            ),
                            child:DropdownButton<String>(
                            value: dropDropValue,
                            iconSize: 24,
                            elevation: 10,
                            style: TextStyle(
                              color: Colors.white
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            icon: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                            ),
                            items: [
                              DropdownMenuItem<String>(
                                value: "Metric",
                                child: Text(
                                  "Metric",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20
                                  ),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "Imperial",
                                child: Container(
                                  child: Text(
                                    "Imperial",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                            onChanged: (value){
                              setState(() {
                                dropDropValue=value;
                              });
                            },
                          ),
                          )
                        ),
                      ],
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
                            data['weight']=value;
                          });
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
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
                            data['height']=value;
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
                        onPressed: calculateBmi,
                        child: Text(
                            "Submit",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                            "FIRST SCREEN"
                        ),
                        FlatButton(
                          child: Text(
                              "Go to second screen"
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/alert');
                          },
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],
      )
    );
  }

  calculateBmi() {
    if(_formKey.currentState.validate() && data.keys.contains('sex')){
      debugPrint(data.toString());
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

  showAlertDialog(BuildContext context,errors) {
    String mesg='The incomplete/wrong fields are:';

    errors.forEach((value){
      mesg+="\n   -${value[0].toUpperCase()+value.substring(1)}";
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
      content: Text(mesg),
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



class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
            Navigator.of(context).pop();
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

