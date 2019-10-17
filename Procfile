web: bundle exec rackup config.ru -p $PORT
worker: bundle exec shoryuken -q send_email -r ./workers/register_mail_worker.rb -C ./config/shoryuken.yml
