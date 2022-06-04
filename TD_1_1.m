#############################
#         TD 1.1 :          #
#       Approximation       #
#     et interpolation      #
#############################

clear all # supprime workspace
close all # ferme fenetres

pkg load image


## Interpolation
#############################
#{
On mesure un signal périodique avec un nombre de points limite. On aimerait 
connaitre la valeur du signal entre ces points.
#}
Te = #{ A COMPLETER #} ; # periode d'echantillonnage
x = #{ A COMPLETER #} ; x = x'; # grille d'echantillon
sig = #{ A COMPLETER #} ; # charge le signal dans le workspace

figure()
plot(x, sig, "b*")
axis([x(1)-Te x(end)+Te -3 3])


n = ; # nombre de points à interpoler
x_interp = #{ A COMPLETER #} ;
sig_interp = LagrangeInterp(x_interp, x, sig);

figure()
plot(x, sig, "b*", x_interp, sig_interp, "r*")
axis([x(1)-Te x(end)+Te -3 3])











