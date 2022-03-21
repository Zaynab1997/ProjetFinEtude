% clear;
% clc; 
% close all;
tstep = 0.05;
tsimu = 100;
Te=tstep;
umin = 0; umax = 5;
vmin = -5; vmax = 5;
% Initial conditions
qinit = [0; 1.5; 0]; q_v = []; q_v = [q_v, qinit];
t = 0; t_v = []; t_v = [t_v,t];
u = 0.01; u_v = []; u_v = [u_v, u];
v = 0; v_v = []; v_v = [v_v, v];
k1 =8;
k2 = 16;
a=.1; %0.2
b=.1;
t=[0: tstep: tsimu];
xr= sin(a*t);
yr=cos(b*t);
dxr=a*cos(a*t);
dyr=-b*sin(b*t);
ddxr=-a*a*sin(a*t);
ddyr=-b*b*cos(b*t);
figure(1); hold on;
% plot reference
plot(xr,yr,'b');
xlabel('X');
ylabel('Y');
i = 1;
for t = 0: tstep : tsimu
qcurrent = q_v(:, end);
plot(qcurrent(1), qcurrent(2),'.r')
%Modèle de d'évolution d'un robot avec l'odomètre
qdot(1)=u*cos(qcurrent(3));
qdot(2)=u*sin(qcurrent(3));
qdot(3)=v;
%Dynamique des écart en x et y
r1 = ddxr(i) - k1*(qdot(1) - dxr(i)) -k2*(qcurrent(1) -xr(i));
r2 = ddyr(i) - k1*(qdot(2) - dyr(i)) -k2*(qcurrent(2)-yr(i));
%Mise en place du feedback dynamique
G=[cos(qcurrent(3)), -u*sin(qcurrent(3)); sin(qcurrent(3)), u*cos(qcurrent(3))];
L= G\[r1,r2]'; % L Will contain w and v L=[w;v]
w=L(1);
u = u + tstep*w; %
% if u<0 or u close to zero
if abs(u)<10^-4 || u < 0
u = umin + 0.01;
end
if u > umax
u = umax;
end
v = L(2) ;
if v > vmax
v = vmax;
elseif v<vmin
v = vmin;
end
%Mise à jour des variables du modèle
qcurrent(1)=qcurrent(1) + tstep*u*cos(qcurrent(3)); % x=x+ tstep*u*cos(thetha)
qcurrent(2)=qcurrent(2) + tstep*u*sin(qcurrent(3)); % y=y+ tstep*u*sin(thetha)
qcurrent(3)=qcurrent(3) + tstep*v; % theta = theta+ v*tstep
qt=qcurrent;
q_v = [q_v, qt];
v_v = [v_v, v]; u_v = [u_v, u];
i = i+1;
pause(0.01);
end
