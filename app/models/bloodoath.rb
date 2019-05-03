class BloodOath

    attr_accessor :follower, :cult, :initiation_date

    @@all=[]

    def initialize(follower, cult)
        @follower=follower
        @cult=cult
        # @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @initiation_date = "#{Time.now.strftime"%F" }"
        @@all << self
    end

    def initiation_date
        # returns a String that is the initiation date of this blood oath in the format YYYY-MM-DD.
        @initiation_date
    end

    def self.all
        # returns an Array of all the blood oaths
        @@all
    end

    def self.first_oath
        # returns the Follower instance for the follower that made the very first blood oath
       sorted_oaths = self.all.sort_by do |oath|
            oath.initiation_date
       end
       sorted_oaths.first.follower
    end
end
