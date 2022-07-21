import 'package:flutter/material.dart';

/// Default Form functionality that wraps a form and exposes a callback
/// passed to [builder] for submitting the form
class FormBuilder extends StatefulWidget {
  const FormBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// returns a widget wrapped around [Form] and passed to it
  /// a callback for submitting the form
  final Widget Function(bool Function() validateAndSubmitForm) builder;

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  final formKey = GlobalKey<FormState>();

  bool _validateAndSubmitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // hide the keyboard if open
      FocusScope.of(context).unfocus();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: widget.builder(_validateAndSubmitForm),
    );
  }
}