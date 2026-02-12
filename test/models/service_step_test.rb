require "test_helper"

class ServiceStepTest < ActiveSupport::TestCase
  test "valid step" do
    assert service_steps(:step1).valid?
  end

  test "requires title" do
    step = ServiceStep.new(service: services(:clearance), step_number: 1)
    assert_not step.valid?
  end

  test "requires step_number" do
    step = ServiceStep.new(service: services(:clearance), title: "Do thing")
    assert_not step.valid?
  end

  test "ordered by step_number" do
    steps = services(:clearance).service_steps
    assert_equal 1, steps.first.step_number
  end
end
