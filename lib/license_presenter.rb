class LicensePresenter < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do

    def licenses
      data.licenses
    end

    def license_preview_path(license, size=:small)
      if license
        case size
          when :small then image_path "licenses/previews/#{license.file_name}"
          when :big then image_path "licenses/#{license.file_name}"
        end
      end
    end

  end
end


::Middleman::Extensions.register(:license_presenter, LicensePresenter)
