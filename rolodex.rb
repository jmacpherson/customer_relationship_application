class Rolodex
  @@rolodex = []

  # def initialize
  #   rolodex = []
  # end

  # def self.prompt
  #   CRM.prompt
  # end

  def contact(id)
    @@rolodex[id-1]
  end

  def self.add(contact)
    @@rolodex << contact
  end

  def self.length
    @@rolodex.length
  end

  def self.modify_contact(id, attribute, new_value)
    case attribute
    when "1"
      contact(id).first_name = new_value
    when "2"
      contact(id).last_name = new_value
    when "3"
      contact(id).email = new_value
    when "4"
      contact(id).notes = new_value
    end 
    puts "Contact modified.\n\n"
  end

  def self.display_all_contacts
    @@rolodex.each { |contact| contact.display_contact }
  end

  def self.display_particular_contact(id)
    @@rolodex[id-1].display_contact
  end

  def display_info_by_attribute
  end

  def delete_contact
  end
end