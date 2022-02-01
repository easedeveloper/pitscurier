import 'package:flutter/material.dart';
import 'package:pitscurier/providers/loginform_provider.dart';
import 'package:pitscurier/ui/inputdecoration_ui.dart';
import 'package:pitscurier/widgets/authbackground.dart';
import 'package:pitscurier/widgets/cardcontainer_wgt.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackGround(
        childABG: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250,),

              CardContainer(
                childCC: Column(
                  children: [
                    SizedBox(height: 5,),
                    Text('Login', style: TextStyle( fontSize: 35, fontWeight: FontWeight.bold ),),//Theme.of(context).textTheme.headline4
                    // SizedBox(height: 30,),

                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
     ),
   );
  }
}



class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecorations(
                hintText: 'curier@pits.com.pe',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: (value) => loginForm.email = value,

              validator: ( value ){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
              },
            ),
            SizedBox(height: 30,),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecorations(
                hintText: '******',
                labelText: 'Contraseñaaa',
                prefixIcon: Icons.lock_outline_rounded,
              ),
              onChanged: (value) => loginForm.passw = value,

              validator: (value){
                return ( value != null && value.length >6 )
                        ? null
                        : 'La contraseña debe ser mayor a 6 caracteres';
              },
            ),
            SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.orange[300],
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15 ),
                child: Text(
                  loginForm.getIsLoading
                    ? 'Espere...'
                    : 'Ingresar',
                  style: TextStyle( color: Colors.white ),
                ),
              ),
              onPressed: loginForm.getIsLoading? null: () async{
                FocusScope.of(context).unfocus();

                if( !loginForm.isValidationForm() ) return;

                loginForm.setIsLoading = true;
                await Future.delayed(Duration(seconds: 2));
                loginForm.setIsLoading = false;
                
                Navigator.pushReplacementNamed(context, '/home');

              }
            )

          ],
        )
      ),
      
    );
  }
}