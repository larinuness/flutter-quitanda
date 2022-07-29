import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../components/custom_textfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        //vai ter a altura exata da tela
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            //dois Expanded pra deixar a tela dividida
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 40,
                      ),
                      children: [
                        TextSpan(
                          text: 'Green',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'grocer',
                          style: TextStyle(
                            color: Color.fromARGB(255, 132, 18, 10),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Categorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Frutas',
                          ),
                          FadeAnimatedText(
                            'Verduras',
                          ),
                          FadeAnimatedText(
                            'Legumes',
                          ),
                          FadeAnimatedText(
                            'Frutas',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                // -----> Formulario <-----
                child: Column(
                  //estica o maximo no eixo cruzado
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextfield(
                      labelName: 'Email',
                      icon: Icons.email,
                    ),
                    const CustomTextfield(
                      labelName: 'Senha',
                      icon: Icons.lock,
                      isSecret: true,
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
                          'Entrar',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.red,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Colors.green,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
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