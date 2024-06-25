class LoggingJob
  include Sidekiq::Job

  def perform(*args)
    p 'Started logging...'
    p 'This is first log'
    sleep 1
    p 'This is second log'
    sleep 5
    p 'This is final log'
  end
end
