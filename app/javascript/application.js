// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
require("@rails/ujs").start()
require("turbolinks"),start()
require("@rails/activestorage").start()
require("channels")
reqiure("../card")
require("jquery")

import "@hotwired/turbo-rails"
import "controllers"
