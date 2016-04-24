class ScreensaverController < ApplicationController
  def index
    @image_url_arr = fetch_images_from_tags.sample(12)
  end

  def new_image
    park = Park.all.sample(1).first
    img_arr = fetch_images(park.insta_tag)
    if img_arr.size == 0
      render json: { img_url: 'NO_SWAP' }
    else
      render json: { img_url: img_arr.sample(1) }
    end
  end

  private
    def fetch_images_from_tags
      parks = Park.all.sample(2)
      image_arr = fetch_images('trailahassee')
      parks.each do |park|
        image_arr.concat(fetch_images(park.insta_tag))
      end
      image_arr
    end

    def fetch_images(tag)
      resp = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}")
      return [] if resp.code != 200
      image_arr = []
      arr = JSON.parse(resp.body)['data']
      arr.each do |img|
        image_arr << img["images"]["standard_resolution"]["url"]
      end
      image_arr
    end
end
