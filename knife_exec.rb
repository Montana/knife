require 'chef/knife'
require 'chef/shef/ext'

abort("usage: knife exec setrevision APP NODE REVISION") unless ARGV[2]

begin
  nodes.find(:name => ARGV[3]).each do |n|
    case ARGV[2]
    when 'haystack'
      n['haystack']['revision'] = ARGV[4]
      begin
        if n.save
          puts "Set haystack.revision to #{ARGV[4]} on node #{n['name']}."
        end
      rescue => e
        puts "Failed to modify node #{n['name']}: #{e.inspect}"
      end
    when 'core'
      n['core']['revision'] = ARGV[4]
      begin
        if n.save
          puts "Set core.revision to #{ARGV[4]} on node #{n['name']}."
        end
      rescue => e
        puts "Failed to modify node #{n['name']}: #{e.inspect}"
      end
    else
      puts "Did not recognize #{ARGV[2]} as a valid application."
      exit 1
    end
  end
rescue => e
  puts "Error encountered when searching for node #{ARGV[3]}: #{e.inspect}"
end

exit 0
