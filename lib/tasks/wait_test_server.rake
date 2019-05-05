# frozen_string_literal: true

task :wait_test_server do
  system(
    <<-CMD
    attempt_counter=0
    max_attempts=10

    until $(curl --output /dev/null --fail --silent #{ENV['CAPYBARA_APP_HOST']}/healthcheck); do
        if [ ${attempt_counter} -eq ${max_attempts} ];then
          echo "Max attempts of ${max_attempts} reached"
          exit 1
        fi

        printf '.'
        attempt_counter=$(($attempt_counter+1))
        sleep 0.3
    done
    CMD
  )
end
