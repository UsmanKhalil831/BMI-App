import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  var result = 0.0;
  var category = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI App'),),
      body: SafeArea(child: Center(
        child: Container(width: 400,color: Colors.amber,height: 400,padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('BMI Calculator',style: TextStyle(fontSize: 40),),
              TextField(controller: weightController,
              decoration: const InputDecoration(hintText: 'Enter weight in Kg'),
              keyboardType: TextInputType.number,),
              TextField(controller: feetController,
              decoration: const InputDecoration(hintText: "Enter your height's feet"),
              keyboardType: TextInputType.number,),
              TextField(controller: inchController,
              decoration: const InputDecoration(hintText: "Enter your height's inches"),
              keyboardType: TextInputType.number,),
              const SizedBox(height: 20,),
              ElevatedButton(child: const Text('Calculate'), onPressed: (){
                setState(() {
                  var weight = int.parse(weightController.text.toString());
                  var feet = int.parse(feetController.text.toString());
                  var inch = int.parse(inchController.text.toString());
                  var meter = (feet*0.3048)+(inch*0.025);
                  var bmi = weight/(meter*meter);
                  result = bmi;
                  if(bmi<18.5){
                    category = 'underweight';
                  }
                  else if(bmi>=18.5 && bmi<25){
                    category = 'normal';
                  }
                  else if(bmi>=25 && bmi<30){
                    category = 'overweight';
                  }
                  else{
                    category = 'obese';
                  }
                });
              }),
              const SizedBox(height: 10,),
              Text('BMI = $result'),
              const SizedBox(height:10),
              Text('Category: $category')
            ],
          ),
        ),
      )),
    );
  }
}