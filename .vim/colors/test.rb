class Test
  def test
    puts "köl#{}lö"
  end # comment
3

# This will guess the User class
  Factory.define :user do |u|
    u.first_name 'John'
    u.last_name  'Doe'
    u.admin false
  end
  Factory.define :user do |u|
    u.first_name 'Joe'
    u.last_name  'Blow'
    u.email {|a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
  end

end
