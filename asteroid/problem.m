clc
X=[4.5596 5.0816 5.5546 5.9636 6.2756];
Y=[0.8145 1.3685 1.9895 2.6925 3.5265];
Initial=[0 0];
A=asteroid(X,Y);

f=@(x,y)A(1)*x^2+2*A(2)*x*y+A(3)*y^2+2*A(4)*x+A(5)*2*y+1;

b=A(2);
a=A(1);
c=A(3);
co=[b,a-c,-b];
r=roots(co);
t=r(2);
sin1= t/sqrt(1 +t^2);
cos1= 1/sqrt(1 +t^2);
A2=[A(1)*cos1^2+2*A(2)*sin1*cos1+A(3)*sin1^2
    0 
    A(1)*sin1^2-2*A(2)*sin1*cos1+A(3)*cos1^2 
    A(4)*cos1+A(5)*sin1 
    -A(4)*sin1+A(5)*cos1];

t=0:0.01:2*pi;
x1=cos(t)*sqrt((A2(4)^2/A2(1)+A2(5)^2/A2(3)-1)/A2(1))-A2(4)/A2(1);
y1=sin(t)*sqrt((A2(4)^2/A2(1)+A2(5)^2/A2(3)-1)/A2(3))-A2(5)/A2(3);

x=cos1*x1-y1*sin1;
y=sin1*x1+y1*cos1;

figure;
fimplicit(f, [-3, 8, -3, 8], 'black-',LineWidth=0.2);
grid on
hold on
plot(X,Y,'.', 'MarkerSize', 15,Color="blue")
p=plot(0,0,'.', 'MarkerSize', 60,Color="red");
text(0.5,0.5,'太阳','FontSize',12,'Color',"red")
h= plot(x(1), y(1), '*', 'MarkerSize', 15, 'MarkerFaceColor', '#77AC30');
legend("小行星",'数据点')

filename = 'point_animation.gif';
for k = 1:length(t)
    set(h, 'XData', x(k), 'YData', y(k));
    drawnow;
    pause(0.0001);

    %frame = getframe(gcf);
    %im = frame2im(frame);
    %[imind, cm] = rgb2ind(im, 256);
    %if k == 1
    %    imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.1);
    %else
    %    imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    %end
end
