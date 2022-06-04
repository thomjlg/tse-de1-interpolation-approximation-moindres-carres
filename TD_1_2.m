#############################
#         TD 1.2 :          #
#       Approximation       #
#     et interpolation      #
#############################

clear all # supprime workspace
close all # ferme fenetres

pkg load image


## Interpolation 2D
#############################
#{
On veut ici appliquer une rotation a l'image. Il va donc falloir remplir les 
"blancs" entre pixels.
=> Interpolation 
#}
img = imread("saturn.png"); # charge le fichier "saturn.png"
img = rgb2gray(img); # convertie l'image en niveau de gris
[nx, ny] = size(img);

figure() # creer une fenetre figure
imshow(img) # affiche im


# Rotation simple
deg = -45; # degre de rotation
ang = (deg/180)*pi; # conversion en radian

# Changement de base cartesienne a polaire des coordonees
R = #{ A COMPLETER #} ;
for i = 1:nx
  for j = 1:ny
    p = [i; j];
    p_rot = #{ A COMPLETER #} ;
    coord_polx(i,j) = #{ A COMPLETER #} ;
    coord_poly(i,j) = #{ A COMPLETER #} ;
  end
end
# coordonnees minimum
px = min(coord_polx(:));
py = min(coord_poly(:));
# rotation de l'image
for i = 1:nx
  for j = 1:ny
    p = [i; j];
    p_rot = #{ A COMPLETER #} ; # nouvelle coordonnees du pixel p
    i_rot = #{ A COMPLETER #} ; 
    j_rot = #{ A COMPLETER #} ;
    if (px < 0)
      i_rot = i_rot + abs(px) + 1;
    end
    if (py < 0)
      j_rot = j_rot + abs(py) + 1;
    end
    img_rot(i_rot, j_rot)= img(i, j);
  end
end

figure()
imshow(img_rot)

pause()

# Interpolation
#{ 
img_rot_interp = #{ A COMPLETER #} ;

figure()
imshow(img_rot_interp)
#}
