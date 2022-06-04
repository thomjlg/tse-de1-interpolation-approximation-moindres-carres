function P = LagrangeInterp(x, xp, yp)
  #{
  Donne le polynome de Lagrange passant par les points (xp,yp) sur la grille 
  de points x.
  xp et yp doivent etre des tableaux n lignes, 1 colonne.
  #}
  
  n = length(xp); # nombre de points/echantillons donnes
  P = zeros(length(x),1); # vecteur contenant les valeurs interpolees
  
  for k = 1:length(x) # pour chaque valeur de la grille de points x
    S = 0; # variable devant contenir la somme des polynomes de Lagrange
    #{
          A COMPLETER
    #}
    P(k) = S; # valeur de l'interpolation au point x(k)
  end
end
