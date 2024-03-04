import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ModelDataClass {
  String title;
  String description;
  String date;
  String image;

  ModelDataClass(
      {required this.title,
      required this.description,
      required this.date,
      this.image = "assets/images/Group 43.png"});
}

class ToDOList extends StatefulWidget {
  const ToDOList({super.key});

  @override
  State createState() => _ToDoListState();
}

class _ToDoListState extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List colors = [
    const Color.fromARGB(255, 250, 232, 232),
    const Color.fromARGB(255, 230, 236, 255),
    const Color.fromARGB(255, 250, 249, 232),
    const Color.fromARGB(255, 250, 232, 250)
  ];
  List<ModelDataClass> cardList = [
    ModelDataClass(
        title: 'Complete assignment',
        description:
            "Spend 1 hour researching relevant materials for the assignment topic",
        date: 'Feb 11 2024',
        image: "assets/images/Group 43.png"),
    ModelDataClass(
        title: 'Plan vacation:',
        description:
            "Choose destination, book flights, accommodation, create itinerary",
        date: 'Mar 2, 2024',
        image: "assets/images/Group 43.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "To-Do List",
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            backgroundColor: const Color.fromRGBO(0, 139, 148, 1)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getBottomSheet(false);
          },
          backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
            weight: 2,
          ),
        ),
        body: (cardList.isNotEmpty)
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: cardList.length,
                itemBuilder: ((context, index) {
                  return getCard(context, index);
                }))
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/noTask.png",
                      height: 160,
                      width: 160,
                    ),
                    const Text(
                      "   No task found",
                      style: TextStyle(fontSize: 16, letterSpacing: 0.6),
                    )
                  ],
                ),
              ));
  }

  Widget getCard(BuildContext context, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(13),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(5, 15),
                ),
              ]),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1.2,
                        blurRadius: 14,
                      ),
                    ], shape: BoxShape.circle, color: Colors.white),
                    child: Image.asset(cardList[index].image),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ]),
                const SizedBox(
                  width: 13,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    width: 230,
                    child: Text(
                      cardList[index].title,
                      style: GoogleFonts.quicksand(
                          fontSize: 15.5, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 230,
                    child: Text(
                      cardList[index].description,
                      style: GoogleFonts.quicksand(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  )
                ]),
              ]),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: (cardList[index].date ==
                            DateFormat.yMMMd().format(DateTime.now()))
                        ? const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ],
                            color: Color.fromARGB(255, 176, 255, 167),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          )
                        : null,
                    child: Text(
                      cardList[index].date,
                      style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(245, 116, 114, 114),
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      getBottomSheet(true, cardList[index]);
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 29, 142, 144),
                      size: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      cardList.remove(cardList[index]);
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.delete_outline,
                      size: 22.5,
                      color: Color.fromARGB(255, 29, 142, 144),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void getBottomSheet(bool toDoEdit, [ModelDataClass? modelDataClassObj]) {
    if (toDoEdit) {
      titleController.text = modelDataClassObj!
          .title; // Eka ne varify kel ki null nahi payje manaje khali nahi lihale tari chalate
      descriptionController.text = modelDataClassObj.description;
      dateController.text = modelDataClassObj.date;
    } else {
      titleController.clear();
      descriptionController.clear();
      dateController.clear();
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text((!toDoEdit) ? "Create Task" : "Edit Task",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600)),
                const SizedBox(
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    " Title",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(2, 167, 177, 1),
                    ),
                  ),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Description",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(2, 167, 177, 1),
                    ),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 35.0, horizontal: 10.0),
                      labelStyle: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Date",
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(2, 167, 177, 1)),
                  ),
                  TextField(
                    readOnly: true,
                    onTap: showCalender,
                    controller: dateController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          child: const Icon(Icons.calendar_month)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
                    fixedSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    (toDoEdit)
                        ? addTask(toDoEdit, modelDataClassObj)
                        : addTask(toDoEdit);
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void addTask(bool toDoEdit, [ModelDataClass? toDOobj]) {
    String task = titleController.text.trim();
    String description = descriptionController.text.trim();
    String date = dateController.text.trim();

    if (task.isNotEmpty && description.isNotEmpty && date.isNotEmpty) {
      (!toDoEdit)
          ? cardList.add(
              ModelDataClass(
                  title: task,
                  description: description,
                  date: date,
                  image: "assets/images/Group 43.png"),
            )
          : {
              toDOobj!.title = task,
              toDOobj.description = description,
              toDOobj.date = date
            };
      titleController.clear();
      descriptionController.clear();
      dateController.clear();
      Navigator.pop(context);
      setState(() {});
    }
  }

  Future<void> showCalender() async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );

    String formatedDate = DateFormat.yMMMd().format(pickdate!);
    setState(() {
      dateController.text = formatedDate;
    });
  }
}
