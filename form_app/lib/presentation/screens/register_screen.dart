import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/register/register_cubit.dart';
import 'package:form_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

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
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    //W/ select doesn't re-render
    return Form(
        //     key: _formKey,
        child: Column(
      children: [
        CustomTextFormField(
          label: 'User name',
          //onChanged: (value) => username = value,
          //onChanged: registerCubit.usernameChanged vvvv SAME ABOVE!! vvvv
          onChanged: (value) {
            //registerCubit.usernameChanged(value);
            //            _formKey.currentState?.validate();
            return registerCubit.usernameChanged(value);
          },
          /* validator: (value) {
            if (value == null || value.isEmpty) return 'User required';
            if (value.trim().isEmpty) return 'User required';
            if (value.trim().length < 6) {
              return 'User required more than 6 letters';
            }
            return null;
          }, */
          errorMessage: username.errorMessage,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: 'Email',
          //onChanged: (value) => email = value,
          onChanged: (value) {
            registerCubit.emailChanged(value);
            //           _formKey.currentState?.validate();
          },
          errorMessage: email.errorMessage,
          /* validator: (value) {
            final emailRegExp = RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            );
            if (value == null || value.isEmpty) return 'Email required';
            if (value.trim().isEmpty) return 'Email required';
            if (!emailRegExp.hasMatch(value)) return 'Invalida mail format';
            return null;
          }, */
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: 'Password',
          obscureText: true,
          //onChanged: (value) => password = value,
          onChanged: (value) {
            registerCubit.passwordChanged(value);
            //          _formKey.currentState?.validate();
          },
          errorMessage: password.errorMessage,
          /* validator: (value) {
            if (value == null || value.isEmpty) return 'User required';
            if (value.trim().isEmpty) return 'User required';
            if (value.trim().length < 6) {
              return 'User required more than 6 letters';
            }
            return null;
          }, */
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            /*  final isValid = _formKey.currentState!.validate();
                if (!isValid) return;
                state will verify valid */
            registerCubit.onSubmit();
          },
          label: const Text('Create User'),
          icon: const Icon(Icons.save),
        ),
      ],
    ));
  }
}
