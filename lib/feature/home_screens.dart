import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/core/app_colors.dart';
import 'package:task_one/core/app_images.dart';
import 'package:task_one/core/app_string.dart';
import 'package:task_one/core/app_textstyle.dart';

class Student {
  final String name;
  final String id;
  final String? image;

  Student({required this.name, required this.id, this.image});
}

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List<Student> students = [
    Student(name: ALEXJOHNSON, id: "#10023", image: JpgImages.one),
    Student(name: MARIAGARCIA, id: "#10045", image: ""),
    Student(name: SAMSMITH, id: "#10088", image: JpgImages.two),
    Student(name: SARAHWILLIAMS, id: "#10102", image: PngImages.text),
    Student(name: MICHAELCHEN, id: "#10155", image: JpgImages.three),
  ];

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

      // section body
      body: students.isEmpty
          ? Center(child: Text(NOSTUDENTS, style: TextStyle(fontSize: 18)))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                // swipe deleta
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
                    setState(() => students.removeAt(index));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${student.name} deleted")),
                    );
                  },
                  // Card Students
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(student.image!),
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
