require "rspec/core/rake_task"

desc "Run those specs"
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w{--colour --format doc}
    t.pattern = 'spec/*_spec.rb'
  end
end
