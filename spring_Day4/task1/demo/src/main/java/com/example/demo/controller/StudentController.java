@RestController
@RequestMapping("/api/students")
public class StudentController {

    private List<Student> students = new ArrayList<>();

    public StudentController(){
        students.add(new Student(1L,"John",20));
        students.add(new Student(2L,"Alice",22));
    }

    @GetMapping
    public ResponseEntity<List<Student>> getStudents(){
        return ResponseEntity.ok(students);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Student> getStudent(@PathVariable Long id){

        for(Student s:students){
            if(s.getId().equals(id)){
                return ResponseEntity.ok(s);
            }
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Student> addStudent(@RequestBody Student student){
        students.add(student);
        return ResponseEntity.status(HttpStatus.CREATED).body(student);
    }

}