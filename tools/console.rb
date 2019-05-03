require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

seattle_blood = Cult.new("Seattle Blood", "Seattle", 2010, "Blood rules", 18)
downtown_blood_club = Cult.new("Downtown Blood Club", "Seattle", 2001, "I love blood", 21)

joe_joeson = Follower.new("Joe Joeson", 30, "I love cults", ["Seattle Blood", "Downtown Blood Club"])
john_jones = Follower.new("John Jones", 70, "Cults are nice", "Downtown Blood Club")
tony = Follower.new("John Jones", 4, "Cults are nice", "Downtown Blood Club")

seattle_blood_john_oath = BloodOath.new(joe_joeson, seattle_blood)
downtown_blood_oath = BloodOath.new(john_jones, downtown_blood_club)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
