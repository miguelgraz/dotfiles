# Encoding: utf-8

# Raw script to iterate through folders and set the musics' tag
# artist and title based on the filename

# http://robinst.github.io/taglib-ruby/
require 'taglib'

path = '/home/miguelgraz/Music/'
folders = []
folders << 'Classica'
folders << 'Dance'
folders << 'Funk Pagode Rap Samba Sertanejo'
folders << 'Gauchas'
folders << 'Grooveshark'
folders << 'Metal'
folders << 'MPB'
folders << 'Outros'
folders << 'Pop'
folders << 'Rock Internacional'
folders << 'Rock Nacional'

folders.each do |folder|
  Dir.entries("#{path}#{folder}").each do |f|
    next if ['.', '..'].include?(f)
    TagLib::MPEG::File.open("#{path}#{folder}/#{f}") do |file|
      tag = file.id3v2_tag(true)
      artist, title = f.gsub(folder, '').gsub('.mp3', '').split(' - ', 2)
      tag.artist = artist
      tag.title = title
      file.save
      puts tag.artist
      puts tag.title
      puts '==================================='
    end
  end
end
