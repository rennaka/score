class Print

  def self.red(output)
    print "\e[31m"
    puts output
    print "\e[0m"
  end

  def self.green(output)
    print "\e[32m"
    puts output
    print "\e[0m"
  end
end
