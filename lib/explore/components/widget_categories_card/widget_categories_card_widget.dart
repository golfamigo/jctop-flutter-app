import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget_categories_card_model.dart';
export 'widget_categories_card_model.dart';

class WidgetCategoriesCardWidget extends StatefulWidget {
  const WidgetCategoriesCardWidget({
    super.key,
    this.data,
  });

  final CategoriesStruct? data;

  @override
  State<WidgetCategoriesCardWidget> createState() =>
      _WidgetCategoriesCardWidgetState();
}

class _WidgetCategoriesCardWidgetState
    extends State<WidgetCategoriesCardWidget> {
  late WidgetCategoriesCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetCategoriesCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                widget.data!.img,
              ).image,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.data?.title,
                'title',
              ),
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.rubik(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
