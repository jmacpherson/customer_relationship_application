class Contact
  attr_accessor :id, :first_name, :last_name, :email, :notes

  def initialize(id_no, f_name, l_name, e_mail, note)
    id = id_no
    first_name = f_name
    last_name = l_name
    email = e_mail
    notes = note
  end

  def contacts
    @@contacts
  end

  def display_contact(id_no)
    puts "ID: #{id}"
    puts "First Name: #{first_name}"
    puts "Last Name: #{last_name}"
    puts "Email: #{email}"
    puts "Notes: #{notes}"
  end
end

class Rolodex
  @@contacts = 0

  def initialize
    @rolodex = []
  end

  def add
    puts "Please enter the contacts first name:"
    f_name = gets.chomp
    puts "Please enter the contacts last name:"
    l_name = gets.chomp
    puts "Please enter the contacts email address:"
    email = gets.chomp
    puts "Please enter any notes about the contact:"
    notes = gets.chomp

    @@contacts += 1
    @rolodex << Contact.new(@rolodex.length,f_name,l_name,email,notes)
  end

  def modify_contact
  end

  def display_all_contacts
  end

  def display_particular_contact
  end

  def display_info_by_attribute
  end

  def delete_contact
  end
end