require 'nokogiri'
require 'open-uri'

class CruiseInformationExtractor
  def initialize(html)
    @doc = Nokogiri::HTML(html)
  end

  def extract_dom_content(selector)
    content = ""
    @doc.css(selector).each do |elem|
      content = elem.content()
      content.strip!
      break
    end
    content
  end

  def get_cruiseline
    extract_dom_content('.reederei')
  end

  def get_ship
    ship_and_company = extract_dom_content('#route-schiff h4 span')
    ship_and_company = ship_and_company.split(/ \(/)
    ship_and_company[0]
  end

  def get_cruise_title
    extract_dom_content('.header h1')
  end
end