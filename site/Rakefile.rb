PROD_SSH_USER = 'sxtxixtxcxh'
PROD_SSH_HOST = 'm.auayan.com'
PROD_SSH_DIR  = '/home/sxtxixtxcxh/m.auayan.com/public'

STAGING_SSH_USER = 'sxtxixtxcxh'
STAGING_SSH_HOST = 'm.auayan.com'
STAGING_SSH_DIR  = '/home/sxtxixtxcxh/m.auayan.com/public'

desc "Build the website from source"
task :build do
 puts "## Building website"
 status = system("middleman build --clean")
 puts status ? "OK" : "FAILED"
end

desc "Run the preview server at http://localhost:4567"
task :preview do
 system("middleman server --livereload")
end

namespace :deploy do
 desc "Deploy website via rsync to production"
 task :production => [:build] do
   puts "## Deploying website via rsync to #{PROD_SSH_HOST}"
   status = system("rsync -avze 'ssh' --delete build/ #{PROD_SSH_USER}@#{PROD_SSH_HOST}:#{PROD_SSH_DIR}")
   puts status ? "OK" : "FAILED"
 end

 desc "Deploy website via rsync to staging"
 task :staging  => [:build]do
   puts "## Deploying website via rsync to #{STAGING_SSH_HOST}"
   status = system("rsync -avze 'ssh' --delete build/ #{STAGING_SSH_USER}@#{STAGING_SSH_HOST}:#{STAGING_SSH_DIR}")
   puts status ? "OK" : "FAILED"
 end
end