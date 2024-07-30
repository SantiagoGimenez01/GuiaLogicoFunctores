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

costoCanieria([], 0).
costoCanieria([Pieza | Resto], PrecioTotal):-
    costoPieza(Pieza, PrecioPieza),
    costoCanieria(Resto, PrecioResto),
    PrecioTotal is PrecioPieza + PrecioResto.

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

