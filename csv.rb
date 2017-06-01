require "faker"
require 'csv' 
require 'pp'
require 'date'

class Person 
  attr_reader :first_name, :last_name, :email, :phone, :created_at
  def initialize(first_name, last_name, email, phone, created_at=Time.now)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end
end

def create_persons(num)
  num.times.map { Person.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::PhoneNumber.cell_phone) }
end

people = create_persons(10)

class PersonWriter
  def initialize(file, people)
   @file = file
   @people = people
  end
  def create_csv
    CSV.open(@file, "wb") do |csv|
      @people.each do |person|
        csv << [person.first_name, person.last_name, person.email, person.phone, person.created_at]
      end  
    end
  end  
end  




person_writer = PersonWriter.new("people.csv", people)
person_writer.create_csv

class PersonParser
  def initialize(file)
    @file = file
  end
  def people
    CSV.foreach(@file).map do |row|
      Person.new(row[0], row[1], row[2], row[3], DateTime.parse(row[4]))
    end
  end
end


parser = PersonParser.new('people.csv')
pp people = parser.people