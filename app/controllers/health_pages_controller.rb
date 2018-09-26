class HealthPagesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'
  require 'geocoder'

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

  def location

  end

  def locationresults
    location = Geocoder.search(params[:location])
    lat = location.first.coordinates[0]
    lon = location.first.coordinates[1]

    generic_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&key=#{ENV['MAP_API']}"
    uri = URI(generic_search)
    response = Net::HTTP.get(uri)
    @generic = JSON.parse(response)
    @generic_r = @generic["results"]

    counseling_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=counseling&key=#{ENV['MAP_API']}"
    uri = URI(counseling_search)
    response = Net::HTTP.get(uri)
    @counseling = JSON.parse(response)
    @counseling_r = @counseling["results"]

    mental_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=mental&key=#{ENV['MAP_API']}"
    uri = URI(mental_search)
    response = Net::HTTP.get(uri)
    @mental = JSON.parse(response)
    @mental_r = @mental["results"]


    psychiatrist_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=psychiatrist&key=#{ENV['MAP_API']}"
    uri = URI(psychiatrist_search)
    response = Net::HTTP.get(uri)
    @psychiatrist = JSON.parse(response)
    @psychiatrist_r = @psychiatrist["results"]

    psychologist_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=psychologist&key=#{ENV['MAP_API']}"
    uri = URI(psychologist_search)
    response = Net::HTTP.get(uri)
    @psychologist = JSON.parse(response)
    @psychologist_r = @psychologist["results"]

    therapy_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=therapy&key=#{ENV['MAP_API']}"
    uri = URI(therapy_search)
    response = Net::HTTP.get(uri)
    @therapy = JSON.parse(response)
    @therapy_r = @therapy["results"]

    group_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=group&key=#{ENV['MAP_API']}"
    uri = URI(group_search)
    response = Net::HTTP.get(uri)
    @group = JSON.parse(response)
    @group_r = @group["results"]
  end

  private

end
