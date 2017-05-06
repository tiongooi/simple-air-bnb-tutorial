class PagesController < ApplicationController
  def index
  end

  def contact
  end

  def gallery
      @images = [['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle'],
          ['https://unsplash.it/200','subtitle']
          ]

          @items = ["car", "truck", "tank"]
  end
end
