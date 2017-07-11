function [Q] =  read_data(filename)
    the_file = fopen(filename);
    C = textscan(the_file,'%f ');

    Q = C{1};
    fclose(the_file);
end