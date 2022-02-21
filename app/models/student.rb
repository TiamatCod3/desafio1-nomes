class Student < ApplicationRecord
  #Como a planilha contém os emails padrão ou vazios, as validações avaliam apenas 
  as atualizções de email
  validates :uffmail, uniqueness: true, on: :update
  validates :active, acceptance: true, on: :update
  
  def generate_mails
    MailHelper::Mail.generate_mails(Student, "uffmail", name,20,"@id.uff.br")
    # names = name.split
    # leg = "@id.uff.br"
    # mails = Set.new
    # counter = 0
    # max = 20
    # while mails.length != max do
    #   suggestion = String.new
    #   suggestion += counter%names.length != 0 ? names[0][0] : ""
    #   suggestion += names[counter%names.length]
    #   suggestion += counter%2 == 0 ? "_" : "" 
    #   suggestion += names[(counter+1)%names.length]
    #   if counter > max
    #     suggestion += rand(999).to_s
    #   end
    #   suggestion += leg
    #   suggestion.downcase!
    #   if Student.where(uffmail: suggestion).empty?
    #     mails.add(suggestion) 
    #   end
    #   counter += 1
    # end
    # debugger
    # mails.to_a
  end

  def self.search(search)
    if search
      self.where(register: search).first
    else
      nil
    end
  end

end
