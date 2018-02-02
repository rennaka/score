class Word

  def self.past(word)
    case word
    when "create"
      "created"
    when "edit"
      "edited"
    when "delete"
      "deleted"
    end
  end
  
end
