# In this video we discuss the reactive flow in a Shiny app.

# One familiar way of thinking about reactivity is to think in the context of a spreadsheet, like Google Sheets or Microsoft Excel.

# Suppose you write a value into a cell in a spreadsheet,

# and then in another cell you write a formula that depends on that cell.

# First, the formula is calculated with the value you originally typed.

# Now when you change the value of the original cell, the result of the formula will automatically update, or in other words, react to this change.

# In a Shiny app reactivity happens in a similar fashion. 

>>> Suppose you have a sliderInput in your app with the inputId alpha. The value of this input is stored in input-dolarsign-alpha.

>>> So when the user moves around the slider, the value of the alpha input is updated in the input list.

# Reactivity automatically occurs when an input value is used to render an output object.

# Here is a roadmap of the reactive flow in Shiny, 

# though for now we'll just focus on the straight path between an input and an output, and discuss the other features later in the course.

The user selects an input, this input goes through some expression in the server, and an output is rendered. Each time the user changes their input selection, the expression that generates the output will automatically re-execute, and the relevant output will be re-rendered based on the new value of the input. In a Shiny application, there’s no need to explictly describe the relationships between inputs and outputs and tell R what to do when each input changes, Shiny automatically handles these details for you.

# Time for practice!
