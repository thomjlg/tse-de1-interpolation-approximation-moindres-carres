#############################
#         TD 1.4 :          #
#       Approximation       #
#     et interpolation      #
#############################

clear all # supprime workspace
close all # ferme fenetres

#pkg load image


signals = load("signals.txt");

## Moindres carres
#############################
# signal vraie
t = 0:0.01:2; t = t';
y = signals.y;

figure()
plot(t,y,"r")

# signal echantillonne
Te = 0.05; # periode d'echantillonnage
t_mes = linspace(0,2,41); t_mes = t_mes'; # instants de mesure
y_n = signals.y_n;

hold on
plot(t_mes, y_n,"b*","markersize",20)

# signal bruite
y_bn = signals.y_bn;

figure()
plot(t_mes, y_bn, "b*","markersize",20)

# approximation

for i=1:41
  tmes2(i)=t_mes(i)*t_mes(i);  
  tmes3(i)=tmes2(i)*t_mes(i); 
  tmes4(i)=tmes3(i)*t_mes(i); 
  tmes5(i)=tmes4(i)*t_mes(i);
  tmes6(i)=tmes5(i)*t_mes(i); 
  tmes7(i)=tmes6(i)*t_mes(i); 
  tmes8(i)=tmes7(i)*t_mes(i); 
  tmes9(i)=tmes8(i)*t_mes(i); 
  tmes10(i)=tmes9(i)*t_mes(i); 
  tmes11(i)=tmes10(i)*t_mes(i); 
  tmes12(i)=tmes11(i)*t_mes(i); 
  tmes13(i)=tmes12(i)*t_mes(i); 
  tmes14(i)=tmes13(i)*t_mes(i); 
  tmes15(i)=tmes14(i)*t_mes(i); 
  tmes16(i)=tmes15(i)*t_mes(i); 
  tmes17(i)=tmes16(i)*t_mes(i); 
  tmes18(i)=tmes17(i)*t_mes(i); 
  tmes19(i)=tmes18(i)*t_mes(i); 
  tmes20(i)=tmes19(i)*t_mes(i); 
  ybnsignals(i) = y_bn(i)*t_mes(i);
  ybnsignals2(i) = ybnsignals(i)*t_mes(i);
  ybnsignals3(i) = ybnsignals2(i)*t_mes(i);
  ybnsignals4(i) = ybnsignals3(i)*t_mes(i);
  ybnsignals5(i) = ybnsignals4(i)*t_mes(i);
  ybnsignals6(i) = ybnsignals5(i)*t_mes(i);
  ybnsignals7(i) = ybnsignals6(i)*t_mes(i);
  ybnsignals8(i) = ybnsignals7(i)*t_mes(i);
  ybnsignals9(i) = ybnsignals8(i)*t_mes(i);
  ybnsignals10(i) = ybnsignals9(i)*t_mes(i);
endfor
#Transpose() des matrices pour avoir des matrices colonnes
tmes2=transpose(tmes2);
tmes3=transpose(tmes3);
tmes4=transpose(tmes4);
tmes5=transpose(tmes5);
tmes6=transpose(tmes6);
tmes7=transpose(tmes7);
tmes8=transpose(tmes8);
tmes9=transpose(tmes9);
tmes10=transpose(tmes10);
tmes11=transpose(tmes11);
tmes12=transpose(tmes12);
tmes13=transpose(tmes13);
tmes14=transpose(tmes14);
tmes15=transpose(tmes15);
tmes16=transpose(tmes16);
tmes17=transpose(tmes17);
tmes18=transpose(tmes18);
tmes19=transpose(tmes19);
tmes20=transpose(tmes20);
ybnsignals=transpose(ybnsignals);
ybnsignals2=transpose(ybnsignals2);
ybnsignals3=transpose(ybnsignals3);
ybnsignals4=transpose(ybnsignals4);
ybnsignals5=transpose(ybnsignals5);
ybnsignals6=transpose(ybnsignals6);
ybnsignals7=transpose(ybnsignals7);
ybnsignals8=transpose(ybnsignals8);
ybnsignals9=transpose(ybnsignals9);
ybnsignals10=transpose(ybnsignals10);



deg = 3; # degre du polynome
 
if (deg ==0)
  X = [41];
  invX = inv(X);
  a = invX*[sum(y_bn)];
 p = a(1)*cos(2*pi*5*t_mes); 
endif  

if (deg ==1)
  X = [41 sum(t_mes);sum(t_mes) sum(tmes2) ];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals)];
# p =((a(2)*cos(2*pi*5))*t_mes)+a(1); 
 
p = (a(2)*t_mes)+a(1); 
for i =1:41
  co(i) = cos(2*pi*5*t_mes(i));
  p(i)=p(i)*co(i);
endfor  
 endif  

if (deg ==2)
  X = [41 sum(t_mes) sum(tmes2);sum(t_mes) sum(tmes2) sum(tmes3) ;sum(tmes2) sum(tmes3) sum(tmes4)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2)];
#p = ((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 

p = (a(3)*tmes2)+(a(2)*t_mes)+a(1); 
for i =1:41
    co(i) = cos(2*pi*5*t_mes(i));
  p(i)=p(i)*co(i);
endfor  
 endif

if (deg ==3)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3)];
  
  p = (a(4)*tmes3)+(a(3)*tmes2)+(a(2)*t_mes)+a(1); 
  for i =1:41
    co(i) = cos(2*pi*5*t_mes(i));
     p(i)=p(i)*co(i);
  endfor  
endif

