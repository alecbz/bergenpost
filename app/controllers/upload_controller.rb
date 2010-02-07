class UploadController < ApplicationController
  before_filter :authenticate

  def index
    render :file => 'app/views/upload/index.html.erb'
  end
  
  def save
    name = File.basename(params[:upload]['file'].original_filename)
    name.sub!(/[^\w\.\-]/, '_')
    path = File.join('public/uploads',name)
    File.open(path, "wb") { |f| f.write(params[:upload]['file'].read) }
    render :text => "Your file has been uploaded as /uploads/" + name
  end
  
  def authenticate  
    authenticate_or_request_with_http_basic do |name, password|
      name == "admin" && Digest::SHA1.hexdigest(password) == "8e11fefdde5ec716ad061d48b24f18fb44e6ab17"
    end
  end
end
