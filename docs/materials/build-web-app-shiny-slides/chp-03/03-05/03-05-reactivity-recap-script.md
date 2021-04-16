# Let's recap what we have learned about reactivity and discuss best practices.

# There are three main takeaway messages about reactivity that all Shiny developers should be familiar with.

>>> One, reactives are like functions, but they are lazily evaluated, meaning they will only evaluate when their inputs change, not each time they are called.

>>> Two, reactives are for reactive values and expressions, observers are for their side effects. 

>>> And three, do not define a reactive() inside a render function.

# We'll wrap up the chapter with a simple but important example.

Here we have an app that adds 2 to the current value of x.

# Here is what the app should look like

# And here again is the code. What's wrong here? <pause>

The object current_x is used in the render function, but it's not currently a reactive expression.

# So we need to put the definition of current_x in the reactive function. But that's still not enough.

# We also need to refer to current_x with parantheses after its name. Missing the parantheses is a common error when working with reactives. So add to your list! When developing Shiny apps, be wary of missing commas, and of missing parantheses when calling reactive expressions.