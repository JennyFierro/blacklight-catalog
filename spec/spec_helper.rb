# frozen_string_literal: true

unless RUBY_PLATFORM.match?(/darwin/) # don't run coverage on a dev machine (unless you want to, then do whatever)
  require 'coveralls'
  Coveralls.wear!
end

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true, allow: 'https://chromedriver.storage.googleapis.com')
RSpec::Matchers.define_negated_matcher :not_change, :change

# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before do
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990027507910302486/holdings/22319997630002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=janeq")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22319997630002486_w_user.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990027507910302486?apikey=fakebibkey123&expand=p_avail,e_avail,d_avail,requests&view=full")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_10.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9937242404302486?view=full&expand=p_avail,e_avail,d_avail,requests&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_9.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/users/janeq/requests/36181952270002486?apikey=fakeuserkey456&user_id_type=all_unique")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_request_test_file.json'))
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990016148150302486?view=full&expand=p_avail,e_avail,d_avail,requests&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_8.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9937275387802486?view=full&expand=p_avail,e_avail,d_avail,requests&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_7.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486/requests?status=active&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_request_test_file.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486?apikey=fakebibkey123&expand=p_avail,e_avail,d_avail,requests&view=full")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_6.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9937004854502486?view=full&expand=p_avail,e_avail,d_avail,requests&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_5.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990005988630302486?apikey=fakebibkey123&expand=p_avail,e_avail,d_avail&view=full")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990005059530302486?apikey=fakebibkey123&expand=p_avail,e_avail,d_avail&view=full")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_2.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/123?apikey=fakebibkey123&expand=p_avail,e_avail,d_avail&view=full")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/123?&expand=p_avail,e_avail,d_avail,requests&view=full&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_a.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/456?expand=p_avail,e_avail,d_avail,requests&view=full&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_3.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/456?apikey=fakebibkey123&expand=p_avail,e_avail,d_avail&view=full")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_3.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/789?expand=p_avail,e_avail,d_avail,requests&view=full&apikey=fakebibkey123")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file_4.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486/holdings/22360885950002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22360885950002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486/holdings/22360885950002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=janeq")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22360885950002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486/holdings/22332597410002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22332597410002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486/holdings/22332597410002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=janeq")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22332597410002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486/holdings/22319658770002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22360885950002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9936550118202486/holdings/22319658770002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=janeq")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22360885950002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9937004854502486/holdings/22439796790002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22439796790002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/9937004854502486/holdings/22394150340002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22394150340002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990005988630302486/holdings/22171079010002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22171079010002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/123/holdings/22171079010002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22171079010002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/456/holdings/22171079010002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22171079010002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990016148150302486/holdings/22200365440002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22200365440002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990005059530302486/holdings/22172707720002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22172707720002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990005059530302486/holdings/22172707740002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22172707740002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990027507910302486/holdings/22236301230002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=janeq")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22236301230002486_w_user.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990027507910302486/holdings/22236301230002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22236301230002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990027507910302486/holdings/22311186980002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22311186980002486.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990027507910302486/holdings/22311186980002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=janeq")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22311186980002486_w_user.xml'), headers: {})
    stub_request(:get, "http://www.example.com/almaws/v1/bibs/990027507910302486/holdings/22319997630002486/items?apikey=fakebibkey123&expand=due_date_policy&user_id=GUEST")
      .to_return(status: 200, body: File.read(fixture_path + '/alma_item_records/22319997630002486_w_guest.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?verb=GetRecord&identifier=oai:alma.blah:single_record&metadataPrefix=marc21"
    ).to_return(status: 200, body: File.read(fixture_path + '/single_record.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?verb=GetRecord&identifier=oai:alma.blah:single_record_missing&metadataPrefix=marc21"
    ).to_return(status: 200, body: File.read(fixture_path + '/single_record_missing.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?verb=GetRecord&identifier=oai:alma.blah:single_record_updated&metadataPrefix=marc21"
    ).to_return(status: 200, body: File.read(fixture_path + '/single_record_updated.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?verb=GetRecord&identifier=oai:alma.blah:single_record_deleted&metadataPrefix=marc21"
    ).to_return(status: 200, body: File.read(fixture_path + '/single_record_deleted.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?metadataPrefix=marc21&set=blacklight4&until=2021-01-28T19:16:10Z&verb=ListRecords"
    ).to_return(status: 200, body: File.read(fixture_path + '/alma_small_set.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?metadataPrefix=marc21&set=blacklight_marc_resource&until=2021-01-28T19:16:10Z&verb=ListRecords"
    ).to_return(status: 200, body: File.read(fixture_path + '/alma_marc_resource.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?metadataPrefix=marc21&set=blacklight4&until=2021-02-15T19:16:10Z&verb=ListRecords"
    ).to_return(status: 200, body: File.read(fixture_path + '/alma_small_set_with_2_fields_missing.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?metadataPrefix=marc21&set=blacklight4&until=2021-01-29T19:16:10Z&verb=ListRecords"
    ).to_return(status: 200, body: File.read(fixture_path + '/alma_deleted_and_suppressed_records.xml'), headers: {})
    stub_request(
      :get,
      "https://smackety.alma.exlibrisgroup.com/view/oai/blah/request?metadataPrefix=marc21&set=blacklight4&until=2021-02-23T19:16:10Z&verb=ListRecords"
    ).to_return(status: 200, body: File.read(fixture_path + '/alma_small_set_with_1_new_1_updated_fields.xml'), headers: {})
    stub_request(
      :get,
      "https://jalapeno.alma.exlibrisgroup.com/view/oai/tabasco/request?identifier=oai:alma.blah:single_record&metadataPrefix=marc21&verb=GetRecord"
    ).to_return(status: 200, body: File.read(fixture_path + '/alma_availability_test_file.xml'), headers: {})
  end
end
