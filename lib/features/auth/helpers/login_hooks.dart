import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginHooks {
  final TextEditingController emailController;
  final TextEditingController passController;
  final ValueNotifier<bool> isObscure;
  final ValueNotifier<bool> isEmailValid;
  final ValueNotifier<bool> isPassValid;

  LoginHooks({
    required this.emailController,
    required this.passController,
    required this.isObscure,
    required this.isEmailValid,
    required this.isPassValid,
  });
}

LoginHooks useLoginHooks() {
  final emailController = useTextEditingController();
  final passController = useTextEditingController();
  final isObscure = useState(true);
  final isEmailValid = useState(false);
  final isPassValid = useState(false);
  useEffect(() {
    void updateEmail() {
      final isValid = RegExp((r'^[^@]+@[^@]+\.[^@]+')).hasMatch(emailController.text);
      isEmailValid.value = isValid;
    }

    emailController.addListener(updateEmail);
    updateEmail();
    return () => emailController.removeListener(updateEmail);
  }, [emailController]);

  useEffect(() {
    void updatePass() {
      isPassValid.value = passController.text.length >= 8;
    }

    passController.addListener(updatePass);
    updatePass();
    return () => passController.removeListener(updatePass);
  }, [passController]);

  return useMemoized(
      () => LoginHooks(
            emailController: emailController,
            passController: passController,
            isObscure: isObscure,
            isEmailValid: isEmailValid,
            isPassValid: isPassValid,
          ),
      [emailController, passController, isObscure, isEmailValid, isPassValid]);
}
