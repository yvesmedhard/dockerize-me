# frozen_string_literal: true

shared_context :time_freeze do
  let(:freeze_at) { Time.current }

  around do |test|
    Timecop.freeze(freeze_at.to_time) do
      test.call
    end
  end
end
