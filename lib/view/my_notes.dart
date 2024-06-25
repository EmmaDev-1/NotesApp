// lib/view/my_notes.dart
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Utils/Navigation/navegationAnimationRightLeft.dart';
import 'package:note_app/components/drawer.dart';
import 'package:note_app/view/add_note.dart';
import 'package:note_app/view/details_note.dart';
import 'package:note_app/view_model/note_view_model.dart';
import 'package:provider/provider.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({super.key});

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NoteViewModel>(context, listen: false).fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notes',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.035,
            fontFamily: 'QuickSand-Bold',
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
          size: 25,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            crearRuta(context, const AddNotePage()),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        shape: CircleBorder(),
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
        ),
        child: dashBoardContent(),
      ),
    );
  }

  Widget dashBoardContent() {
    return Consumer<NoteViewModel>(
      builder: (context, noteViewModel, child) {
        if (noteViewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return noteViewModel.notes.isEmpty
            ? const Center(child: Text('No notes available'))
            : ReorderableListView.builder(
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final note = noteViewModel.notes.removeAt(oldIndex);
                    noteViewModel.notes.insert(newIndex, note);
                  });
                },
                itemCount: noteViewModel.notes.length,
                itemBuilder: (context, index) {
                  final note = noteViewModel.notes[index];
                  return Padding(
                    key: ValueKey(note.id),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Slidable(
                      key: Key(note.id),
                      startActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        extentRatio: 0.4,
                        children: [
                          SlidableAction(
                            onPressed: note.status == 'Pending'
                                ? (context) => _showTaskDoneConfirmationDialog(
                                    context, note.id)
                                : (context) =>
                                    _showArchiveTaskConfirmationDialog(
                                        context, note.id),
                            backgroundColor: Colors.green,
                            icon: note.status == 'Pending'
                                ? Icons.task_alt_rounded
                                : Icons.archive,
                            label: note.status == 'Pending'
                                ? 'Task Done'
                                : 'Archive Task',
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        extentRatio: 0.4,
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              _showDeleteConfirmationDialog(context, note.id);
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: 'Delete',
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            crearRuta(
                              context,
                              DetailsNotePage(note: note),
                            ),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    color: _getPriorityColor(note.priority),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              note.title,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025,
                                                fontFamily: 'QuickSand-Bold',
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            note.dueDate != null
                                                ? DateFormat('dd/MM/yyyy')
                                                    .format(note.dueDate!)
                                                : 'No date',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018,
                                              fontFamily: 'QuickSand',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        note.description ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018,
                                          fontFamily: 'QuickSand',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
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

  void _showDeleteConfirmationDialog(BuildContext context, String noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('¿You want to remove the task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo sin eliminar
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<NoteViewModel>(context, listen: false)
                    .deleteNote(noteId);
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showTaskDoneConfirmationDialog(BuildContext context, String noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('¿Already finish the task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<NoteViewModel>(context, listen: false)
                    .updateNoteStatus(noteId, 'Done');
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showArchiveTaskConfirmationDialog(BuildContext context, String noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Archive'),
          content: const Text('¿Want to Archive the task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<NoteViewModel>(context, listen: false)
                    .archiveNote(noteId);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}
