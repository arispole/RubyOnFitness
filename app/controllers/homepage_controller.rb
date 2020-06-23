class HomepageController < ApplicationController
skip_before_action :verify_authenticity_token
skip_before_action :authenticate_user!, :only => [:index]

	def index
	end

	def calculate
        @age = params[:age]
        @height = params[:height]
        @weight = params[:weight]
        @bmi = request_api("https://fitness-calculator.p.rapidapi.com/bmi?age=#{URI.encode(@age)}&height=#{URI.encode(@height)}&weight=#{URI.encode(@weight)}")

    end


    def request_api(url)
        response = Excon.get(
            url,
            headers: {
                'X-RapidApid-Host' => URI.parse(url).host,
                'X-RapidApi-Key' => "bf99d8c7a8msh3b43ed43e2d2b7fp11499ejsn4094935e2443"
            }
        )

        return nil if response.status != 200
        JSON.parse(response.body)
    end

end

