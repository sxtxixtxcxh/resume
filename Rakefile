require 'nanoc3/tasks'

%w{yaml}.each{|lib| require lib}
# a rake task to copy any css and javascript 
# files over to the webroot output directory

config  = YAML.load(File.open("config.yaml"))

def path_tree(path,to_copy=[])
  tree = []
  Dir.glob("#{path}/*").each do |path|
    if File.directory?(path)
      tree << path_tree(path)
    else
      tree << path 
      path_tree(path)
    end 
  end 
  tree.flatten
end

task :default do
  config["asset_dirs"].each do |search_dir| 
    path_tree(search_dir).each do |asset|
      # Some vars
      from  = asset
      to    = [config["output_dir"],asset].join("/")
      # Create dir for file, if necessary; 
      # e.g., for /path/to/file.txt
      # create /path/to, if need be
      if !File.exist?(File.dirname(to))
        puts "mkdir -p #{File.dirname(to)}"
        FileUtils.makedirs(File.dirname(to))
      end 
      # Copy the file over, but only if it's changed or doesn't already exist
      if !File.exist?(to) || !FileUtils.compare_file(from,to)
        puts "cp #{from} #{to}"
        FileUtils.copy(from,to)
      end 
    end 
  end 
end