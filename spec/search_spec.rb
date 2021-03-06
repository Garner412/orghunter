require "spec_helper"
describe Orghunter::Search do
  # Somehow there is no effect of doing this in the spec_helper
  Orghunter.configure do |config|
    config.api_key = ENV['ORGHUNTER_API_KEY']
  end

  VCR.use_cassette('cow_search') do

    term_search = Orghunter::Search.new( {search_term: 'cows',rows: 22, start: 1} )

    it "Has an array of charities" do
      expect(term_search.results).to be_kind_of(Array)
      expect(term_search.results).to_not be_empty
      term_search.results.each{|charity| expect(charity).to be_kind_of(Orghunter::Charity)}
    end
    it "Has a count of the results" do
      expect(term_search.count).to eq(84)
    end

    it "Has a record start position" do
      expect(term_search.start_position).to eq(1)
    end

    it "Has an ending position" do
      expect(term_search.final_position).to eq(23)
    end

    it "Has a number of rows returned" do
      expect(term_search.rows_returned).to eq(22)
    end
  end

  describe "When searching by EIN" do
    VCR.use_cassette('ein_search') do
      ein_search = Orghunter::Search.new({ein: 261688229})

      it "builds the appropriate search string" do
        expect(ein_search.instance_variable_get(:@query_url)).to eq("http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}&ein=261688229")
      end

      it "Returns one charity" do
        expect(ein_search.count).to equal(1)
      end

      it "Returns the charity with a particular EIN" do
        returned_charity = ein_search.results[0]
        expect(returned_charity).to be_kind_of(Orghunter::Charity)
        expect(returned_charity.ein).to eq('261688229')
      end
    end
  end

  describe "When searching by city" do
    VCR.use_cassette('city_search') do
      city_search = Orghunter::Search.new({city: 'Chicago'})

      it "builds the appropriate search string" do
        expect(city_search.instance_variable_get(:@query_url)).to eq("http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}&city=Chicago")
      end

      it "returns results with the correct city" do
        expect(city_search.results).to_not be_empty
        city_search.results.each {|charity| expect(charity.city).to eq('CHICAGO')}
      end
    end
  end

  describe "When searching by state" do
    VCR.use_cassette('state_search') do
      state_search = Orghunter::Search.new({state: 'IL'})

      it "builds the appropriate search string" do
        expect(state_search.instance_variable_get(:@query_url)).to eq("http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}&state=IL")
      end

      it "returns results with the correct state" do
        expect(state_search.results).to_not be_empty
        state_search.results.each {|charity| expect(charity.state).to eq('Illinois')}
      end
    end
  end

  describe "When searching by zip code" do
    VCR.use_cassette('zip_search') do
      zip_code_search = Orghunter::Search.new({zip_code: '60606'})

      it "builds the appropriate search string" do
        expect(zip_code_search.instance_variable_get(:@query_url)).to eq("http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}&zipCode=60606")
      end

      it "returns results with the correct zip code" do
        expect(zip_code_search.results).to_not be_empty
        zip_code_search.results.each {|charity| expect(charity.zip_code).to match(/60606/)}
      end
    end
  end

  describe "When searching by eligibility status" do
    VCR.use_cassette('eligibility_search') do
      eligible_search = Orghunter::Search.new({eligible: true})

      it "builds the appropriate search string" do
        expect(eligible_search.instance_variable_get(:@query_url)).to eq("http://data.orghunter.com/v1/charitysearch?user_key=#{Orghunter.configuration.api_key}&eligible=1")
      end
      it "returns results with the correct eligibility" do
        expect(eligible_search.results).to_not be_empty
        eligible_search.results.each {|charity| expect(charity.eligible?).to eq(true)}
      end
    end
  end

  describe "Where there are NO search results" do
    VCR.use_cassette('no_results') do
      no_results = Orghunter::Search.new({search_term: 'hjnkoihjbnklmjoiuhjbnkloijuhjb'})

      it "has a count of zero" do
        expect(no_results.count).to eq(0)
      end

      it "has an empty array for results" do
        expect(no_results.results).to eq([])
      end
    end
  end
end
