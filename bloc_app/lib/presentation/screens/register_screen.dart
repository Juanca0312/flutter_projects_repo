import 'package:bloc_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('new user'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const FlutterLogo(
              size: 100,
            ),
            _RegisterForm(),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        CustomTextFormField(
          label: 'nombre de usuario',
          validator: (value) {
            if (value == null || value.isEmpty) return 'Campo requerido';
            if (value.trim().isEmpty) return 'Campo requerido';
            if (value.length < 6) return 'Usuario mayor a 6 letras';
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'correo electrónico',
          validator: (value) {
            if (value == null || value.isEmpty) return 'Campo requerido';
            if (value.trim().isEmpty) return 'Campo requerido';
            final emailRegExp = RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            );
            if (!emailRegExp.hasMatch(value))
              return 'No tiene formato de correo';
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'password',
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Campo requerido';
            if (value.trim().isEmpty) return 'Campo requerido';
            if (value.length < 6) return 'Password mayor a 6 letras';
            return null;
          },
        ),
        const SizedBox(height: 20),
        FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
            },
            icon: const Icon(Icons.save),
            label: const Text('Save user')),
      ]),
    );
  }
}
