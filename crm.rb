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
    puts "[7] Exit\n\n"
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
      delete_a_contact
    when "4"
      display_contacts
      return_to_prompt
    when "5"
      id = select_contact_id("Please enter the id of the contact you would like to display")
      clear
      display_a_contact(id)
      return_to_prompt
    when "6"
      display_attribute
      return_to_prompt
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
    id_message = "Please enter the ID of the contact you would like to modify."
    id = select_contact_id(id_message)
    clear
    display_a_contact(id)
    
    attribute_message = "Which attribute would you like to modify?"
    attribute = select_attribute(attribute_message)

    puts "What should this be?"
    new_value = gets.chomp

    Rolodex.modify_contact(id, attribute, new_value)
    puts "Contact modified.\n\n"
    prompt
  end

  def self.delete_a_contact
    message = "Which contact would you like to delete?\n\n"
    id = select_contact_id(message)
    Rolodex.delete_contact(id)
    clear
    puts "Contact deleted.\n\n"
    prompt
  end

  def self.display_contacts
    Rolodex.display_all_contacts
  end

  def self.display_a_contact(id)
    Rolodex.display_particular_contact(id)
  end

  def self.display_attribute
    display_message = "Which attribute would you like to display?"
    attribute = select_attribute(display_message)
    clear
    Rolodex.display_info_by_attribute(attribute)
    print "\n"
  end

  def self.select_contact_id(message)
    display_contacts
    puts "#{message}"
    id = gets.to_i
    if Rolodex.contact(id).nil?
      while Rolodex.contact(id).nil?
        clear
        puts "That contact doesn't exist.\n\n"
        display_contacts
        puts "Please select again.\n\n"
        id = gets.to_i
      end
    end

    return id
  end

  def self.select_attribute(message)
    puts "#{message}"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes\n\n"
    attribute = gets.chomp

    unless (attribute == "1") || (attribute == "2") || (attribute == "3") || (attribute == "4")
      clear
      puts "That's not a valid option.\n\n"
      return select_attribute(message)
    end

    return attribute
  end

  def self.return_to_prompt
    puts "Press enter to return to the main menu."
    gets
    clear
    prompt
  end
end

CRM.prompt