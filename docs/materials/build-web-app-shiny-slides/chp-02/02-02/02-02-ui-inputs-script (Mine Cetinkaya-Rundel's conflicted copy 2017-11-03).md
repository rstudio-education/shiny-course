# The goal of this video is to build familiarity with a few UI input functions.

# Once again, we'll build on our simple movie browser app.

# Shiny provides a wide selection of input widgets. The Shiny cheatsheet is a great place to review a list of them all at once, and once you know which one you want to use, you can find out more about it in the package documentation. You'll also get a chance to work with some of them in the following exercises.

# Let's start with a checkboxInput. 

Suppose we want to add a checkbox input to our app to specify whether the data plotted should be shown in a data table. We need to make three modifications to our app to accomplish this.

>>> One, in the ui, add an input widget that the user can interact with to check/uncheck the box.

>>> Two, again in the ui, add an output to the UI defining where the data table should appear.

>>> Three, in the server, add a reactive expression that creates the data table if the checkbox is checked.

We'll go through these steps one by one.

# Let's start with the checkboxInput widget:

>>> The first argument is the inputId, which we can define to be anything we want, but short and informative names are the best. 
>>> Next is the label, which is the user facing description of the widget. 
>>> And last is the value, the initial value of the widget. TRUE means the box is initially checked. If you want it to not be checked initially, you'd set it to FALSE instead. 

# A cautionary tale before we move on -- watch for your commas! Remember that this widget definition goes in the sidebarPanel. In this panel we separate out widgets with commas. For example, the first is the selectInput widget for x, 
>>> then we have a comma,
>>> then another selectInput and another comma,
>>> then our new checkboxInput, and no comma after it since it's the last item in the list.

# Second step is to add an output to the UI defining where the data table should appear. We'll use the dataTableOutput function from the DT package. This function takes one argument, the outputId. Again, you can define the outputId to be anything you want, but short and informative names are the best.

# Lastly, in our server, we describe how this table should be calculated. We use the renderDataTable function from the DT package to describe how this table should be built. The first line of  in the render function is an if statement, telling the app to only build the table if input$show_data is TRUE. We also specify some other arguments to datatable, mostly for cosmetic reasons.

# Here is the resulting app, with the box checked,

# and here it is with the box unchecked.

# A quick note on scoping: We saw that the data loaded on top of the Shiny app, outiside of ui and server definitions, is visible to the server. That's how we were able to plot the data simply by referring to the data frame by name. The data frame is actually also visible to the UI as well. So our UI inputs could be defined programmatically based on attributes of the data.

>>> Here is an example for this,  not with an interactive widget but instead with a static HTML statement. 

# Time for practice!



