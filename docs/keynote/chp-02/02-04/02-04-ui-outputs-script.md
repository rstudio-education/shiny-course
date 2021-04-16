# We've seen UI outputs before, and in this video we dive deeper into the plotOutput function to build an interactive graph.

# Once again we're going to start with this app.

# And add functionality to the app so that movies corresponding to the brushed points on the plot are displayed in a data table beneath the plot.

# We need to make three modifications to our app to accomplish this.

>>> One, in the ui, we add functionality to plotOutput to select points via brushing.

>>> Two, also in the ui,  we add an output defining where the data table should appear. 

>>> Three, in the server, we add a reactive expression that creates the data table for the selected points.

Let's go through these steps one by one.

# First is the brushing capability added to the plotOutput function. Previously we've only passed one argument to the plotOutput function. This time we're making use its additional arguments, 

>>> one of which is brush. Providing a string to this argument allows the user to "brush" in the plotting area. Brushing means that the user will be able to draw a rectangle in the plotting area and drag it around. Brushing will send information about the brushed area to the server. The value will then be accessible via input-dollarsign-plot_brush.

# Second, we use the dataTableOutput to define where on the mainpanel the data table should apear.

# And third, in the server, we describe how this table should be calculated with the renderDataTable function. We make use of a helper function, 
>>> brushedPoints, which returns rows from a data frame which are under a brush used with plotOutput. The first argument is the data frame from which to select rows. And the second argument is the input element that contains information on the brushed points. In order to avoid printing all of the variables in the data frame, in the next line we select a few to display. Note that the complete expression is wrapped in curly braces again. We do this for consistentcy in our code as well as to make debugging easier, if need be.

# In the following exercises you'll get to work with other interactive graphics and output functions!
