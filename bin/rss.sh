#!/usr/bin/env sh

pandoc-rss $(find . -type f -name "*.html" | sort -g -t '/' -k 3 -r)> site/rss.xml

PREFIX=$(cat <<-END
  <?xml version="1.0" encoding="UTF-8" ?>
  <?xml-stylesheet href="./rss.xsl" type="text/xsl"?>
  <rss version="2.0">
  <channel>
    <title>Reading List</title>
    <link>https://reading.takashiidobe.com</link>
  <description>Books I've read</description>
END
)

# prefix
echo $PREFIX | cat - site/rss.xml | sponge site/rss.xml

# suffix
echo "</channel></rss>" >> site/rss.xml
