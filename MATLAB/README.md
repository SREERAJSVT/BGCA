WebAPP
![image](https://github.com/user-attachments/assets/908de88e-996f-48a2-a8dd-0fa431e46560)
MATLAB OutPut



# Blood Glucose Calculator MATLAB App

This MATLAB app calculates and visualizes the estimated blood glucose levels of a type 1 diabetic patient after consuming different types of food, considering physical activity.

## Overview

The app uses a mathematical model to estimate blood glucose levels based on the following parameters:

*   **G:** Initial glucose level (mg/dl)
*   **V:** Volume (dl)
*   **α (Alpha):** Parameter related to glucose absorption (different values for with and without physical activity)
*   **ω (Omega):** Parameter related to glucose decay
*   **extG:** External glucose level from food (mg/dl)
*   **b:** Parameter related to the food's effect on glucose

The app allows users to input these parameters, select whether the patient is performing physical activity, and then generates a plot showing the estimated blood glucose levels over time (0 to 300 minutes).

## Features

*   **User Input:** Users can input values for all parameters (G, V, α, ω) and food data (extG, b) through editable input fields and a table.
*   **Food Selection:** The app models the glucose response for multiple food items simultaneously.
*   **Activity Selection:** A dropdown menu allows users to select whether the patient is performing physical activity, which affects the α parameter.
*   **Visualization:** The app displays a line graph of estimated blood glucose levels over time for each food item.
*   **Interactive Updates:** The graph updates automatically whenever any input value is changed.
*   **Customizable Plot:** The plot has a fixed y-axis scale (80-240 mg/dl) with ticks every 20 units and a fixed x-axis scale (0-300 minutes) with ticks at 0, 100, 200, and 300.

## How to Use

1.  **Open MATLAB:** Open MATLAB on your computer.
2.  **Navigate to Directory:** Navigate to the directory where you saved the `BloodGlucoseCalculator.m` file.
3.  **Run the App:** In the MATLAB command window, type `BloodGlucoseCalculator` and press Enter. This will launch the app.
4.  **Input Parameters:** Enter the desired values for G, V, α (for both no activity and with activity), and ω in the "Parameters" section.
5.  **Input Food Data:** Enter the extG and b values for each food item in the "Food Data" table. You can edit the existing values or add new rows if needed (though the plotting colors are currently hardcoded).
6.  **Select Activity:** Choose "Yes" or "No" from the "Physical Activity" dropdown.
7.  **Click "Simulate":** Click the "Simulate" button to generate the plot. The plot will update automatically whenever any input value is changed.

## Code Explanation

*   **`BloodGlucoseCalculator.m`:** This is the main file containing the app's code. It creates the UI components and defines the `updatePlot` function, which performs the calculations and updates the plot.

## Dependencies

*   MATLAB (tested on R2017a and later; may work on some earlier versions with minor modifications.)

## Known Issues

*   The plot colors are hardcoded in the `updatePlot` function. Adding more foods requires manually adding colors to the code.
*   The app's layout could be further improved using MATLAB's App Designer for more advanced layout management.

## Future Improvements

*   Implement dynamic color assignment for food items.
*   Use MATLAB's App Designer for a more polished and customizable UI.
*   Add error handling for invalid user inputs.
*   Potentially add more complex glucose models.

## Author

\[Your Name/GitHub Username]

## License

\[Optional: Add a license, e.g., MIT License]
