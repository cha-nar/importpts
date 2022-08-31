# importpts

import.pts() 
Narimane Chatar 
23/05/2021

Automatically imports all the pts files containing landmark coordinates exported from landmark editor or Stratovan checkpoint in your working directory storing everything in a 3D array ready for Procrustes superimposition using gpagen. 

 MOST COMMON ERROR MESSAGE 

          # Error in ptsarray[, , i] <- as.matrix(read.table(file = ptslist[i],  : 
          # number of items to replace is not a multiple of replacement length

          MEANING:  - some of your pts files do not have the same number of landmarks or 
                    - you introduced a number of landmarks that does not correspond to your data. 
          Check all the files in a notepad
         
Example

Working directory containing 45 pts files, each of them containing 37 points. Data from Chatar & al 2021 

  Chatar, N., Fischer, V., Siliceo, G. et al. Morphometric Analysis of the Mandible of Primitive Sabertoothed Felids from the late Miocene of Spain. J Mammal Evol 28, 753–771 (2021). https://doi.org/10.1007/s10914-021-09541-0

![image](https://user-images.githubusercontent.com/73315118/187622811-d910c44f-e60e-4166-b58f-126c1e0b6b54.png)
![image](https://user-images.githubusercontent.com/73315118/187623034-b9116566-7e59-46b7-9535-d54e124fd00f.png)

          import.pts(Landmark = 37)
or 

          import.pts(37)

Returns two objetcs:
1. 'ptslist', a list of all the pts files stored in your working directory:

          > ptslist
           [1] "Acinonyx_j_MNCN_COMP_3438.pts"        "Amphimachairodus_G_BC_102.pts"        "Caracal_c_MAV_1518.pts"              
           [4] "Dinofelis_b_DNMNH_BF_55_23.pts"       "Felis_l_MAV-965.pts"                  "Homotherium_c_CB_06.pts"             
           [7] "Lynx_r_OUVC_9576.pts"                 "Machairodus_a_B 2230.pts"             "Machairodus_a_B_382.pts"             
          [10] "Machairodus_a_B_3974.pts"             "Machairodus_a_BAT_1_01_E7_82.pts"     "Machairodus_a_BAT_1_04_F6_130.pts"   
          [13] "Machairodus_a_BAT_1_05_E6_42.pts"     "Machairodus_a_BAT_1_05_F6_265.pts"    "Machairodus_a_BAT_1_06_E4_52.pts"    
          [16] "Machairodus_a_BAT_3_07_672.pts"       "Machairodus_a_BAT_3_07_698.pts"       "Machairodus_a_BAT_3_09_1017.pts"     
          [19] "Machairodus_a_BAT_3_09_1344.pts"      "Machairodus_a_BAT_3_13_1916b.pts"     "Megantereon_CB_20.pts"               
          [22] "Neofelis_n_BC_005.pts"                "Panthera_l_MNCN_COMP_255.pts"         "Panthera_o_MAV_2415.pts"             
          [25] "Panthera_p_AMNH_113745.pts"           "Panthera_t_MNCN_COMP_999.pts"         "Panthera_u_BC_56.pts"                
          [28] "Promegantereon_o_B_3109.pts"          "Promegantereon_o_B_4708.pts"          "Promegantereon_o_B_5198.pts"         
          [31] "Promegantereon_o_B_5264.pts"          "Promegantereon_o_B_7042.pts"          "Promegantereon_o_BAT_1_01_E5_17.pts" 
          [34] "Promegantereon_o_BAT_1_02_E7_66.pts"  "Promegantereon_o_BAT_1_07_E5_102.pts" "Promegantereon_o_BAT_1_07_E5_97.pts" 
          [37] "Promegantereon_o_BAT_3_05_D8_755.pts" "Promegantereon_o_BAT_3_09_779.pts"    "Promegantereon_o_BAT_3_10_1773.pts"  
          [40] "Promegantereon_o_BAT_3_11_132.pts"    "Promegantereon_o_BAT_3_11_2020.pts"   "Promegantereon_o_BAT_3_13_1596.pts"  
          [43] "Promegantereon_o_BAT_3_14_94.pts"     "Puma_c_ISM_ZOO_693928.pts"            "Smilodon_f_F_AM_14349_M7786_9732.pts"
          [46] "Xenosmilus_h_BC_113.pts"
          
2. 'ptsarray', a 3D array containing all your landmark coordinates, the name of each specimen is defined as the name of the pts file and the name of each landmark is the same as in the pts file in the same exact order:

          > ptsarray
          , , Acinonyx_j_MNCN_COMP_3438

                         [,1]        [,2]       [,3]
          S000     -11.376827  57.2202220 -15.773093
          S001     -13.640221  73.2300720 -12.420223
          S002     -11.688808  74.7713320 -16.106327
          S003     -14.047218  89.9048840 -13.204573
          S004     -12.686813  89.9321060 -15.610176
          S005     -11.890251 105.6621900 -15.602662
          S006     -12.268312 118.7793700 -17.511642
          S007     -30.907965  -2.4989805 -20.663963
          S008     -11.600607  -3.7545605  -6.870319
          S009     -16.444607   1.1018786 -30.346312
          S010      -9.563807   1.6150244 -27.567286
          C000-000  -6.543262   5.0352483 -18.094845
          C000-001   2.637705   5.6062112 -17.486429
          C000-002  16.592236   0.3645229 -11.960574
          C000-003  23.731102   1.9855715  -9.499072
          C000-004  24.605648   5.6825037  -9.990653
          C000-005  23.648840  11.4155610 -10.043732
          C000-006  19.503929  19.4183120 -10.673919
          C000-007   8.296625  29.4243580 -14.277111
          C000-008  -3.601878  42.9294850 -16.499638
          C001-000 -12.264740 101.4087800 -15.946574
          C001-001 -12.610980 101.9130300 -16.154688
          C001-002 -12.701469 102.6044500 -16.263075
          C001-003 -12.645191 103.2161300 -16.231903
          C001-004 -12.523882 103.6936000 -16.101622
          C001-005 -12.397614 104.1010400 -15.955075
          C001-006 -12.259256 104.4817900 -15.807917
          C001-007 -12.108695 104.8627500 -15.674864
          C001-008 -11.992175 105.2774400 -15.621201
          C002-001 -17.854759 117.0316400 -19.819857
          C002-002 -22.519316 113.7537800 -21.052217
          C002-003 -28.057238 108.0118900 -21.574669
          C002-004 -31.865355  98.0132370 -22.160757
          C002-005 -33.163811  84.4842380 -22.574013
          C002-006 -32.679577  68.2203140 -22.551060
          C002-007 -30.297029  50.4204250 -21.864897
          C002-008 -30.803972  28.2110750 -20.945692
