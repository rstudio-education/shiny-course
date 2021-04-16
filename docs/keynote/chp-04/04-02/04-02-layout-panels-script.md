# In this video we discuss the layout of a Shiny app.

# One useful function for customizing the layout of your app is fluidrow. This function creates horizontal rows where objects can be placed. You can add as many rows as you want, but you want to be careful about expanding your app too much vertically as your users might not be willing to scroll down to interact with your app in full.

# The column function is also incredibly useful. It adds columns within a row, and it requires that you define a width for each column. 

# The width is relative, 
>>> and the total width of columns within any given row should add up to 12. You can use the columns to place output objects like a plots or summary tables in specific places in your app.

# We can also use panels to group multiple elements into a single element that has its own properties. 
>>> This functionality is especially important and useful for complex apps with a large number of inputs and outputs such that it might not be clear to the user where to get started.

# The wellpanel function groups elements into a grey well, or a box with rounded corners. This is a look you should be used to seeing in shiny apps by now.

# Shiny offers 12 different panels, 
>>> but we'll take a look at a small subset of them in this video, and then you'll get to work with a few others in the following exercises.

# We have made heavy use of sidebarPanel and mainPanel in our apps in this course. However we mostly stuck with their default widths. 
>>> The default width for a sidebarPanel is 4 and for a mainPanel is 8. 

# If we wanted to make an app where the sidebar and mainPanel are of equal width, so the app is split down the middle, we can specify a width argument to the sidebarPanel and mainPanel functions and set each to 6. 

# The titlePanel is used to create a panel cotaining an application title. Often it makes sense to include this panel outside the sidebarLayout. But in addition to the title on the page, we might want to also change the text that shows up on the browser tab for our app, especially if our title is long. 

# To customize this text we specify the windowTitle argument in the titlePanel, which is by default equal to the application title. For example, my application title might be "Movie browser, 1970 to 2014" 
>>> but I might just want to make my windowTitle "Movies".

# The last panel we'll consider is conditionalPanel, which creates a panel that is visible conditional upon the value of an input or an output. 
>>> Under the hood this function evaluates a JavaScript expression once at startup and then whenever Shiny detects a relevant change or input/output. 
>>> Being able to display panels conditional on previous user selections is a powerful feature of Shiny. We'll add a conditional panel to our app in the following exercise. 

# so let's get to it!

