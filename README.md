# newOseaClassifier
ECG beat Classifier that originates from OSEA by Patrick Hamilton (Ep Limited) 
It classifies ECG beats as Normal/Ventricular
The executable file, classifyonerecord, should be called (in the command line) with 4 arguments:
1)the name of a Physionet WFDB record
2)the number of the channel to be analysed (first channel is number 0)
3)the name of the txt file containing the  samples where the beats were detected
4)the extension for the output WFDB annotation file

Example of use:
1) run gqrs on record 106 (first channel)from MIT-BIH Arrhytmia database -> gqrs -r 106

2)use 'awk' to produce a txt file containing the samples corresponding to 'gqrs' detections ->
rdann -r 106 -a qrs | awk '{print $2}'> detections.txt

3) classify the beats detected by gqrs ->
./classifyonerecord 106 0 detections.txt myannot

4) read file 106.myannot containing the beat classifications ->
rdann -r 106 -a myannot
