package com.example.demo.services;

import com.example.demo.model.Student;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
@Service
public class StudentServices {

    private final List<Student> students = new ArrayList<>();

    public StudentServices() {

        students.add(new Student(1L, "John", 20));
        students.add(new Student(2L, "Alice", 22));
    }


    public List<Student> getAllStudents() {
        return students;
    }


    public Student getStudentById(Long id) {

        for (Student s : students) {
            if (s.getId().equals(id)) {
                return s;
            }
        }

        return null;
    }


    public Student addStudent(Student student) {

        students.add(student);
        return student;
    }


    public Student updateStudent(Long id, Student updatedStudent) {

        for (Student s : students) {

            if (s.getId().equals(id)) {

                s.setName(updatedStudent.getName());
                s.setAge(updatedStudent.getAge());

                return s;
            }
        }

        return null;
    }


    public boolean deleteStudent(Long id) {

        Iterator<Student> iterator = students.iterator();

        while (iterator.hasNext()) {

            Student s = iterator.next();

            if (s.getId().equals(id)) {
                iterator.remove();
                return true;
            }
        }

        return false;
    }


    public List<Student> searchByName(String name) {

        List<Student> result = new ArrayList<>();

        for (Student s : students) {

            if (s.getName().equalsIgnoreCase(name)) {
                result.add(s);
            }
        }

        return result;
    }
}