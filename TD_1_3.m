#############################
#         TD 1.3 :          #
#       Approximation       #
#     et interpolation      #
#############################

clear all # supprime workspace
close all # ferme fenetres

#pkg load image


## Regression lineaire
#############################
annees = [2005 2010 2013 2014 2015 2016 2017 2018]'; 
deces = [538.1 551.2 569.2 559.3 593.7 593.9 606.3 614.0]'; # en milliers

figure()
plot(annees, deces, "b*","markersize",15)

grid_an = annees; grid_an = grid_an'; # grille d'approximation

# calcul de droite
a_1 =  (deces(8) - deces(1))/(annees(8) - annees(1)); # coefficient directeur
a_0 =  deces(8) -  (a_1 * annees(8)); # ordonnee à l'origine

loi_1 = (a_1*grid_an)+a_0; # loi droite 

figure()
plot(annees, deces, "b*","markersize",15)
hold on
plot(grid_an, loi_1, "r")

e_1=0
for i=1:8 
  e_1=e_1+(deces(i)-loi_1(i)); 
 endfor
title(e_1)

# approximation moindres carres
for i=1:8 
  annees2(i)=annees(i)*annees(i); 
  anneesdeces(i) = annees(i)*deces(i);
endfor

X = [8 sum(annees);sum(annees) sum(annees2) ];
invX = inv(X);

coef = invX*[sum(deces); sum(anneesdeces)];
loi_2 = (coef(2)*grid_an)+coef(1); # loi moindres carres

figure()
plot(annees, deces, "b*","markersize",15)
hold on
plot(grid_an, loi_2, "g")

e_2=0
for i=1:8 
  e_2=e_2+(deces(i)-loi_2(i)); 
 endfor
title(e_2)
