require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('..models/member')
class ClientHubTest < Minitest::Test

  def test_age_calculator
    @member1 = Member1.new(

    )

  end

end
