# README

This is very simple API for parse URL and store content from parsing results.

Here two points -

* POST `/pages`. Input parameter - `page: {url: 'www.example.com'}`. It will return parsed results.

* GET `/page` . Input parameter - `url: 'www.example.com'` or `id: '2'`. It will return parsed results for found page.
