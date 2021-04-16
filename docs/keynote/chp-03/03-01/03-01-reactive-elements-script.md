# In this video we discuss reactivity in a bit more detail.

# There are three kinds of objects in reactive programming: reactive sources, conductors, and endpoints. We're going to denote them with these symbols.

# A reactive source is typically a user input that comes through a browser interface,

>>> while a ractive endpoint is something that appears in the user’s browser window, such as a plot or a table

>>> A reactive source can be connected to multiple endpoints, and vice versa. For example we might have a UI input widget to make a selection of our data, and the selected data can be used in multiple outputs like plots and summaries.

# Reactive conductor is a reactive component between a source and an endpoint 

>>> It can both be a dependent, in other words, be a child, and have dependents, in other words, be a parent
>>> On the other hand, sources can only be parents,
>>> And endpoints can only be children

# To illustrate reactivity we're going to start with this app once again

# And end up with an app 
>>> that lets the user subset the data by movie type
>>> updates the plot for those selected movie types
>>> and display some text noting the number of movies in the selection

The subsetted movies dataframe gets used in two places, plot and text outputs. Hence, we we're going to make use of reactive expressions to build this app.

# First, we add a UI element for the user to select movie type with selectInput.

>>> we define an inputId that we'll use to refer to the input element to later in the app, 
>>> we come up with a user facing label, 
>>> and we specify the choices users can select from, 
>>> as well as a default choice.

# Next, we filter for selected title type and save the new data frame as a reactive expression.
>>>using the reactive function. This function creates a cached expression that knows it is out of date when its input changes. So you, the Shiny developer, do not need to worry about keeping track of when the input changes, Shiny automatically does that for you.

Two more things to note here:

>>> One, before we do any calculations that depends on input$selected_type, we check its availability with the req function, and
>>> Two, we surround the expression with curly braces 

# The next two steps could happen in either order. Let’s start with the plot first.

You should be familiar with creating plots using the renderPlot function by now. But there is something new here. The data frame we're using is no longer movies, but the new reactive expression we created. And because it's reactive we refer to it with parentheses after its name. This is, once again, a cached expression, meaning that it will only rerun when its inputs change.

# And lastly we create the text stating the number of observations in the selection. The obvious choice for creating this output would be renderText. But I feel like getting a little fancier with this one. Suppose we know a bit of HTML -- which is true, I really only know a bit of HTML -- and I want to use some text decoration, like bolding and line breaks in my text output. So we need a rendering function that generates HTML, which is renderUI.

>>> we use the paste function to string along the text of the sentence we want displayed on the app.
>>> This sentence depends on the value of the number of rows of the movies_subset reactive expression we created earlier,
>>> as well as input$selected type.
>>> using simple HTML we add some decoration to the text
>>> and finally wrap the whole thing up in a function that marks the given text as HTML.

Then on the ui side
>>> we use the counterpart uiOutput function to lay out the text on the app

# Time for some reactivity exercises!
