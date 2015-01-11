require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)

# TODO: to be more sophisticated
require 'jobs/post_image_job'

require 'clockwork'

include Clockwork

every(5.minutes, "Post most recent image") { PostImageJob.post_image(5) }
