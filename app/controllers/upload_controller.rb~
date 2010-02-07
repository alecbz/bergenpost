class UploadController < ApplicationController
  before_filter :authenticate
  
  def index #method should be here so before_filer works
    @files = []
    Dir.foreach('public/uploads/') do |filename|
      @files << filename unless filename[0].chr == '.'#if File.file? filename
    end
  end
  
  def save
    name = File.basename(params[:upload]['file'].original_filename)
    name.sub!(/[^\w\.\-]/, '_')
    path = File.join('public/uploads',name)
    f = begin File.new(path, "r+") rescue nil end
    if f
      f.close
      render :text => 'File ' + name + ' already exists. Please use a different filename.'
    else
      File.open(path, "wb") { |file| file.write(params[:upload]['file'].read) }
      redirect_to "/uploads/" + name
    end
    
     #File.open(path, "wb") { |f| f.write(params[:upload]['file'].read) }
  end
  
  def authenticate  
    authenticate_or_request_with_http_basic do |name, password|
      name == "admin" && Digest::SHA1.hexdigest(password) == "8e11fefdde5ec716ad061d48b24f18fb44e6ab17"
    end
  end
end
