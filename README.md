# Codebreaker

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/codebreaker`. To experiment with that code, run `bin/console` for an interactive prompt.

This gem is a game. You should guess the secret code. It this game you have 3 difficulties (:easy, :medium, :hell)

    $ easy: attempts: 15, hints: 2 
    $ medium: attempts: 10, hints: 1 
    $ hell: attempts: 5, hints: 1

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add codebreaker

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install codebreaker

## Usage

Main Class is CoderBreakerGame 

    $ CodeBreaker::CodeBreakerGame

To start game call `start_game`, with params `name: name, difficulty: difficulty` in this method will be generated secret code and game object
Bu using `action` method you can pass commands like `:guess` to call guess method with params `action(:guess, input)` input is you guess code the we be compared to secret code
and will return a string of result

## Example

Create object
`game = CodeBreaker::CodeBreakerGame.new`
Then call method `game.action(:guess, 1234)` fort example out secret code is `1243` so result will be `'+++-'` || `'+'` means the digit is exists and in the same position 
|| `'-'` means the digit is exits but not in the same position || `' '` means there is no digit

## Validation

    Name should be not less then 3 nad 20 in size, should be instance of String and can not be nil
    Input should consist of digits from 1 to 6 and only 4 digit size

## Errors

`NoMethodError` for action method `NoAttemptsLeftError` for `guess` command and `NoHintLeftError` for `receive_hint` command + `ValidatorError` for validation
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/codebreaker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/codebreaker/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Codebreaker project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/codebreaker/blob/master/CODE_OF_CONDUCT.md).
