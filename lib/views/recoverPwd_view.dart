// import 'package:ecume/model/recoverPwd_model.dart';
import 'package:flutter/material.dart';

class RecoverPwdView extends StatefulWidget {
  @override
  _RecoverPwdViewState createState() => _RecoverPwdViewState();
}

class _RecoverPwdViewState extends State<RecoverPwdView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool isApiCallProcess = false;
  // RecoverPwdRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    // requestModel = new RecoverPwdRequestModel();
  }

  // Widget build(BuildContext context) {
  //   return ProgressHUD(child: _uiSetup(context), inAsyncCall: isApiCallProcess);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 33, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(
                          "Recuperar contraseña",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Ingrese el número telefónico con el que se registro",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 25),
                        new TextFormField(
                          keyboardType: TextInputType.phone,
                          // onSaved: (input) => requestModel.phone = input,
                          validator: (input) => input.length < 10
                              ? "El número telefónico debe tener 10 caracteres"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Número telefónico",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Wrap(
                          children: <Widget>[
                            RaisedButton(
                              padding: const EdgeInsets.all(12),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                " Cancelar ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.grey,
                              shape: StadiumBorder(),
                            ),
                            SizedBox(width: 10),
                            RaisedButton(
                              padding: const EdgeInsets.all(12),
                              onPressed: () {
                                // if (validateAndSave()) {
                                //   setState(() {
                                //     isApiCallProcess = true;
                                //   });
                                //   APIService apiService = new APIService();
                                //   apiService.login(requestModel).then((value) {
                                //     setState(() {
                                //       isApiCallProcess = true;
                                //     });
                                //     if (value.token.isNotEmpty) {
                                //       //pasamos a la siguiente ventana
                                //     } else {
                                //       _showMyDialog();
                                //     }
                                //   });
                                //   print(requestModel.toJson());
                                // }
                              },
                              child: Text(
                                " Recuperar ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Theme.of(context).accentColor,
                              shape: StadiumBorder(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
