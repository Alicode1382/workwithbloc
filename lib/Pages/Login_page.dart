import 'package:flutter/material.dart';
import 'package:moviesapi/Pages/Movies_Page.dart';
import 'package:moviesapi/ProgressHUD.dart';
import 'package:moviesapi/api/api_service.dart';
import 'package:moviesapi/bloc/navigation_bloc.dart';
import 'package:moviesapi/model/Login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();

  bool hinttext = true;

  Loginrequestmodel requestmodel;
  bool isApicalliprocress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestmodel = new Loginrequestmodel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uisetup(context),
      inAsyncCall: isApicalliprocress,
      opacity: 0.3,
    );
  }

  Widget _uisetup(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      key: scaffoldkey,
      body: new SingleChildScrollView(
        child: new Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          new Text("عضویت",
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => requestmodel.email = input,
                            validator: (input) => !input.contains("@")
                                ? "ایمیل شما نیاز به اعتبارسنجی دارد"
                                : null,
                            decoration: new InputDecoration(
                                hintText: "آدرس ایمیل",
                                errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.2))),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor),
                                ),
                                prefixIcon: new Icon(
                                  Icons.email,
                                  color: Theme.of(context).accentColor,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved: (input) => requestmodel.password = input,
                            validator: (pass) {
                              if (pass.length < 5) {
                                return "پسور شما باید شامل پنج کاراکتر باشد";
                              }
                            },
                            obscureText: hinttext,
                            decoration: new InputDecoration(
                              hintText: "رمز عبور",
                              errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor),
                              ),
                              prefixIcon: new Icon(
                                Icons.lock,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: new IconButton(
                                onPressed: () {
                                  setState(() {
                                    hinttext = !hinttext;
                                  });
                                },
                                icon: Icon(!hinttext
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.4),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FlatButton(
                            onPressed: () {
                              if (validateandsave()) {
                                setState(() {
                                  isApicalliprocress = true;
                                });

                                Apiservice apiservice = new Apiservice();
                                apiservice.login(requestmodel).then((value) {
                                  setState(() {
                                    isApicalliprocress = false;
                                  });
                                  if (value.token.isNotEmpty) {
                                    final snackbar = SnackBar(
                                        content: new Text(
                                            "عضویت با موفقیت انجام شد!"));
                                    scaffoldkey.currentState
                                        .showSnackBar(snackbar);
                                  } else {
                                    final snackbar = SnackBar(
                                        content: new Text(value.error));
                                    scaffoldkey.currentState
                                        .showSnackBar(snackbar);
                                  }

                                  if (formkey.currentState.validate()) {
                                    context
                                        .bloc<Navigation_bloc>()
                                        .add(Navigation_event.Moviespage);
                                  }
                                });
                                print(requestmodel.tojson());
                              }
                            },
                            child: Text(
                              "ورود",
                              style: new TextStyle(color: Colors.white),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            color: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                          ),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateandsave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
