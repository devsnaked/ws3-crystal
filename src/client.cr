require "http/client"

class Crawler
  def initialize(token : String, dr_list : Array(String))
    @token = token
    @dr_list = dr_list
    @url = "http://ws3.sistemaindustria.org.br:9443"
  end

  def download(dr : String)
      puts path!(dr)
      client = HTTP::Client.new @url
      puts client
      client.get path!(dr), headers: headers! do |response|
        puts response
      end
  end

  def download
    puts "Download started..."
    self.download "AL"
  end

  def headers!
    HTTP::Headers{
      "Accept"        => "application/json, text/plain, */*",
      "Content-Type"  => "application/x-www-form-urlencoded",
      "Authorization" => "Bearer #{@token}",
    }
  end

  def path!(dr : String)
    "/api-basi/v1/epmat/dr/#{dr}/alunos/"
  end



end

crawler = Crawler.new("tokenWtf", ["AL"])
crawler.download()

