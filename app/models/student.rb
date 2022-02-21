class Student < ApplicationRecord
  #Como a planilha contém os emails padrão ou vazios, as validações avaliam apenas 
  #as atualizções de email
  validates :uffmail, uniqueness: true, on: :update
  validates :active, acceptance: true, on: :update
  
  def generate_mails
    MailHelper::Mail.generate_mails(Student, "uffmail", name,20,"@id.uff.br")
  end

  def self.search(search)
    if search
      self.where(register: search).first
    else
      nil
    end
  end

end
