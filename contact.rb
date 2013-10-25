class Contact
  attr_accessor :id, :first_name, :last_name, :email, :notes

  def initialize(id_no, f_name, l_name, e_mail, note)
    @id = id_no
    @first_name = f_name
    @last_name = l_name
    @email = e_mail
    @notes = note
  end

  def display_contact
    puts "ID: #{@id}"
    puts "First Name: #{@first_name}"
    puts "Last Name: #{@last_name}"
    puts "Email: #{@email}"
    puts "Notes: #{@notes}\n\n"
  end
end