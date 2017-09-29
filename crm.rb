require_relative 'contact'

class CRM

  def initialize(name)
    puts "Okay, this CRM has the name " + name
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit

    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    contact = Contact.create(
      first_name:first_name ,
      last_name: last_name,
      email: email,
      note: note
    )
  end

  def modify_existing_contact
    puts "Enter contact id to modify"
    contact_id = gets.chomp.to_i
    puts contact = Contact.find(contact_id)
    search_menu
    user_selected = gets.chomp.to_i
    case user_selected
    when 1 then user_attribute = 'first_name'
    when 2 then user_attribute = 'last_name'
    when 3 then user_attribute = 'email'
    when 4 then user_attribute = 'note'
    when 5 then user_attribute = 'id'
    when 6 then exit
    end
    puts "enter new value"
    new_value = gets.chomp
    puts contact.update(user_attribute.to_sym => new_value).inspect
  end

  def delete_contact
    puts "Enter id of contact to delete"
    id = gets.chomp.to_i
    Contact.delete(id)
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    search_menu
    user_selected = gets.to_i
    search_option(user_selected)
  end
  def search_menu
    puts '[1] for first name'
    puts '[2] for last name'
    puts '[3] for email'
    puts '[4] for note'
    puts '[5] for id'
    puts '[6] Exit'
    puts 'Enter a number: '
  end
  def search_option(user_selected)

    case user_selected
    when 1 then user_attribute = 'first_name'
    when 2 then user_attribute = 'last_name'
    when 3 then user_attribute = 'email'
    when 4 then user_attribute = 'note'
    when 5 then user_attribute = 'id'
    when 6 then exit
    end
    puts "enter value for search:"
    search_for = gets.chomp
    puts Contact.find_by(user_attribute.to_sym => search_for).inspect
  end
end


new_crm = CRM.new("best")

new_crm.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
