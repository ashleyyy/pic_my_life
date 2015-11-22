class PicUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    'uploads/pics'
  end

end