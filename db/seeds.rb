Student.destroy_all
Teacher.destroy_all
Yoga.destroy_all


linda = Student.create(name: "linda", email_address: "linfarris19@ymail.com", password: "12345" )
cody = Student.create(name: "cody Ramos", email_address: "CodyGRamos@ymail.com", password: "54321")
eric = Student.create(name: "eric K", email_address: "erick@gmail.com", password: "78910" )

monica= Teacher.create(name: "monica")
evan = Teacher.create(name: "evan")
zay = Teacher.create(name: "Zay")


Yoga.create(time: "Monday", specialty: "Yin Yoga", student_id: linda.id , teacher_id: monica.id)
Yoga.create(time: "Tuesday ", specialty: "Vinyasa Yoga", student_id: cody.id , teacher_id: zay.id)

puts "It has been seeded"
