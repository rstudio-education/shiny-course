# The goal of this video is to build familiarity with a few rendering functions.

# As we mentioned earlier in the course, Shiny provides a wide selection of output types, 
>>> each of which works with a render function. We looked at the renderPlot function before. 
# Now let's take a look at the renderTable function.

# This is the app you've seen numerous times so far that we will use as our starting point.

# And this is the final app that we want to achieve, with a summary table beneath the plot.

# So we want to add a summary table beneath the plot displaying summary statistics for a new variable we'll create, ratio of audience scores to critics scores. We need to make four modifications to our app to accomplish this.

>>> One, outside of the ui and server, we calculate the new variable.

>>> Two, in the ui, we add an input widget that the user can interact with to check boxes for selected title types.

>>> Three, also in the ui, add an output defining where the summary table should appear.

>>> Four, in the server, we add a reactive expression that creates the summary table.

We'll go through these steps one by one.

# First is creating the new variable, which we can do outside of the ui and the server so it's calculated once when our app launches. There are many ways one can create the new variable in R, we do so here using the mutate function from the dplyr package.

# Second, we add the checkboxInput widget to the ui.

>>> The first argument is the inputId. 
>>> Next is the user facing label. 
>>> Third, we define the choices. Previously we manually entered the choices. We present an alternative approach here, directly using information from the dataset. Specifically, the choices we want are the levels of the title type variable.
>>>> And by default we select all of them. 

# Third, we add an output to the UI defining where the summary table should appear. We use the tableOutput function for this. This function takes one argument, the outputId.

# Lastly, in the server, we describe how this table should be calculated with the renderTable function. 

>>> Note that the name of the output created by the render function should match the name we used for the output in the ui.
>>> The first argument is the expression that returns an R object in tabular form. Note that we wrap the expression with curly braces. The expression first filters for the selected title types. Since this is a user selection, the information is in the input list generated in the ui. Then, the expression groups the data by MPAA rating, and then calculates summary ststistics like means, standard deviations, and sample sizes for each level of MPAA ratings.

If we stopped here and didn't include any of the following arguments, the app would look something like ...
# this:

>>> But this is what we want our table to look like. 

# In order to achieve this look we add additional arguments to our render function. 
>>> like striped TRUE for alternating color rows,
>>> spacing l for for larger row heights,
>>> the align argument for left, right, or center alignment of columns,
>>> digits for number of decimal places to display,
>>> width for, well, width of the table output,
>>> and lastly a caption.

# To recap:

>>> Shiny has a variety of render functions with corresponding output functions to create and display outputs.

>>> Render functions can take on multiple arguments, the first being the expression for the desired output.

>>> The expression in the render function should be wrapped in curly braces.

# Alright, it's time for you to practice render functions!



