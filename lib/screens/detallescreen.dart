import 'package:flutter/material.dart';
import 'package:pitscurier/providers/product_form_provider.dart';
import 'package:pitscurier/search/task_delegate.dart';
import 'package:pitscurier/services/product_services.dart';
import 'package:pitscurier/ui/inputdecoration_ui.dart';
import 'package:pitscurier/widgets/productoimagen_wgt.dart';
import 'package:provider/provider.dart';

class DetalleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proServ = Provider.of<ProductServices>(context);

    return ChangeNotifierProvider(
      create: (_)=>  ProductFormProvider( proServ.prodModel ),
      child: _ProductFormScreen(),
    );
  }
}

class _ProductFormScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Andrei Salas'),
        backgroundColor: Colors.orange[300],
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => 
              showSearch(
                context: context,
                delegate: TaskDelegate()
              ),
          )
        ],
        leading:IconButton(
          icon: Icon( Icons.exit_to_app ),
          tooltip: 'Regresar al Login',
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _ProductForm(),
                Positioned(
                  top: 100.0,
                  right: 50.0,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon( Icons.qr_code_scanner, size: 40, color: Colors.black, )
                  ),
                ),

                Positioned(
                  top: 300.0,
                  right: 50.0,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon( Icons.camera_alt, size: 40, color: Colors.black, )
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class _ProductForm extends StatefulWidget {
  const _ProductForm({ Key? key }) : super(key: key);
  @override
  __ProductFormState createState() => __ProductFormState();
}

class __ProductFormState extends State<_ProductForm> {
  String dropDownValueEntrega = 'Entrega';
  String dropDownValueMotivo = 'Motivo';

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final productForm = productFormProvider.productM;

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 10, vertical: 50),
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 20, ),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productFormProvider.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),
              Center(
                child:Text('Documento de la Lista', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, ),),
              ),

              TextFormField(
                initialValue: productForm.cBarraGuia,
                onChanged: (value) => productForm.cBarraGuia = value,
                validator: (value){
                  if( value == null || value.length < 1 )
                    return 'El Codigo de Barra es Obligatorio';
                },
                decoration: InputDecorations.authInputDecorations(
                  hintText: 'Lectura del Codigo QR',
                  labelText: 'Lectura del Codigo QR',
                ),
              ),
              // IconButton(onPressed: null, icon: Icon(Icons.camera_alt)),
              SizedBox(height: 20,),

              /**** ENTREGA */
              DropdownButton(
                value: dropDownValueEntrega,
                icon: Icon( Icons.arrow_downward ),
                elevation: 0,
                style: TextStyle( color: Colors.deepPurple[700] ),
                underline: Container( height: 2, color: Colors.black),
                onChanged: (String? value){
                  setState(() {
                    dropDownValueEntrega = value!;
                  });
                },
                items: productFormProvider.productM.entrega?.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
              ),
              SizedBox(height: 20,),

              /**** MOTIVO */
              DropdownButton(
                value: dropDownValueMotivo,
                icon: Icon( Icons.arrow_downward ),
                elevation: 0,
                style: TextStyle( color: Colors.deepPurple[700] ),
                underline: Container( height: 2, color: Colors.black,),
                onChanged: (String? value){
                  setState(() {
                    dropDownValueMotivo = value!;
                  });
                },
                
                items: productFormProvider.productM.motivo?.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
              ),
              SizedBox(height: 60,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProductoImagen(),
                  ProductoImagen(),
                  ProductoImagen(),
                ],
              ),
              SizedBox(height: 40,),
              
            ],
          )
        ),
      ),
    );
  }



  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only( 
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
      bottomRight: Radius.circular(25),
      bottomLeft:  Radius.circular(25),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}





