Example Depot application from [Agile Web Development with Rails 4][1]

Thoughts as I go through the example application.

Product controller functional tests
------------------------------------
I added more tests to the product controller per the playtime section in chapter 8.
* Verifying that product description is getting truncated to 80 characters or less.
I spent a lot of time searching around for a way to strip the HTML tags from the HTML::Tag object that is returned from the css_select method.
I finally ended up including ActionView::Helpers::SanitizeHelper and using the strip_tags method.
This seems overkill for just removing simple HTML tags.
Is it possible to de something like 'css_select("dd").map { &:text )' and I'm just not seeing it?

For caching example see the [turn-on-caching branch][2].

[1]: http://pragprog.com/book/rails4/agile-web-development-with-rails-4
[2]: https://github.com/dacamo76/depot/tree/turn-on-caching
