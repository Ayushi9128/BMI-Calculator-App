import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var wtcontroller=TextEditingController();
  var ftcontroller=TextEditingController();
  var incontroller=TextEditingController();

  var result="";

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Center(child:Text("BMI APP",style:TextStyle(fontSize:20))),
      ),
      body:Container(
        color:Colors.amber.shade50,
        child:Center(
          child:Container(
          width:300,
       
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [

        Text("BMI",style:TextStyle(fontWeight: FontWeight.w700,fontSize:25)),
        SizedBox(height:11),
        TextField(
          controller:wtcontroller,
          decoration:InputDecoration(
            label:Text("Enter the weight (in kg)"),
            prefixIcon:Icon(Icons.line_weight_outlined)
          ),
          keyboardType:TextInputType.number,
        ),
        SizedBox(height:11),
        TextField(
          controller:ftcontroller,
          decoration:InputDecoration(
            label:Text("Enter your height (in ft)"),
            prefixIcon:Icon(Icons.height_outlined)
          ),
          keyboardType:TextInputType.number
        ),
        SizedBox(height:11),
        TextField(
          controller:incontroller,
          decoration:InputDecoration(
            prefixIcon:Icon(Icons.height_outlined),
            label:Text("Enter your height (in inch)")
          ),
          keyboardType:TextInputType.number
        ),
        SizedBox(height:11),
        Container(
          width:120,
          height:40,
         
          decoration:BoxDecoration(
            color:Colors.amber,
             borderRadius:BorderRadius.circular(19)  
          ),
          child:TextButton(
            onPressed: (){
              
              var wt= wtcontroller.text.toString();
              var ft= ftcontroller.text.toString();
              var inch= incontroller.text.toString();

              if(wt!="" && ft!="" && inch!=""){
                var wtt=int.parse(wt);
                var ftt=int.parse(ft);
                var inchh=int.parse(inch);

                var t_inchh= (ftt*12)+inchh;
                var h= ((t_inchh)*(2.54))/100;
                var bmi= wtt/(h*h);
                var msg="";
                 if (bmi < 18){
                    msg= "Under Weight";
                  } 
                  else if(bmi>=18 && bmi<25 ){
                    msg="Healthy Person";
                  }
                  else if (bmi>25){
                    msg=" Over Weight";
                  }
                setState((){
                 result="Your bmi is: ${bmi.toStringAsFixed(2)} \n\t\t $msg";
                });
               
              }
              else{
                setState((){
                  result="Please fill all the blanks";
                });
              }
            }, 
          child: Text("Calculate",
            style:TextStyle(fontSize:17,color:Colors.black
            )))
        ),
        SizedBox(height:11),
        Text(result,style:TextStyle(fontSize:20))
        
      ],))))
    );
  }
}
