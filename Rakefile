# encoding: UTF-8

require 'bundler/gem_tasks'
require 'zip'
require 'httparty'
require 'fileutils'

desc 'Download latest sass from sigbit-admin repo'
task :update do
  Zip.on_exists_proc = true # Allow override of files

  DEST_SASS_FOLDER = 'assets/stylesheets/'.freeze
  DEST_JS_FOLDER = 'assets/javascripts/'.freeze
  SASS_FOLDER = 'sigbit-admin-master/public/sass/'.freeze
  JS_FOLDER = 'sigbit-admin-master/public/js/'.freeze
  FILE_REGEX = /.*(sass|js)\/(.*)/

  puts "Downloading latest repo..."
  input = HTTParty.get("https://github.com/significantbit/sigbit-admin/archive/master.zip").body

  puts "Removing old folders..."
  FileUtils.rm_rf(DEST_SASS_FOLDER)
  FileUtils.rm_rf(DEST_JS_FOLDER)

  Zip::File.open_buffer(StringIO.new(input)) do |io|
    io.each do |f|
      if f.name.include?(SASS_FOLDER)
        extract_file(io, DEST_SASS_FOLDER, f)
      elsif f.name.include?(JS_FOLDER)
        extract_file(io, DEST_JS_FOLDER, f)
      end
    end

  end

end


def extract_file(io, destination, file)
  fpath = File.join(destination, file.name[FILE_REGEX, 2])
  puts "Updating: #{fpath}"
  io.extract(file, fpath)
end
