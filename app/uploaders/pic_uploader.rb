class PicUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    'pics'
  end
end