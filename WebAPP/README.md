Blood Glucose Calculator - Web App - Read Me
This is a web application that calculates and visualizes the estimated blood glucose levels of a type 1 diabetic patient after consuming different types of food, considering physical activity.

Getting Started
Save the Files: Save the provided HTML file (index.html) and JavaScript file (script.js) in the same directory.

Open in a Web Browser: Open the index.html file in your web browser (Chrome, Firefox, etc.). This will launch the Blood Glucose Calculator app.

Using the App
Parameters:

G (Initial Glucose): Enter the initial blood glucose level (mg/dl) in the corresponding input field.
V (Volume): Enter the total volume of distribution (dl) in the corresponding input field.
α (Alpha): This parameter is related to glucose absorption. There are separate input fields for α with and without physical activity. Select the appropriate value based on the patient's activity level.
ω (Omega): Enter the parameter related to glucose decay in the corresponding input field.
Food Data:

The table allows you to input data for multiple food items.
For each food item, enter the following values:
Food: The name of the food item.
extG (mg/dl): The external glucose level of the food (mg/dl).
b: A parameter related to the food's effect on glucose.
Physical Activity:

Select "Yes" or "No" from the dropdown menu to indicate whether the patient is performing physical activity. This affects the α parameter used in the calculations.
Simulate Button:

Click the "Simulate" button to generate a plot showing the estimated blood glucose levels over time for each food item you entered.
Real-time Updates:

The plot automatically updates whenever you modify any input value (parameters or food data).
Plot:

The plot displays the estimated blood glucose level (mg/dl) on the y-axis and time (minutes) on the x-axis.
The y-axis has a fixed range of 140 to 240 mg/dl.
Each food item has a different colored line in the plot (colors are currently defined in the code).
Code Explanation
The app uses HTML and JavaScript to create the user interface and perform the calculations.
The calculateAndPlot function is responsible for:
Extracting user input values.
Performing calculations for each food item based on the chosen α value.
Generating datasets for the plot.
Creating or updating the chart using Chart.js library.
Limitations
The app doesn't handle invalid user input (e.g., negative values).
The food plot colors are currently hardcoded in the JavaScript. Adding more foods requires adding colors manually.
Future Improvements
Implement error handling for invalid user input.
Add a way to dynamically assign colors to food items.