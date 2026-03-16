package com.example.demo.controllers;

import com.example.demo.model.Student;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    private final List<Student> students = new ArrayList<>();

    public StudentController() {

        students.add(new Student(1L, "Divya", 21));
        students.add(new Student(2L, "Rahul", 22));

    }

    @GetMapping
    public List<Student> getStudents() {
        return students;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Student> getStudent(@PathVariable Long id) {

        for (Student s : students) {
            if (s.getId().equals(id)) {
                return ResponseEntity.ok(s);
            }
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Student> addStudent(@RequestBody Student student) {

        students.add(student);
        return new ResponseEntity<>(student, HttpStatus.CREATED);
    }
}