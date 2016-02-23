function classifyonerecordosea(recname, channel, txtannotfile, output_ext)

  % these function produces a WFDB annotation file with the beat
  % classification for every beat located at the samples contained in
  % the txtannotfile
  %
  % arguments:
  % wfdb record name ex: a103l)
  % channel to be used (first channel is channel 1)
  % name of the txt file containing the QRS detection (samples)
  % extension for the output file
  
  % the use of this file requires the compilations of the c++ code in
  % the same directory using the Makefile

  command= ['./classifyonerecordosea ',recname,' ', num2str(channel-1), '',... 
            txtannotfile,' ',output_ext]

  system(command)