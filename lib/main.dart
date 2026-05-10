import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ':Perfume App',
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
           icon: Icon(Icons.menu),
           onPressed: () {}
        ),
        title: Center(
          child: SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
              ),
              filled: true,
              fillColor: Colors.white,
              )
            )
          )
        )
        ),


      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            
          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),      
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]  
            ),
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomNavigationBar(

        currentIndex: _selectedIndex,
        onTap: (index) {
          setState((){
            _selectedIndex = index;
          });
        },
        items: 
        const[ 
          
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Icon(Icons.shopping_cart)),
            label: ""
          ),
          BottomNavigationBarItem(icon: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Icon(Icons.person)),
            label: ""
          )
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey
              ),
      
      )
      )
      
    );
  }
}
