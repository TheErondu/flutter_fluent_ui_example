import 'package:fluent_ui/fluent_ui.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hermes/utils/tools.dart';
import 'package:hermes/views/dashboard.dart';
import 'package:hive/hive.dart';

import '../services/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _clearController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // ignore: unused_field
  Future<void>? _futureloginCall;

  bool _showPassword = false;
  @override
  void initState() {
    super.initState();
    logout();
    _clearController.addListener(() {
      if (_clearController.text.length == 1 && mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _clearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Login to Dashboard')),
      children: [
        Center(
          widthFactor:0.2,
            child: TextFormBox(
              header: 'Email',
              placeholder: 'Type your email here :)',
              controller: emailController,
              autovalidateMode: AutovalidateMode.always,
              validator: (text) {
                if (text == null || text.isEmpty) return 'Provide an email';
                if (!EmailValidator.validate(text)) return 'Email not valid';
                return null;
              },
              textInputAction: TextInputAction.next,
              prefix: const Padding(
                padding: EdgeInsetsDirectional.only(start: 8.0),
                child: Icon(FluentIcons.edit_mail),
              ),
            ),
          ),
        const SizedBox(height: 20),
        TextBox(
          header: 'Password',
          placeholder: 'Type your password here',
          obscureText: !_showPassword,
          controller: passwordController,
          maxLines: 1,
          suffixMode: OverlayVisibilityMode.always,
          suffix: IconButton(
            icon: Icon(
              !_showPassword ? FluentIcons.lock : FluentIcons.unlock,
            ),
            onPressed: () => setState(() => _showPassword = !_showPassword),
          ),
          outsideSuffix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Button(
              child: const Text('Submit'),
              onPressed: () {
                setState(() {
                  String email = emailController.text;
                  String password = passwordController.text;
                  _futureloginCall = loginCall(email, password);
                });
                if (authCheck() != false) {
                  Navigator.push(
                      context,
                      FluentPageRoute(
                          builder: (context) => const DashboardView()));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
