import 'package:flutter/material.dart';

class Tictachome extends StatefulWidget {
  const Tictachome({super.key});

  @override
  State<Tictachome> createState() => _TictachomeState();
}

class _TictachomeState extends State<Tictachome> {
  List<String> l1 = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  var currentplayer = "X";
  var click = 0;

  void drawxo(i) {
    if (l1[i] == " ") {
      setState(() {
        l1[i] = currentplayer;
        currentplayer = currentplayer == "X" ? "O" : "X";
        findwinner(l1[i]);
      });
    }
  }

  void reset1() {
    setState(() {
      l1 = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
      winnerplayer1 = "";
      player1 = 0;
      player2 = 0;
    });
  }

  bool checkmove(i1, i2, i3, sign) {
    if (l1[i1] == sign && l1[i2] == sign && l1[i3] == sign) {
      return true;
    } else {
      return false;
    }
  }

  var winnerplayer = "";
  var winnerplayer1 = "";
  var player1 = 0;
  var player2 = 0;

  void findwinner(currentsign) {
    if (checkmove(0, 1, 2, currentsign) ||
        checkmove(3, 4, 5, currentsign) ||
        checkmove(6, 7, 8, currentsign) ||
        checkmove(0, 3, 6, currentsign) ||
        checkmove(1, 4, 7, currentsign) ||
        checkmove(2, 5, 8, currentsign) ||
        checkmove(0, 4, 8, currentsign) ||
        checkmove(2, 4, 6, currentsign)) {
      print(currentsign);
      print("Won $currentsign");

      setState(() {
        winnerplayer1 = currentsign;

        if (winnerplayer1 == "X") {
          player1 = player1 + 1;
        } else {
          player2 = player2 + 1;
        }
        if (player1 >= 1 || player2 >= 1) {
          winnerDiloguge();
          reset2();
        }
      });
    }
  }

  void reset2() {
    setState(() {
      l1 = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
    });
  }

  void winnerDiloguge() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5.0,
          backgroundColor: Colors.white,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              "Winner is 🎉 $winnerplayer1",
              style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            )),
          ),
        );
      },
    );
  }

  void paint2() {
    Center(
        child: CustomPaint(
      painter: BannerPainter(
          message: "hellow",
          textDirection: TextDirection.rtl,
          location: BannerLocation.topStart,
          layoutDirection: TextDirection.rtl),
    ));
  }



    



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Tic Tac Toe")),
          backgroundColor: const Color.fromARGB(255, 35, 100, 40),
          elevation: 8,
          shadowColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 450,
                color: const Color.fromARGB(255, 55, 176, 59),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Player 1 (X)",
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                fontSize: 20),
                          ),
                          Text(
                            "Player 2 (O)",
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Winner $player1",
                            textScaleFactor: 2,
                          ),
                          Text(
                            "Winner $player2",
                            textScaleFactor: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    // color: Colors.purpleAccent,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromARGB(255, 55, 176, 59),
                          Color.fromARGB(255, 33, 90, 37),
                        ])),
                    height: 350,
                    width: 350,
                    child: GridView.builder(
                        itemCount: l1.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 3,
                                crossAxisSpacing: 3),
                        itemBuilder: (context, index) => Center(
                              child: InkWell(
                                highlightColor: Colors.blue,
                                onTap: () {
                                  drawxo(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 189, 255, 172),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                          style: BorderStyle.solid)),
                                  height: 90,
                                  width: 90,
                                  // color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      l1[index],
                                      // textScaleFactor: 2,
                                      style: const TextStyle(
                                        // color: Colors.black,
                                        fontSize: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(
                            255, 25, 86, 26)), // Change button color
                  ),
                  onPressed: () {
                    // it is a reset funtion to set the value on winner of player x and player  O
                    reset1();

                    paint2();
                    // print("value of $IndexError");
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                        color: Color.fromARGB(255, 184, 202, 184),
                        letterSpacing: 2,
                        fontSize: 16),
                  ),
                ),
              ),
              // if (winnerplayer1 != "")
              // Text(
              //  "won by $winnerplayer1",
              //  textScaleFactor: 2.5,
              //),
              // Text("winner of $winnerplayer1")
            ],
          ),
        ));
  }
}
