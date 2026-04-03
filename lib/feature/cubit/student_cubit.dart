import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/core/app_images.dart';
import 'package:task_one/core/app_string.dart';
import '../model/student_model.dart';
import 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState([])) {
    loadStudents();
  }

  void loadStudents() {
    final students = [
      Student(name: ALEXJOHNSON, id: "#10023", image: JpgImages.one),
      Student(name: MARIAGARCIA, id: "#10045", image: ""),
      Student(name: SAMSMITH, id: "#10088", image: JpgImages.two),
      Student(name: SARAHWILLIAMS, id: "#10102", image: ""),
      Student(name: MICHAELCHEN, id: "#10155", image: JpgImages.three),
    ];

    emit(StudentState(students));
  }

  void removeStudent(int index) {
    final updated = List<Student>.from(state.students)..removeAt(index);
    emit(StudentState(updated));
  }

  void addStudent() {
    final updated = List<Student>.from(state.students)
      ..add(
        Student(
          name: "New Student",
          id: "#10${state.students.length}",
        ),
      );

    emit(StudentState(updated));
  }
}