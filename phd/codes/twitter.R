install.packages("twitteR", "RCurl", "RJSONIO", "stringr")
library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)
library(ROAuth)
library(httr)
install.packages('base64enc')

# Declare Twitter API Credentials
api_key <- "ShJxozVMZkCHzl5TPXxSx2BFa" # From dev.twitter.com
api_secret <- "nWZngW98SfttXlYIoWitm67paURVOhUF5xLr0LTo8r6MGIRGjE" # From dev.twitter.com
token <- "126607148-BRD3Plqo2jBlYqmo2x6JC1XFbZ47ONoVj9hoKkFp" # From dev.twitter.com
token_secret <- "dsbXnHTbsfzhTlKwg9AoAy5wKEHb5tuQWa0e08w5aIAnf" # From dev.twitter.com

# Create Twitter Connection
setup_twitter_oauth(api_key, api_secret, token, token_secret)
tweets <- searchTwitter("samsung tv worst", n=100, lang="en", since="2014-08-20")
tweets.df <- twListToDF(tweets)
write.csv(tweets.df,"E:/twit.csv")
