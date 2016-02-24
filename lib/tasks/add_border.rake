require 'rmagick'
require 'open-uri'
namespace :add_border do
  
  
  desc "add_border"
  task "add_border" => :environment do
    
    image = Magick::ImageList.new  
    urlimage = open("http://davehin.es/Untitled-1.png") # Image Remote URL 
    image.from_blob(urlimage.read)
    this = image[0].border(20,20,"#000000") 
    watermark_text = Magick::Draw.new
    watermark_text.annotate(this, 250,10,650,15, "Hines Dealership") do
      self.pointsize = 14
      self.font = 'Arial'
      self.fill = 'white'
    end
    
    this.write('1.png')
    
  end
  
  
end
