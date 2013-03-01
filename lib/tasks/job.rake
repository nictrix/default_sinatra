require 'progressbar'

namespace :job do
  desc "Generic Job"
  task :generic => :'db:configure_connection' do
    generic_array = [1,2,3,4,5,6,7]

    pbar = ProgressBar.new("Progress", generic_array.length)

    generic_array.each do |n|
      pbar.inc
    end

    pbar.finish
  end
end
