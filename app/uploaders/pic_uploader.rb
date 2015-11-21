class PicUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    'uploads/pics'
  end

  process resize_to_fit: [800, 800]

end