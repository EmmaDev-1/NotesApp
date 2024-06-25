// lib/view/add_note.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/view_model/note_view_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateTime? selectedDate;
  String selectedPriority = 'Low';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int currentPriorityIndex = 0;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                actionButtons(),
                dateAndCarouselSection(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 1,
                  color: const Color.fromARGB(193, 168, 168, 168),
                ),
                titleSection(),
                descriptionSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.cancel_outlined),
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        IconButton(
          onPressed: _saveNote,
          icon: const Icon(Icons.check),
          color: Theme.of(context).colorScheme.inversePrimary,
        )
      ],
    );
  }

  Widget dateAndCarouselSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Text(
                "Limit date: ",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  fontFamily: 'QuickSand',
                ),
              ),
              selectedDate == null
                  ? IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.date_range_outlined),
                    )
                  : TextButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        dateFormat.format(selectedDate!),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontFamily: 'QuickSand',
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    )
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Text(
                "Priority: ",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  fontFamily: 'QuickSand',
                ),
              ),
              Column(
                children: [
                  const Icon(Icons.arrow_drop_up_rounded),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 50.0,
                        viewportFraction: 1,
                        scrollDirection: Axis.vertical,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPriorityIndex = index;
                            selectedPriority = ['Low', 'Medium', 'High'][index];
                          });
                        },
                      ),
                      items: ['Low', 'Medium', 'High'].map((priority) {
                        ['Low', 'Medium', 'High'].indexOf(priority);
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                priority,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: _getPriorityColor(priority),
                                  fontFamily: 'QuickSand',
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down_rounded),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget titleSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: titleController,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 20,
          fontFamily: 'QuickSand-Bold',
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: "Title",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'QuickSand-Bold',
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 185, 185, 185),
          ),
        ),
      ),
    );
  }

  Widget descriptionSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: descriptionController,
        maxLines: 16,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 16,
          fontFamily: 'QuickSand',
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: "Description",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 185, 185, 185),
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _saveNote() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    // Validar que el título y la fecha de vencimiento no estén vacíos
    if (titleController.text.isEmpty || selectedDate == null) {
      _showErrorDialog(context, "You must fill in all fields");
      return;
    }

    final newNote = NoteModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: user.uid,
      title: titleController.text,
      description: descriptionController.text,
      dueDate: selectedDate,
      priority: selectedPriority,
    );

    final noteViewModel = Provider.of<NoteViewModel>(context, listen: false);
    await noteViewModel.addNote(newNote);

    Navigator.pop(context);
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Low':
      default:
        return Colors.green;
    }
  }
}
