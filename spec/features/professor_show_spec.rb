require 'rails_helper'

describe 'Professor Show Page' do
  describe "displays professor information" do
    it "includes a list of the professors students" do
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)

      visit "/professors/#{lupin.id}"
      within ".student" do
        expect(page).to have_css('.name')
        expect(page).to have_content('Harry Potter')
        expect(page).to have_content('Draco Malfoy')
      end
    end
  end
end
