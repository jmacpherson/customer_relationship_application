require_relative "contact"
require_relative "rolodex"

class CRM
  def self.prompt
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display a contact"
    puts "[6] Display an attribute" 
    puts "[7] Exit"
    puts "Enter a number: "
    call_option(gets.chomp)
  end

  def self.call_option(option)
    puts "\e[H\e[2J"
    case option
    when "1"
      add
    when "2"
      modify_contact
    when "3"
    when "4"
      display_contacts
      puts "Press enter to return to the main menu."
      gets
      clear
      prompt
    when "5"
    when "6"
    when "7"
      puts "Goodbye."
      return
    else
      puts "Sorry, we don't have that option."
      return prompt
    end
  end

  def self.clear
    puts "\e[H\e[2J"
  end

  def self.add
    puts "Please enter the contacts first name:"
    f_name = gets.chomp
    puts "Please enter the contacts last name:"
    l_name = gets.chomp
    puts "Please enter the contacts email address:"
    email = gets.chomp
    puts "Please enter any notes about the contact:"
    notes = gets.chomp
    id = Rolodex.length + 1
  
    contact = Contact.new(id,f_name,l_name,email,notes)
    Rolodex.add(contact)

    clear
    puts "Contact added.\n\n"
    prompt
  end

  def self.modify_contact
    select_contact
    puts "Which attribute would you like to modify?"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes"
    attribute = gets.chomp
    Rolodex.modify_contact(id, attribute, new_value)
    prompt
  end

  def self.display_contacts
    Rolodex.display_all_contacts
  end

  def self.display_a_contact(id)
    Rolodex.display_particular_contact(id)
  end

  def self.select_contact
    display_contacts
    puts "Please enter the ID of the contact you would like to modify."
    id = gets.to_i
    clear
    display_a_contact(id)
  end
end

CRM.prompt