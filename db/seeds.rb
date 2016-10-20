require 'nokogiri'
require 'open-uri'

def save_page(url)
  html = open(url)
  Nokogiri::HTML(html)
end

def extract_and_create_card(doc)
  doc.xpath('.//table/tbody/tr').each do |tr|
    german_word = tr.xpath('.//td[@class="bigLetter"]').text.strip.to_s
    english_word = tr.xpath('.//td')[2].text.strip.to_s    
    Card.create!(original_text: german_word, translated_text: english_word, review_date: Date.today)
  end
end

doc = save_page('http://www.languagedaily.com/learn-german/vocabulary/common-german-words')

extract_and_create_card(doc)

links_of_pages = []
doc.xpath('.//div[@class="jsn-article-content"]/ul/li/a/@href').each do |href|
  links_of_pages << 'http://www.languagedaily.com' + href
end

links_of_pages.each do |link|
  doc = save_page(link)
  extract_and_create_card(doc)
end
