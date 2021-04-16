# In this video we discuss why we use reactives.

# In the previous exercises we were able to reuse our subsetted data frame in multiple places in the server after defining it once as a reactive expression.

>>> In general, reactive conductors help you avoid copy-and-paste code and let you not repeat yourself, 
and they also help decompose large and complex calculations into smaller pieces.

>>> These benefits are similar to what happens when you decompose a large complex R script into a series of small functions that build on each other

# Whike functions and reactives help accomplish similar goals in terms of not-repeating oneself, they're different in implementation. 

>>> Each time you call a function, R will evaluate it.

>>> However reactive expressions are lazy, they only get executed when their input changes. This means that even if you call a reactive expression multiple times in your app, it will only re-execute when its inputs change.

# Using many reactive expressions in your app can create a complicated dependency structure in your app.

>>>  The reactlog is a graphical representation of this dependency structure, and it also gives you very detailed information about what’s happening under the hood as Shiny evaluates your application.

>>> To view the reactlog, start a fresh R session, and run options shiny reactlog TRUE,
>>> then launch your app as you normally would
>>> and in the app press Ctrl+F3

# The reactlog for the app we developed in the previous video looks like this. It uses the icons for reactive sources, conductors, and endpoints that we saw earlier in the course.

>>> Outputs are visualized as endpoints 
>>> while inputs are sources. 
>>> And the movies_subset reactive expression is a connector.

This visualization also makes it easy to view the inputs the reactive expression depends on.

# Alright, on to more practice with reactive programming.

