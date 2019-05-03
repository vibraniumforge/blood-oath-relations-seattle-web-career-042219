class Follower

    @@all = []

    attr_accessor :name, :age, :life_motto, :cults

    def initialize(name, age, life_motto, cults)
        @name=name
        @age=age
        @life_motto=life_motto
        @cults=cults
        @@all << self
    end

    def name
        # returns a String that is the follower's name
        @name
    end

    def age
        # returns a Fixnum that is the age of the follower
        @age
    end

    def life_motto
        # returns a String that is the follower's life motto
        @life_motto
    end

    def cults
        # returns an Array of this follower's cults
        blood_oaths.map do |blood_oath|
            blood_oath.cult
        end
    end

    def join_cult(cult)
        # Takes in an argument of a Cult instance and adds this follower to the cult's list of followers
        BloodOath.new(self, cult) 
    end
    
    def self.all
        # returns an Array of all the followers
        @@all
    end

    def self.of_a_certain_age(age)
        # takes a Fixnum argument that is an age and returns an Array of followers who are the given age or older
        self.all.select do |blood_oath|
            blood_oath.age > age
        end
    end

    ### helpers ###

    def blood_oaths
        BloodOath.all.select do |bloodoath|
            bloodoath.follower == self
        end
    end

    def cults
        blood_oaths.map do |bloodoath|
            bloodoath.cult
        end
    end

    def self.follower_activity_sort
        follower_activity = self.all.map do |follower|
          {follower => follower.cults.length}
        end
        sorted_follower_activity = follower_activity.sort_by do |follower|
          follower.values[0]
        end
        sorted_follower_activity.reverse
     end

    ###############
    # ANALYTICS

    def my_cults_slogans
        # prints out all of the slogans for this follower's cults
        cults.each do |slogan|
            puts "#{slogan}"
        end
    end

    def self.most_active
        # returns the Follower instance who has joined the most cults
        self.follower_activity_sort[0]
    end

    def self.top_ten
        # returns an Array of followers; they are the ten most active followers
        follower_activity_sort[0...9]
    end

    ### Bonus ###

    def fellow_cult_members
        # returns a unique Array of followers who are in the same cults as you
        Follower.all.select do |follower|
            follower.cults & self.cults != [] && follower != self
          end
        end 

    def join_cult_bonus(cult)
        #         takes in an argument of a Cult instance and adds this follower to the cult's list of followers
        # NOW this is changed such that if you don't meet the minimum age requirement of the given Cult instance:
        # do not let them join the cult
        # print out a friendly message informing them that they are too young

        if self.age >= cult.minimum_age
            BloodOath.new(self, cult)
          else
            puts "Sorry, you are not yet old enough."
          end

    end
end