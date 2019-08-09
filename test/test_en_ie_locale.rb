# frozen_string_literal: true

require_relative 'test_helper'

class TestEnIeLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-IE'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_en_ie_internet_methods
    assert Faker::Internet.domain_suffix.is_a? String
  end

  def test_en_ie_address_methods
    assert Faker::Address.street_name.is_a? String
    assert Faker::Address.city.is_a? String
    assert Faker::Address.state.is_a? String
    assert Faker::Address.postcode.is_a? String
  end

  def test_en_ie_country_methods
    assert_equal Faker::Address.country, 'Ireland'
    assert_equal Faker::Address.country_code, 'IE'
  end

  def test_mobiles_start_with_0
    mobile = Faker::PhoneNumber.phone_number.gsub(/\D/, '')
    assert_equal '0', mobile[0]
  end
end
