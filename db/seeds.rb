# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# https://gist.github.com/arjunvenkat/1115bc41bf395a162084
# https://gist.github.com/wrburgess/ea0869979accad8172d3
require 'csv'

# csv_text = File.read('alunos.csv')
csv_text = File.read(Rails.root.join('lib', 'seeds', 'alunos.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  student = Student.new
  student.name = row['nome']
  student.register = row['matricula']
  student.phone = row['telefone']
  student.mail = row['email']
  student.uffmail = row['uffmail']
  student.status = row['status']
  student.save
end