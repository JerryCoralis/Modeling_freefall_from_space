[Feb. 11 - morning]
- data importing: uiimport, xlsread, readtable, importdata https://www.mathworks.com/help/matlab/ref/xlsread.html#bthgbma
- type .xlsx
- reading of data is done via ??? awaiting email 
- prep the data: remove emepty, chara, 0 rows & columns. This way all elements of the matrix of data is plot-able
- plot the prepped data to generate plots for altitude, abs(velocty), altitude
/end of iteration-1, commited to master


[Feb. 11 - night]
- Working on prepping data, first iteration removes all rows that contain only NaN via any(rawArray,2)

!!! vectorization = when you use a matrix operation to reduce a loop
ie) if you wanted to add 1 to each element in an array, it is cheaper to do an matrix operation then to loop through every element

- columns of data are stored in variables that are called when plotting
- plotting (time,altitude) we have some data anomalies
- appened ms to s to m via datetime or sx10^2+ms. This is our x data points
