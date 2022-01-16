import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int secilisayfa = 0;
  bool hover1 = false;
  bool hover2 = false;
  bool hover3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.email),
        title: Center(
          child: Text("Sinav2 Uygulaması"),
        )
      ),
      body: Stack(
        children: [
          Visibility(
            visible: secilisayfa==0?true:false,
            child: Center(
              child: FlutterLogo(size: 200,),
            ),
          ),
          Visibility(
            visible: secilisayfa==1?true:false,
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 350,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 48,
                  itemBuilder: (BuildContext ctx, index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                      ),
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AlertDialog(
                              title: Text("Uçak Bileti"),
                              content: Text((index + 1).toString() + " nolu firma için bilet almak istermisiniz?"),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end ,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(onPressed: (){ Navigator.pop(context); }, child: Text("İptal")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(onPressed: (){ Navigator.pop(context); }, child: Text("Satın al")),
                                  )
                                ],),
                              ],
                            ),
                          ],
                        ));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(width: 100, height: 100 ,child: Image.asset("resimler/TALogo.png")),
                            SizedBox(height: 5,),
                            Text((index + 1).toString() + " nolu firma", style: TextStyle(backgroundColor: Colors.red, color: Colors.white),)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Visibility(
            visible: secilisayfa==2?true:false,
            child: ListView.builder(itemCount: 48, itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3),
                child: ElevatedButton(
                  onPressed: (){
                    showDialog(context: context, builder: (BuildContext context) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AlertDialog(
                          title: Text("Otobüs Bileti"),
                          content: Text((index + 1).toString() + " nolu firma için bilet almak istermisiniz?"),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end ,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(onPressed: (){ Navigator.pop(context); }, child: Text("İptal")),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(onPressed: (){ Navigator.pop(context); }, child: Text("Satın al")),
                                )
                              ],),
                          ],
                        ),
                      ],
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.grey,
                  ),
                  child: Row(
                    children: [
                      Container(width: 75, height: 75 ,child: Image.asset("resimler/kamilkoc.png")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text((index + 1).toString() + " nolu firma", style: TextStyle(fontSize: 16, color: Colors.black),),
                        Text("Uçar gider. Sizi sevdiklerinize götürür.", style: TextStyle(color: Colors.grey, fontSize: 14),)
                      ],)
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    secilisayfa = 0;
                  });
                },
                child: MouseRegion(
                  onEnter: ( details) => setState(() => hover1 = true),
                  onExit: ( details) => setState(() {
                    hover1 = false;
                  }),
                  child: Container(decoration: BoxDecoration(shape: BoxShape.circle, color: hover1?Colors.grey.withOpacity(0.2):Colors.transparent,) ,width: 65, height: 65,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [
                    Icon(Icons.home, color: secilisayfa==0?Colors.blue:Colors.grey,),
                    Text("AnaSayfa", style: TextStyle(color: secilisayfa==0?Colors.blue:Colors.grey, fontSize: 12),)
                  ],),),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    secilisayfa = 1;
                  });
                },
                child: MouseRegion(
                  onEnter: ( details) => setState(() => hover2 = true),
                  onExit: ( details) => setState(() {
                    hover2 = false;
                  }),
                  child: Container(decoration: BoxDecoration(shape: BoxShape.circle, color: hover2?Colors.grey.withOpacity(0.2):Colors.transparent,) ,width: 65, height: 65,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [
                    Icon(Icons.airplanemode_active, color: secilisayfa==1?Colors.blue:Colors.grey,),
                    Text("Uçak", style: TextStyle(color: secilisayfa==1?Colors.blue:Colors.grey, fontSize: 12),)
                  ],),),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    secilisayfa = 2;
                  });
                },
                child: MouseRegion(
                  onEnter: ( details) => setState(() => hover3 = true),
                  onExit: ( details) => setState(() {
                    hover3 = false;
                  }),
                  child: Container(decoration: BoxDecoration(shape: BoxShape.circle, color: hover3?Colors.grey.withOpacity(0.2):Colors.transparent,) ,width: 65, height: 65,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [
                    Icon(Icons.directions_bus, color: secilisayfa==2?Colors.blue:Colors.grey,),
                    Text("Otobüs", style: TextStyle(color: secilisayfa==2?Colors.blue:Colors.grey, fontSize: 12),)
                  ],),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
