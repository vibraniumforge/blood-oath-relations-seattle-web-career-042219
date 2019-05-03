class Cult

    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []
    def initialize(name, location, founding_year, slogan, minimum_age)
        @name=name
        @location=location
        @founding_year=founding_year
        @slogan=slogan
        @minimum_age=minimum_age
        @@all << self
    end

    def name
        # returns a String that is the follower's name
        @name
    end

    def location
        # returns a String that is the city where the cult is located
        @location
    end

    def founding_year
        # returns a Fixnum that is the year the cult was founded
        @founding_year
    end

    def slogan
        # returns a String that is this cult's slogan
        @slogan
    end

    def recruit_follower(follower)
        # takes in an argument of a Follower instance and adds them to this cult's list of followers
        # andy = Follower.new("andy", 31, "Cult Life", "Word")
        BloodOath.new(follower, self)
    end

    def cult_population
        # returns a Fixnum that is the number of followers in this cult
        followers.length
    end

    def self.all
        # returns an Array of all the cults
        @@all
    end

    def self.find_by_name(name)
        # takes a String argument that is a name and returns a Cult instance whose name matches that argument
        self.all.find do |cult_members|
            cult_members.name == name
        end
    end

    def self.find_by_location(location)
        # takes a String argument that is a location and returns an Array of cults that are in that locations
        self.all.select do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year(founding_year)
        # takes a Fixnum argument that is a year and returns all of the cults founded in that year
        self.all.find_all do |cult|
            cult.founding_year == founding_year
        end
    end

    # helpers

    def blood_oaths
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
        end
    end

    def followers
        blood_oaths.map do |bloodoath|
            bloodoath.follower
        end
    end

    #########

    # Advanced

    def average_age
        # returns a Float that is the average age of this cult's followers
        total_age=followers.reduce(0) do |sum, follower|
            sum + follower.age
         end 
        total_age/followers.size
    end

    def my_followers_mottos
        # prints out all of the mottos for this cult's followers
        followers.map do |follower|
            follower.life_motto
        end
    end

    def self.least_popular
        # returns the Cult instance who has the least number of followers :(
        self.all.min_by do |cult|
            cult.followers.length
        end
    end

    def self.cult_locations
        locations = {}
        self.all.each do |cult|
          if !locations[cult.location]
            locations[cult.location] = 1
          else
            locations[cult.location] += 1
          end
        end
        locations
      end

    def self.most_common_location
        # returns a String that is the location with the most cults
        location = cult_locations.max_by do |location, count|
            count
        end
        location[0]
    end

    # Bonus

    def self.minimum_age(name)
        # returns a Fixnum that is the minimum age required for followers joining this cult
        self.find_by_name(name).minimum_age
    end

    def recruit_follower_bonus(follower)
#         takes in an argument of a Follower instance and adds them to this cult's list of          followers
        # NOW this is changed such that if the given Follower instance is not of age:
        # do not let them join the cult
        # print out a friendly message informing them that they are too young
        if follower.age > 18
            BloodOath.new(follower, self)
        else
            "Sorry you are too young."
        end
    end

end
