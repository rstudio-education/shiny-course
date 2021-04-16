# Hello, and welcome to Building Web Applications with Shiny!

My name is Mine Cetinkaya-Rundel, and this course is an introduction to Shiny, the R package for building interactive web apps straight from R.

In this chapter, we'll begin by introducing the basics of Shiny.

So, let's get to it...

# Here is a Shiny app, one you will be able to build by the end of this course.

We'll go through the technical details of each component of such an app throughout the course, but for now let's take a high level view.
>>> We have a title for the app.
>>> And a series of inputs
>>> Some of these inputs use drop down menus for selection
>>> Some are sliders
>>> Some allow for text input
>>> And some are action buttons
>>> We have a data table output
>>> As well as text output
>>> And a plot output that the user can interactively update
>>> As much as it looks like there is a lot going on in this sample app, the app doesn't even scratch the surface of what you can build with Shiny. I hope you're excited to take it all in!

# But before we get started with Shiny, let's talk background. 

>> This course assumes that you are familiar with R as a programming language.

>> Additionally, this course uses Tidyverse syntax. Using Tidyverse functionality is not a requirement for Shiny, but rather it's a choice we have made in designing the course. Specifically we'll be making heavy use of ggplot2 for plotting and dplyr for data wrangling. 

# The course is designed for beginners and many of the exercises have plenty of scaffolding to help you along the way. 

That being said, there are a few other resources that might help your learning.

>>> The first is the Shiny cheatsheet. This is a handy-dandy cheatsheet that I recommend you keep close by when building Shiny apps.

>>> The second is the Shiny homepage -- shiny.rstudio.com -- it  is the place to go to learn about all things Shiny and to keep up to date with it as it evolves.

# Also, let's go over three very important tips for learning to develop Shiny apps

>>> One: always run the entire script containing the R code, not just up to the point where you’re developing code. For most exercises in this course you will be asked to modify or update existing Shiny code, and even though you might be altering a small portion of the code, you still need to run the entire app code to create the app.

>>> Two: Sometimes the best way to troubleshoot is to run the app and review the error. Not only can the error message be informative, but googling the error message might quickly land you on a solution.

>>> Three: Watch out for commas! This will mean more as you start to learn Shiny, but just keep in mind, a Shiny error can often be caused by a missing comma.

# Alrighty! Let's take a look at the anatomy of a Shiny app

We start by loading any necessary packages, one of which is necessarily shiny.

>>> Then we lay out the user interface with a ui object that controls the appearance of our app.

>>> And we define the server function that contains instructions needed to build the app.

>>> We end each Shiny app script with a call to the shinyApp() function that puts these two components together to create the Shiny app object.

# In this course we will build a simple movie browser app.

>>> We will use data from the movies dataset, which combines data from two websites: the Internet Movie Database, commonly known as IMDB, and Rotten Tomatoes. The observations are a random sample of 651 movies released in the US between 1970 and 2014.

>>> So where does the loading of the data happen in an app?

# Let's revisit the app layout from a couple slides back 

>>> we  load the data before ui and server definitions so that it can be used in both.

# Alright, time for some practice!
