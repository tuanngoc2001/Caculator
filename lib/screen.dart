import 'package:caculator/asstes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double kq = 0.0, numberone = 0.0, numbertwo = 0.0;
  late String pheptinh = "";
  bool checkcham = false;
  // late String cham="";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: size.height * 1 / 3,
            width: double.infinity,
            child: Text(
              kq.toString(),
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          nutbam(size, "AC", "?", "%", "/", true),
          nutbam(size, "7", "8", "9", "X", false),
          nutbam(size, "4", "5", "6", "-", false),
          nutbam(size, "1", "2", "3", "+", false),
          hangcuoi(size, "0", ".", "="),
        ],
      ),
    );
  }

  Widget hangcuoi(
      Size size, String titleone, String titletwo, String titlethree) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 20),
      child: Row(
        children: [
          Container(
            height: 60,
            margin: const EdgeInsets.only(left: 10),
            width: size.width * 2 / 5 + 15,
            decoration: BoxDecoration(
                color: colornumber, borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Text(
              titleone,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: size.width * 1 / 5,
              height: 60,
              decoration: BoxDecoration(
                  color: colornumber, borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                titletwo,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
            onTap: () {
              setState(() {
                checkcham = true;
              });
            },
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: size.width * 1 / 5,
              height: 60,
              decoration: BoxDecoration(
                  color: colortool, borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                titlethree,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
            onTap: () {
              setState(() {
                switch (pheptinh) {
                  case "+":
                    kq = numberone + numbertwo;
                    break;
                  case "-":
                    kq = numberone - numbertwo;
                    break;
                  case "X":
                    kq = numberone * numbertwo;
                    break;
                  case "/":
                    kq = numberone / numbertwo;
                    break;
                  case "%":
                    if (numbertwo != 0) {
                      kq = numberone % numbertwo;
                      numberone = 0.0;
                      numbertwo = 0.0;
                      pheptinh = "";
                    } else {
                      Fluttertoast.showToast(msg: "Mẫu số là 0.0");
                    }

                    break;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  bool Checknumber(String title) {
    for (int i = 0; i <= 9; i++) if (title == i.toString()) return true;
    return false;
  }

  void Check() {
    switch (pheptinh) {
      case "AC":
        numberone = 0.0;
        numbertwo = 0.0;
        checkcham = false;
        pheptinh = "";
        kq = 0.0;
        break;
      case "?": //cái này mình chưa rõ là gì nên bỏ qua nhé.
        break;
    }
  }

  Widget nutbam(Size size, String titleone, String titletwo, String titlethree,
      String titlefour, bool checkcolor) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 20),
      child: Row(
        children: [
          GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: size.width * 1 / 5,
                height: 60,
                child: Center(
                  child: Text(
                    titleone,
                    style: TextStyle(
                        color: (checkcolor ? tool : word),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: (checkcolor ? colorAC : colornumber),
                ),
              ),
              onTap: () {
                setState(() {
                  Checknumber(titleone)
                      ? (pheptinh == ""
                          ? (checkcham
                              ? kq = numberone =
                                  numberone + double.parse(titleone) / 10
                              : kq = numberone =
                                  numberone * 10 + double.parse(titleone))
                          : (checkcham
                              ? kq = numbertwo =
                                  numbertwo + double.parse(titleone) / 10
                              : kq = numbertwo =
                                  numbertwo * 10 + double.parse(titleone)))
                      : (pheptinh = titleone);
                  print(checkcham);
                  checkcham = false;

                  Check();
                  print(pheptinh);
                  print("so 1:" + numberone.toString());
                  print("so 2:" + numbertwo.toString());
                });
              }),
          GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: size.width * 1 / 5,
                height: 60,
                child: Center(
                  child: Text(
                    titletwo,
                    style: TextStyle(
                        color: (checkcolor ? tool : word),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: (checkcolor ? colorAC : colornumber),
                ),
              ),
              onTap: () {
                setState(() {
                  Checknumber(titletwo)
                      ? (pheptinh == ""
                          ? (checkcham
                              ? kq = numberone =
                                  numberone + double.parse(titletwo) / 10
                              : kq = numberone =
                                  numberone * 10 + double.parse(titletwo))
                          : (checkcham
                              ? kq = numbertwo =
                                  numbertwo + double.parse(titletwo) / 10
                              : kq = numbertwo =
                                  numbertwo * 10 + double.parse(titletwo)))
                      : (pheptinh = titletwo);
                  print(checkcham);
                  checkcham = false;
                  Check();
                  print(checkcham);
                  print(pheptinh);
                  print("so 1:" + numberone.toString());
                  print("so 2:" + numbertwo.toString());
                });
              }),
          GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: size.width * 1 / 5,
                height: 60,
                child: Center(
                  child: Text(
                    titlethree,
                    style: TextStyle(
                        color: (checkcolor ? tool : word),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: (checkcolor ? colorAC : colornumber),
                ),
              ),
              onTap: () {
                setState(() {
                  Checknumber(titlethree)
                      ? (pheptinh == ""
                          ? (checkcham
                              ? kq = numberone =
                                  numberone + double.parse(titlethree) / 10
                              : kq = numberone =
                                  numberone * 10 + double.parse(titlethree))
                          : (checkcham
                              ? kq = numbertwo =
                                  numbertwo + double.parse(titlethree) / 10
                              : kq = numbertwo =
                                  numbertwo * 10 + double.parse(titlethree)))
                      : (pheptinh = titlethree);
                  print(checkcham);
                  checkcham = false;

                  Check();
                  // print(checkcham);
                  print(pheptinh);
                  print("so 1:" + numberone.toString());
                  print("so 2:" + numbertwo.toString());
                });
              }),
          GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: size.width * 1 / 5,
                height: 60,
                child: Center(
                  child: Text(
                    titlefour,
                    style: TextStyle(
                        color: word, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: colortool,
                ),
              ),
              onTap: () {
                setState(() {
                  Checknumber(titlefour)
                      ? (pheptinh == ""
                          ? (checkcham
                              ? kq = numberone =
                                  numberone + double.parse(titlefour) / 10
                              : kq = numberone =
                                  numberone * 10 + double.parse(titlefour))
                          : (checkcham
                              ? kq = numbertwo =
                                  numbertwo + double.parse(titlefour) / 10
                              : kq = numbertwo =
                                  numbertwo * 10 + double.parse(titlefour)))
                      : (pheptinh = titlefour);
                  print(checkcham);
                  checkcham = false;
                  Check();
                  print(pheptinh);
                  print("so 1:" + numberone.toString());
                  print("so 2:" + numbertwo.toString());
                });
              }),
        ],
      ),
    );
  }
}
