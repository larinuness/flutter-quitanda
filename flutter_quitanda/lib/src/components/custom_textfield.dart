import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  final IconData icon;
  final String labelName;
  final bool isSecret;
  final List<TextInputFormatter>? formatter;

  const CustomTextfield({
    Key? key,
    required this.icon,
    required this.labelName,
    this.isSecret = false,
    this.formatter,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: widget.formatter,
        //deixa o texto oculto
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? IconButton(
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscure == !isObscure;
                    });
                  },
                )
              : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelName,
          //deixa menos espaço entre o texto e o padding (fica mais junto)
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
