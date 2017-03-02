###[Feb. 11 - *Iteration 1*]
- data `importing: uiimport, xlsread, readtable, importdata` [xlsread doc](https://www.mathworks.com/help/matlab/ref/xlsread.html#bthgbma)
- reading of data is done via xlsread, but other options are viable
- prep the data: remove emepty, chara, 0 rows & columns. This way all elements of the matrix of data is plot-able
- plot the prepped data to generate plots for altitude, abs(velocty), altitude

---

###[Feb. 11 - *Iteration 2*]
- Working on prepping data, first iteration removes all rows that contain only NaN via any(rawArray,2)

> vectorization = when you use a matrix operation to reduce a loop
> if you wanted to add 1 to each element in an array, it is cheaper to do an matrix operation then to loop through every element
  
- columns of data are stored in variables that are called when plotting
- plotting (time,altitude) we have some data anomalies
- appened ms to s to m via datetime or sx10^2+ms. This is our x data points
- forgot we were suppose to use ode45, will apply this to the code later.

---

###[Feb. 15 - *Iteration 2*]
- visual of the mission, compare with graphed results to ensure everything is working 
  [stratos mission timeline](http://www.redbullstratos.com/the-mission/mission-timeline/ )
- Omit a data point if dependant value is NaN, keep the other elements of the row, they might be a valid point. 
- continuation of (appened ms to s to m via datetime or sx10^2+ms. This is our x data points)
  - Have a uniform independant value to plot against. All other data points should be plotted against this. 
  
  ---

###[Feb. 17 - *Iteration 2*]
- new excel data with more data points. Current code is able to handle both files. 
- office hour with Hadi:
  - model we generate is to be compared to actual model, this is how we are graded.
  - in later parts we are suppose to adjust drag force to more accurately simulate the jump.
  - Part1: read through and follow 10.3-10.5, apply this to our problem
  
  ----
  
###[Feb. 19 - *Iteration 2*]
- apply ode45 to model free fall:
  - takes in an interval, and initial conditions. Sometimes the initial cond. variable is unused but is still requried.
  - susbs in the free fall formula and it will model the equation
  
---

###[Feb. 21 - *Iteration 2*]
- going over `any()` and comparing it to isnan to see which is a better filter for the raw data:
  - any goes along the rows and tests to see if there is a nonzero value in that row, returns a logic of this
  - via `dataArray(B,:)` take the logic true rows and grab their col elements, this is our new matrix
  - this deletes all the rows with ONLY nonzero entries, in our case NaN. Heartrate prevents the case of allMovementData = 0
  
---
  
###[Feb.22 - *Iteration 3*] 
- code now plots modeled data and raw excel data points for position against time
  - adjust ode45's elapsedTime limits as well as the raw data's elapsedTime limits for a prettier plot
- issue with plotting modeled velocity:
  - `diff(position)` produces a shorter vector, we are going to cut out an element to make it congruent
  - current plot looks a little funky, middle of the plot shoots to inf
  
---

###[Feb.26 - *Iteration 4*]
- moved some contents to skeleton code & beautified code
- plotting position seperately from velocity
  - modeled data, ode45 is returning x by 2 array, first of which is position, second is veocity
  - this was seperated into col vectors used to plot modeled data.
- `abs(modeled velocity)` so it coincide with the direction of actual velocity
- ODE45 takes in the whole span of time 
  - this means that if unrestricted, modeled data goes up to elapsedTime
  - each graph is now restricted for aesthetics by xlim & ylim
- check with instructors to see if graphs are correct
- Part 2
  - remade an ode45, freefall and acceleration function for part
  - graphs are generated and restricted in the same way
- Instructors response: watch the scaling of your graphs. It looks like airspeed is the issue and we need to mind the units.
- use [nasa atmosphere](https://www.grc.nasa.gov/www/k-12/airplane/atmosmet.html) to undertand stdatmos provided to us.

---

###[Mar.1 - *Iteration 5*]
- Plots for part 1 and 2 completed 
  - rescaled velocity and ode45 time interval to 1 min for part 1
  -reimplemented `timeDataCap` instead of using xlim ylim 
- smoothing accleration plot 
  - we want to use `medfitl(x,n)` where n is some nth-order, the best n value for acceleration has not been found.
  - we want an n-value where the trend is kept but the noise and anomalies of the data are thrown out.
  - a smoothing would get rid of the sharp drop @ ~60s. Not yet implemented.
- Citation for mass
  - [helmet](http://www.redbullstratos.com/technology/pressure-suit-and-helmet/) 8pounds = 3.63kg
  - [suit](https://www.quora.com/What-is-the-weight-of-a-space-suit-on-the-ISS) 110pounds = 49.90kg
  - [lifes support](http://www.redbullstratos.com/technology/pressure-suit-and-helmet/) 200pounds = 90.72kg
  - [felix mass](http://felixbaumgartner.com/bio/) = 73kg
  - life support quoted from first link











