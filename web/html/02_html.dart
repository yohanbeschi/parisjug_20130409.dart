import '../../lib/parisjug_20130410.dart';

void main() {
  
  String tree = '<ul>';
  
  for (School school in schools) {
    tree += '<li>${school.schoolName}';
    
    var grades = school.grades;
    if (grades != null) {
      tree += '<ul>';
      
      for (Grade grade in grades) {
        tree += '<li>${grade.schoolGrade}';
        
        var students = grade.students;
        if (students != null) {
          tree += '<ul>';
          
          for (Student student in students) {
            tree += '<li>${student.firstname} ${student.lastname}</li>';
          }
          
          tree += '</ul>';
        }
        tree += '</li>';
      }
      
      tree += '</ul>';
    }
    
    tree += '</li>';
  }
  
  tree += '</ul>';
  
  query('body').insertAdjacentHtml('afterBegin', tree);
}