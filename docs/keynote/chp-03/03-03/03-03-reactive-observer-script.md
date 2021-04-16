# In this video we discuss implementations of the three different types of reactive objects

# As we go through the different implementations, I recommend that you think back to where they appear on the reactive flow chart.

# An implementation of reactive sources is reactiveValues. 

>>> One example is user inputs. The input object is a reactive value that looks like a list, and contains many individual reactive values that are set by input from the web browser.

# The implementation of reactive conductors is reactive expression that you can create with the reactive function.

>>> An example is the reactive data frame subsets we created in the earlier videos and exercises.

>>> Reactive expressions can access reactive values or other reactive expressions, and they return a value

>>> They are useful for caching the results of any procedure that happens in response to user input

# And lastly, the implementation for reactive endpoints is observers.

>>> For example, an output object is a reactive observer. Actually, under the hood a render function returns a reactive expression, and when you assign this reactive expression to an output$ value, Shiny automatically creates an observer that uses the reactive expression.

>>> Observers can access reactive sources and reactive expressions, but they don’t return a value.

>>> Instead they are used for their side effects, which typically involves sending data to the web browser

# To help these concepts sink in a bit more, let's compare reactives vs. observers

>>> On one hand, they both store expressions that can be executed

>>> On the other hand,
>>> Reactive expressions return values, but observers don’t 

>>> And observers (and endpoints in general) eagerly respond to reactives, but reactive expressions (and conductors in general) do not

>>> Also reactive expressions must not have side effects, while observers are only useful for their side effects

# Most importantly

>>> we use the reactive function when calculating values, without side effects

>>> and we use the observer function when performing actions, with side effects

>>> The moral of the story is to not use observe when calculating a value, and to especially not use reactive for performing actions with side effects

# Here is a summary table of the differences between reactives and observers.

A calculation is a block of code where you don’t care about whether the code actually executes—you just want the answer. Safe for caching. We use reactive for these.

An action is where you care very much that the code executes, and there is no return value, there are only side effects. For these we use observe.

# Next you get to assess your understanding of reactives vs. observers.

