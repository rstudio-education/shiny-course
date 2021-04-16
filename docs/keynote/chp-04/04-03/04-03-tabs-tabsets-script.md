# If the amount of information you want to communicate to your users does not fit well on a page, or there is detailed information, like raw data, that you want to make available to your users but not necessarily feature prominently in your app, you can make use of tabs to distribute this information to stackable tab panels.

# Tabsets are created by calling the tabsetPanel function with a list of tabs created by tabPanel.

# Each tab panel has a unique title and a list of output elements which are rendered vertically within the tab. In this  example we display a plot of our data in the first tab, 

# summary statistics in the second tab, 

# raw data in the third tab, 

# and some background information on our dataset in the fourth tab.

# Note that in the previous example the user first selected a sample of the data. 
>>> Then this new sampled data got used in four separate tabs. Introducing tabs into our user interface underlines the importance of creating reactive expressions for shared data. If the dataset is expensive to compute, then the user interface could be slow to render if each tab were required to do the computation. Instead, we calculate the data once in a reactive expression, and then have the result be shared by all of the output tabs.

# Another option for laying out tabs is using the navlistpanel, which lists the tabs vertically down the side, as opposed to horizontally across the screen.

# To recap, we use tab panels to create stackable panels, and use tabsetpanel or navlistpanel to arrange the tabs with a navigation across the page or down the side of the page.

# There are many other ways of customizing the look of your app, including using custom CSS. However one quick and easy way of changing the look is using the prebuilt themes in the shinythemes package. In order to use one of these themes we need to load the shinythemes package first. The package website has thumbnail images of each of the themes, but it can be difficult to tell exactly how the theme will look on your app. 

# A useful tool for browsing  themes is the themeselector widget. To use this widget simply add the widget to your app. It can be inserted anywhere inside of the application, although if it is put inside a tab, it will be visible only when that tab is showing. I usually place it right underneath the fluidpage definition. This widget is to be used in development only. Once you decide on a theme, you should remove the widget and just define the theme you want using the shinytheme function.

# Next up you get to build an app with tabs and see how it looks with different shiny themes.
