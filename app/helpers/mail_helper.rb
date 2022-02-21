module MailHelper
  class Mail
    def self.generate_mails(klass, targetfield, fullname, max ,domain)
      
      suggestion = String.new
      names = fullname.split
      mails = Set.new 
      counter = 0

      while mails.length != max do
        suggestion = String.new
        suggestion += counter%names.length != 0 ? names[0][0] : ""
        suggestion += names[counter%names.length]
        suggestion += counter%2 == 0 ? "_" : "." 
        suggestion += names[(counter+1)%names.length]
        if counter > max
          suggestion += rand(999).to_s
        end
        suggestion += domain
        suggestion.downcase!
        if klass.where([targetfield + " = '" + suggestion + "'"]).empty?
          mails.add(suggestion) 
        end
        counter += 1
      end
      mails.to_a
    end  
  end
end

