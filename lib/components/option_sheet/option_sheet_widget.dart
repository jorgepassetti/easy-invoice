import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'option_sheet_model.dart';
export 'option_sheet_model.dart';

class OptionSheetWidget extends StatefulWidget {
  const OptionSheetWidget({
    Key? key,
    bool? canEdit,
  })  : this.canEdit = canEdit ?? true,
        super(key: key);

  final bool canEdit;

  @override
  _OptionSheetWidgetState createState() => _OptionSheetWidgetState();
}

class _OptionSheetWidgetState extends State<OptionSheetWidget> {
  late OptionSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 409.0,
      height: 188.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.canEdit)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context, 'edit');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.edit,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        title: Text(
                          FFLocalizations.of(context).getText(
                            'hf60xz4v' /* Editar */,
                          ),
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).accent2,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                      ),
                    ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context, 'delete');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.delete,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'mhhs7qyo' /* Eliminar */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).accent2,
                        size: 20.0,
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context, 'cancel');
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          '1nymwqwh' /* Cancelar */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).accent2,
                        size: 20.0,
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
