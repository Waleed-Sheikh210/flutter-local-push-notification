import 'package:flutter/material.dart';
import 'package:push_notification/notification.dart';
import 'package:timezone/data/latest.dart' as tz;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:const PushNotification()
    );
  }
}

class PushNotification extends StatefulWidget {
  const PushNotification({ Key? key }) : super(key: key);

  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {

  @override
  void initState() {
    super.initState();
    
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Text("Local Notification!!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
         const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: (){
                NotificationService().showNotification(
                  0,
                  "title",
                  "body",
                  5);
              },
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.99,
                height: MediaQuery.of(context).size.height*0.08,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green,width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                  Icon(Icons.notifications),
                  SizedBox(width: 20,),
                  Text("Simple Notification")
                ],),
              ),
            ),
          ),
           const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: (){},
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.99,
                height: MediaQuery.of(context).size.height*0.08,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green,width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                  Icon(Icons.notifications_active_sharp),
                  SizedBox(width: 20,),
                  Text("Schedule Notification")
                ],),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: (){},
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width*0.99,
                height: MediaQuery.of(context).size.height*0.08,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green,width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                  Icon(Icons.highlight_remove_outlined),
                  SizedBox(width: 20,),
                  Text("Remove Notification")
                ],),
              ),
            ),
          ),
        ],
      ),
    );  
  }
}