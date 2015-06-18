# require_relative '../../db/config'
require_relative '../app/models/person'


  def print_state(state)
    puts  "Senators:"
    Person.where(title: "Sen", state: state).each do |person|
      puts "#{person.name} (#{person.party})"
    end
  end


  def print_state1(state)
    puts  "Representatives:"
    Person.where(title: "Rep", state: state).each do |person|
    puts "#{person.name} (#{person.party})"
  end
end


  def percentage_senate(sex)
      a = Person.where(gender: sex, title: "Sen", in_office: 1).count
      a1 = a.to_f

      b = Person.where(title: "Sen", in_office: 1).count
      b2 = b.to_f

      c = a1 / b2 * 100
      c = c.round
      puts "Male Senators: #{a} (#{c}%)"
  end

  def percentage_rep(sex)
      a = Person.where(gender: sex, title: "Rep", in_office: 1).count
      a1 = a.to_f

      b = Person.where(title: "Rep", in_office: 1).count
      b2 = b.to_f

      c = (a1 / b2) * 100
      c = c.round

       puts "Male Representatives: #{a} (#{c}%)"
  end

  # def print_state(state)
  #   x = 0
  #   Person.where(title: "Sen", state: state, in_office: 1).count do |person|

  #     puts "#{person.state}: #{x} #{person.party}"
  #   end
  # end
  # def print_state(state)
  # Person.select(state: state).where(title: "Sen", in_office: "1").group(:state).count
  def print_state_active_sen_rep
      Person.select(:state).distinct.order(:state).map(&:state).each do |state_given|
      puts "#{state_given}: #{Person.where(title: "Sen", in_office: 1, state: state_given).count} Senators, #{Person.where(title: "Rep", in_office: 1, state: state_given).count} Representative(s)"
    end
  end

print_state_active_sen_rep
# percentage_senate('M')
# percentage_rep('M')
# print_state('CA')
# print_state1('CA')