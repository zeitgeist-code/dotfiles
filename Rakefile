# script is inspired by http://github.com/ryanb/dotfiles/blob/master/Rakefile
# of the incredible Ryan Bates

require 'rake'

task :default => [:install]

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir.glob('*',File::FNM_DOTMATCH).each do |file|
    next if %w[. .. Rakefile .git].include? file
    
    if File.exist? file
      if replace_all 
        replace_file(file)
      else
        print "overwrite ~/#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end
 
def replace_file(file)
  system "rm ~/#{file}"
  link_file(file)
end
 
def link_file(file)
    puts "linking ~/#{file}"
    system "ln -s $PWD/#{file} ~/#{file}"
end

