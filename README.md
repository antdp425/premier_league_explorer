# PremierLeagueExplorer

Premier League Explorer provides:
 - access to basic information about all 20 teams in the English Premier League for the current season  
 - a quick look into a teams current position in the league table
 - a quick look at the full league table

## Getting Started

This gem uses the free version of the [FootyStats API](https://footystats.org/api/). 

In order to use this gem:

1. Navigate to the [FootyStats API](https://footystats.org/api/)
2. Click "Register" in the top right corner of the page
3. Create an account
4. Click "Account" and note down your free trial API key (listed under API Settings). The free version of the API will only give you access to (limited) English Premier League API data.

(Within 'api.rb' -- you will need to replace "YOURKEY" on line 5 with the API Key that you noted in Step 4.)

The current URL on line 5 will provide stats for the 2019/20 season. (id:2012)

You can update the URL to a different season by changing the number after 'season_id:=' with the ID of another season from this list: https://api.footystats.org/league-list?key=YOURKEY

(Again, replacing 'YOURKEY' with the key noted in Step 4.)

## Prerequisites

Be sure to install the following gems
```
gem "HTTParty"
gem "json"
gem "terminal-table"
gem 'colorize'
```

## Installation

Add this line to your application's Gemfile:

```ruby

gem 'premier_league_explorer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install premier_league_explorer

## Usage

- At startup, you will be presented with a list of 20 teams.

![List of Teams](https://i.imgur.com/QFRfSMz.png)

- From there, you will be able to enter a number (noted on the left of the team name in brackets).
- Afer entering a number, you will be presented with basic info about the team, as well as info about their current position in the league table.

![Team Facts and Info](https://i.imgur.com/Re0V8zN.png)

- Typing 'menu' will show the team list from startup again.
- Typing 'table' will show the full league table.
- Typing 'exit' will close the application.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/antdp425/premier_league_explorer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/antdp425/premier_league_explorer/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PremierLeagueExplorer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/antdp425/premier_league_explorer/blob/master/CODE_OF_CONDUCT.md).
