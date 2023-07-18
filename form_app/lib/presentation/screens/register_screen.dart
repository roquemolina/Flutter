import 'package:flutter/material.dart';
import 'package:form_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New User'),
      ),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 150),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const CustomTextFormField(
          label: 'User name',
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextFormField(
          label: 'Email',
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextFormField(
          label: 'Password',
          obscureText: true,
        ),
        
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {},
          label: const Text('Create User'),
          icon: const Icon(Icons.save),
        ),
      ],
    ));
  }
}
