# frozen_string_literal: true

Before do
  $driver.start_driver
end

After do
  $driver.driver_quit
  $logger.info('Finish test')
end