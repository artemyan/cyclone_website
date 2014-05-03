class License

  attr_reader :title, :description, :file_url, :preview_url

  def initialize(license)
    @licenses = license
    @title = license['title'].html_safe
    @description = license['description'].html_safe
    @pdf_url = generate_file_url(license['file_name'])
    @preview_url = generate_preview_url(license['preview_name'])
  end


  def generate_file_url(name)
    "/system/licenses/files/#{name}" if name
  end

  def generate_preview_url(name)
    "/system/licenses/previews/#{name}" if name
  end



end