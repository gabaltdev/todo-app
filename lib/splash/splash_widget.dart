import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../iniciar_sesion/iniciar_sesion_widget.dart';
import '../registrarse/registrarse_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 220, 0, 0),
                child: Container(
                  width: 380,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: Image.asset(
                        'assets/images/logo-sara.png',
                      ).image,
                    ),
                  ),
                  alignment: AlignmentDirectional(0, 1),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IniciarSesionWidget(),
                      ),
                    );
                  },
                  text: 'Iniciar Sesion',
                  options: FFButtonOptions(
                    width: 380,
                    height: 50,
                    color: Color(0xFF77838F),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF090909),
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFF7ED957),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrarseWidget(),
                      ),
                    );
                  },
                  text: 'Resgistrate',
                  options: FFButtonOptions(
                    width: 380,
                    height: 50,
                    color: Color(0xFF77838F),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF090909),
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFF7ED957),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0, -0.5),
            child: Text(
              'My Todo App',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFFF5EDED),
                    fontSize: 25,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
