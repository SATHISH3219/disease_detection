import 'package:disease_detection/Brain_Tumor/brain_tumor.dart';
import 'package:disease_detection/TuberClosis/tuber_closis.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int inde = 0;
  void indes() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  // List of image paths
  final List<String> imagePaths = [
    "assets/braintumor.png",
    "assets/tuberclosis.jpeg",
    "assets/upload.jpg",
    "assets/upload.jpg",
  ];

  // List of text for each grid item
  final List<String> itemTexts = [
    'Brain Tumor',
    'Tuber Closis',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        title: const Center(
          child: Text(
            "Disease Detection",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: buildScrollableGridView(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: inde,
        onTap: (int Index) {
          inde = Index;
          setState(() {
            if (inde == 0) {
              indes();
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_information), label: "Medicine"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        backgroundColor: Colors.blue,
        selectedFontSize: 15,
        selectedItemColor: Colors.black,
      ),
    );
  }

  Widget buildScrollableGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            navigateToPage(context, index);
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 0, blurRadius: 4),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      imagePaths[index],
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(itemTexts[index]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BrainTumor(
                      itemText: '',
                    )));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TuberClosis(
                      itemText: '',
                    )));
        break;
      default:
        break;
    }
  }
}
