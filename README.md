Example how to turn on caching
==================================

Test1
-----
To test caching, in the store view (index.html.erb) make changes inside the caching directives.
Refreshing the store index should not display the changes.
Got to the products page and edit a product.
Returning to the store index page, the page should now display the changes.
 
Test2
-----
In the store view, make changes outside of the caching directives.
These changes should be displayed immediately when the store index page is refreshed.
