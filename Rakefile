# encoding: UTF-8

require 'bundler/gem_tasks'
require 'zip'
require 'httparty'
require 'fileutils'

desc 'Download latest sass from sigbit-admin repo'
task :update do
  Zip.on_exists_proc = true # Allow override of files

  DEST_FOLDER = 'assets/stylesheets/'.freeze
  SASS_FOLDER = 'sigbit-admin-master/public/sass/'.freeze
  FILE_REGEX = /.*sass\/(.*)/

  puts "Downloading latest repo"
  input = HTTParty.get("https://github.com/significantbit/sigbit-admin/archive/master.zip").body
  FileUtils.rm_rf(DEST_FOLDER)
  
  Zip::File.open_buffer(StringIO.new(input)) do |io|
    io.each do |f|
      if f.name.include? SASS_FOLDER
        fpath = File.join(DEST_FOLDER, f.name[FILE_REGEX, 1])
        puts "Updating: #{fpath}"
        io.extract(f, fpath)
      end
    end
  end
end
