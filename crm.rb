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
 # Finish off the rest for 3 through 6
 # To be clear, the methods add_new_contact and modify_existing_contact
 # haven't been implemented yet
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

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact

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
    search menu
    user_selected = gets.to_i
    search_option(user_selected)
    Contact.find_by
  end
  def search_menu
    puts '[1] Search by first name'
    puts '[2] Search by last name'
    puts '[3] Search by email'
    puts '[4] Search by note'
    puts '[5] Search by id'
    puts '[6] Exit'
    puts 'Enter a number: '
  end
  def search_option(user_selected)
    case user_selected
    when 1 then Contact.find_by()
    when 2 then Contact.find_by
    when 3 then Contact.find_by
    when 4 then Contact.find_by
    when 5 then Contact.find_by
    when 6 then exit
  end
end


new_crm = CRM.new("best")

new_crm.main_menu
