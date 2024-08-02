% Ejercicio Cañerias
 
/*
De los codos me interesa el color, p.ej. un codo rojo.
De los caños me interesan color y longitud, p.ej. un caño rojo de 3 metros.
De las canillas me interesan: tipo (de la pieza que se gira para abrir/cerrar), color y ancho (de la boca).
*/

% codo(Color).
codo(rojo).
% caño(Color, Longitud).
canio(rojo, 3).
% canilla(Tipo, Color, Ancho).
canilla(triangular, roja, 4).

% Punto 1

costoCanieria(Canieria, PrecioTotal):-
    findall(Precio,(member(Pieza, Canieria), costoPieza(Pieza, Precio)), Precios),
    sumlist(Precios, PrecioTotal).
    
costoPieza(codo(_), 5).

costoPieza(canio(_, Metros), Precio):-
    Precio is 3 * Metros.

costoPieza(canilla(triangular, _, _), 20).
costoPieza(canilla(Tipo, _, Ancho), Precio):-
    Tipo \= triangular,
    precioSegunAncho(Ancho, 5, Precio).

precioSegunAncho(Ancho, Num, 15):-
    Ancho > Num.
precioSegunAncho(Ancho, Num, 12):-
    Ancho =< Num.

%% Punto 2
colorPieza(codo(Color), Color).
colorPieza(canio(Color, _), Color).
colorPieza(canilla(_, Color, _), Color).

coloresEnchufables(azul, rojo).
coloresEnchufables(rojo, negro).

/*
puedoEnchufar(P1, P2):-
    colorPieza(P1, Color1),
    colorPieza(P2, Color2),
    Color1 = Color2.
puedoEnchufar(P1, P2):-
    colorPieza(P1, Color1), colorPieza(P2, Color2),
    coloresEnchufables(Color1, Color2).
*/

%% Punto 3
puedoEnchufar([P1|Resto], [P2|Resto2]):-
    reverse([P1 | Resto], [Ultimo | Reves]),
    colorPieza(Ultimo, Color1),
    colorPieza(P2, Color2),
    Color1 = Color2.
puedoEnchufar([P1|Resto], [P2|Resto2]):-
    reverse([P1 | Resto], [Ultimo | Reves]),
    colorPieza(Ultimo, Color1),
    colorPieza(P2, Color2),
    coloresEnchufables(Color1, Color2).

%% Punto 4
canieriaBienArmada([P1 | Resto]):-
    puedoEnchufar([P1], Resto),
    canieriaBienArmada(Resto).

canieriaBienArmada([Resto | []]).




