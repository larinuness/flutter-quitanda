// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';

import '../../../app_data.dart' as appData;
import '../../components/custom_textfield.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextfield(
            initialValue: appData.user.email,
            icon: Icons.email,
            labelName: 'E-mail',
            readOnly: true,
          ),
          CustomTextfield(
            initialValue: appData.user.name,
            icon: Icons.person,
            labelName: 'Nome',
            readOnly: true,
          ),
          CustomTextfield(
            initialValue: appData.user.phone,
            icon: Icons.phone,
            labelName: 'Celular',
            readOnly: true,
          ),
          CustomTextfield(
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            labelName: 'CPF',
            isSecret: true,
            readOnly: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text(
                'Atualizar senha',
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const CustomTextfield(
                      icon: Icons.lock,
                      labelName: 'Senha atual',
                      isSecret: true,
                    ),
                    const CustomTextfield(
                      icon: Icons.lock_outline,
                      labelName: 'Nova senha',
                      isSecret: true,
                    ),
                    const CustomTextfield(
                      icon: Icons.lock_outline,
                      labelName: 'Confirmar nova senha',
                      isSecret: true,
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Atualizar'),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
