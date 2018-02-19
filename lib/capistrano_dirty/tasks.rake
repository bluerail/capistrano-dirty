namespace :capistrano_dirty do
  desc 'checks for dirty strings in the codebase'
  task :check do
    pattern_match = CapistranoDirty.dirty?

    raise pattern_match.to_s if pattern_match
  end
end
