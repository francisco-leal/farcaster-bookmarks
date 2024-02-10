class ProcessLatestCastsJob < ApplicationJob
  queue_as :default

  def perform
    return if AppSetting.first.casts_processing

    puts "Running"
  end
end