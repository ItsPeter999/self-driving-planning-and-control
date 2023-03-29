# self-driving-planning-and-control
After watching the videoes of "[忠厚老实的老王](https://space.bilibili.com/287989852/?spm_id_from=333.999.0.0)" on bilibili, based on [his framework](https://github.com/VincentWong3?tab=repositories), the algorithm of the trajectory tracking part has been enriched, and the DYC stability control has been added, making the tracking effect better and the yaw stability improved.

## main work

Based on the original framework, MPC (Model Predictive Control for Unmanned Vehicles - Gong Jianwei), MPC based on MPT3, and EMPC based on MPT3 are added; 

DYC control is added, with yaw rate and center of mass sideslip angle as inputs, and the additional torque of the four wheels as outputs.

## content



## effect



## to do

1. control part
- [ ] The performance of EMPC needs to be improved
2. DYC part
- [ ] DYC is the most basic sliding mode control and needs to be optimized
3. longitudinal speed planning needs to be optimized
- [ ] content of graduation thesis
