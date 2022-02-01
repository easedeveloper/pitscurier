import 'package:flutter/material.dart';
import 'package:pitscurier/models/products_modelos.dart';


class ProductServices extends ChangeNotifier{

 late final ProductModel prodModel = new ProductModel(
   cBarraGuia: '095-1096',
   descargo: 'Motivo-Domicilio Cerrado',
   picture: 'Imagen 1',
   id: 001,
   entrega: ['Entrega','Correcta','Recibido','Entregado','Domicilio Abierto'],
   motivo: [
     'Motivo',
     'Domicilio Cerrado',
     'Notificado con Acta Negativo de Recepcion',
     'Notificado con Acta por debajo de la Puerta',
     'No Persona Capaz',
     'Direccion Errada',
     'No Existe'
   ],
  );



}