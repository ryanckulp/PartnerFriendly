# PartnerFriendly

Are you a marketer? PartnerFriendly is for you.

When savvy users register for applications, they may append their email with strings like "+yourapp" preceding "@theirdomain.com."

They do this to identify you in the case that they unsolicited email from one of your partners, such as a co-branded marketing newsletter.

PartnerFriendly neutralizes this issue by removing such identifiers, transforming

![Before Validation](https://github.com/ryanckulp/PartnerFriendly/blob/screenshots/screenshots/before-validation.png?raw=true)
--->
![After Validation](https://github.com/ryanckulp/PartnerFriendly/blob/screenshots/screenshots/after-validation.png?raw=true)

upon entry to your database.

## Installation

Add to your application's Gemfile:

```ruby
gem 'partner_friendly'
```

Then execute:

    $ bundle

Or install it yourself as:

    $ gem install partner_friendly

## Usage

In your User model, add:
```
...
    before_validation :clean
...
    def clean
        PartnerFriendly::Process.clean(self)
    end
```

## FAQ

The user may try to trick the system with multiple identifiers,

![Multiple Identifier Example](https://github.com/ryanckulp/PartnerFriendly/blob/screenshots/screenshots/multiple-identifier-example.png?raw=true)

however this just yields:

![After Validation](https://github.com/ryanckulp/PartnerFriendly/blob/screenshots/screenshots/multiple-identifier-error.png?raw=true)

ProTip: opting for before_save or before_create instead of before_validation may throw a nasty database error:

![PG Unique Violation](https://github.com/ryanckulp/PartnerFriendly/blob/screenshots/screenshots/pg-unique-violation.png?raw=true)

In this case, simply rescue from the error with a redirect or existing authentication flash for "user already exists."

## Contributing
Bug reports and pull requests are welcome.
1. Fork it ( http://github.com/ryanckulp/PartnerFriendly/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

