
% filename = 'y-sx.txt';
% the_file = fopen(filename);
% C = textscan(the_file,'%f');
% % T_allx = C{1};
% Y_sx = C{1};
% fclose(the_file);

filename = 'y-right.txt';
the_file = fopen(filename);
C = textscan(the_file,'%f ');

Y_right = C{1};
fclose(the_file);
% % 
% figure;
% plot(T_all,X_all);
% hold on
% plot(T_all,Y_all);


% Z = complex(X,Y);
% plot(Tx,abs(Z))
% 
% 
% figure;
% plot(Tx(2*1e6:2.002*1e6),X(2*1e6:2.002*1e6));
% hold on
% plot(Ty(2*1e6:2.002*1e6),Y(2*1e6:2.002*1e6));
% figure;
% plot(T1,X1);
% hold on
% plot(T1,Y1);
% Z1= complex(X1,Y1);
% plot(T1,abs(Z1))
