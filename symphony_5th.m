Fs=8000;                % Sampling Frequency
dn = 1.3;               % Duration of a full note
%The openening four measures of beethoven's 5th
beet1 = ["R8","G4-8","S","G4-8","S","G4-8","S","E4b2","S","E4b2","S",...
    "R8","F4-8","S","F4-8","S","F4-8","S","D4b2","S","D4b2","S"];
beet2 = ["R8","G3-8","S","G3-8","S","G3-8","S","E3b2","S","E3b2","S",...
    "R8","F3-8","S","F3-8","S","F3-8","S","D3b2","S","D3b2","S"];
beet3 = ["R8","G2-8","S","G2-8","S","G2-8","S","E2b2","S","E2b2","S",...
    "R8","F2-8","S","F2-8","S","F2-8","S","D2b2","S","D2b2","S"];
%the five points for the ADSR envelope (time, value)
adsr_param = [[0, 0]; [0.2, 1]; [0.3, 0.85]; [0.9, 0.85]; [1, 0]];
%Write Your code
y1_final = [];
y2_final = [];
y3_final = [];
for i = 1:length(beet1)
    current_code = beet1(i);
    y1 = make_note(current_code, Fs, dn);
    y1_adsr = adsr(y1, adsr_param);
    y1_final = [ y1_final, y1_adsr];
end
for i = 1:length(beet2)
    current_code = beet2(i);
    y2 = make_note(current_code, Fs, dn);
    y2_adsr = adsr(y2, adsr_param);
    y2_final = [ y2_final, y2_adsr];
end
for i = 1:length(beet3)
    current_code = beet3(i);
    y3 = make_note(current_code, Fs, dn);
    y3_adsr = adsr(y3, adsr_param);
    y3_final = [ y3_final, y3_adsr];
end
y = y1_final + y2_final + y3_final;
sound(y);