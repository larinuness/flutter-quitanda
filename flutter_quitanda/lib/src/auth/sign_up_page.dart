import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../components/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final cpfMask = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});

  final phoneMask = MaskTextInputFormatter(
      mask: '(##) # ####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      //estica o maximo no eixo cruzado
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email
                        const CustomTextfield(
                          icon: Icons.email,
                          labelName: 'E-mail',
                        ),
                        // Senha
                        const CustomTextfield(
                          icon: Icons.lock,
                          labelName: 'Senha',
                          isSecret: true,
                        ),
                        // Nome
                        const CustomTextfield(
                          icon: Icons.person,
                          labelName: 'Nome',
                        ),
                        // Celular
                        CustomTextfield(
                          icon: Icons.phone,
                          labelName: 'Celular',
                          formatter: [phoneMask],
                        ),
                        // CPF
                        CustomTextfield(
                          icon: Icons.file_copy,
                          labelName: 'CPF',
                          formatter: [cpfMask],
                        ),
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SafeArea(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
