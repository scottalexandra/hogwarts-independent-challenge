require 'rails_helper'

describe "Unroll students Spec" do
  it "it should unenroll students from a professor" do
    hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: hagrid.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: hagrid.id)

    visit "/professors/#{hagrid.id}"
    expect(page).to have_button('unenroll')

    first(:button, "unenroll").click
    # click_button("unenroll", match: :first)

    expect(current_path).to eq("/professors/#{hagrid.id}")
    expect(page).not_to have_content('Harry Potter')
  end
end
