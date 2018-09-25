class HealthPagesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'

  def search
    search = params[:search]
    url = "https://healthfinder.gov/api/v2/topicsearch.json?api_key=#{ENV['HEALTH_API']}&Keyword=#{search}"
    #don't forget to take API key out.
    # net
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @data = JSON.parse(response)
    # http
    # response = HTTParty.get(url)
    # @data = response.parsed_response
    if @data["Result"]["Total"] == "0"
      @results = "We apologize but there is no information available for this topic."
      @internet = "https://www.google.com/search?&q=" + "#{search} " + "health"
    else
      @results = @data["Result"]["Resources"]["Resource"]
    end
  end

  def results
  end

  def help
  end

  private

end
