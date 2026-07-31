;; extends

; RSpec DSL calls, highlighted separately so they can be colored green
; regardless of the colorscheme's normal method-call color.
((call
  method: (identifier) @keyword.rspec.ruby)
  (#any-of? @keyword.rspec.ruby
    "describe" "context" "it" "specify" "example"
    "before" "after" "around"
    "let" "let!" "subject" "subject!"
    "shared_examples" "shared_examples_for" "shared_context"
    "include_examples" "include_context"
    "it_behaves_like" "it_should_behave_like"
    "expect" "allow" "allow_any_instance_of" "expect_any_instance_of"
    "feature" "scenario" "background"))
