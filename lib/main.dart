import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Cor base azul
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _fazerLogin() {
    final email = _emailController.text;
    final senha = _senhaController.text;
    
    if (email.isNotEmpty && senha.isNotEmpty) {
      if (email == 'teste@teste.com' && senha == '1234') {
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            title: Text('Login'),
            content: Text('Login realizado com sucesso!'),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            title: Text('Erro'),
            content: Text('Email ou senha incorretos!'),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Atenção'),
          content: Text('Preencha todos os campos.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior (AppBar) azul
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tela de Login'),
      ),
      // Corpo com fundo branco
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  
                  // LOGO
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                  
                  const SizedBox(height: 40),
                  const Text(
                    'Bem-vindo!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      // Como o fundo está branco, use preto (ou outra cor) para enxergar bem:
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // CAMPO DE E-MAIL
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // CAMPO DE SENHA
                  TextField(
                    controller: _senhaController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // BOTÃO DE LOGIN (AZUL)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _fazerLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Entrar'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
