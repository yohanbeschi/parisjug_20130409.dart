part of parisjug_20130410;

class School {
  int id;
  String schoolName;
  
  List<Grade> grades;
  
  School(this.id, this.schoolName, [this.grades]);
}

class Grade {
  int id;
  String schoolGrade;
  
  List<Student> students;
  
  Grade(this.id, this.schoolGrade, [this.students]);
}

class Student {
  int id;
  String firstname;
  String lastname;
  
  Student(this.id, this.firstname, this.lastname);
}

/*
 * - School 1
 * - School 2
 * | - Grade 2.1
 * | - Grade 2.2
 * | | - Student 2.2.1
 * | | - Student 2.2.2
 * - School 3
 * | - Grade 3.1
 * - School 4
 */
List<School> get schools { 
  final School school1 = new School(1, 'School 1');
  final Student student2_2_1 = new Student(8, 'Person',  '2.2.1'); 
  final Student student2_2_2 = new Student(9, 'Person',  '2.2.2'); 
  final Grade grade2_2 = new Grade(6, 'Grade 2.2', [student2_2_1, student2_2_2]); 
  final Grade grade2_1 = new Grade(5, 'Grade 2.1'); 
  final School school2 = new School(2, 'School 2', [grade2_1, grade2_2]); 
  final Grade grade3_1 = new Grade(7, 'Grade 3.1');
  final School school3 = new School(3, 'School 3', [grade3_1]);
  final School school4 = new School(4, 'School 4');
  final List<School> schools = [school1, school2, school3, school4];
  
  return schools;
}