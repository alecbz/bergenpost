class UploadController < ApplicationController
  before_filter :authenticate
  
  def index
    service = S3::Service.new(:access_key_id => "AKIAJLTKW3PD7BMZUNBQ", :secret_access_key => "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")
    bucket = service.buckets.find("alecbenzer")
    @files = bucket.objects
  end
  
  def save
    service = S3::Service.new(:access_key_id => "AKIAJLTKW3PD7BMZUNBQ", :secret_access_key => "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")
    bucket = service.buckets.find("alecbenzer")
    
    fname = File.basename(params[:upload]['file'].original_filename)
    fname.sub!(/[^\w\.\-]/, '_')
    
    new_object = bucket.objects.build(fname)
    types = MIME::Types.type_for(fname)
    if types.empty?
      new_object.content_type = "text/plain"
    else
      new_object.content_type = types.first.content_type
    end
    new_object.content = params[:upload]['file'].read
    new_object.save
    redirect_to '/upload/'
    

    
    # df = DataFile.new
    # df.name = fname
    # df.data = Marshal.dump("Hello World\n")
    # df.data = params[:upload]['file']
    #
    #if df.save
    #  redirect_to "/uploads/" + df.name
    #else
    #  render :text => "error saving file"
    #end
    # path = File.join('public/uploads',name)
    # f = begin File.new(path, "r+") rescue nil end
    # if f
    #   f.close
    #   render :text => 'File ' + name + ' already exists. Please use a different filename.'
    # else
    #   File.open(path, "wb") { |file| file.write(params[:upload]['file'].read.to_s) }
    #   redirect_to "/uploads/" + name
    # end
    
    # File.open(path, "wb") { |f| f.write(params[:upload]['file'].read) }
  end
  
  #def show_file
  #  file = nil
  #  if params[:name] and params[:extension]
  #    file = DataFile.find_by_name(params[:name] + '.' + params[:extension])
  #  elsif params[:name]
  #    file = DataFile.find_by_name(params[:name])
  #  elsif params[:id]
  #    file = DataFile.find(params[:id])
  #  end
  #  
  #  if file.nil?
  #    render :text => 'could not find file'
  #  else
  #    name = File.join('tmp',file.name)
  #    # File.open(name,"wb") { |f| f.write(Marshal.load(file.data)) }
  #    File.open(name,"wb") { |f| f.write(file.data) }
  #    render :file => name
  #  end
  #end
  
  def authenticate  
    authenticate_or_request_with_http_basic do |name, password|
      name == "admin" && Digest::SHA1.hexdigest(password) == "8e11fefdde5ec716ad061d48b24f18fb44e6ab17"
    end
  end
end