if (deg ==4)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7);sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3);sum(ybnsignals4)];
# p = ((a(5)*cos(2*pi*20))*tmes4)+((a(4)*cos(2*pi*15))*tmes3)+((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 

  p = (a(5)*tmes4)+(a(4)*tmes3)+(a(3)*tmes2)+(a(2)*t_mes)+a(1); 
for i =1:41
    co(i) = cos(2*pi*5*t_mes(i));
  p(i)=p(i)*co(i);
endfor  
 endif 

  if (deg ==5)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8);sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9);sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3);sum(ybnsignals4);sum(ybnsignals5)];
#p = ((a(6)*cos(2*pi*25))*tmes5)+((a(5)*cos(2*pi*20))*tmes4)+((a(4)*cos(2*pi*15))*tmes3)+((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 

  p = (a(6)*tmes5)+(a(5)*tmes4)+(a(4)*tmes3)+(a(3)*tmes2)+(a(2)*t_mes)+a(1); 
for i =1:41
    co(i) = cos(2*pi*5*t_mes(i));
  p(i)=p(i)*co(i);
endfor  
endif 
  
 if (deg ==6)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9);sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10);sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11);sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3);sum(ybnsignals4);sum(ybnsignals5);sum(ybnsignals6)];
#p = ((a(7)*cos(2*pi*30))*tmes6)+((a(6)*cos(2*pi*25))*tmes5)+((a(5)*cos(2*pi*20))*tmes4)+((a(4)*cos(2*pi*15))*tmes3)+((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 

  p = (a(7)*tmes6)+(a(6)*tmes5)+(a(5)*tmes4)+(a(4)*tmes3)+(a(3)*tmes2)+(a(2)*t_mes)+a(1); 
for i =1:41
    co(i) = cos(2*pi*5*t_mes(i));
  p(i)=p(i)*co(i);
endfor  
 endif 
  #{
 if (deg ==7)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10);sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11);sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12);sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) ;sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3);sum(ybnsignals4);sum(ybnsignals5);sum(ybnsignals6);sum(ybnsignals7)];
p = ((a(8)*cos(2*pi*35))*tmes7)+((a(7)*cos(2*pi*30))*tmes6)+((a(6)*cos(2*pi*25))*tmes5)+((a(5)*cos(2*pi*20))*tmes4)+((a(4)*cos(2*pi*15))*tmes3)+((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 
  endif 

 if (deg ==8)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11);sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12);sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13);sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14);sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15);sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3);sum(ybnsignals4);sum(ybnsignals5);sum(ybnsignals6);sum(ybnsignals7);sum(ybnsignals8)];
p = ((a(9)*cos(2*pi*40))*tmes8)+((a(8)*cos(2*pi*35))*tmes7)+((a(7)*cos(2*pi*30))*tmes6)+((a(6)*cos(2*pi*25))*tmes5)+((a(5)*cos(2*pi*20))*tmes4)+((a(4)*cos(2*pi*15))*tmes3)+((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 
  endif 
  
   if (deg ==9)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12);sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13);sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14);sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15);sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16);sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16) sum(tmes17);sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16) sum(tmes17) sum(tmes18)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3);sum(ybnsignals4);sum(ybnsignals5);sum(ybnsignals6);sum(ybnsignals7);sum(ybnsignals8);sum(ybnsignals9)];
p = ((a(10)*cos(2*pi*45))*tmes9)+((a(9)*cos(2*pi*40))*tmes8)+((a(8)*cos(2*pi*35))*tmes7)+((a(7)*cos(2*pi*30))*tmes6)+((a(6)*cos(2*pi*25))*tmes5)+((a(5)*cos(2*pi*20))*tmes4)+((a(4)*cos(2*pi*15))*tmes3)+((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 
endif 

   if (deg ==10)
  X = [41 sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10);sum(t_mes) sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11);sum(tmes2) sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12); sum(tmes3) sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13);sum(tmes4) sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14);sum(tmes5) sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15);sum(tmes6) sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16);sum(tmes7) sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16) sum(tmes17);sum(tmes8) sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16) sum(tmes17) sum(tmes18);sum(tmes9) sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16) sum(tmes17) sum(tmes18) sum(tmes19);sum(tmes10) sum(tmes11) sum(tmes12) sum(tmes13) sum(tmes14) sum(tmes15) sum(tmes16) sum(tmes17) sum(tmes18) sum(tmes19) sum(tmes20)];
  invX = inv(X);
  a = invX*[sum(y_bn);sum(ybnsignals);sum(ybnsignals2);sum(ybnsignals3);sum(ybnsignals4);sum(ybnsignals5);sum(ybnsignals6);sum(ybnsignals7);sum(ybnsignals8);sum(ybnsignals9);sum(ybnsignals10)];
  a = a*cos(2*pi*5*transpose(t_mes)); 
p = ((a(11)*cos(2*pi*50))*tmes10)+((a(10)*cos(2*pi*45))*tmes9)+((a(9)*cos(2*pi*40))*tmes8)+((a(8)*cos(2*pi*35))*tmes7)+((a(7)*cos(2*pi*30))*tmes6)+((a(6)*cos(2*pi*25))*tmes5)+((a(5)*cos(2*pi*20))*tmes4)+((a(4)*cos(2*pi*15))*tmes3)+((a(3)*cos(2*pi*10))*tmes2)+((a(2)*cos(2*pi*5))*t_mes)+a(1); 
  endif 
  #}
figure()
plot(t, y, "r")
hold on
plot(t_mes, y_bn)
hold on
plot(t_mes, p, "g*")


