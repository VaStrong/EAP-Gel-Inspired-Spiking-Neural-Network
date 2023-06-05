# EAP-Gel-Inspired-Spiking-Neural-Network
This repository contains all code and data used within the experiments described in the paper “EAP Hydrogel Inspired Spiking Neural Network” and chapter 5 of the thesis "Soft Computation Using
Electroactive Polymer Hydrogels". All data analysis was performed using code written in the Matlab environment, using Matlab packages, and datasets constructed in Matlab. The stimulation driving and current recording software was written in Arduino. This repository is available on Zenodo. This repository is organised into folders according to the languages used and sections of the paper.

## Matlab
* "data.mat" – This holds the recorded current data along with the generated coefficients.

* "BendingTrednAnalys.m" – Generates the plots showing the effect of weight on the bending trend of the hydrogel. Also generates the coefficients using Matlab curve fitting.
* "CoefficentPlot.m" – Generates plot of coefficient values b1, b2, and b3 against weight.
* "CurrentAnalys.m" – Generates plot of current against time over different experiments with a line of best fit.
* "weightModelPlot.m" – Generates plot of how weight variation effects hydrogel bending over time using a heatmap.

## Arduino
* "gel_stim_driver.ino" - Controls the stimulation driving hardware to apply the stimulation in the desired directions controlled by buttons on the hardware.
* "gel_stim_driver_current_measure.ino" - Controls the stimulation driving hardware to apply the stimulation in the desired directions controlled by buttons on the hardware. This also records and outputs current measurements along with voltage for later analysis.
