import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "GRID and HERO",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperHero = List();

  var karakter = [
    {"nama": "Aquaman", "gambar": "aquaman.jpg"},
    {"nama": "Batman", "gambar": "batman.jpg"},
    {"nama": "Captain", "gambar": "captain.jpg"},
    {"nama": "Catwoman", "gambar": "catwoman.jpg"},
    {"nama": "Flash", "gambar": "flash.jpg"},
    {"nama": "Hulk", "gambar": "hulk.jpg"},
    {"nama": "Ironman", "gambar": "ironman.jpg"},
    {"nama": "Spiderman", "gambar": "spiderman.jpg"},
    {"nama": "Superman", "gambar": "superman.jpg"},
    {"nama": "Venom", "gambar": "venom.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambarnya = karakternya["gambar"];
      daftarSuperHero.add(Container(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: karakternya["nama"],
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Detail(
                                  nama: karakternya["nama"],
                                  gambar: karakternya["gambar"],
                                ),
                          )),
                      child: Image.asset(
                        "img/$gambarnya",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Image.asset("img/$gambarnya", fit: BoxFit.cover,),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  karakternya["nama"],
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          )));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SuperHero",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarSuperHero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 240,
            child: 
            Hero(
              tag: nama,
              child: Material(
                child: InkWell(
                  child: Image.asset("img/$gambar", fit: BoxFit.cover,),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
