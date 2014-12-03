FactoryGirl.define do
  factory :command_source do
    user_id 1
    class_type "Module::MyClass"
    body "h" * 125
  end

end
