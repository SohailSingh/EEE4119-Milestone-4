syms F alpha

%ddth was obtained from milestone 1
ddth = (21*F*sin(alpha))/221000
ddth_new = subs(ddth,sin(alpha), alpha)
ddth_new = subs(ddth_new,F, 34000)

%taking the laplace transform in order to design the controller in the
%frequency demain
P = laplace(ddth_new)

%P_s in the continuous-time transfer function plant
P_s = tf(42, [13 0 0])
P_s1 = P_s/(1+P_s)
%figure and bode functions are used below to plot the graphs in order to
%identify the critical speed
figure(1)
bode(P_s1)
figure(2)
step(P_s/1+P_s)
% sisotools was then used to adjust the step response to the desired point.
% a screenshot of the process and the final outcome is attached in the
% submission folder
sisotool(P_s)