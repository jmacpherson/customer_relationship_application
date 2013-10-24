class Rolodex
  @@rolodex = []

  # def initialize
  #   rolodex = []
  # end

  # def self.prompt
  #   CRM.prompt
  # end

  def self.contact(id)
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
  end

  def self.delete_contact(id)
    @@rolodex.delete(contact(id))
    reassign_contact_ids
  end

  def self.display_all_contacts
    @@rolodex.each { |contact| contact.display_contact }
  end

  def self.display_particular_contact(id)
    contact(id).display_contact unless contact(id).nil?
  end

  def self.reassign_contact_ids
    @@rolodex.each { |contact| contact.id = (@@rolodex.index(contact) + 1) }
  end

  def display_info_by_attribute
  end
end