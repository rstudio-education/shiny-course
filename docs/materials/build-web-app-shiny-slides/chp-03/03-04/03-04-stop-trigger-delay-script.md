# In this video we present how to stop, trigger, and delay Shiny actions

# Suppose your app has an input widget where users can enter text for the title of the plot. However you only want the title to update if any of the other inputs that go into the plot change. You can achieve this by isolating the plot title such that

>>> When input x or y changes, the plot, along with the title, will update.
>>> But when only the title input changes, the plot will not update.

# For triggering reactions, we use observeEvent. So why might one want to explicitly trigger a reaction? Sometimes you might want to wait for a specific action to be taken from the user, like clicking an actionButton, before calculating an expression or taking an action. A reactive value or expression that is used to trigger other calculations in this way is called an event. 

>>> These events can be the first argument in the observeEvent function. This argument can be a simple reactive value like an input, a call to a reactive expression, or a complex expression provided wrapped in curly braces.

>>> The second argument is the expression to call whenever the first argument is invalidated.

So this is similar to saying if event expression happens, call handler expression.

# Suppose your app allows for taking a random sample of the data based on a sample size numeric input. Suppose also that you want to add functionality for the users to download the random sample they generated *if* they press an action button requesting to do so. 

In the UI, we create an action button.

And in the server, we condition the observeEvent on the inputId of that action button. This way R knows to call the expression given in the second argument of observeEvent when the user presses the action button.
--
# And finally we can delay reactions with eventReactive, which takes similar arguments as observeEvent.

# Supposde your goal is to change how users take random samples in your app -- you only want them to get a new sample when an action button that says "get new sample" is pressed, not when other things like a numeric input defining the size of the sample changes.

In the event reactive function, the first argument is the input associated with the action button, and the second argument is the sampling code.

>>> Then, we add one more argument -- ignoreNull. This argument tells R what to do (or what not to do) when the event expression evaluates to Null. For example, what should the app do when the app is first launched and the user has not even interacted with the app yet? If this is set to FALSE, the app will initially perform the action or calculation and then the user can re-initiate it.

# observeEvent and eventReactive look and feel very similar -- same syntax, same arguments, but they're actually not the same at all!

>>> observeEvent() is used to perform an action in response to an event

>>> while eventReactive() is used to create a calculated value that only updates in response to an event

# This pair of functions also seem similar, at a first glance, to the observe/reactive pair, however the main difference between them is that

>>> observe() and reactive() functions automatically trigger on whatever they access

>>> while observeEvent() and eventReactive() functions need to be explicitly told what triggers them

# and where does isolate fit in all this?

>>> isolate() is used to stop a reaction

>>> observeEvent() is used to perform an action in response to an event

>>> and eventReactive() is used to create a calculated value that only updates in response to an event

# Time to practice!
