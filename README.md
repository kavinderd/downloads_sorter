# DownloadsSorter

Ahhhhhhh! My downloads folder has about 10,000 files in it. It's such a mess. I don't want to manually go through this so I'll use the might DownloadsSorter gem to do that for me.

This gem goes through a specified folder (I build this for my Downloads folder, but could be anything) and moves certain file types to file types. This means PDFs and Docs go to a Documents folder, PNGs and JPEGS to an Images folder and so on.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'downloads_sorter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install downloads_sorter

## Usage

From your command line call `dl_sort` and a file path to sort:

```ruby
dl_sort /Users/Me/Downloads
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/downloads_sorter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
