[![Gem Version](https://badge.fury.io/rb/ididthis.svg)] [rubygems] 
[![Build Status](https://travis-ci.org/duckpuppy/ididthis.svg)] [travis]
[![Dependency Status](https://gemnasium.com/duckpuppy/ididthis.svg)] [gemnasium]
[![Code Climate](https://codeclimate.com/github/duckpuppy/ididthis/badges/gpa.svg)] [code_climate]
[![Coverage Status](https://coveralls.io/repos/duckpuppy/ididthis/badge.svg?branch=develop&service=github)] [coveralls]
[![Downloads](https://img.shields.io/gem/dtv/ididthis.svg)]()

[rubygems]: http://badge.fury.io/rb/ididthis
[travis]: https://travis-ci.org/duckpuppy/ididthis
[gemnasium]: https://gemnasium.com/duckpuppy/ididthis
[code_climate]: https://codeclimate.com/github/duckpuppy/ididthis
[coveralls]: https://coveralls.io/github/duckpuppy/ididthis?branch=develop

# ididthis

`ididthis` is a command-line utilty for posting and viewing dones on [iDoneThis] [idonethis].

## Installation

    $ gem install ididthis

## Usage

A list of commands for `ididthis` can be seen by running

    $ ididthis help

Addtional help for a command can be show by running

    $ ididthis help COMMAND

`ididthis` supports only what the current [iDoneThis API] [idonethis_api] allows.  As newer releases of the API are developed, this gem will update to take advantage of the newer functionality.
Noticably missing from the API currently are methods for manipulating existing dones.

## Development

After checking out the repo, run `bundle install` to install dependencies. 
Then, run `rake rspec` to run the tests. You can also run `rake console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version if one
doesn't exist, push git commits and tags, and push the `.gem` file to 
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/duckpuppy/ididthis. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[idonethis]: https://idonethis.com
[idonethis_api]: https://idoneths.com/api
