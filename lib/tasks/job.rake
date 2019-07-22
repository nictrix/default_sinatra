# frozen_string_literal: true

require 'progressbar'

namespace :job do
  desc 'Generic Job'
  task :generic do
    generic_array = [1, 2, 3, 4, 5, 6, 7]
    format = '%t: %P |%B| %a'

    pbar = ProgressBar.create(title: 'Progress', total: generic_array.length, format: format)

    generic_array.each do
      sleep rand(0..10)
      pbar.increment
    end

    pbar.finish
  end
end
