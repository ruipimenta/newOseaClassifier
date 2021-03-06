# newOseaClassifier

ECG beat Classifier that originates from OSEA [by Patrick Hamilton (Ep Limited)   
This software classifies ECG beats as Normal/Ventricular. Some changes were introduced in the original OSEA software to increase the sensitivity of Ventricular beats classification (with a consequente reduction of the positive predictivity)  
There are 2 executable files for classifying ECG channels on Physionet WFDB records that implemente the same algorithm and two executable the implements the original OSEA algorithm:
  
+ testonerecordosea : is the original OSEA algorithm with QRS detection and beat classification(Normal/Ventricular)  
- testonerecordNewosea : uses the the original OSEA  beat detection code but uses our changes to the beat classification algorithm  
* classifyonerecordosea : classifies beats given the QRS detections. It implements the original OSEA classification algorithm
* classifyonerecordNewosea : classifies beats given the QRS detections. It implements our changes to the original OSEA classification algorithm  

###classifyonerecordosea and classifyonerecordNewosea  
The executable file, classifyonerecord, should be called (in the command line) with 4 arguments:  

1. the name of a Physionet WFDB record
2. the number of the channel to be analysed (first channel is number 0)
3. the name of the txt file containing the  samples where the beats were detected
4. the extension for the output WFDB annotation file

Example of use:

1. run gqrs on record 106 (first channel)from MIT-BIH Arrhytmia database -> gqrs -r 106
2. use 'awk' to produce a txt file containing the samples corresponding to 'gqrs' detections  
*rdann -r 106 -a qrs | awk '{print $2}'> detections.txt*  
3. classify the beats detected by gqrs  
*./classifyonerecordNewosea 106 0 detections.txt myannot*  
4. read file 106.myannot containing the beat classifications  
*rdann -r 106 -a myannot*

###testonerecordosea and testonerecordNewosea  
The executable file should be called (in the command line) with 2 arguments:  

1. the name of a Physionet WFDB record  
2. the number of the channel to be analysed (first channel is number 0)
  
The WFDB output file gets the extension atest_0 if the channel to be analysed is 0, atest_1 if the channel to be analysed is 1, ...
