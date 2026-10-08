%           FINDING DELTA_OPT F0R VARIABLE TR SEPARATION i.e. from 0.0m to 5m (each Rx uniformaly distributed in a disc of radius 5m around its Tx as per PPP) for
%           different values of ALPHA, dmax and initial number of nodes
%           (nodes density).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% for N=100, alpha=4, gamma *=10dB ,itt=1000 %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc     % clearing and closing already running/open programs n variable n figures etc
clear all   % clearing and closing already running/open programs n variable n figures etc
close all   % clearing and closing already running/open programs n variable n figures etc
itterations=5;  % Minimum required SINR threshold, gamma*=10=10dB
%dmax=5;
tic
R=20;                   % Network Radius, circular network
roh=10;
area=(4/3)*pi*((R)^3);        % Network area
% clu_rad=5; %clustring radius
% k=9; % number of neighbors required to survive the thinning process
%matlabpool('open','4');
for M_ii=1:7
    %M=(1-(rem(1,M_ii)))+(2*(M_ii-1));
M=2^(M_ii-1);
n=0.001*M;        %noise at reciever
%alpha=4;        % path loss exponent
SNRo=10/M;
for dmax_ii=1:2
    dmax=2*dmax_ii;

for alpha_ii=1:2:5
    alpha=3+(0.5*(alpha_ii-1));
% alpha=3+2*(alpha_ii-1);
    
    for users_ii=1:2:25
users_i=10+(10*(users_ii-1));            % Initial number of contending transmitters
%S_S=(1/SNRo)-(n/roh);

for itt=1:itterations
    random_sequence=rand(1,users_i);        % assigning random value [0-1] to each receiver or Tx for assigneing T-R separation.
for i=1:users_i
    r(i)=((rand)^(1/3))*R;                      % generating random positions for Txs uniformaly distributed in a disc of radius R, by using theta defind in next command 
    theta(i)=2*pi*rand;                     % generating random angle U[0-360] for Tx placement
    phi(i)=pi*rand;                         %phi can vary from 0 to pi
    xt1(i)=r(i)*sin(phi(i))*cos(theta(i));              % calculating x-axis value of ith Transmitter
    yt1(i)=r(i)*sin(phi(i))*sin(theta(i));              % calculating y-axis value of ith Transmitter
    zt1(i)=r(i)*cos(phi(i));             % calculating y-axis value of ith Transmitter

% r_r(i)=(rand(1,1))*(dmax);         % generating random hop length U[0-d_max], USE r_r(i)=sqrt(random_sequence(i))*(R/aa);IF YOU WANT TO GENERATE UNIFORM RECEIVERS IN A DISC OF RADIUS R/aa         
r_r(i)=((rand)^(1/3))*(dmax);
    theta_r(i)=2*pi*rand;                   % generating random angle U[0-360], of Rx wrt Tx
    phi_r(i)=pi*rand;
    xt_r(i)=r_r(i)*sin(phi_r(i))*cos(theta_r(i));         % calculating x-axis value of ith Rx wrt ith Tx
    yt_r(i)=r_r(i)*sin(phi_r(i))*sin(theta_r(i));         % calculating y-axis value of ith Rx wrt ith Tx
    zt_r(i)=r_r(i)*cos(phi_r(i));
    
    xr1(i)=xt1(i)+xt_r(i);                  % calculating x-axis value of ith R, this is one(1)
    yr1(i)=yt1(i)+yt_r(i);                  % calculating y-axis value of ith Rx
    zr1(i)=zt1(i)+zt_r(i);                 % calculating z-axis value of ith Rx
    
%     r=sqrt(rand)*R;                      % generating random positions for Txs uniformaly distributed in a disc of radius R, by using theta defind in next command 
%     theta=2*pi*rand;                     % generating random angle U[0-360] for Tx placement
%     xt1(i)=r*cos(theta);              % calculating x-axis value of ith Transmitter
%     yt1(i)=r*sin(theta);              % calculating y-axis value of ith Transmitter
%     r_r=sqrt(rand(1,1))*(dmax);         % generating random hop length U[0-d_max], USE r_r(i)=sqrt(random_sequence(i))*(R/aa);IF YOU WANT TO GENERATE UNIFORM RECEIVERS IN A DISC OF RADIUS R/aa         
%     theta_r=2*pi*rand;                   % generating random angle U[0-360], of Rx wrt Tx
%     xt_r=r_r*cos(theta_r);         % calculating x-axis value of ith Rx wrt ith Tx
%     yt_r=r_r*sin(theta_r);         % calculating y-axis value of ith Rx wrt ith Tx
%     xr1(i)=xt1(i)+xt_r;                  % calculating x-axis value of ith Rx
%     yr1(i)=yt1(i)+yt_r;                  % calculating x-axis value of ith Rx
end
% 
% for i=1:users_i
%     r=sqrt(rand)*R;
%     theta=2*pi*rand;
%     xt_1(i)=r*cos(theta);
%     yt_1(i)=r*sin(theta);
%     r_r=sqrt(rand)*R
%     theta_r=2*pi*rand;                   % generating random angle U[0-360], of Rx wrt Tx
%     xt_r=r_r*cos(theta_r);         % calculating x-axis value of ith Rx wrt ith Tx
%     yt_r=r_r*sin(theta_r);         % calculating y-axis value of ith Rx wrt ith Tx
%     xr1(j)=xt1(j)+xt_r;                  % calculating x-axis value of ith Rx
%     yr1(j)=yt1(j)+yt_r;
% end
% for i=1:users_i
%     for j=1:users_i
% Dist_Mat(i,j)=sqrt(((yt_1(j)-yt_1(i))^2)+((xt_1(j)-xt_1(i))^2)); %Distance between ith transmitter and jth transmitter
%     end
% end
% % Dist_Mat;
% % Thinned=Dist_Mat<clu_rad;
% Thinned_1=Dist_Mat<clu_rad;
% Thinned_2=Dist_Mat>((2*R)-(clu_rad/2));
% Thinned=Thinned_1+Thinned_2;
% Num_of_neghbor=(sum(Thinned))-1;
% j=2;
% xt1(1)=0;
% yt1(1)=0;
% xr1(1)=xt1(1)+((sqrt(rand(1,1))*(dmax))*cos(2*pi*rand));                  
% yr1(1)=yt1(1)+((sqrt(rand(1,1))*(dmax))*sin(2*pi*rand));
% for i=1:users_i
%     if Num_of_neghbor(i)>= k
% xt1(j)=xt_1(i);
% yt1(j)=yt_1(i);
% r_r=sqrt(rand(1,1))*(dmax);         % generating random hop length U[0-d_max], USE r_r(i)=sqrt(random_sequence(i))*(R/aa);IF YOU WANT TO GENERATE UNIFORM RECEIVERS IN A DISC OF RADIUS R/aa         
% 
%     theta_r=2*pi*rand;                   % generating random angle U[0-360], of Rx wrt Tx
%     xt_r=r_r*cos(theta_r);         % calculating x-axis value of ith Rx wrt ith Tx
%     yt_r=r_r*sin(theta_r);         % calculating y-axis value of ith Rx wrt ith Tx
%     xr1(j)=xt1(j)+xt_r;                  % calculating x-axis value of ith Rx
%     yr1(j)=yt1(j)+yt_r;
%     users_c=j;
% j=j+1;
%     else
%         users_c=j-1;
%     end
% end
% N_i_c(itt)=users_c;
xt=xt1;
yt=yt1;
yr=yr1;
xr=xr1; 
zt=zt1;
zr=zr1;

    for delta=1:41
    delta_or=(delta-1)/10;                     % difining values for variable delta
delta_or_i(itt,delta)=0.1+delta_or;
users_initial(itt,delta)=users_i;
lmbda_i(itt,delta)=users_initial(itt,delta)/area;

    
xt2=xt1;
yt2=yt1;
yr2=yr1;
xr2=xr1;
zt2=zt1;
zr2=zr1;

dd=sqrt(((xt2(1)-xr2(1))^2)+ ((yt2(1)-yr2(1))^2) + ((zt2(1)-zr2(1))^2));  % calculating T-R separation for first T-R pair
d2=dd;
if(users_i==1)
    d2=sqrt(((xt2(1)-xr2(1))^2)+ ((yt2(1)-yr2(1))^2) + ((zt2(1)-zr2(1))^2)); % calculating T-R separation for first T-R pair
    dd=d2;
    i=2;
else
 i=2;
for xx=2:users_i
    
for j=1:i
d2(i,j)=sqrt(((xt2(j)-xr2(i))^2)+ ((yt2(j)-yr2(i))^2) + ((zt2(j)-zr2(i))^2));  % d(m,n)=distance btwn mth Rx and nth Tx.
d2(j,i)=sqrt(((xt2(i)-xr2(j))^2)+ ((yt2(i)-yr2(j))^2) + ((zt2(i)-zr2(j))^2));  % d(m,n)=distance btwn mth Rx and nth Tx.
end
      a=0;
    for x=1:(i-1)
                if ((d2(i,x) > ((delta_or_i(itt,delta))*(d2(x,x)))) && (d2(x,i) > ((delta_or_i(itt,delta))*(d2(i,i))))) % checking guard zone criteria, accept new pair if it fulfills the guard zone criteria for all the existing pairs
                    a=a;
                else
                    a=a+1;
                    break % breaking for loop as soon as the guard zone criteria is violated for a single node 
                end
    end
    
  if (a==0)    % a==0 meanse the guard zone critea is full filled by all the considered nodes
        
 i=i+1; % increment i to include next T-R pair for testing guard zone critera in next itteration
 dd=d2;
  else      % a not eual to 0 meanse the guard zone critea not full filled by  the latest considered nodes
    xt2(i)=[];    % deleting the latest considered node from the pool. because it will not transmit/partisipate in communication
    xr2(i)=[];
    yr2(i)=[];
    yt2(i)=[];
    zr2(i)=[];
    zt2(i)=[]; 
  end
end
end

    user_g_z1(itt,delta)=(i-1); % Number of scheduled pairs (for this itteration and this specific value of delta)
    lmbda_g_z1(itt,delta)=user_g_z1(itt,delta)/area;    % Density of scheduled pairs (for this itteration and this specific value of delta)
    itt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%           PAIRWISE POWER CONTROL          %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     

