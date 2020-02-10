require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../models/member')

class MembersTest < Minitest::Test

    def setup
      member1 = Member.new({
        "id" => "1",
        "first_name" => "Robert",
        "last_name" => "Smith",
        "dob" => "1993/08/10",
        "goal" => "To build muscle and stay fit"
      })
    end

    def test_age_calculator(dob)
      member1.age_calculator(dob)
      assert_equal(27, member1.dob.year)
    end

end
