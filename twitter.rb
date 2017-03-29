require 'nokogiri'
require 'open-uri'
require 'pp'
class TwitterScrapper
  def initialize(url)
    @url = Nokogiri::HTML(open(url))
  end 

  def extract_username
    profile_name = @url.search(".ProfileHeaderCard-name > a")
    puts "Username: #{profile_name.first.inner_text}"
   
  end

  def extract_tweets
     tweets = @url.search('.tweet')
     tweets.pop
     tweets.map do |tweet|
        time = tweet.css(".content .tweet-timestamp ._timestamp").inner_text
        text = tweet.css(".content .js-tweet-text-container .TweetTextSize").inner_text
        rt = tweet.css('.content .stream-item-footer .ProfileTweet-actionList.js-actions .ProfileTweet-action.ProfileTweet-action--retweet.js-toggleState.js-toggleRt .ProfileTweet-actionButton.js-actionButton.js-actionRetweet .IconTextContainer .ProfileTweet-actionCount').inner_text.strip
        fav = tweet.search('.content .stream-item-footer .ProfileTweet-actionList.js-actions .ProfileTweet-action.ProfileTweet-action--favorite.js-toggleState .ProfileTweet-actionButton.js-actionButton.js-actionFavorite .IconTextContainer .ProfileTweet-actionCount').inner_text.strip
        puts "#{time}: #{text} "
        puts "retweets:#{rt}    favorites: #{fav} "
        
      end
  end

  def extract_stats
    tweets_counter = @url.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-nav > span.ProfileNav-value")
    tweets_counter = tweets_counter.inner_text
    values = @url.search(".ProfileNav-stat.ProfileNav-stat--link.u-borderUserColor.u-textCenter.js-tooltip.js-openSignupDialog.js-nonNavigable.u-textUserColor > span.ProfileNav-value")
    following = values.first.inner_text
    followers = values[1].inner_text
    likes = values[2].inner_text
    puts "Stats: Tweets: #{tweets_counter} Siguiendo: #{following} Seguidores: #{followers} Likes: #{likes}"
    
  end


  def print
    p "*" * 60
     extract_username
    p "*" * 60
     extract_stats
    p "*" * 60
     extract_tweets

  end

end


twitter = TwitterScrapper.new("https://twitter.com/POTUS")
# twitter.extract_username
# twitter.extract_stats
twitter.print