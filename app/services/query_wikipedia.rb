require 'wikipedia'

# Service to access the Wikipedia API to get some info about the places

class QueryWikipedia
  def initialize(place)
    # Search by 'city, state/province' if it's in the US, Canada, Australia, or China; else search by 'city, country'
    country = place.iso2
    if country == 'US' || country == 'CA' || country == 'AU' || country == 'CN'
      @page = Wikipedia.find("#{place.city}, #{place.province}")
    else
      @page = Wikipedia.find("#{place.city}, #{place.country_name}")
    end
  end
  
  # get the URL for the Wikipedia page for the place
  def get_url
    return @page.fullurl
  end
  
  # get the summary from the Wikipedia page on the place and display it on the page, but if the summary is empty, show a random travel quote instead
  def get_summary
    if @page.summary == ''
      return quotes.sample
    end
    return @page.summary
  end
  
  # Travel quotes to be used when Wikipedia doesn't bring back any summary
  # Quotes from lists here: https://expertvagabond.com/best-travel-quotes/ and here: https://www.huffingtonpost.com/jinna-yang/20-of-the-most-inspiring-_b_8856096.html
  quotes = ["Travel doesn't become adventure until you leave yourself behind. - Marty Rubin",
    "Life begins at the end of your comfort zone. - Anonymous",
    "It's better to see something once than to hear about it a thousand times. - Anonymous",
    "Travel makes one modest. You see what a tiny place you occupy in the world. - Gustave Flaubert",
    "It feels good to be lost in the right direction. - Anonymous",
    "For my part, I travel not to go anywhere, but to go. I travel for travel’s sake. The great affair is to move. - Robert Louis Stevenson",
    "Traveling – it leaves you speechless, then turns you into a storyteller. - Ibn Battuta",
    "To travel is to discover that everyone is wrong about other countries. - Aldous Huxley",
    "When overseas you learn more about your own country, than you do the place you’re visiting. - Clint Borgen"]
  
end