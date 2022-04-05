function y = make_note(staff_note, Fs, dn)

Ts = 1/Fs;
code_char = char(staff_note);
if (code_char(1) == 'R')            %for rest notes
    duration_devider = str2num(code_char(2));
    y = zeros(1, length(Ts:Ts:dn/duration_devider));
elseif (code_char(1) == 'S')        %for seperate notes
    y = zeros(1, length(Ts:Ts:dn/80));
else                                %for regular notes
    note_codes = [ "C-", 0, "C#", 1, "Db", 1, "D-", 2, "Eb", 3, "D#", 3, "E-", 4, "F-", 5, "F#", 6, "Gb", 6, "G-", 7, "Ab", 8, "G#", 8, "A-", 9, "Bb", 10, "A#", 10, "B-", 11 ];
    duration_devider = str2num(code_char(4));
    t = Ts:Ts:dn/duration_devider;
    n = str2num(code_char(2));
    
    for i = 1 : length(note_codes)
        temp = [code_char(1), code_char(3)];
        if ( temp == char(note_codes(i)))
            m = str2num(note_codes(i+1));
        end
    end
    
    f_note = 440*2^((m-9)/12)*2^(n-4);
    y = cos(2*pi*f_note*t);
end
end
