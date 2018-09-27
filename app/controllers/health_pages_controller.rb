class HealthPagesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'
  require 'geocoder'

  def search
    search = params[:search]
    url = "https://healthfinder.gov/api/v2/topicsearch.json?api_key=#{ENV['HEALTH_API']}&Keyword=#{search}"
    # net
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @data = JSON.parse(response)
    # http
    # response = HTTParty.get(url)
    # @data = response.parsed_response
    if @data["Result"]["Total"] == "0"
      @results = "We apologize but there is no information available for this topic."
      @internet = "https://www.google.com/search?&q=" + "#{search}"
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

    @c_urls = []
    counseling_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=counseling&key=#{ENV['MAP_API']}"
    uri = URI(counseling_search)
    response = Net::HTTP.get(uri)
    @counseling = JSON.parse(response)
    @counseling_r = @counseling["results"]

    @counseling_r.first(10).each do |s|
    search = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{s['place_id']}&fields=name,rating,formatted_address,url&key=#{ENV['MAP_API']}"
    uri = URI(search)
    response = Net::HTTP.get(uri)
    urls = JSON.parse(response)
    results = urls["result"]
    @c_urls << results["url"]
    end

    @psycha_urls = []
    psychiatrist_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=psychiatrist&key=#{ENV['MAP_API']}"
    uri = URI(psychiatrist_search)
    response = Net::HTTP.get(uri)
    @psychiatrist = JSON.parse(response)
    @psychiatrist_r = @psychiatrist["results"]

    @psychiatrist_r.first(10).each do |s|
    search = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{s['place_id']}&fields=name,rating,formatted_address,url&key=#{ENV['MAP_API']}"
    uri = URI(search)
    response = Net::HTTP.get(uri)
    urls = JSON.parse(response)
    results = urls["result"]
    @psycha_urls << results["url"]
    end

    @psycho_urls = []
    psychologist_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=psychologist&key=#{ENV['MAP_API']}"
    uri = URI(psychologist_search)
    response = Net::HTTP.get(uri)
    @psychologist = JSON.parse(response)
    @psychologist_r = @psychologist["results"]

    @psychologist_r.first(10).each do |s|
    search = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{s['place_id']}&fields=name,rating,formatted_address,url&key=#{ENV['MAP_API']}"
    uri = URI(search)
    response = Net::HTTP.get(uri)
    urls = JSON.parse(response)
    results = urls["result"]
    @psycha_urls << results["url"]
    end

    @t_urls = []
    therapy_search = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=16093&type=doctor&keyword=therapy&key=#{ENV['MAP_API']}"
    uri = URI(therapy_search)
    response = Net::HTTP.get(uri)
    @therapy = JSON.parse(response)
    @therapy_r = @therapy["results"]

    @therapy_r.first(10).each do |s|
    search = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{s['place_id']}&fields=name,rating,formatted_address,url&key=#{ENV['MAP_API']}"
    uri = URI(search)
    response = Net::HTTP.get(uri)
    urls = JSON.parse(response)
    results = urls["result"]
    @t_urls << results["url"]
    end

  end

  private

end
