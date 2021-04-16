# Earlier in the course we mentioned that the ui is ultimately built with HTML. We actually use R functions to make the ui, but they get translated to HTML. In this chapter we build on this idea to develop more complex app interfaces. More specifically, we discuss tags. 

# Shiny comes with a list of functions saved under tags that allow us to access HTML tags and use them to add static (as opposed to reactive) content to our apps. The tags object in shiny is a list of 110 simple functions for constructing HTML documents. 
>>> Each of the elements in this list is a function that maps to an HTML tag.

# For example, let's use the b tag, which is used for bolding text in HTML. The function is tags-dollarsign-b. We can pass a text string, in quotation marks, to this function, like "This is my first app". Then R translates the text string to HTML.

# So how would we use these tags in building an app? 
>>> We might use the various levels of headers if it makes sense for me to have subheadings in my app. 
>>> For example tags-h1-first level heading, tags-h2-second level heading, tags-h3-third level heading, etc.

# If we have references we want to link to at the bottom of my app, we can use the a tag with the href argument for specifying a URL.

# We can also nest tags within each other to create something like a new paragraph with the p tag and some text in that paragraph where certain words are italicized with the em tag and certain are bolded with the b tag.

# Additionally, the most commonly used tags are wrapped in their own functions and you can use them without the tags list. 
>>> These are functions like a for anchor text, 
>>> br for a line break, 
>>> code for displaying code in monospace form, and
>>> the heading functions we mentioned earlier. 
The function names correspond to the tag names, and the functions accept text strings as arguments. For example tags-h1-first level heading is equivalent to h1-first level heading.

# If you're comfortable with HTML, an alternative is to directly use HTML syntax and wrap your HTML code with the HTML function.

# Next, let's work on some exercises on adding HTML elements to our apps to customize its appearance.
