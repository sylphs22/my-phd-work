install.packages("Rfacebook")
install.packages("httpuv")
install.packages("RColorBrewer")
install.packages("RCurl")
install.packages("rjson")
install.packages("httr")

library(Rfacebook)
library(httpuv)
library(RColorBrewer)
library(RCurl)
library(rjson)
library(httr)

myaccess_token = "CAACEdEose0cBAMDKvo79ecP5sBieVLZC9wmd6ZBvZBu5kZAJi7t1gUjXGubrFlND4HF3rZApbPXRvErpCVlVPgrO6wraa59mDUYRL7nnHVxYZBpoaIXkdZCEWDWPknr1k4Nzp1UZAwnlrVXRK3aXpbZB2SrhWpQ7PyJBaUYn7vA8xLn6kFmcq6outvEzzff6MdmhPuGKArjIGLJSWZCZAgQ7h0R"
options(RCurlOptions=list(verbose=FALSE, capath=system.file("CurlSSL","cacert.pem", package="RCurl"),ssl.verifypeer=FALSE))
me<- getUsers("me", token=myaccess_token)
me
my_friends <- getFriends(token=myaccess_token, simplify=T)
str(my_friends)
table(my_friends)
my_friends
