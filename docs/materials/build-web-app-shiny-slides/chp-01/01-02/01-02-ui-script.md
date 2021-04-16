# In this video we’ll build the user interface of a simple app.

# However, before we get into the weeds of building a user interface, let's revisit the anatomy of a Shiny app.

>>> The user interface, that we'll refer to as the ui going forward, defines and lays out the inputs of your app where users can make their selections. It also lays out the outputs.

>>> The server function on the other hand calculates outputs and performs any other calculations needed for the outputs.

# For example, if your app features a plot, 

>>> the code for building that plot lives in the server function. 
>>> But the setup for the user defined inputs for the plot as well as information on where physically on the app the plot should appear are defined in the ui. 

# Here is the app we'll work with in this video.

# And here is the code that builds the ui of that app.

Since this is too much code to parse, we’ll explore individual components of the ui one by one.

# At the outermost layer of our UI definition 
>>> we begin with the fluidPage function.

This function creates a fluid page layout consisting of rows and columns. Rows make sure that elements in them appear on the same line. And columns within these rows define how much horizontal space each element should occupy. Fluid pages scale their components in realtime to fill all available browser width, which means you, the app developer, don’t need to worry about defining relative widths for individual app components. As always, for more information on arguments to this function, you can view the R function help by typing ?fluidPage in your R console.

# Next, we define the layout of our app. Shiny includes a number of options for laying out the components of an application. The default layout, the one we're using in our example app, is a layout with a sidebar,
>>> that you can define with the sidebarLayout function. 

# This is a simple layout 
>>> with a narrow sidebar for inputs 
>>> and a wider main area for output.

Under the hood, Shiny implements layout features available in Bootstrap 2, which is an popular HTML/CSS framework. However the nice thing about working in Shiny is that no prior experience with Bootstrap is necessary. To learn more about various layouts, I recommend reviewing the Application Layout Guide article at shiny.rstudio.com.

# Next we define our sidebar panel containing input controls

# This panel contains two dropdown menus created with the selectInput function

# Let's take a look at one of the selectInput widgets a little more closely.

>>> The first argument is the inputId, which is the input value that the app will internally use to access the value selected by the user.

>>> The second argument is the label, which is the display label that the user sees.

>>> The third argument is the list of choices the user will choose from. In this app, these are variable names from the movies dataset.

>>> And lastly we specify a default selection from that list.

# The final component of our UI is the mainPanel. Currently the mainpanel contains only one component, a plot output. We'll talk about how this plot is built later in the course.

# Next, let's practice building an app UI!
