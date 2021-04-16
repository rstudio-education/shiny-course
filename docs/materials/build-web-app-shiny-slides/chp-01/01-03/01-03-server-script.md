# Now that you've had some practice with the UI, it's time to move on to the server function.

# Again, before we get into the details, let's remind ourselves of the anatomy of a Shiny app.

>>> The basic task of the server function is to define the relationship between inputs and outputs.

# Here again is the app that we will be working with in this video. Earlier we saw how to build the UI of this app, and we also noted that each input was tagged with an inputId that can be used to refer to them in the server.

# Here is the server function code for this app.

Once again there is a lot going on here to parse at once, so in the following slides we take a closer look at the function.

# At the outermost layer

>>> we define our server function which takes two arguments: an input and an output. Both of these are named lists. The server function accesses inputs selected by the user to perform computations and specifies how outputs laid out in the UI should be updated. The server function can take on one more argument, session, which is an environment that can be used to access information and functionality relating to the session. However this concept is beyond the scope of this course, so for now we'll stick to server functions that only have input and output arguments.

# Our simple app had only one output, a plot. So our server function contains the logic necessary to build this plot.

>>> the renderPlot function specifies how the plot output should be updated. Let's take a look at what is happening in the renderPlot function first.

# This is good ol' ggplot2 code! So even if you're new to shiny, if you've previously used ggplot2 for plotting in R, this syntax should look familiar to you. One aspect of the syntax that might be new, however, is how the x and y variables are defined. They come from the input list that is built in the UI.

# Here is the relevant ui and server code. Input x and y come from the selectInput widgets, 

>>> and map to the x and y arguments of the plot aesthetics.

# There are three rules of building server functions

>>> One, always save objects to display to the named output list, in other words, something of the form output-dollarsign-plottodisplay
>>> Two, always build objects to display with one of the render functions, like we built our plot with renderPlot
>>> And three, use input values from the named input list, with input-dollarsign-something.

# Just like various inputs, Shiny also provides a wide selection of output types, 

>>> each of which works with a render function.

# For example, in our app 

>>> we used the renderPlot function to build our reactive plot (we'll get to what I mean by reactive in a second) and laid out the plot with the plotOutput function. 

>>> Shiny knows to match these two together as they use the same outputID, scatterplot.

In the following exercises you'll get a chance to work with other render/output function pairs to add more elements to your app.

# Let's also briefly discuss reactivity. 

It’s easy to build interactive applications with Shiny, but to get the most out of it, you’ll need to understand the reactive programming scheme used by Shiny. In a nutshell Shiny automatically updates outputs, such as plots, when inputs that go into them change.

# Before we wrap up this video we should also mention the last component of each Shiny app, which is a call to the aptly named shinyApp function, which puts the ui and the server pieces together to create a Shiny app object.

# Time to put this all into practice!
