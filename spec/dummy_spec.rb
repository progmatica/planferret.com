describe "Numberness" do

  it "should be able to add" do
    ( 2 + 2 ).should == 4
  end

  it "should be able to add correctly" do
    ( 2 + 2 ).should == 5
  end

end

describe "Randomness" do
  
  before do
    @random = []
    10000.times do
      @random << rand( 10 )
    end
    @non_random = Array.new( 500, 2 ) + Array.new( 500, 3 )
  end
 
  it do
    @random.each do |integer|
      integer.should be_an_instance_of( Fixnum )
    end
  end

  it "should be within range" do
    @random.each do |integer|
      integer.should be_close( 4.5, 5 )
    end
  end

  # Fail to reject the null hypothesis that there is no significant
  # difference between the expected and the actual frequencies.  True 
  # is rejection of null hypothesis -- the higher the number, the more
  # surely we reject the null hypothesis and conclude opposite, which is that
  # there is a difference, hence not random.  False is failure to reject null
  # hypothesis -- therefore, it could be true, therefore may be random.
  it "should fail chi squared (alpha=0.05) for non-random" do
    @e = ( @non_random.length / 10 )
    ( ( 0..9 ).collect do |integer|
      ( @non_random.select{ |i| i == integer }.length - @e ).to_f ** 2 / @e 
    end.inject { |sum, n| sum + n } > 16.919 ).should_not be_false
  end

  # Fail to reject the null hypothesis that there is no significant
  # difference between the expected and the actual frequencies.  True 
  # is rejection of null hypothesis -- the higher the number, the more
  # surely we reject the null hypothesis and conclude opposite, which is that
  # there is a difference, hence not random.  False is failure to reject null
  # hypothesis -- therefore, it could be true, therefore may be random.
  it "should have expected frequency according to chi squared (alpha=0.05)" do
    @e = ( @random.length / 10 )
    ( ( 0..9 ).collect do |integer|
      ( @random.select{ |i| i == integer }.length - @e ).to_f ** 2 / @e 
    end.inject { |sum, n| sum + n } > 16.919 ).should be_false
  end
  
  it "should pass runs test"
  
  it "should pass autocorrelation test"
  
  it "should pass gap test"

end
