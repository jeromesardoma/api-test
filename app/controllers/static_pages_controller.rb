class StaticPagesController < ApplicationController
  def home
  end

  def search
    @result = request_api('https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/jokes/random')
  end

  private

    def request_api(url)
      response = Excon.get(
        url,
        headers: {
          'X-RapidAPI-Host' => URI.parse(url).host,
          # remember to save key as ENV var prior to updating on Github
          'X-RapidAPI-Key' => ENV['rapid_api_key']
        }
      )

      return nil unless response.status == 200

      JSON.parse(response.body)
    end


end
