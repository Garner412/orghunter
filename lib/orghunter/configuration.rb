module Orghunter
  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = ENV["ORGHUNTER_API_KEY"] || nil
    end
  end

end
