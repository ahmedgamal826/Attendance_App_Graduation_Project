import 'package:attendance_app/features/assignments/cubit/cubit_admin/assignment_cubit.dart';
import 'package:attendance_app/features/assignments/presentation/views/widgets/assignment_page_admin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentsPageAdmin extends StatelessWidget {
  const AssignmentsPageAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Admin Assignment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.blueAccent,
          elevation: 1,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.blue.shade50,
                Colors.blue.shade100,
              ],
              stops: const [0.5, 0.8, 1.0],
            ),
          ),
          child: const TestPageAdminBody(),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              _showAddTestDialog(context);
            },
            backgroundColor: Colors.blue.shade400,
            elevation: 4,
            child: const Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ),
      ),
    );
  }

  void _showAddTestDialog(BuildContext context) {
    String newTestName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Add New assignment',
            style: TextStyle(
                color: Colors.blue.shade700, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter assignment name',
              filled: true,
              fillColor: Colors.blue.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
              ),
            ),
            onChanged: (value) {
              newTestName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  Text('Cancel', style: TextStyle(color: Colors.blue.shade700)),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTestName.isNotEmpty) {
                  context.read<TestCubit>().addTest(newTestName);
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
