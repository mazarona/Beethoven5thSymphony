function y = adsr(note, adsr_param)

tn = adsr_param(:,1);
an = adsr_param(:,2);
tq = 1/length(note):1/length(note):1; 
adsr_env = interp1(tn, an, tq);
y = note.*adsr_env;

end