for l=1:user_g_z1(itt,delta)
    for i=1:user_g_z1(itt,delta)
        if i==l
            F2(l,i)=0;  % POWER FROM INTENDED RECEIVER IS NOT INTERFERENCE
        else   %CATERRING FRACTIONAL DISTANCE FOR PATH LOSS MODEL
            if (dd(l,l) < 1.00) && (dd(i,l) > 1.00)
            F2(l,i)=(((1)/(dd(i,l)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
            elseif (dd(l,l) < 1.00) && (dd(i,l) < 1.00)
            F2(l,i)=1;                          % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
            elseif (dd(l,l) > 1.00) && (dd(i,l) < 1.00)
            F2(l,i)=(((dd(l,l))/(1))^alpha);    % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
            else
            F2(l,i)=(((dd(l,l))/(dd(i,l)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
            end
        end
    end
end
FF=sum(F2); % TO CALCULATE TOTAL INTERFERENCE AT AT ITH RECEIVER BY SUMMING UP ALL THE INTERFERER'S EFFECT ON ITH SINGLE RX
% for p=1:9 % FOR PPC
%     for i=1:user_g_z1(itt,delta)   %CONSIDERING ALL SCHEDULED RECEIVERS
%     Pr(p)=p;    % GENERATING ARRAY FOR ROH I.E. ACTUAL SIGNAL POWER RECEIVED AT EACH RX
%     SNR(i)=Pr(p)/(n+(Pr(p))*FF(i));  %% roh 0:0.1:49.9
%     snr_ro(i,p)=SNR(i); % RECEIVED SINR AT ITH RX FOR THIS SPECIFIC VALUE OF ROH (I.E. FOR THIS ITTERARTION)
%     
%     end   
% end

    for i=1:user_g_z1(itt,delta)   %CONSIDERING ALL SCHEDULED RECEIVERS
    snr_ro(i)=roh/(n+(roh)*FF(i)); % RECEIVED SINR AT ITH RX FOR THIS SPECIFIC VALUE OF ROH (I.E. FOR THIS ITTERARTION)
    end   

% % if (user_g_z1(itt,delta)>1)
% % active=sum(snr_ro>=SNRo);
% % else
% %     active=snr_ro>=SNRo;
% % end
% % if user_g_z1(itt,delta)== 1
% %     aaaa=1;
% % else
% users_ii;
% active=sum(snr_ro>=SNRo);
% % if users_ii==1
% % active=sum(snr_ro>=SNRo)   %snr_ro>=SNRo IS GIVING A MATRIX OF ZEROS AND ONES , WHERE A RECEIVER (ITH RECEIVER IF THAT SPECIFIC 1 IS IN ITH ROW) HAS MET THE MINIMUM SINR CONDITION FOR THAT VALUE OF ROH (PTH COLOMN) AND ZERO OTHERWISE
% % else
% %   active=sum(snr_ro>=SNRo);   %snr_ro>=SNRo IS GIVING A MATRIX OF ZEROS AND ONES , WHERE A RECEIVER (ITH RECEIVER IF THAT SPECIFIC 1 IS IN ITH ROW) HAS MET THE MINIMUM SINR CONDITION FOR THAT VALUE OF ROH (PTH COLOMN) AND ZERO OTHERWISE  
% % end
%   [aaaa,index_for_roh]=max(active);           % CALCULATING THE TOTAL NUMBER OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR 
% % end
% 
% 
% Roh(itt,delta)=Pr(index_for_roh);
% 
% users_g_z_ppc1(itt,delta)=aaaa+1;   
users_g_z_ppc1(itt,delta)=sum(snr_ro>=SNRo);  %NUMBER OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR FOR THIS SPECIFIC ITTERATION AND THIS SPECIFIC DELTA (SCHEDULING)

lmbda_g_z_ppc1(itt,delta)=users_g_z_ppc1(itt,delta)/area;   %DENSITY OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR FOR THIS SPECIFIC ITTERATION AND THIS SPECIFIC DELTA (SCHEDULING)
clear active snr_ro SNR FF F2

xt3=xt1;
yt3=yt1;
yr3=yr1;
xr3=xr1;
zt3=zt1;
zr3=zr1;

    
dd3=sqrt(((xt3(1)-xr3(1))^2)+ ((yt3(1)-yr3(1))^2) + ((zt3(1)-zr3(1))^2));  % calculating T-R separation for first T-R pair
d3=dd3;
if(users_i==1)
    d3=sqrt(((xt3(1)-xr3(1))^2)+ ((yt3(1)-yr3(1))^2) + ((zt3(1)-zr3(1))^2)); % calculating T-R separation for first T-R pair
    dd3=d3;
    i=2;
else
 i=2;
for xx=2:users_i
    
for j=1:i
d3(i,j)=sqrt(((xt3(j)-xr3(i))^2)+ ((yt3(j)-yr3(i))^2) + ((zt3(j)-zr3(i))^2));  % d(m,n)=distance btwn mth Rx and nth Tx.
d3(j,i)=sqrt(((xt3(i)-xr3(j))^2)+ ((yt3(i)-yr3(j))^2) + ((zt3(i)-zr3(j))^2));  % d(m,n)=distance btwn mth Rx and nth Tx.
end
      a=0;
    for x=1:(i-1)
                if ((d3(i,x) > ((delta_or_i(itt,delta))*(dmax))) && (d3(x,i) > ((delta_or_i(itt,delta))*(dmax)))) % checking guard zone criteria, accept new pair if it fulfills the guard zone criteria for all the existing pairs
                    a=a;
                else
                    a=a+1;
                    break % breaking for loop as soon as the guard zone criteria is violated for a single node 
                end
    end
    
  if (a==0)    % a==0 meanse the guard zone critea is full filled by all the considered nodes
        
 i=i+1; % increment i to include next T-R pair for testing guard zone critera in next itteration
 dd3=d3;
  else      % a not eual to 0 meanse the guard zone critea not full filled by  the latest considered nodes
    xt3(i)=[];    % deleting the latest considered node from the pool. because it will not transmit/partisipate in communication
    xr3(i)=[];
    yr3(i)=[];
    yt3(i)=[];
    zr3(i)=[];
    zt3(i)=[]; 
  end
end
end

    user_g_z_fix(itt,delta)=(i-1); % Number of scheduled pairs (for this itteration and this specific value of delta)
    lmbda_g_z_fix(itt,delta)=user_g_z_fix(itt,delta)/area;    % Density of scheduled pairs (for this itteration and this specific value of delta)
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%           PAIRWISE POWER CONTROL          %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     

for l=1:user_g_z_fix(itt,delta)
    for i=1:user_g_z_fix(itt,delta)
        if i==l
            F3(l,i)=0;  % POWER FROM INTENDED RECEIVER IS NOT INTERFERENCE
        else   %CATERRING FRACTIONAL DISTANCE FOR PATH LOSS MODEL
            if (dd3(l,l) < 1.00) && (dd3(i,l) > 1.00)
            F3(l,i)=(((1)/(dd3(i,l)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
            elseif (dd3(l,l) < 1.00) && (dd3(i,l) < 1.00)
            F3(l,i)=1;                          % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
            elseif (dd3(l,l) > 1.00) && (dd3(i,l) < 1.00)
            F3(l,i)=(((dd3(l,l))/(1))^alpha);    % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
            else
            F3(l,i)=(((dd3(l,l))/(dd3(i,l)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
            end
        end
    end
end
FF3=sum(F3); % TO CALCULATE TOTAL INTERFERENCE AT AT ITH RECEIVER BY SUMMING UP ALL THE INTERFERER'S EFFECT ON ITH SINGLE RX
% for p=1:9 % FOR PPC
%     for i=1:user_g_z_fix(itt,delta)   %CONSIDERING ALL SCHEDULED RECEIVERS
%     Pr3(p)=p;    % GENERATING ARRAY FOR ROH I.E. ACTUAL SIGNAL POWER RECEIVED AT EACH RX
%     SNR3(i)=Pr3(p)/(n+(Pr3(p))*FF3(i));  %% roh 0:0.1:49.9
%     snr_ro3(i,p)=SNR3(i); % RECEIVED SINR AT ITH RX FOR THIS SPECIFIC VALUE OF ROH (I.E. FOR THIS ITTERARTION)
%     
%     end   
% end
% 
% % if (user_g_z1(itt,delta)>1)
% % active=sum(snr_ro>=SNRo);
% % else
% %     active=snr_ro>=SNRo;
% % end
% % if user_g_z1(itt,delta)== 1
% %     aaaa=1;
% % else
    for i=1:user_g_z_fix(itt,delta)   %CONSIDERING ALL SCHEDULED RECEIVERS
    snr_ro3(i)=roh/(n+(roh)*FF3(i)); % RECEIVED SINR AT ITH RX FOR THIS SPECIFIC VALUE OF ROH (I.E. FOR THIS ITTERARTION)
    end  

% active3=sum(snr_ro3>=SNRo);
% % if users_ii==1
% % active3=sum(snr_ro3>=SNRo)  %snr_ro>=SNRo IS GIVING A MATRIX OF ZEROS AND ONES , WHERE A RECEIVER (ITH RECEIVER IF THAT SPECIFIC 1 IS IN ITH ROW) HAS MET THE MINIMUM SINR CONDITION FOR THAT VALUE OF ROH (PTH COLOMN) AND ZERO OTHERWISE
% % else
% %    active3=sum(snr_ro3>=SNRo); 
% % end
% [aaaa3,index_for_roh3]=max(active3);           % CALCULATING THE TOTAL NUMBER OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR 
% % end
% 
% 
% Roh3(itt,delta)=Pr3(index_for_roh3);
% 
% users_g_z_ppc_fix(itt,delta)=aaaa3+1;   
users_g_z_ppc_fix(itt,delta)=sum(snr_ro3>=SNRo);  %NUMBER OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR FOR THIS SPECIFIC ITTERATION AND THIS SPECIFIC DELTA (SCHEDULING)

lmbda_g_z_ppc_fix(itt,delta)=users_g_z_ppc_fix(itt,delta)/area;   %DENSITY OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR FOR THIS SPECIFIC ITTERATION AND THIS SPECIFIC DELTA (SCHEDULING)
clear active3 snr_ro3 SNR3 FF3 F3

xt4=xt1;
yt4=yt1;
yr4=yr1;
xr4=xr1;
zt4=zt1;
zr4=zr1;

    
dd_csma=sqrt(((xt4(1)-xt4(1))^2)+ ((yt4(1)-yt4(1))^2) + ((zt4(1)-zt4(1))^2));  % calculating T-R separation for first T-R pair
dd4=sqrt(((xt4(1)-xr4(1))^2)+ ((yt4(1)-yr4(1))^2) + ((zt4(1)-zr4(1))^2));
d4=dd4;
d_csma=dd_csma;
if(users_i==1)
    d4=sqrt(((xt4(1)-xr4(1))^2)+ ((yt4(1)-yr4(1))^2) + ((zt4(1)-zr4(1))^2)); % calculating T-R separation for first T-R pair
    d_csma=sqrt(((xt4(1)-xt4(1))^2)+ ((yt4(1)-yt4(1))^2) + ((zt4(1)-zt4(1))^2));
    dd4=d4;
    dd_csma=d_csma;
    i=2;
else
 i=2;
for xx=2:users_i                             %
    
for j=1:i
d4(i,j)=sqrt(((xt4(j)-xr4(i))^2)+ ((yt4(j)-yr4(i))^2) + ((zt4(j)-zr4(i))^2));  % d(m,n)=distance btwn mth Rx and nth Tx.
d_csma(i,j)=sqrt(((xt4(j)-xt4(i))^2)+ ((yt4(j)-yt4(i))^2) + ((zt4(j)-zt4(i))^2));

d4(j,i)=sqrt(((xt4(i)-xr4(j))^2)+ ((yt4(i)-yr4(j))^2) + ((zt4(i)-zr4(j))^2));  % d(m,n)=distance btwn mth Rx and nth Tx.
d_csma(j,i)=sqrt(((xt4(i)-xt4(j))^2)+ ((yt4(i)-yt4(j))^2) + ((zt4(i)-zt4(j))^2));
end
      a=0;
    for x=1:(i-1)
                if ((d_csma(i,x) > ((delta_or_i(itt,delta))*(dmax)))) % checking guard zone criteria, accept new pair if it fulfills the guard zone criteria for all the existing pairs
                    a=a;
                else
                    a=a+1;
                    break % breaking for loop as soon as the guard zone criteria is violated for a single node 
                end
    end
    
  if (a==0)    % a==0 meanse the guard zone critea is full filled by all the considered nodes
        
 i=i+1; % increment i to include next T-R pair for testing guard zone critera in next itteration
 dd4=d4;
 dd_csma=d_csma;
  else      % a not eual to 0 meanse the guard zone critea not full filled by  the latest considered nodes
    xt4(i)=[];    % deleting the latest considered node from the pool. because it will not transmit/partisipate in communication
    xr4(i)=[];
    yr4(i)=[];
    yt4(i)=[];
    zr4(i)=[];
    zt4(i)=[]; 
  end
end
end

    user_g_z_csma(itt,delta)=(i-1); % Number of scheduled pairs (for this itteration and this specific value of delta)
    lmbda_g_z_csma(itt,delta)=user_g_z_csma(itt,delta)/area;    % Density of scheduled pairs (for this itteration and this specific value of delta)
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%           PAIRWISE POWER CONTROL          %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     

for l=1:user_g_z_csma(itt,delta)
    for i=1:user_g_z_csma(itt,delta)
        if i==l
            F4(l,i)=0;  % POWER FROM INTENDED RECEIVER IS NOT INTERFERENCE
        else   %CATERRING FRACTIONAL DISTANCE FOR PATH LOSS MODEL
            if (dd4(l,l) < 1.00) && (dd4(i,l) > 1.00)
            F4(l,i)=(((1)/(dd4(i,l)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
            elseif (dd4(l,l) < 1.00) && (dd4(i,l) < 1.00)
            F4(l,i)=1;                          % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
            elseif (dd4(l,l) > 1.00) && (dd4(i,l) < 1.00)
            F4(l,i)=(((dd4(l,l))/(1))^alpha);    % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
            else
            F4(l,i)=(((dd4(l,l))/(dd4(i,l)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
            end
        end
    end
end
FF4=sum(F4); % TO CALCULATE TOTAL INTERFERENCE AT AT ITH RECEIVER BY SUMMING UP ALL THE INTERFERER'S EFFECT ON ITH SINGLE RX
% for p=1:9 % FOR PPC
%     for i=1:user_g_z_csma(itt,delta)   %CONSIDERING ALL SCHEDULED RECEIVERS
%     Pr4(p)=p;    % GENERATING ARRAY FOR ROH I.E. ACTUAL SIGNAL POWER RECEIVED AT EACH RX
%     SNR4(i)=Pr4(p)/(n+(Pr4(p))*FF4(i));  %% roh 0:0.1:49.9
%     snr_ro4(i,p)=SNR4(i); % RECEIVED SINR AT ITH RX FOR THIS SPECIFIC VALUE OF ROH (I.E. FOR THIS ITTERARTION)
%     
%     end   
% end
% 
% % if (user_g_z1(itt,delta)>1)
% % active=sum(snr_ro>=SNRo);
% % else
% %     active=snr_ro>=SNRo;
% % end
% % if user_g_z1(itt,delta)== 1
% %     aaaa=1;
% % else

    for i=1:user_g_z_csma(itt,delta)   %CONSIDERING ALL SCHEDULED RECEIVERS
    snr_ro4(i)=roh/(n+(roh)*FF4(i)); % RECEIVED SINR AT ITH RX FOR THIS SPECIFIC VALUE OF ROH (I.E. FOR THIS ITTERARTION)
    end  
% active4=sum(snr_ro4>=SNRo);
% % if users_ii==1
% % active4=sum(snr_ro4>=SNRo)   %snr_ro>=SNRo IS GIVING A MATRIX OF ZEROS AND ONES , WHERE A RECEIVER (ITH RECEIVER IF THAT SPECIFIC 1 IS IN ITH ROW) HAS MET THE MINIMUM SINR CONDITION FOR THAT VALUE OF ROH (PTH COLOMN) AND ZERO OTHERWISE
% % else
% %   active4=sum(snr_ro4>=SNRo);  
% % end
% [aaaa4,index_for_roh4]=max(active4);           % CALCULATING THE TOTAL NUMBER OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR 
% % end
% 
% 
% Roh4(itt,delta)=Pr4(index_for_roh4);
% 
% users_g_z_ppc_csma(itt,delta)=aaaa4+1;   
users_g_z_ppc_csma(itt,delta)=sum(snr_ro4>=SNRo);  %NUMBER OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR FOR THIS SPECIFIC ITTERATION AND THIS SPECIFIC DELTA (SCHEDULING)

lmbda_g_z_ppc_csma(itt,delta)=users_g_z_ppc_csma(itt,delta)/area;   %DENSITY OF RECEVERS WITH RECEIVED SINR GREATER THAN OR EQUAL TO MINIMUM REQUIRED SINR FOR THIS SPECIFIC ITTERATION AND THIS SPECIFIC DELTA (SCHEDULING)
clear active4 snr_ro4 SNR4 FF4 F4



clear Thinned_1 dd3 d3 snr_ro3 SNR3 aaaa3 FF3 Thinned_2 snr_ro3 index_for_roh3 Pr3 Thinned Num_of_neghbor Dist_Mat yt_1 xt_1 xt4 xt2 xr4 xr2 zr4 zt4 yr4 yr2 yt4 yt2 xt3 xt2 xr3 xr2 yr3 yr2 yt3 yt2 zr3 zr2 zt3 zt2 a b abcd2 zzz2 sss2 dist_2 xt_ppc xr_ppc yt_ppc yr_ppc d d_gz dd d1 d2 d2tx ltx F F1 F2 FF snr_ro SNR active i power_ppc aaaa index_for_roh

% end
clear dd4 d4 snr_ro4 SNR4 aaaa4 FF4 Thinned_2 snr_ro4 index_for_roh4 Pr4 Thinned xt t_r1 t_r2 t_r3 t_r4 t_r5 t_r6 t_r7 a_1 b_1 a_2 b_2 a_3 b_3 a_4 b_4 a_5 b_5 a_6 b_6 a_7 b_7 xt2 xr xr2 yr yr2 yt yt2 d dist_i dist_1 dd d1 d2 F F1 F2 FF U U1 Id snr_ro active i nmb nmb2 Perito power_ppc aaaa aaaa3
    end
clear Thinned_1 Thinned_2 Thinned Num_of_neghbor Dist_Mat yt_1 xt_1 xr1 xt1 yr1 yt1 zt1 zr1 random_sequence

if (itt==1)
    deltaori=delta_or_i;
    lmbdai=lmbda_i;
    lmbdagz1=lmbda_g_z1;
    lmbdagzppc1=lmbda_g_z_ppc1;
    usersgzppc1=users_g_z_ppc1;
%     Roh_ppc=Roh;
        lmbdagz3=lmbda_g_z_fix;
    lmbdagzppc3=lmbda_g_z_ppc_fix;
    usersgzppc3=users_g_z_ppc_fix;
%     Roh_ppc3=Roh3;
    
            lmbdagz4=lmbda_g_z_csma;
    lmbdagzppc4=lmbda_g_z_ppc_csma;
    usersgzppc4=users_g_z_ppc_csma;
%     Roh_ppc4=Roh4;

else        % AVERAGING OVER ALL ITTERATIONS TO GET RELIABLE AND REALISTIC RESULTS
    deltaori=sum(delta_or_i)/itt;
    lmbdai=sum(lmbda_i)/itt;
    lmbdagz1=sum(lmbda_g_z1)/itt;
    lmbdagzppc1=sum(lmbda_g_z_ppc1)/itt;
    usersgzppc1=sum(users_g_z_ppc1)/itt;
%     Roh_ppc=sum(Roh)/itt;
        lmbdagz3=sum(lmbda_g_z_fix)/itt;
    lmbdagzppc3=sum(lmbda_g_z_ppc_fix)/itt;
    usersgzppc3=sum(users_g_z_ppc_fix)/itt;
%     Roh_ppc3=sum(Roh3)/itt;
    
            lmbdagz4=sum(lmbda_g_z_csma)/itt;
    lmbdagzppc4=sum(lmbda_g_z_ppc_csma)/itt;
    usersgzppc4=sum(users_g_z_ppc_csma)/itt;
%     Roh_ppc4=sum(Roh4)/itt;
end

gzppc1_per_gz1=lmbdagzppc1./lmbdagz1;
gzppc3_per_gz3=lmbdagzppc3./lmbdagz3;
gzppc4_per_gz4=lmbdagzppc4./lmbdagz4;
%itt
end
[C,I] = max(lmbdagzppc1);
DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii)=deltaori(I);
[C3,I3] = max(lmbdagzppc3);
DELTA_OPT3(alpha_ii,users_ii,dmax_ii,M_ii)=(deltaori(I3));
[C4,I4] = max(lmbdagzppc4);
DELTA_OPT4(alpha_ii,users_ii,dmax_ii,M_ii)=(deltaori(I4));
users_ii;
%N_i_clu(users_ii)=sum(N_i_c)/itt;
    end
    M_ii;
    dmax_ii;
    alpha_ii;
end
end
end
toc
for M_ii=1:7
    %M=(1-(rem(1,M_ii)))+(2*(M_ii-1));
    M=2^(M_ii-1);
for dmax_ii=1:2
    dmax=2*dmax_ii;
for alpha_ii=1:2:5
    alpha=3+(0.5*(alpha_ii-1));
    for users_ii=1:25
    if DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii) == 0
    DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii)=(DELTA_OPT(alpha_ii,users_ii-1,dmax_ii,M_ii) + DELTA_OPT(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
    DELTA_OPT3(alpha_ii,users_ii,dmax_ii,M_ii)=(DELTA_OPT3(alpha_ii,users_ii-1,dmax_ii,M_ii) + DELTA_OPT3(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
    DELTA_OPT4(alpha_ii,users_ii,dmax_ii,M_ii)=(DELTA_OPT4(alpha_ii,users_ii-1,dmax_ii,M_ii) + DELTA_OPT4(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
    else
    end
    end
end
end
end

for M_ii=1:7
    %M=(1-(rem(1,M_ii)))+(2*(M_ii-1));
    M=2^(M_ii-1);
for dmax_ii=1:2
    dmax=2*dmax_ii;
for alpha_ii=1:5
    alpha=3+(0.5*(alpha_ii-1));
    for users_ii=1:25
    if DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii) == 0
        DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii)=(DELTA_OPT(alpha_ii-1,users_ii,dmax_ii,M_ii) + DELTA_OPT(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
    DELTA_OPT3(alpha_ii,users_ii,dmax_ii,M_ii)=(DELTA_OPT3(alpha_ii-1,users_ii,dmax_ii,M_ii) + DELTA_OPT3(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
    DELTA_OPT4(alpha_ii,users_ii,dmax_ii,M_ii)=(DELTA_OPT4(alpha_ii-1,users_ii,dmax_ii,M_ii) + DELTA_OPT4(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
    else
    end
    end
end
end
end


DELTA_OPT;
DELTA_OPT3;
DELTA_OPT4;
itt
toc
%matlabpool('close');
save Simulated_optimal_delta_for_var_M_N_alpha_and_dmax_3D_R20_N250_itt_500.mat











clear all
close all
clc

load Simulated_optimal_delta_for_var_M_N_alpha_and_dmax_3D_R20_N250_itt_500.mat

clearvars -except DELTA_OPT DELTA_OPT3 DELTA_OPT4

tic
itterations=5;
roh=10;
R=20;
area=(4/3)*pi*((R)^3);        % Network area


for M_ii=1:7
    %M=(1-(rem(1,M_ii)))+(2*(M_ii-1));
M=2^(M_ii-1);
    M_i_ary(M_ii)=M;
    n=0.001*M;        %noise at reciever
    SNRo=10/M;
    for dmax_ii=1:2
        dmax=2*dmax_ii;
        dmax_i_ary(dmax_ii)=dmax;
        for alpha_ii=1:2:5
            alpha=3+(0.5*(alpha_ii-1));
            alpha_i_ary(alpha_ii)=alpha;
            %         for users_ii=1:8
            %             users_i=10+(40*(users_ii-1));
            %             users_i_ary(users_ii)=users_i ;
            %             lambda_i_ary(users_ii)=users_i/area;
            for itt=1:itterations
                for users_ii=1:2:25
                    users_i=10+(10*(users_ii-1));
                    users_i_ary(users_ii)=users_i;
                    lambda_i_ary(users_ii)=users_i/area;
                    
                    
                    if (users_ii==1)
                        
                        
                        for users=1:users_i
                            
                            r(users)=((rand)^(1/3))*R;                      % generating random positions for Txs uniformaly distributed in a disc of radius R, by using theta defind in next command
                            theta(users)=2*pi*rand;                     % generating random angle U[0-360] for Tx placement
                            phi(users)=pi*rand;                         %phi can vary from 0 to pi
                            xt1(users)=r(users)*sin(phi(users))*cos(theta(users));              % calculating x-axis value of ith Transmitter
                            yt1(users)=r(users)*sin(phi(users))*sin(theta(users));              % calculating y-axis value of ith Transmitter
                            zt1(users)=r(users)*cos(phi(users));             % calculating y-axis value of ith Transmitter
                            
                            % r_r(users)=(rand(1,1))*(dmax);         % generating random hop length U[0-d_max], USE r_r(users)=sqrt(random_sequence(users))*(R/aa);IF YOU WANT TO GENERATE UNIFORM RECEIVERS IN A DISC OF RADIUS R/aa
                            r_r(users)=((rand)^(1/3))*(dmax);
                            theta_r(users)=2*pi*rand;                   % generating random angle U[0-360], of Rx wrt Tx
                            phi_r(users)=pi*rand;
                            xt_r(users)=r_r(users)*sin(phi_r(users))*cos(theta_r(users));         % calculating x-axis value of ith Rx wrt ith Tx
                            yt_r(users)=r_r(users)*sin(phi_r(users))*sin(theta_r(users));         % calculating y-axis value of ith Rx wrt ith Tx
                            zt_r(users)=r_r(users)*cos(phi_r(users));
                            
                            xr1(users)=xt1(users)+xt_r(users);                  % calculating x-axis value of ith R, this is one(1)
                            yr1(users)=yt1(users)+yt_r(users);                  % calculating y-axis value of ith Rx
                            zr1(users)=zt1(users)+zt_r(users);                 % calculating z-axis value of ith Rx
                        end

                        clear Num_of_neghbor Dist_Mat Thinned Thinned_1 Thinned_2
                        users_i_ary_clustered(itt,users_ii)=users_i;
                        lambda_i_ary_clustered(itt,users_ii)=users_i/area;
                        
                        
                        xt_4=xt1;
                        yt_4=yt1;
                        yr_4=yr1;
                        xr_4=xr1;
                        zt_4=zt1;
                        zr_4=zr1;
                        
                        xt2_gz2_4=xt1;
                        yt2_gz2_4=yt1;
                        yr2_gz2_4=yr1;
                        xr2_gz2_4=xr1;
                        zt2_gz2_4=zt1;
                        zr2_gz2_4=zr1;
                        
                        
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            for j=1:users_i_ary_clustered(itt,users_ii)
                                d_wogz(j,i)=sqrt(((xt1(i)-xr1(j))^2)+ ((yt1(i)-yr1(j))^2) + ((zt1(i)-zr1(j))^2));
                            end
                        end
                        
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            for j=1:users_i_ary_clustered(itt,users_ii)
                                if (i==j)
                                    F_wogz_41(j,i)=0;
                                else
                                    if (d_wogz(j,j) < 1.00) && (d_wogz(i,j) > 1.00)
                                        F_wogz_41(j,i)=(((1)/(d_wogz(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (d_wogz(j,j) < 1.00) && (d_wogz(i,j) < 1.00)
                                        F_wogz_41(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (d_wogz(j,j) > 1.00) && (d_wogz(i,j) < 1.00)
                                        F_wogz_41(j,i)=(((d_wogz(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F_wogz_41(j,i)=(((d_wogz(j,j))/(d_wogz(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                end
                            end
                        end
                        
                        FF_wogz_4=sum(F_wogz_41);
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            snr_ro_wogz_4(i)=roh/(n+(roh*FF_wogz_4(i)));
                        end
                        
                        active_wogz_4=snr_ro_wogz_4>=SNRo;
                        zzz2_wogz_4=active_wogz_4;
                        users_wogz_4(itt,users_ii)=sum(active_wogz_4);
                        lmbda_wogz_4(itt,users_ii)=users_wogz_4(itt,users_ii)/area;
                        dist_2_wogz_4=0;
                        
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            if (zzz2_wogz_4(i)==1)
                                dist_2_wogz_4=dist_2_wogz_4+(sqrt(((xt1(i)-xr1(i))^2)+ ((yt1(i)-yr1(i))^2) + ((zt1(i)-zr1(i))^2)));
                            else
                                dist_2_wogz_4=dist_2_wogz_4+0;
                            end
                        end
                        dist1_wogz_4(itt,users_ii)=dist_2_wogz_4;
                        
                        clear p_4 dist_2_wogz_4 roh_opt_wogz_4 active_wogz_4 index_wogz_4 abcd2_wogz_4 xt_ppc_wogz_4 xr_ppc_wogz_4 yt_ppc_wogz_4 yr_ppc_wogz_4 sss2_wogz_4 zzz2_wogz_4
                        
                        
                        
                        N_4=1;
                        for k=1:users_i_ary_clustered(itt,users_ii)
                            
                            for i=1:N_4
                                d_4(N_4,i)=sqrt(((xt_4(i)-xr_4(N_4))^2)+ ((yt_4(i)-yr_4(N_4))^2) + ((zt_4(i)-zr_4(N_4))^2));
                                d_4(i,N_4)=sqrt(((xt_4(N_4)-xr_4(i))^2)+ ((yt_4(N_4)-yr_4(i))^2) + ((zt_4(N_4)-zr_4(i))^2));
                            end
                            
                            for i=1:N_4
                                if i==N_4
                                    F_4(N_4,i)=0;
                                else
                                    F_4(N_4,i)=SNRo*(((d_4(N_4,N_4))/(d_4(N_4,i)))^alpha);
                                    F_4(i,N_4)=SNRo*(((d_4(i,i))/(d_4(i,N_4)))^alpha);
                                end
                            end
                            
                            [V_4,D_4]=eig(F_4);
                            
                            if ((max(max(abs(D_4)))) < 1)
                                N_4=N_4+1;
                                F1_4=F_4;
                                d1_4=d_4;
                            else
                                xt_4(N_4)=[];
                                xr_4(N_4)=[];
                                yr_4(N_4)=[];
                                yt_4(N_4)=[];
                                zr_4(N_4)=[];
                                zt_4(N_4)=[];
                            end
                        end
                        % end
                        N_4;%%%%%%%%%%%%%%%%%%%%
                        F1_4;%%%%%%%%%%%%%%%%%%%
                        d1_4;%%%%%%%%%%%%%%%%%%%%%%%
                        % nmb2=N-1;
                        users_s_4(itt,users_ii)=N_4-1;
                        lmbda_s_4(itt,users_ii)=users_s_4(itt,users_ii)/area;
                        
                        dist_1_4=0;
                        for i=1:users_s_4(itt,users_ii)
                            dist_1_4=dist_1_4+(sqrt(((xt_4(i)-xr_4(i))^2)+ ((yt_4(i)-yr_4(i))^2) + ((zt_4(i)-zr_4(i))^2)));
                        end
                        dist_4(itt,users_ii)=dist_1_4;
                        clear N_4 F_4 d_4 d1_4 F1_4 xt_4 xr_4 yt_4 yr_4
                        
                        xt2_gz2_4=xt1;
                        yt2_gz2_4=yt1;
                        yr2_gz2_4=yr1;
                        xr2_gz2_4=xr1;
                        zt2_gz2_4=zt1;
                        zr2_gz2_4=zr1;
                        
                        delta_or=DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii);
                        
                        xt2_gz2_fix=xt1;
                        yt2_gz2_fix=yt1;
                        yr2_gz2_fix=yr1;
                        xr2_gz2_fix=xr1;
                        zt2_gz2_fix=zt1;
                        zr2_gz2_fix=zr1;
                        
                        delta_or3=DELTA_OPT3(alpha_ii,users_ii,dmax_ii,M_ii);
                        
                        xt2_gz2_csma=xt1;
                        yt2_gz2_csma=yt1;
                        yr2_gz2_csma=yr1;
                        xr2_gz2_csma=xr1;
                        zt2_gz2_csma=zt1;
                        zr2_gz2_csma=zr1;
                        
                        delta_or4=DELTA_OPT4(alpha_ii,users_ii,dmax_ii,M_ii);
                        
                        for k=1:users_i_ary_clustered(itt,users_ii)
                            
                            if(k==1)      %%%%%%   Proposed i.e. (1+delta)dtx with alpha=4, gamma*=10db
                                d2_gz2_4=sqrt(((xt2_gz2_4(1)-xr2_gz2_4(1))^2)+ ((yt2_gz2_4(1)-yr2_gz2_4(1))^2) + ((zt2_gz2_4(1)-zr2_gz2_4(1))^2));
                                dd_gz2_4=d2_gz2_4;
                                users_ii_gz2_4=2;
                                
                                d2_gz2_fix=sqrt(((xt2_gz2_fix(1)-xr2_gz2_fix(1))^2)+ ((yt2_gz2_fix(1)-yr2_gz2_fix(1))^2) + ((zt2_gz2_fix(1)-zr2_gz2_fix(1))^2));
                                dd_gz2_fix=d2_gz2_fix;
                                users_ii_gz2_fix=2;
                                
                                d2_gz2_csma=sqrt(((xt2_gz2_csma(1)-xr2_gz2_csma(1))^2)+ ((yt2_gz2_csma(1)-yr2_gz2_csma(1))^2) + ((zt2_gz2_csma(1)-zr2_gz2_csma(1))^2));
                                DGZ_csma=sqrt(((xt2_gz2_csma(1)-xt2_gz2_csma(1))^2)+ ((yt2_gz2_csma(1)-yt2_gz2_csma(1))^2) + ((zt2_gz2_csma(1)-zt2_gz2_csma(1))^2));
                                dd_gz2_csma=d2_gz2_csma;
                                DDGZ_csma=DGZ_csma;
                                users_ii_gz2_csma=2;
                                
                            else
                                for j=1:users_ii_gz2_4
                                    d2_gz2_4(users_ii_gz2_4,j)=sqrt(((xt2_gz2_4(j)-xr2_gz2_4(users_ii_gz2_4))^2)+ ((yt2_gz2_4(j)-yr2_gz2_4(users_ii_gz2_4))^2) + ((zt2_gz2_4(j)-zr2_gz2_4(users_ii_gz2_4))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    d2_gz2_4(j,users_ii_gz2_4)=sqrt(((xt2_gz2_4(users_ii_gz2_4)-xr2_gz2_4(j))^2)+ ((yt2_gz2_4(users_ii_gz2_4)-yr2_gz2_4(j))^2) + ((zt2_gz2_4(users_ii_gz2_4)-zr2_gz2_4(j))^2));
                                end
                                for j=1:users_ii_gz2_fix
                                    d2_gz2_fix(users_ii_gz2_fix,j)=sqrt(((xt2_gz2_fix(j)-xr2_gz2_fix(users_ii_gz2_fix))^2)+ ((yt2_gz2_fix(j)-yr2_gz2_fix(users_ii_gz2_fix))^2) + ((zt2_gz2_fix(j)-zr2_gz2_fix(users_ii_gz2_fix))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    d2_gz2_fix(j,users_ii_gz2_fix)=sqrt(((xt2_gz2_fix(users_ii_gz2_fix)-xr2_gz2_fix(j))^2)+ ((yt2_gz2_fix(users_ii_gz2_fix)-yr2_gz2_fix(j))^2) + ((zt2_gz2_fix(users_ii_gz2_fix)-zr2_gz2_fix(j))^2));
                                end
                                for j=1:users_ii_gz2_csma
                                    d2_gz2_csma(users_ii_gz2_csma,j)=sqrt(((xt2_gz2_csma(j)-xr2_gz2_csma(users_ii_gz2_csma))^2)+ ((yt2_gz2_csma(j)-yr2_gz2_csma(users_ii_gz2_csma))^2) + ((zt2_gz2_csma(j)-zr2_gz2_csma(users_ii_gz2_csma))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    d2_gz2_csma(j,users_ii_gz2_csma)=sqrt(((xt2_gz2_csma(users_ii_gz2_csma)-xr2_gz2_csma(j))^2)+ ((yt2_gz2_csma(users_ii_gz2_csma)-yr2_gz2_csma(j))^2) + ((zt2_gz2_csma(users_ii_gz2_csma)-zr2_gz2_csma(j))^2));
                                    DGZ_csma(users_ii_gz2_csma,j)=sqrt(((xt2_gz2_csma(j)-xt2_gz2_csma(users_ii_gz2_csma))^2)+ ((yt2_gz2_csma(j)-yt2_gz2_csma(users_ii_gz2_csma))^2) + ((zt2_gz2_csma(j)-zt2_gz2_csma(users_ii_gz2_csma))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    DGZ_csma(j,users_ii_gz2_csma)=sqrt(((xt2_gz2_csma(users_ii_gz2_csma)-xt2_gz2_csma(j))^2)+ ((yt2_gz2_csma(users_ii_gz2_csma)-yt2_gz2_csma(j))^2) + ((zt2_gz2_csma(users_ii_gz2_csma)-zt2_gz2_csma(j))^2));
                                end
                                a=0;
                                for x=1:(users_ii_gz2_4-1)
                                    if ((d2_gz2_4(users_ii_gz2_4,x) > ((delta_or)*(d2_gz2_4(x,x)))) && (d2_gz2_4(x,users_ii_gz2_4) > ((delta_or)*(d2_gz2_4(users_ii_gz2_4,users_ii_gz2_4)))))
                                        a=a;
                                    else
                                        a=a+1;
                                        break
                                    end
                                end
                                
                                if (a==0)
                                    dd_gz2_4=d2_gz2_4;
                                    users_ii_gz2_4=users_ii_gz2_4+1;
                                else
                                    xt2_gz2_4(users_ii_gz2_4)=[];
                                    xr2_gz2_4(users_ii_gz2_4)=[];
                                    yr2_gz2_4(users_ii_gz2_4)=[];
                                    yt2_gz2_4(users_ii_gz2_4)=[];
                                    zr2_gz2_4(users_ii_gz2_4)=[];
                                    zt2_gz2_4(users_ii_gz2_4)=[];
                                end
                                b=0;
                                for x=1:(users_ii_gz2_fix-1)
                                    if ((d2_gz2_fix(users_ii_gz2_fix,x) > ((delta_or3)*(dmax))) && (d2_gz2_fix(x,users_ii_gz2_fix) > ((delta_or3)*(dmax))))
                                        b=b;
                                    else
                                        b=b+1;
                                        break
                                    end
                                end
                                
                                if (b==0)
                                    dd_gz2_fix=d2_gz2_fix;
                                    users_ii_gz2_fix=users_ii_gz2_fix+1;
                                else
                                    xt2_gz2_fix(users_ii_gz2_fix)=[];
                                    xr2_gz2_fix(users_ii_gz2_fix)=[];
                                    yr2_gz2_fix(users_ii_gz2_fix)=[];
                                    yt2_gz2_fix(users_ii_gz2_fix)=[];
                                    zr2_gz2_fix(users_ii_gz2_fix)=[];
                                    zt2_gz2_fix(users_ii_gz2_fix)=[];
                                end
                                
                                c=0;
                                for x=1:(users_ii_gz2_csma-1)
                                    if (DGZ_csma(users_ii_gz2_csma,x) > ((delta_or4)*(dmax)))
                                        c=c;
                                    else
                                        c=c+1;
                                        break
                                    end
                                end
                                
                                if (c==0)
                                    dd_gz2_csma=d2_gz2_csma;
                                    users_ii_gz2_csma=users_ii_gz2_csma+1;
                                    DDGZ_csma=DGZ_csma;
                                else
                                    xt2_gz2_csma(users_ii_gz2_csma)=[];
                                    xr2_gz2_csma(users_ii_gz2_csma)=[];
                                    yr2_gz2_csma(users_ii_gz2_csma)=[];
                                    yt2_gz2_csma(users_ii_gz2_csma)=[];
                                    zr2_gz2_csma(users_ii_gz2_csma)=[];
                                    zt2_gz2_csma(users_ii_gz2_csma)=[];
                                end
                            end
                        end
                        user_g_z2_4(itt,users_ii)=(users_ii_gz2_4-1);
                        lmbda_g_z2_4(itt,users_ii)=user_g_z2_4(itt,users_ii)/area;
                        user_g_z2_fix(itt,users_ii)=(users_ii_gz2_fix-1);
                        lmbda_g_z2_fix(itt,users_ii)=user_g_z2_fix(itt,users_ii)/area;
                        user_g_z2_csma(itt,users_ii)=(users_ii_gz2_csma-1);
                        lmbda_g_z2_csma(itt,users_ii)=user_g_z2_csma(itt,users_ii)/area;
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        
                        %           PAIRWISE POWER CONTROL          %
                        
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        for j=1:(users_ii_gz2_4-1)
                            for i=1:(users_ii_gz2_4-1)
                                if (i==j)
                                    F2_gz2_41(i,j)=0;
                                else
                                    if (dd_gz2_4(j,j) < 1.00) && (dd_gz2_4(i,j) > 1.00)
                                        F2_gz2_41(j,i)=(((1)/(dd_gz2_4(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (dd_gz2_4(j,j) < 1.00) && (dd_gz2_4(i,j) < 1.00)
                                        F2_gz2_41(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (dd_gz2_4(j,j) > 1.00) && (dd_gz2_4(i,j) < 1.00)
                                        F2_gz2_41(j,i)=(((dd_gz2_4(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F2_gz2_41(j,i)=(((dd_gz2_4(j,j))/(dd_gz2_4(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                    
                                end
                            end
                        end
                        
                        F2_gz2_41;
                        FF_gz2_4=sum(F2_gz2_41);
                        
                        
                        
                        for i=1:user_g_z2_4(itt,users_ii)
                            %SNR_4(i)=roh/(n+(roh)*FF_gz2_4(i));  %% roh 0:0.01:9.99
                            snr_ro_4(i)=roh/(n+(roh)*FF_gz2_4(i));
                        end
                        
                        active_4=snr_ro_4>=SNRo;
                        zzz2_4=active_4;
                        users_g_z_ppc2_4(itt,users_ii)=sum(zzz2_4);
                        
                        %P_out(itt,users_ii)=(user_g_z2_4(itt,users_ii) - users_g_z_ppc2_4(itt,users_ii)) / user_g_z2_4(itt,users_ii);
                        sss2_4=0;
                        dist_3_4=0;
                        
                        for i=1:user_g_z2_4(itt,users_ii)
                            if (zzz2_4(i)==1)
                                dist_3_4=dist_3_4+(sqrt(((xt2_gz2_4(i)-xr2_gz2_4(i))^2)+ ((yt2_gz2_4(i)-yr2_gz2_4(i))^2) + ((zt2_gz2_4(i)-zr2_gz2_4(i))^2)));
                            else
                                dist_3_4=dist_3_4+0;
                            end
                        end
                        
                        dist3_4(itt,users_ii)=dist_3_4;
                        
                        lmbda_g_z_ppc2_4(itt,users_ii)=users_g_z_ppc2_4(itt,users_ii)/area;
                        clear snr_ro_4 active_4 zzz2_4 SNR_4 F2_gz2_41 FF_gz2_4 dd_gz2_4 d2_gz2_4
                        
                        for j=1:(users_ii_gz2_fix-1)
                            for i=1:(users_ii_gz2_fix-1)
                                if (i==j)
                                    F2_gz2_fix(i,j)=0;
                                else
                                    if (dd_gz2_fix(j,j) < 1.00) && (dd_gz2_fix(i,j) > 1.00)
                                        F2_gz2_fix(j,i)=(((1)/(dd_gz2_fix(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (dd_gz2_fix(j,j) < 1.00) && (dd_gz2_fix(i,j) < 1.00)
                                        F2_gz2_fix(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (dd_gz2_fix(j,j) > 1.00) && (dd_gz2_fix(i,j) < 1.00)
                                        F2_gz2_fix(j,i)=(((dd_gz2_fix(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F2_gz2_fix(j,i)=(((dd_gz2_fix(j,j))/(dd_gz2_fix(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                    
                                end
                            end
                        end
                        
                        F2_gz2_fix;
                        FF_gz2_fix=sum(F2_gz2_fix);
                        
                        
                        
                        for i=1:user_g_z2_fix(itt,users_ii)
                            %SNR_fix(i)=roh/(n+(roh)*FF_gz2_fix(i));  %% roh 0:0.01:9.99
                            snr_ro_fix(i)=roh/(n+(roh)*FF_gz2_fix(i));
                        end
                        
                        active_fix=snr_ro_fix>=SNRo;
                        zzz2_fix=active_fix;
                        users_g_z_ppc2_fix(itt,users_ii)=sum(zzz2_fix);
                        
                        %P_out_fix(itt,users_ii)=(user_g_z2_fix(itt,users_ii) - users_g_z_ppc2_fix(itt,users_ii)) / user_g_z2_fix(itt,users_ii);
                        sss2_fix=0;
                        dist_3_fix=0;
                        
                        for i=1:user_g_z2_fix(itt,users_ii)
                            if (zzz2_fix(i)==1)
                                dist_3_fix=dist_3_fix+(sqrt(((xt2_gz2_fix(i)-xr2_gz2_fix(i))^2)+ ((yt2_gz2_fix(i)-yr2_gz2_fix(i))^2) + ((zt2_gz2_fix(i)-zr2_gz2_fix(i))^2)));
                            else
                                dist_3_fix=dist_3_fix+0;
                            end
                        end
                        
                        dist3_fix(itt,users_ii)=dist_3_fix;
                        
                        lmbda_g_z_ppc2_fix(itt,users_ii)=users_g_z_ppc2_fix(itt,users_ii)/area;
                        
                        clear snr_ro_fix b active_fix zzz2_fix SNR_fix F2_gz2_fix FF_gz2_fix dd_gz2_fix d2_gz2_fix FF_gz2_fix F2_gz2_fix dd_gz2_fix d2_gz2_fix
                        
                        for j=1:(users_ii_gz2_csma-1)
                            for i=1:(users_ii_gz2_csma-1)
                                if (i==j)
                                    F2_gz2_csma(i,j)=0;
                                else
                                    if (dd_gz2_csma(j,j) < 1.00) && (dd_gz2_csma(i,j) > 1.00)
                                        F2_gz2_csma(j,i)=(((1)/(dd_gz2_csma(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (dd_gz2_csma(j,j) < 1.00) && (dd_gz2_csma(i,j) < 1.00)
                                        F2_gz2_csma(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (dd_gz2_csma(j,j) > 1.00) && (dd_gz2_csma(i,j) < 1.00)
                                        F2_gz2_csma(j,i)=(((dd_gz2_csma(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F2_gz2_csma(j,i)=(((dd_gz2_csma(j,j))/(dd_gz2_csma(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                    
                                end
                            end
                        end
                        
                        F2_gz2_csma;
                        FF_gz2_csma=sum(F2_gz2_csma);
                        
                        
                        
                        for i=1:user_g_z2_csma(itt,users_ii)
                            %SNR_csma(i)=roh/(n+(roh)*FF_gz2_csma(i));  %% roh 0:0.01:9.99
                            snr_ro_csma(i)=roh/(n+(roh)*FF_gz2_csma(i));
                        end
                        
                        active_csma=snr_ro_csma>=SNRo;
                        zzz2_csma=active_csma;
                        users_g_z_ppc2_csma(itt,users_ii)=sum(zzz2_csma);
                        
                        %P_out_csma(itt,users_ii)=(user_g_z2_csma(itt,users_ii) - users_g_z_ppc2_csma(itt,users_ii)) / user_g_z2_csma(itt,users_ii);
                        sss2_csma=0;
                        dist_3_csma=0;
                        
                        for i=1:user_g_z2_csma(itt,users_ii)
                            if (zzz2_csma(i)==1)
                                dist_3_csma=dist_3_csma+(sqrt(((xt2_gz2_csma(i)-xr2_gz2_csma(i))^2)+ ((yt2_gz2_csma(i)-yr2_gz2_csma(i))^2) + ((zt2_gz2_csma(i)-zr2_gz2_csma(i))^2)));
                            else
                                dist_3_csma=dist_3_csma+0;
                            end
                        end
                        
                        dist3_csma(itt,users_ii)=dist_3_csma;
                        
                        lmbda_g_z_ppc2_csma(itt,users_ii)=users_g_z_ppc2_csma(itt,users_ii)/area;
                        
                        clear snr_ro_csma c DDGZ_csma DGZ_csma active_csma zzz2_csma SNR_csma F2_gz2_csma FF_gz2_csma dd_gz2_csma d2_gz2_csma FF_gz2_csma F2_gz2_csma dd_gz2_csma d2_gz2_csma
                        
                        
                    else
                        
                        
                        for users=users_i-19:users_i
                            r(users)=((rand)^(1/3))*R;                      % generating random positions for Txs uniformaly distributed in a disc of radius R, by using theta defind in next command
                            theta(users)=2*pi*rand;                     % generating random angle U[0-360] for Tx placement
                            phi(users)=pi*rand;                         %phi can vary from 0 to pi
                            xt1(users)=r(users)*sin(phi(users))*cos(theta(users));              % calculating x-axis value of ith Transmitter
                            yt1(users)=r(users)*sin(phi(users))*sin(theta(users));              % calculating y-axis value of ith Transmitter
                            zt1(users)=r(users)*cos(phi(users));             % calculating y-axis value of ith Transmitter
                            
                            % r_r(users)=(rand(1,1))*(dmax);         % generating random hop length U[0-d_max], USE r_r(users)=sqrt(random_sequence(users))*(R/aa);IF YOU WANT TO GENERATE UNIFORM RECEIVERS IN A DISC OF RADIUS R/aa
                            r_r(users)=((rand)^(1/3))*(dmax);
                            theta_r(users)=2*pi*rand;                   % generating random angle U[0-360], of Rx wrt Tx
                            phi_r(users)=pi*rand;
                            xt_r(users)=r_r(users)*sin(phi_r(users))*cos(theta_r(users));         % calculating x-axis value of ith Rx wrt ith Tx
                            yt_r(users)=r_r(users)*sin(phi_r(users))*sin(theta_r(users));         % calculating y-axis value of ith Rx wrt ith Tx
                            zt_r(users)=r_r(users)*cos(phi_r(users));
                            
                            xr1(users)=xt1(users)+xt_r(users);                  % calculating x-axis value of ith R, this is one(1)
                            yr1(users)=yt1(users)+yt_r(users);                  % calculating y-axis value of ith Rx
                            zr1(users)=zt1(users)+zt_r(users);                 % calculating z-axis value of ith Rx
                        end
%                         for i=1:users_i
%                             for j=1:users_i
%                                 Dist_Mat(i,j)=sqrt(((yt_1(j)-yt_1(i))^2)+((xt_1(j)-xt_1(i))^2)); %Distance between ith transmitter and jth transmitter
%                             end
%                         end
%                         % Dist_Mat;
%                         % Thinned=Dist_Mat<clu_rad;
%                         Thinned_1=Dist_Mat<clu_rad;
%                         Thinned_2=Dist_Mat>((2*R)-(clu_rad/2));
%                         Thinned=Thinned_1+Thinned_2;
%                         Num_of_neghbor=(sum(Thinned))-1;
%                         j=2;
%                         xt1(1)=0;
%                         yt1(1)=0;
%                         for i=1:users_i
%                             if Num_of_neghbor(i)>= kkk
%                                 xt1(j)=xt_1(i);
%                                 yt1(j)=yt_1(i);
%                                 r_r=sqrt(rand(1,1))*(dmax);    % generating random hop length U[0-d_max], USE r_r(i)=sqrt(random_sequence(i))*(R/aa);IF YOU WANT TO GENERATE UNIFORM RECEIVERS IN A DISC OF RADIUS R/aa
%                                 
%                                 theta_r=2*pi*rand;             % generating random angle U[0-360], of Rx wrt Tx
%                                 xt_r=r_r*cos(theta_r);         % calculating x-axis value of ith Rx wrt ith Tx
%                                 yt_r=r_r*sin(theta_r);         % calculating y-axis value of ith Rx wrt ith Tx
%                                 xr1(j)=xt1(j)+xt_r;            % calculating x-axis value of ith Rx
%                                 yr1(j)=yt1(j)+yt_r;
%                                 users_c=j;
%                                 j=j+1;
%                             else
%                                 users_c=j-1;
%                             end
%                         end
                        clear Num_of_neghbor Dist_Mat Thinned Thinned_1 Thinned_2
                        users_i_ary_clustered(itt,users_ii)=users_i;
                        lambda_i_ary_clustered(itt,users_ii)=users_i/area;
                        
                        
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            for j=1:users_i_ary_clustered(itt,users_ii)
                                d_wogz(j,i)=sqrt(((xt1(i)-xr1(j))^2)+ ((yt1(i)-yr1(j))^2) + ((zt1(i)-zr1(j))^2));
                            end
                        end
                        
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            for j=1:users_i_ary_clustered(itt,users_ii)
                                if (i==j)
                                    F_wogz_41(j,i)=0;
                                else
                                    if (d_wogz(j,j) < 1.00) && (d_wogz(i,j) > 1.00)
                                        F_wogz_41(j,i)=(((1)/(d_wogz(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (d_wogz(j,j) < 1.00) && (d_wogz(i,j) < 1.00)
                                        F_wogz_41(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (d_wogz(j,j) > 1.00) && (d_wogz(i,j) < 1.00)
                                        F_wogz_41(j,i)=(((d_wogz(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F_wogz_41(j,i)=(((d_wogz(j,j))/(d_wogz(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                end
                            end
                        end
                        
                        FF_wogz_4=sum(F_wogz_41);
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            snr_ro_wogz_4(i)=roh/(n+(roh*FF_wogz_4(i)));
                        end
                        
                        active_wogz_4=snr_ro_wogz_4>=SNRo;
                        zzz2_wogz_4=active_wogz_4;
                        users_wogz_4(itt,users_ii)=sum(active_wogz_4);
                        lmbda_wogz_4(itt,users_ii)=users_wogz_4(itt,users_ii)/area;
                        dist_2_wogz_4=0;
                        
                        for i=1:users_i_ary_clustered(itt,users_ii)
                            if (zzz2_wogz_4(i)==1)
                                dist_2_wogz_4=dist_2_wogz_4+(sqrt(((xt1(i)-xr1(i))^2)+ ((yt1(i)-yr1(i))^2) + ((zt1(i)-zr1(i))^2)));
                            else
                                dist_2_wogz_4=dist_2_wogz_4+0;
                            end
                        end
                        dist1_wogz_4(itt,users_ii)=dist_2_wogz_4;
                        
                        clear p_4 dist_2_wogz_4 roh_opt_wogz_4 active_wogz_4 index_wogz_4 abcd2_wogz_4 xt_ppc_wogz_4 xr_ppc_wogz_4 yt_ppc_wogz_4 yr_ppc_wogz_4 sss2_wogz_4 zzz2_wogz_4
                        
                        
                        
                        
                        xt_4=xt1;
                        yt_4=yt1;
                        yr_4=yr1;
                        xr_4=xr1;
                        zt_4=zt1;
                        zr_4=zr1;
                        
                        xt2_gz2_4=xt1;
                        yt2_gz2_4=yt1;
                        yr2_gz2_4=yr1;
                        xr2_gz2_4=xr1;
                        zt2_gz2_4=zt1;
                        zr2_gz2_4=zr1;
                        
                        N_4=1;
                        for k=1:users_i_ary_clustered(itt,users_ii)
                            
                            for i=1:N_4
                                d_4(N_4,i)=sqrt(((xt_4(i)-xr_4(N_4))^2)+ ((yt_4(i)-yr_4(N_4))^2) + ((zt_4(i)-zr_4(N_4))^2));
                                d_4(i,N_4)=sqrt(((xt_4(N_4)-xr_4(i))^2)+ ((yt_4(N_4)-yr_4(i))^2) + ((zt_4(N_4)-zr_4(i))^2));
                            end
                            
                            %         for l=1:N_4
                            %             d_4(l,N_4)=sqrt(((xt_4(N_4)-xr_4(l))^2)+ ((yt_4(N_4)-yr_4(l))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                            %         end
                            
                            for i=1:N_4
                                if i==N_4
                                    F_4(N_4,i)=0;
                                else
                                    F_4(N_4,i)=SNRo*(((d_4(N_4,N_4))/(d_4(N_4,i)))^alpha);
                                    F_4(i,N_4)=SNRo*(((d_4(i,i))/(d_4(i,N_4)))^alpha);
                                end
                            end
                            
                            %         for l=1:N_4
                            %             if l==N_4
                            %                F_4(l,N_4)=0;
                            %             else
                            %                F_4(l,N_4)=SNRo*(((d_4(l,l))/(d_4(l,N_4)))^alpha_4);
                            %             end
                            %         end
                            
                            [V_4,D_4]=eig(F_4);
                            
                            if ((max(max(abs(D_4)))) < 1)
                                N_4=N_4+1;
                                F1_4=F_4;
                                d1_4=d_4;
                            else
                                xt_4(N_4)=[];
                                xr_4(N_4)=[];
                                yr_4(N_4)=[];
                                yt_4(N_4)=[];
                                zr_4(N_4)=[];
                                zt_4(N_4)=[];
                            end
                        end
                        % end
                        N_4;%%%%%%%%%%%%%%%%%%%%
                        F1_4;%%%%%%%%%%%%%%%%%%%
                        d1_4;%%%%%%%%%%%%%%%%%%%%%%%
                        % nmb2=N-1;
                        users_s_4(itt,users_ii)=N_4-1;
                        lmbda_s_4(itt,users_ii)=users_s_4(itt,users_ii)/area;
                        % for i=1:nmb2
                        % U(i)=n*SNRo*(d1(i,i)^alpha_4);     %U for DPCA goldsmith 15.5.3
                        % end
                        % U1=U';  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        % Id=eye(nmb2);
                        % Perito=((Id-F1)^-1)*U1;%%%%%%%%%%;
                        % P_perito(itt,users_i)=sum(Perito);
                        
                        dist_1_4=0;
                        for i=1:users_s_4(itt,users_ii)
                            dist_1_4=dist_1_4+(sqrt(((xt_4(i)-xr_4(i))^2)+ ((yt_4(i)-yr_4(i))^2) + ((zt_4(i)-zr_4(i))^2)));
                        end
                        dist_4(itt,users_ii)=dist_1_4;
                        clear N_4 F_4 d_4 d1_4 F1_4 xt_4 xr_4 yt_4 yr_4
                        % delta_or=DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii);
                        %          if ((2+floor((users_ii-1)/4)) < 9)
                        %          delta_or=DELTA_OPT(alpha_ii,1+floor((users_ii-1)/4),dmax_ii,M_ii)+((rem((users_ii-1),4))/4)*(DELTA_OPT(alpha_ii,2+floor((users_ii-1)/4),dmax_ii,M_ii)-DELTA_OPT(alpha_ii,1+floor((users_ii-1)/4),dmax_ii,M_ii));
                        %          delta_or_used(alpha_ii,users_ii,dmax_ii,M_ii)=delta_or;
                        %          else
                        %              delta_or=DELTA_OPT(alpha_ii,1+floor((users_ii-1)/4),dmax_ii,M_ii);
                        %              delta_or_used(alpha_ii,users_ii,dmax_ii,M_ii)=delta_or;
                        %          end
                        %
                        %          if (users_ii < 5)
                        %          delta_or=DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii);
                        %          delta_or_used(alpha_ii,users_ii,dmax_ii,M_ii)=delta_or;
                        %          else
                        delta_or=DELTA_OPT(alpha_ii,users_ii,dmax_ii,M_ii);
                        delta_or_used(alpha_ii,users_ii,dmax_ii,M_ii)=delta_or;
                        xt2_gz2_4=xt1;
                        yt2_gz2_4=yt1;
                        yr2_gz2_4=yr1;
                        xr2_gz2_4=xr1;
                        zt2_gz2_4=zt1;
                        zr2_gz2_4=zr1;
                        
                        xt2_gz2_fix=xt1;
                        yt2_gz2_fix=yt1;
                        yr2_gz2_fix=yr1;
                        xr2_gz2_fix=xr1;
                        zt2_gz2_fix=zt1;
                        zr2_gz2_fix=zr1;
                        delta_or3=DELTA_OPT3(alpha_ii,users_ii,dmax_ii,M_ii);
                        
                        xt2_gz2_csma=xt1;
                        yt2_gz2_csma=yt1;
                        yr2_gz2_csma=yr1;
                        xr2_gz2_csma=xr1;
                        zt2_gz2_csma=zt1;
                        zr2_gz2_csma=zr1;
                        
                        delta_or4=DELTA_OPT4(alpha_ii,users_ii,dmax_ii,M_ii);
                        
                        for k=1:users_i_ary_clustered(itt,users_ii)
                            
                            if(k==1)      %%%%%%   Proposed i.e. (1+delta)dtx with alpha=4, gamma*=10db
                                d2_gz2_4=sqrt(((xt2_gz2_4(1)-xr2_gz2_4(1))^2)+ ((yt2_gz2_4(1)-yr2_gz2_4(1))^2) + ((zt2_gz2_4(1)-zr2_gz2_4(1))^2));
                                dd_gz2_4=d2_gz2_4;
                                users_ii_gz2_4=2;
                                
                                d2_gz2_fix=sqrt(((xt2_gz2_fix(1)-xr2_gz2_fix(1))^2)+ ((yt2_gz2_fix(1)-yr2_gz2_fix(1))^2) + ((zt2_gz2_fix(1)-zr2_gz2_fix(1))^2));
                                dd_gz2_fix=d2_gz2_fix;
                                users_ii_gz2_fix=2;
                                
                                d2_gz2_csma=sqrt(((xt2_gz2_csma(1)-xr2_gz2_csma(1))^2)+ ((yt2_gz2_csma(1)-yr2_gz2_csma(1))^2) + ((zt2_gz2_csma(1)-zr2_gz2_csma(1))^2));
                                DGZ_csma=sqrt(((xt2_gz2_csma(1)-xt2_gz2_csma(1))^2)+ ((yt2_gz2_csma(1)-yt2_gz2_csma(1))^2) + ((zt2_gz2_csma(1)-zt2_gz2_csma(1))^2));
                                dd_gz2_csma=d2_gz2_csma;
                                DDGZ_csma=DGZ_csma;
                                users_ii_gz2_csma=2;
                            else
                                for j=1:users_ii_gz2_4
                                    d2_gz2_4(users_ii_gz2_4,j)=sqrt(((xt2_gz2_4(j)-xr2_gz2_4(users_ii_gz2_4))^2)+ ((yt2_gz2_4(j)-yr2_gz2_4(users_ii_gz2_4))^2) + ((zt2_gz2_4(j)-zr2_gz2_4(users_ii_gz2_4))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    d2_gz2_4(j,users_ii_gz2_4)=sqrt(((xt2_gz2_4(users_ii_gz2_4)-xr2_gz2_4(j))^2)+ ((yt2_gz2_4(users_ii_gz2_4)-yr2_gz2_4(j))^2) + ((zt2_gz2_4(users_ii_gz2_4)-zr2_gz2_4(j))^2));
                                end
                                
                                for j=1:users_ii_gz2_fix
                                    d2_gz2_fix(users_ii_gz2_fix,j)=sqrt(((xt2_gz2_fix(j)-xr2_gz2_fix(users_ii_gz2_fix))^2)+ ((yt2_gz2_fix(j)-yr2_gz2_fix(users_ii_gz2_fix))^2) + ((zt2_gz2_fix(j)-zr2_gz2_fix(users_ii_gz2_fix))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    d2_gz2_fix(j,users_ii_gz2_fix)=sqrt(((xt2_gz2_fix(users_ii_gz2_fix)-xr2_gz2_fix(j))^2)+ ((yt2_gz2_fix(users_ii_gz2_fix)-yr2_gz2_fix(j))^2) + ((zt2_gz2_fix(users_ii_gz2_fix)-zr2_gz2_fix(j))^2));
                                end
                                
                                for j=1:users_ii_gz2_csma
                                    d2_gz2_csma(users_ii_gz2_csma,j)=sqrt(((xt2_gz2_csma(j)-xr2_gz2_csma(users_ii_gz2_csma))^2)+ ((yt2_gz2_csma(j)-yr2_gz2_csma(users_ii_gz2_csma))^2) + ((zt2_gz2_csma(j)-zr2_gz2_csma(users_ii_gz2_csma))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    d2_gz2_csma(j,users_ii_gz2_csma)=sqrt(((xt2_gz2_csma(users_ii_gz2_csma)-xr2_gz2_csma(j))^2)+ ((yt2_gz2_csma(users_ii_gz2_csma)-yr2_gz2_csma(j))^2) + ((zt2_gz2_csma(users_ii_gz2_csma)-zr2_gz2_csma(j))^2));
                                    DGZ_csma(users_ii_gz2_csma,j)=sqrt(((xt2_gz2_csma(j)-xt2_gz2_csma(users_ii_gz2_csma))^2)+ ((yt2_gz2_csma(j)-yt2_gz2_csma(users_ii_gz2_csma))^2) + ((zt2_gz2_csma(j)-zt2_gz2_csma(users_ii_gz2_csma))^2));  % d(m,n)=distance of btwn mth Tx and nth Rx.
                                    DGZ_csma(j,users_ii_gz2_csma)=sqrt(((xt2_gz2_csma(users_ii_gz2_csma)-xt2_gz2_csma(j))^2)+ ((yt2_gz2_csma(users_ii_gz2_csma)-yt2_gz2_csma(j))^2) + ((zt2_gz2_csma(users_ii_gz2_csma)-zt2_gz2_csma(j))^2));
                                end
                                
                                a=0;
                                for x=1:(users_ii_gz2_4-1)
                                    if ((d2_gz2_4(users_ii_gz2_4,x) > ((delta_or)*(d2_gz2_4(x,x)))) && (d2_gz2_4(x,users_ii_gz2_4) > ((delta_or)*(d2_gz2_4(users_ii_gz2_4,users_ii_gz2_4)))))
                                        a=a;
                                    else
                                        a=a+1;
                                        break
                                    end
                                end
                                
                                if (a==0)
                                    dd_gz2_4=d2_gz2_4;
                                    users_ii_gz2_4=users_ii_gz2_4+1;
                                else
                                    xt2_gz2_4(users_ii_gz2_4)=[];
                                    xr2_gz2_4(users_ii_gz2_4)=[];
                                    yr2_gz2_4(users_ii_gz2_4)=[];
                                    yt2_gz2_4(users_ii_gz2_4)=[];
                                    zr2_gz2_4(users_ii_gz2_4)=[];
                                    zt2_gz2_4(users_ii_gz2_4)=[];
                                end
                                
                                b=0;
                                for x=1:(users_ii_gz2_fix-1)
                                    if ((d2_gz2_fix(users_ii_gz2_fix,x) > ((delta_or3)*(dmax))) && (d2_gz2_fix(x,users_ii_gz2_fix) > ((delta_or3)*(dmax))))
                                        b=b;
                                    else
                                        b=b+1;
                                        break
                                    end
                                end
                                
                                if (b==0)
                                    dd_gz2_fix=d2_gz2_fix;
                                    users_ii_gz2_fix=users_ii_gz2_fix+1;
                                else
                                    xt2_gz2_fix(users_ii_gz2_fix)=[];
                                    xr2_gz2_fix(users_ii_gz2_fix)=[];
                                    yr2_gz2_fix(users_ii_gz2_fix)=[];
                                    yt2_gz2_fix(users_ii_gz2_fix)=[];
                                    zr2_gz2_fix(users_ii_gz2_fix)=[];
                                    zt2_gz2_fix(users_ii_gz2_fix)=[];
                                end
                                
                                c=0;
                                for x=1:(users_ii_gz2_csma-1)
                                    if (DGZ_csma(users_ii_gz2_csma,x) > ((delta_or4)*(dmax)))
                                        c=c;
                                    else
                                        c=c+1;
                                        break
                                    end
                                end
                                
                                if (c==0)
                                    dd_gz2_csma=d2_gz2_csma;
                                    users_ii_gz2_csma=users_ii_gz2_csma+1;
                                    DDGZ_csma=DGZ_csma;
                                else
                                    xt2_gz2_csma(users_ii_gz2_csma)=[];
                                    xr2_gz2_csma(users_ii_gz2_csma)=[];
                                    yr2_gz2_csma(users_ii_gz2_csma)=[];
                                    yt2_gz2_csma(users_ii_gz2_csma)=[];
                                    zr2_gz2_csma(users_ii_gz2_csma)=[];
                                    zt2_gz2_csma(users_ii_gz2_csma)=[];
                                end
                                
                            end
                        end
                        user_g_z2_4(itt,users_ii)=(users_ii_gz2_4-1);
                        lmbda_g_z2_4(itt,users_ii)=user_g_z2_4(itt,users_ii)/area;
                        
                        user_g_z2_fix(itt,users_ii)=(users_ii_gz2_fix-1);
                        lmbda_g_z2_fix(itt,users_ii)=user_g_z2_fix(itt,users_ii)/area;
                        
                        user_g_z2_csma(itt,users_ii)=(users_ii_gz2_csma-1);
                        lmbda_g_z2_csma(itt,users_ii)=user_g_z2_csma(itt,users_ii)/area;
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        
                        %           PAIRWISE POWER CONTROL          %
                        
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        for j=1:(users_ii_gz2_4-1)
                            for i=1:(users_ii_gz2_4-1)
                                if (i==j)
                                    F2_gz2_41(i,j)=0;
                                else
                                    if (dd_gz2_4(j,j) < 1.00) && (dd_gz2_4(i,j) > 1.00)
                                        F2_gz2_41(j,i)=(((1)/(dd_gz2_4(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (dd_gz2_4(j,j) < 1.00) && (dd_gz2_4(i,j) < 1.00)
                                        F2_gz2_41(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (dd_gz2_4(j,j) > 1.00) && (dd_gz2_4(i,j) < 1.00)
                                        F2_gz2_41(j,i)=(((dd_gz2_4(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F2_gz2_41(j,i)=(((dd_gz2_4(j,j))/(dd_gz2_4(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                    
                                end
                            end
                        end
                        
                        %                 for l=1:(users_ii_gz2_4-1)
                        %                     if (l==(users_ii_gz2_4-1))
                        %                         F2_gz2_4(l,(users_ii_gz2_4-1))=0;
                        %                     else
                        %                         F2_gz2_4(l,(users_ii_gz2_4-1))=(((dd_gz2_4(l,l))/(dd_gz2_4((users_ii_gz2_4-1),l)))^alpha_4);
                        %                     end
                        %                 end
                        
                        F2_gz2_41;
                        FF_gz2_4=sum(F2_gz2_41);
                        
                        
                        
                        for i=1:user_g_z2_4(itt,users_ii)
                            %SNR_4(i)=roh/(n+(roh)*FF_gz2_4(i));  %% roh 0:0.01:9.99
                            snr_ro_4(i)=roh/(n+(roh)*FF_gz2_4(i));
                        end
                        
                        %                 [aaaa_4,index2_4]=max(active_4);
                        %                 users_g_z_ppc2_4(itt,users_i)=aaaa_4+1;
                        %                 users_g_z_ppc2_4(itt,users_i)=users_g_z_ppc2_4(itt,users_i)-1;
                        %                 %roh_opt=((length(active))-sum(active>(max(active)-1)))*(1/100);
                        %                 abcd2_4=snr_ro_4(:,index2_4);
                        %                 zzz2_4=(abcd2_4>=SNRo);
                        %                 xt_ppc_4=xt2_gz2_4;
                        %                 xr_ppc_4=xr2_gz2_4;
                        %                 yt_ppc_4=yt2_gz2_4;
                        %                 yr_ppc_4=yr2_gz2_4;
                        
                        active_4=snr_ro_4>=SNRo;
                        zzz2_4=active_4;
                        users_g_z_ppc2_4(itt,users_ii)=sum(zzz2_4);
                        %P_out(itt,users_ii)=(user_g_z2_4(itt,users_ii) - users_g_z_ppc2_4(itt,users_ii)) / user_g_z2_4(itt,users_ii);
                        sss2_4=0;
                        
                        dist_3_4=0;
                        for i=1:user_g_z2_4(itt,users_ii)
                            if (zzz2_4(i)==1)
                                dist_3_4=dist_3_4+(sqrt(((xt2_gz2_4(i)-xr2_gz2_4(i))^2)+ ((yt2_gz2_4(i)-yr2_gz2_4(i))^2) + ((zt2_gz2_4(i)-zr2_gz2_4(i))^2)));
                            else
                                dist_3_4=dist_3_4+0;
                            end
                        end
                        clear snr_ro_4 SNR_4
                        clear snr_ro_4 active_4 zzz2_4 SNR_4 F2_gz2_41 FF_gz2_4 dd_gz2_4 d2_gz2_4
                        %                 dist_3_4=0;
                        %                 for i=1:sss2_4
                        %                     dist_3_4=dist_3_4+(sqrt(((xt_ppc_4(i)-xr_ppc_4(i))^2)+ ((yt_ppc_4(i)-yr_ppc_4(i))^2)));
                        %                 end
                        dist3_4(itt,users_ii)=dist_3_4;
                        
                        % for i=1:user_g_z1(itt,users_i)
                        % power_ppc(i)=roh_opt*((dd(i,i))^alpha_4);
                        % end
                        % power_ppc;
                        % P_ppc1(itt,users_i)=sum(power_ppc);
                        lmbda_g_z_ppc2_4(itt,users_ii)=users_g_z_ppc2_4(itt,users_ii)/area;
                        
                        
                        for j=1:(users_ii_gz2_fix-1)
                            for i=1:(users_ii_gz2_fix-1)
                                if (i==j)
                                    F2_gz2_fix(i,j)=0;
                                else
                                    if (dd_gz2_fix(j,j) < 1.00) && (dd_gz2_fix(i,j) > 1.00)
                                        F2_gz2_fix(j,i)=(((1)/(dd_gz2_fix(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (dd_gz2_fix(j,j) < 1.00) && (dd_gz2_fix(i,j) < 1.00)
                                        F2_gz2_fix(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (dd_gz2_fix(j,j) > 1.00) && (dd_gz2_fix(i,j) < 1.00)
                                        F2_gz2_fix(j,i)=(((dd_gz2_fix(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F2_gz2_fix(j,i)=(((dd_gz2_fix(j,j))/(dd_gz2_fix(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                    
                                end
                            end
                        end
                        
                        F2_gz2_fix;
                        FF_gz2_fix=sum(F2_gz2_fix);
                        
                        
                        
                        for i=1:user_g_z2_fix(itt,users_ii)
                            %SNR_fix(i)=roh/(n+(roh)*FF_gz2_fix(i));  %% roh 0:0.01:9.99
                            snr_ro_fix(i)=roh/(n+(roh)*FF_gz2_fix(i));
                        end
                        
                        active_fix=snr_ro_fix>=SNRo;
                        zzz2_fix=active_fix;
                        users_g_z_ppc2_fix(itt,users_ii)=sum(zzz2_fix);
                        
                        %P_out_fix(itt,users_ii)=(user_g_z2_fix(itt,users_ii) - users_g_z_ppc2_fix(itt,users_ii)) / user_g_z2_fix(itt,users_ii);
                        sss2_fix=0;
                        dist_3_fix=0;
                        
                        for i=1:user_g_z2_fix(itt,users_ii)
                            if (zzz2_fix(i)==1)
                                dist_3_fix=dist_3_fix+(sqrt(((xt2_gz2_fix(i)-xr2_gz2_fix(i))^2)+ ((yt2_gz2_fix(i)-yr2_gz2_fix(i))^2) + ((zt2_gz2_fix(i)-zr2_gz2_fix(i))^2)));
                            else
                                dist_3_fix=dist_3_fix+0;
                            end
                        end
                        
                        dist3_fix(itt,users_ii)=dist_3_fix;
                        
                        lmbda_g_z_ppc2_fix(itt,users_ii)=users_g_z_ppc2_fix(itt,users_ii)/area;
                        clear snr_ro_fix b active_fix zzz2_fix SNR_fix F2_gz2_fix FF_gz2_fix dd_gz2_fix d2_gz2_fix
                        
                        for j=1:(users_ii_gz2_csma-1)
                            for i=1:(users_ii_gz2_csma-1)
                                if (i==j)
                                    F2_gz2_csma(i,j)=0;
                                else
                                    if (dd_gz2_csma(j,j) < 1.00) && (dd_gz2_csma(i,j) > 1.00)
                                        F2_gz2_csma(j,i)=(((1)/(dd_gz2_csma(i,j)))^alpha);    % IF INTERFERER'S T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT ROH IS TRANSITTED BY THE INTERFERES
                                    elseif (dd_gz2_csma(j,j) < 1.00) && (dd_gz2_csma(i,j) < 1.00)
                                        F2_gz2_csma(j,i)=1;                         % IF INTERFERER'S T-R SEPARATION AND RECEIVER UNDER TESTING'S OWN T-R SEPARATION ARE FRACTIONAL, LETS ASSUME THAT ROH IS RECEIVER AT THE RECEIVER AS INTERFERENCE
                                    elseif (dd_gz2_csma(j,j) > 1.00) && (dd_gz2_csma(i,j) < 1.00)
                                        F2_gz2_csma(j,i)=(((dd_gz2_csma(j,j))/(1))^alpha);   % IF RECEIVER UNDER TESTING'S OWN T-R SEPARATION IS FRACTIONAL, LETS ASSUME THAT TOTAL TRANSMITTED POWER BY INTERFERER IS RECEIVED AS INTERFERENCE AT THE RECEIVER
                                    else
                                        F2_gz2_csma(j,i)=(((dd_gz2_csma(j,j))/(dd_gz2_csma(i,j)))^alpha);    % ACTUAL FORMULA FOR INTERFERENCE CALCULATION FROM A SINGLE INTERFERER, USED ONLY FOR DISTANCES EQUAL OR GREATER THAN 1
                                    end
                                    
                                end
                            end
                        end
                        
                        F2_gz2_csma;
                        FF_gz2_csma=sum(F2_gz2_csma);
                        
                        
                        
                        for i=1:user_g_z2_csma(itt,users_ii)
                            %SNR_csma(i)=roh/(n+(roh)*FF_gz2_csma(i));  %% roh 0:0.01:9.99
                            snr_ro_csma(i)=roh/(n+(roh)*FF_gz2_csma(i));
                        end
                        
                        active_csma=snr_ro_csma>=SNRo;
                        zzz2_csma=active_csma;
                        users_g_z_ppc2_csma(itt,users_ii)=sum(zzz2_csma);
                        
                        %P_out_csma(itt,users_ii)=(user_g_z2_csma(itt,users_ii) - users_g_z_ppc2_csma(itt,users_ii)) / user_g_z2_csma(itt,users_ii);
                        sss2_csma=0;
                        dist_3_csma=0;
                        
                        for i=1:user_g_z2_csma(itt,users_ii)
                            if (zzz2_csma(i)==1)
                                dist_3_csma=dist_3_csma+(sqrt(((xt2_gz2_csma(i)-xr2_gz2_csma(i))^2)+ ((yt2_gz2_csma(i)-yr2_gz2_csma(i))^2) + ((zt2_gz2_csma(i)-zr2_gz2_csma(i))^2)));
                            else
                                dist_3_csma=dist_3_csma+0;
                            end
                        end
                        
                        dist3_csma(itt,users_ii)=dist_3_csma;
                        
                        lmbda_g_z_ppc2_csma(itt,users_ii)=users_g_z_ppc2_csma(itt,users_ii)/area;
                        
                        clear snr_ro_csma DDGZ_csma c DGZ_csma active_csma zzz2_csma SNR_csma F2_gz2_csma FF_gz2_csma dd_gz2_csma d2_gz2_csma FF_gz2_csma F2_gz2_csma dd_gz2_csma d2_gz2_csma
                        
                    end
                end
                
                %users_wogz_4
                clear Num_of_neghbor Dist_Mat Thinned Thinned_1 Thinned_2 xt_1 yt_1 xt3_4 xt2_4 xr3_4 xr2_4 yr3_4 yr2_4 yt3_4 yt2_4 a b abcd2_4 zzz2_4 sss2_4 dist_2_4 xt_ppc_4 xr_ppc_4 yt_ppc_4 yr_ppc_4 d_gz_4 dd_4 d2_4 F2_4 FF_4 snr_ro_4 SNR_4 active_4 i power_ppc_4 aaaa_4
                clear xrr1 xtt1 yrr1 ytt1 zrr1 ztt1 aaaa_wogz_4 FF_wogz_4 active_wogz_4 pr_wogz_4 SNR_wogz_4 snr_ro_wogz_4 random_sequence t_r1 t_r2 t_r3 t_r4 t_r5 t_r6 t_r7 a_1 b_1 a_2 b_2 a_3 b_3 a_4 b_4 a_5 b_5 a_6 b_6 a_7 b_7 xt2_4 xr2_4 yr2_4 yt2_4 dist_i_4 dist_1_4 dd_4 d2_4 F2_4 FF_4 U_4 U1_4 Id_4 snr_ro_4 active_4 i nmb_4 nmb2_4 Perito_4 power_ppc_4 aaaa_4
                clear xr1 xt1 yr1 yt1 zr1 zt1 random_sequence_4 d_wogz_4 F_wogz_41 F_wogz_4 F_4 F1_4 d1_4 d_4 xt_4 yt_4 xr_4 yr_4 N_4 F2_gz1_4 FF_gz1_4 d2_gz1_4 dd_gz1_4 users_ii_gz1_4
                clear F2_gz3_4 FF_gz3_4 d2_gz3_4 dd_gz3_4 users_ii_gz3_4 F2_gz2_4 F2_gz2_41 FF_gz2_4 d2_gz2_4 dd_gz2_4 users_ii_gz2_4
                % M_ii
            end
            %users_wogz_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1 sum(users_wogz_4)/itterations];
            %lmbda_wogz_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_wogz_4)/itterations];
            %dist1_wogz_4_agr(alpha_ii,:,dmax_ii,M_ii)=[(2*dmax/3) sum(dist1_wogz_4)/itterations];
            
            users_i_ary_i=sum(users_i_ary_clustered)/itterations;
            lambda_i_ary_i=sum(lambda_i_ary_clustered)/itterations;
            
            users_s_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1 sum(users_s_4)/itterations];
            lmbda_s_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_s_4)/itterations];
            dist_4_agr(alpha_ii,:,dmax_ii,M_ii)=[(2*dmax/3) sum(dist_4)/itterations];
            
            dist3_4_agr(alpha_ii,:,dmax_ii,M_ii)=[(2*dmax/3) sum(dist3_4)/itterations];
            lmbda_g_z_ppc2_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_g_z_ppc2_4)/itterations];
            user_g_z2_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1 sum(user_g_z2_4)/itterations];
            lmbda_g_z2_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_g_z2_4)/itterations];
            users_g_z_ppc2_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1 sum(users_g_z_ppc2_4)/itterations];
            %P_out_agr(alpha_ii,:,dmax_ii,M_ii)=[0 sum(P_out)/itterations];
            
            dist3_4_agr_fix(alpha_ii,:,dmax_ii,M_ii)=[(2*dmax/3) sum(dist3_fix)/itterations];
            lmbda_g_z_ppc2_4_agr_fix(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_g_z_ppc2_fix)/itterations];
            user_g_z2_4_agr_fix(alpha_ii,:,dmax_ii,M_ii)=[1 sum(user_g_z2_fix)/itterations];
            lmbda_g_z2_4_agr_fix(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_g_z2_fix)/itterations];
            users_g_z_ppc2_4_agr_fix(alpha_ii,:,dmax_ii,M_ii)=[1 sum(users_g_z_ppc2_fix)/itterations];
            %P_out_agr_fix(alpha_ii,:,dmax_ii,M_ii)=[0 sum(P_out_fix)/itterations];
            
            dist3_4_agr_csma(alpha_ii,:,dmax_ii,M_ii)=[(2*dmax/3) sum(dist3_csma)/itterations];
            lmbda_g_z_ppc2_4_agr_csma(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_g_z_ppc2_csma)/itterations];
            user_g_z2_4_agr_csma(alpha_ii,:,dmax_ii,M_ii)=[1 sum(user_g_z2_csma)/itterations];
            lmbda_g_z2_4_agr_csma(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_g_z2_csma)/itterations];
            users_g_z_ppc2_4_agr_csma(alpha_ii,:,dmax_ii,M_ii)=[1 sum(users_g_z_ppc2_csma)/itterations];
            %P_out_agr_csma(alpha_ii,:,dmax_ii,M_ii)=[0 sum(P_out_csma)/itterations];
            
            users_wogz_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1 sum(users_wogz_4)/itterations];
            lmbda_wogz_4_agr(alpha_ii,:,dmax_ii,M_ii)=[1/area sum(lmbda_wogz_4)/itterations];
            dist1_wogz_4_agr(alpha_ii,:,dmax_ii,M_ii)=[(2*dmax/3) sum(dist1_wogz_4)/itterations];
            
            M_ii;
            dmax_ii;
            alpha_ii;
        end
    end
end


users_i_aryx=users_i_ary;
users_i_ary=[1 users_i_ary];
lambda_i_ary=[1/area lambda_i_ary];
% users_i_ary_c=[1 users_i_ary_c];
% lambda_i_ary_c=[1/area lambda_i_ary_c];

users_i_ary_i=[1 sum(users_i_ary_clustered)/itterations];
lambda_i_ary_i=[1/area sum(lambda_i_ary_clustered)/itterations];
users_i_ary_i;
for M_ii=1:7
    %M=(1-(rem(1,M_ii)))+(2*(M_ii-1));
    M=2^(M_ii-1);
    for dmax_ii=1:2
        dmax=2*dmax_ii;
        for alpha_ii=1:2:5
            alpha=3+(0.5*(alpha_ii-1));
            for users_ii=1:26
                %users_i_ary_i(users_ii);
                if users_i_ary_i(users_ii) == 0
                    %users_i_ary_c(users_ii) =(users_i_ary_c(users_ii-1) + users_i_ary_c(users_ii+1))/2;
                    lambda_i_ary_i(users_ii) =(lambda_i_ary_i(users_ii-1) + lambda_i_ary_i(users_ii+1))/2;
                    users_i_ary(users_ii) =(users_i_ary(users_ii-1) + users_i_ary(users_ii+1))/2;
                    lambda_i_ary(users_ii) =(lambda_i_ary(users_ii-1) + lambda_i_ary(users_ii+1))/2;
                    dist1_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist1_wogz_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + dist1_wogz_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    lmbda_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_wogz_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_wogz_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    users_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_wogz_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + users_wogz_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    users_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(users_g_z_ppc2_4_agr_csma(alpha_ii,users_ii-1,dmax_ii,M_ii) + users_g_z_ppc2_4_agr_csma(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    lmbda_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(lmbda_g_z2_4_agr_csma(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_g_z2_4_agr_csma(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    
                    user_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(user_g_z2_4_agr_csma(alpha_ii,users_ii-1,dmax_ii,M_ii) + user_g_z2_4_agr_csma(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    lmbda_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(lmbda_g_z_ppc2_4_agr_csma(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_g_z_ppc2_4_agr_csma(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    dist3_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(dist3_4_agr_csma(alpha_ii,users_ii-1,dmax_ii,M_ii) + dist3_4_agr_csma(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    users_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii)=(users_g_z_ppc2_4_agr_fix(alpha_ii,users_ii-1,dmax_ii,M_ii) + users_g_z_ppc2_4_agr_fix(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    lmbda_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z2_4_agr_fix(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_g_z2_4_agr_fix(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    user_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(user_g_z2_4_agr_fix(alpha_ii,users_ii-1,dmax_ii,M_ii) + user_g_z2_4_agr_fix(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    lmbda_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z_ppc2_4_agr_fix(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_g_z_ppc2_4_agr_fix(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    dist3_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(dist3_4_agr_fix(alpha_ii,users_ii-1,dmax_ii,M_ii) + dist3_4_agr_fix(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    users_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_g_z_ppc2_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + users_g_z_ppc2_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    
                    lmbda_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z2_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_g_z2_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    user_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(user_g_z2_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + user_g_z2_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    lmbda_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z_ppc2_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_g_z_ppc2_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    dist3_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist3_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + dist3_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    dist_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + dist_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    lmbda_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_s_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + lmbda_s_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                    users_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_s_4_agr(alpha_ii,users_ii-1,dmax_ii,M_ii) + users_s_4_agr(alpha_ii,users_ii+1,dmax_ii,M_ii))/2;
                else
                end
            end
        end
    end
end



for users_ii=1:26
    
    if users_i_ary_i(users_ii) == 0
        users_i_ary_i(users_ii) =(users_i_ary_i(users_ii-1) + users_i_ary_i(users_ii+1))/2;
    else
    end
end



for M_ii=1:7
    %M=(1-(rem(1,M_ii)))+(2*(M_ii-1));
    M=2^(M_ii-1);
    for dmax_ii=1:2
        dmax=2*dmax_ii;
        for alpha_ii=1:5
            alpha=3+(0.5*(alpha_ii-1));
            for users_ii=1:26
                users_i_ary_i(users_ii);
                if alpha_i_ary(alpha_ii) == 0
                    
                    dist1_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist1_wogz_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + dist1_wogz_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    lmbda_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_wogz_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_wogz_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    users_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_wogz_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + users_wogz_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    users_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(users_g_z_ppc2_4_agr_csma(alpha_ii-1,users_ii,dmax_ii,M_ii) + users_g_z_ppc2_4_agr_csma(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    lmbda_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(lmbda_g_z2_4_agr_csma(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_g_z2_4_agr_csma(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    
                    user_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(user_g_z2_4_agr_csma(alpha_ii-1,users_ii,dmax_ii,M_ii) + user_g_z2_4_agr_csma(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    lmbda_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(lmbda_g_z_ppc2_4_agr_csma(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_g_z_ppc2_4_agr_csma(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    dist3_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(dist3_4_agr_csma(alpha_ii-1,users_ii,dmax_ii,M_ii) + dist3_4_agr_csma(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    users_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii)=(users_g_z_ppc2_4_agr_fix(alpha_ii-1,users_ii,dmax_ii,M_ii) + users_g_z_ppc2_4_agr_fix(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    lmbda_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z2_4_agr_fix(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_g_z2_4_agr_fix(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    user_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(user_g_z2_4_agr_fix(alpha_ii-1,users_ii,dmax_ii,M_ii) + user_g_z2_4_agr_fix(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    lmbda_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z_ppc2_4_agr_fix(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_g_z_ppc2_4_agr_fix(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    dist3_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(dist3_4_agr_fix(alpha_ii-1,users_ii,dmax_ii,M_ii) + dist3_4_agr_fix(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    users_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_g_z_ppc2_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + users_g_z_ppc2_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    
                    lmbda_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z2_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_g_z2_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    user_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(user_g_z2_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + user_g_z2_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    lmbda_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z_ppc2_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_g_z_ppc2_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    dist3_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist3_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + dist3_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    dist_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + dist_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    lmbda_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_s_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + lmbda_s_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                    users_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_s_4_agr(alpha_ii-1,users_ii,dmax_ii,M_ii) + users_s_4_agr(alpha_ii+1,users_ii,dmax_ii,M_ii))/2;
                else
                end
            end
        end
    end
end



for alpha_ii=1:5
    
    if alpha_i_ary(alpha_ii) == 0
        alpha_i_ary(alpha_ii) =(alpha_i_ary(alpha_ii-1) + alpha_i_ary(alpha_ii+1))/2;
    else
    end
end



% 
% 
% for M_ii=1:9
%     M=(1-(rem(1,M_ii)))+(2*(M_ii-1));
%     for dmax_ii=1:2
%         dmax=2*dmax_ii;
%         for alpha_ii=1:5
%             alpha=3+(0.5*(alpha_ii-1));
%             for users_ii=1:12
%                 users_i_ary_i(users_ii);
%                 if M_i_ary(M_ii) == 0
%                     
%                     dist1_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist1_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + dist1_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     lmbda_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     users_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + users_wogz_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     users_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(users_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii-1) + users_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     lmbda_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(lmbda_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     
%                     user_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(user_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii-1) + user_g_z2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     lmbda_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(lmbda_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_g_z_ppc2_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     dist3_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii)=(dist3_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii-1) + dist3_4_agr_csma(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     users_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii)=(users_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii-1) + users_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     lmbda_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     user_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(user_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii-1) + user_g_z2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     lmbda_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_g_z_ppc2_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     dist3_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii) =(dist3_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii-1) + dist3_4_agr_fix(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     users_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + users_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     
%                     lmbda_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     user_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(user_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + user_g_z2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     lmbda_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_g_z_ppc2_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     dist3_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist3_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + dist3_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     dist_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(dist_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + dist_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     lmbda_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(lmbda_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + lmbda_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                     users_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii) =(users_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii-1) + users_s_4_agr(alpha_ii,users_ii,dmax_ii,M_ii+1))/2;
%                 else
%                 end
%             end
%         end
%     end
% end
% 
% 
% 
% for M_ii=1:9
%     
%     if M_i_ary(M_ii) == 0
%         M_i_ary(M_ii) =(M_i_ary(M_ii-1) + M_i_ary(M_ii+1))/2;
%     else
%     end
% end
% 
% 




%Gain_capacity_aloha=users_g_z_ppc2_4_agr./users_wogz_4_agr;
Gain_capacity_fix=users_g_z_ppc2_4_agr./users_g_z_ppc2_4_agr_fix;
Gain_capacity_gz_fix=user_g_z2_4_agr./user_g_z2_4_agr_fix;
%Gain_transport_aloha=dist3_4_agr./dist1_wogz_4_agr;
Gain_transport_fix=dist3_4_agr./dist3_4_agr_fix;

%Gain_capacity_aloha=users_g_z_ppc2_4_agr./users_wogz_4_agr;
Gain_capacity_csma=users_g_z_ppc2_4_agr./users_g_z_ppc2_4_agr_csma;
Gain_capacity_gz_csma=user_g_z2_4_agr./user_g_z2_4_agr_csma;
%Gain_transport_aloha=dist3_4_agr./dist1_wogz_4_agr;
Gain_transport_csma=dist3_4_agr./dist3_4_agr_csma;

Gain_capacity_jspca=users_g_z_ppc2_4_agr./users_s_4_agr;
Gain_capacity_gz_jspca=user_g_z2_4_agr./users_s_4_agr;
%Gain_transport_aloha=dist3_4_agr./dist1_wogz_4_agr;
Gain_transport_jspca=dist3_4_agr./dist_4_agr;

Gain_capacity_Aloha=users_g_z_ppc2_4_agr./users_wogz_4_agr;
% Gain_capacity_gz_Aloha=user_g_z2_4_agr./users_s_4_agr;
%Gain_transport_aloha=dist3_4_agr./dist1_wogz_4_agr;
Gain_transport_Aloha=dist3_4_agr./dist1_wogz_4_agr;

% users_i_aryx=users_i_ary;
% users_i_ary=[1 users_i_ary];
% lambda_i_ary=[1/area lambda_i_ary];
% % users_i_ary_c=[1 users_i_ary_c];
% % lambda_i_ary_c=[1/area lambda_i_ary_c];
%
% users_i_ary_c=[1 sum(users_i_ary_clustered)/itterations];
% lambda_i_ary_c=[1/area sum(lambda_i_ary_clustered)/itterations];


% save Alot_of_data_proposed_vs_only__jspca_for_many_network_parameters_FAST_itt200.mat
% toc



for i=1:7
    Gain_capacity_jspca_alp4_us100_d1(i)=Gain_capacity_jspca(3,11,1,i);
    Gain_capacity_jspca_alp4_us100_d2(i)=Gain_capacity_jspca(3,11,2,i);
    Gain_transport_jspca_alp4_us100_d2(i)=Gain_transport_jspca(3,11,2,i);
    Gain_transport_jspca_alp4_us100_d1(i)=Gain_transport_jspca(3,11,1,i);
    Gain_capacity_fix_alp4_us100_d1(i)=Gain_capacity_fix(3,11,1,i);
    Gain_capacity_fix_alp4_us100_d2(i)=Gain_capacity_fix(3,11,2,i);
    Gain_transport_fix_alp4_us100_d2(i)=Gain_transport_fix(3,11,2,i);
    Gain_transport_fix_alp4_us100_d1(i)=Gain_transport_fix(3,11,1,i);
    Gain_capacity_csma_alp4_us100_d1(i)=Gain_capacity_csma(3,11,1,i);
    Gain_capacity_csma_alp4_us100_d2(i)=Gain_capacity_csma(3,11,2,i);
    Gain_transport_csma_alp4_us100_d2(i)=Gain_transport_csma(3,11,2,i);
    Gain_transport_csma_alp4_us100_d1(i)=Gain_transport_csma(3,11,1,i);
end

save Alot_of_data_proposed_vs_benchmarks_3D_R20_N250_itt_500.mat
toc

figure(1)
%plot(users_i_ary,users_wogz_4_agr(3,:,2,1),'r*-')
%hold on
%plot(users_i_ary,users_wogz_4_agr(3,:,2,5),'r')
plot(users_i_ary_i,users_s_4_agr(3,:,2,1),'b*-')
hold on
plot(users_i_ary_i,users_s_4_agr(3,:,2,2),'b')
plot(users_i_ary_i,users_g_z_ppc2_4_agr(3,:,2,1),'g*-')
plot(users_i_ary_i,users_g_z_ppc2_4_agr(3,:,2,2),'g')
plot(users_i_ary_i,user_g_z2_4_agr(3,:,2,1),'r*-')
plot(users_i_ary_i,user_g_z2_4_agr(3,:,2,2),'r')
hold off

% figure(2)
% plot(users_i_ary,Gain_capacity_aloha(3,:,2,1),'r*-')
% hold on
% plot(users_i_ary,Gain_capacity_aloha(3,:,2,5),'r')
% hold off

% figure(3)
% plot(users_i_ary,Gain_transport_aloha(3,:,2,1),'r*-')
% hold on
% plot(users_i_ary,Gain_transport_aloha(3,:,2,5),'r')
% hold off

figure(2)
plot(users_i_ary_i,Gain_capacity_jspca(3,:,2,1),'r')
hold on
plot(users_i_ary_i,Gain_capacity_fix(3,:,2,1),'b')
plot(users_i_ary_i,Gain_capacity_csma(3,:,2,1),'g')
plot(users_i_ary_i,Gain_transport_jspca(3,:,2,1),'r*-')
plot(users_i_ary_i,Gain_transport_fix(3,:,2,1),'b*-')
plot(users_i_ary_i,Gain_transport_csma(3,:,2,1),'g*-')
%plot(users_i_ary_c,Gain_capacity_Aloha(2,:,1,1),'g')
hold off


figure(3)
plot(alpha_i_ary,Gain_capacity_jspca(:,11,1,1),'r')
hold on
plot(alpha_i_ary,Gain_capacity_jspca(:,11,1,7),'b')
hold off

figure(4)
plot(alpha_i_ary,Gain_capacity_fix(:,11,1,1),'r')
hold on
plot(alpha_i_ary,Gain_capacity_fix(:,11,1,7),'b')
hold off

figure(5)
plot(alpha_i_ary,Gain_capacity_csma(:,11,2,1),'r')
hold on
plot(alpha_i_ary,Gain_capacity_csma(:,11,2,7),'b')
hold off

figure(6)
plot(users_i_ary_i,Gain_capacity_jspca(3,:,1,1),'r')
hold on
plot(users_i_ary_i,Gain_capacity_jspca(3,:,2,1),'b')
hold off

figure(7)
plot(users_i_ary_i,Gain_capacity_fix(3,:,1,1),'r')
hold on
plot(users_i_ary_i,Gain_capacity_fix(3,:,2,1),'b')
hold off

figure(8)
plot(users_i_ary_i,Gain_capacity_csma(3,:,1,1),'r')
hold on
plot(users_i_ary_i,Gain_capacity_csma(3,:,2,1),'b')
hold off


figure(9)
plot(M_i_ary,Gain_capacity_jspca_alp4_us100_d1,'r')
hold on
plot(M_i_ary,Gain_transport_jspca_alp4_us100_d1,'b')
hold off

figure(10)
plot(M_i_ary,Gain_capacity_fix_alp4_us100_d1,'r')
hold on
plot(M_i_ary,Gain_transport_fix_alp4_us100_d1,'b')
hold off

figure(11)
plot(M_i_ary,Gain_capacity_csma_alp4_us100_d1,'r')
hold on
plot(M_i_ary,Gain_transport_csma_alp4_us100_d1,'b')
hold off

figure(12)
plot(M_i_ary,Gain_capacity_jspca_alp4_us100_d2,'r')
hold on
plot(M_i_ary,Gain_transport_jspca_alp4_us100_d2,'b')
hold off

figure(13)
plot(M_i_ary,Gain_capacity_fix_alp4_us100_d2,'r')
hold on
plot(M_i_ary,Gain_transport_fix_alp4_us100_d2,'b')
hold off

figure(14)
plot(M_i_ary,Gain_capacity_csma_alp4_us100_d2,'r')
hold on
plot(M_i_ary,Gain_transport_csma_alp4_us100_d2,'b')
hold off
