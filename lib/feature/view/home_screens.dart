import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_one/core/app_colors.dart';
import 'package:task_one/core/app_images.dart';
import 'package:task_one/core/app_string.dart';
import 'package:task_one/core/app_textstyle.dart';
import 'package:task_one/feature/cubit/student_cubit.dart';
import 'package:task_one/feature/cubit/student_state.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(IconImages.backbuttonicons),
        ),
        title: Text(STUDENTS, style: headingTitle),
      ),

      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          final students = state.students;

          return students.isEmpty
              ? Center(child: Text(NOSTUDENTS, style: TextStyle(fontSize: 18)))
              : ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
// swip delela
                    return Dismissible(
                      key: Key(student.id),
                      direction: DismissDirection.endToStart,

                      background: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SvgPicture.asset(IconImages.trashicon),
                      ),

                      onDismissed: (_) {
                        context.read<StudentCubit>().removeStudent(index);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${student.name} deleted")),
                        );
                      },
// card for infromations
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                student.image != null &&
                                    student.image!.isNotEmpty
                                ? AssetImage(student.image!)
                                : null,
                            child:
                                (student.image == null ||
                                    student.image!.isEmpty)
                                ? Text(
                                    student.name
                                        .split(" ")
                                        .map((e) => e[0])
                                        .take(2)
                                        .join(),
                                  )
                                : null,
                          ),

                          title: Text(student.name, style: nameStudents),
                          subtitle: Text("ID: ${student.id}", style: textTitle),

                          trailing: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(IconImages.irawicon),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),

      // Button Circle add students
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: blue,
        shape: const CircleBorder(),
        child: SvgPicture.asset(IconImages.addicons, width: 12, height: 12),
      ),
    );
  }
}
