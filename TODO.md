# hecr.Rmd file

## Todo (winter break)
The goal is to complete the items in this list before the winter break so that 
is before Decemeber 21st.   

[ ] finish the vignettes for the 2-d recipes   
[ ] refactor the hec_two function   
[ ] integrate any changes that were planned for the redesign back into the mater branch   
[ ] add HEC-RAS version numbers supported (5.0.5 and 5.0.6)   
[ ] Update code to report plan file rather than geometry file for new RAS version   
[ ] If duplicate XY pairs are given, throw error and tell person to clean up data
[ ] Report all duplicate hdf cell values instead of filtering for unique values. give message saying # of duplicate hdf cell values.

## After the usage section before one-d examples

**#EMANUEL: CAN WE PUT SOMETHING ABOUT UPCOMMING FEATURES HERE?   
+Pulling terrain elevations along 1-D and 2-D profiles   
+2-D profiles (one timestep, values at multiple points and draw a line to 
connect the dots). I think this can already be done w/ what we have, but I 
need to verify   
+CAN WE ALSO GET MAXIMUM VALUES? WE SHOULD TALK ABOUT THIS. 
+Velocity output   
+read in vertices of profile line from csv   
+Select plans by name rather than number   
+flow across a line? This might be hard   
+Current development features include allowing a user to set up a 
configuration file with these as entry, and thus allowing for an arbitrary 
length of coordinate pairs, without over populating an R script. Not sure what
this  means, but copied from below.**   
