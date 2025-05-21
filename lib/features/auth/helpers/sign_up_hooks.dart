// signup_hooks.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpHooks {
  final TextEditingController fNameController;
  final TextEditingController lNameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController phoneController; // This will hold the full phone number for the provider
  final ValueNotifier<String> phoneNumberNotifier; // For UI display in CommonPhonePicker (number part)
  final ValueNotifier<String> phoneIsoNotifier; // For UI display in CommonPhonePicker (ISO code)
  final ValueNotifier<bool> isObscureNotifier;
  final GlobalKey phoneKey; // Key for the phone input field

  // Optional: Validation notifiers similar to LoginHooks
  final ValueNotifier<bool> isEmailValidNotifier;
  final ValueNotifier<bool> isPassValidNotifier;
  final ValueNotifier<bool> isFNameValidNotifier;
  final ValueNotifier<bool> isLNameValidNotifier;
  final ValueNotifier<bool> isPhoneValidNotifier;

  SignUpHooks({
    required this.fNameController,
    required this.lNameController,
    required this.emailController,
    required this.passController,
    required this.phoneController,
    required this.phoneNumberNotifier,
    required this.phoneIsoNotifier,
    required this.isObscureNotifier,
    required this.phoneKey,
    // Optional validation notifiers
    required this.isEmailValidNotifier,
    required this.isPassValidNotifier,
    required this.isFNameValidNotifier,
    required this.isLNameValidNotifier,
    required this.isPhoneValidNotifier,
  });
}

SignUpHooks useSignUpHooks() {
  final fNameController = useTextEditingController();
  final lNameController = useTextEditingController();
  final emailController = useTextEditingController();
  final passController = useTextEditingController();
  final phoneController = useTextEditingController(); // For AuthProvider
  final phoneNumberNotifier = useState(''); // For UI
  final phoneIsoNotifier = useState(''); // For UI
  final isObscureNotifier = useState(true);
  final phoneKey = useMemoized(() => GlobalKey(), const []);

  // Optional: Validation states
  final isEmailValidNotifier = useState(false);
  final isPassValidNotifier = useState(false);
  final isFNameValidNotifier = useState(false);
  final isLNameValidNotifier = useState(false);
  final isPhoneValidNotifier = useState(false);

  useEffect(() {
    void updateEmailValidity() {
      // Basic email validation, adjust regex as needed
      final isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text);
      isEmailValidNotifier.value = isValid;
    }

    emailController.addListener(updateEmailValidity);
    updateEmailValidity(); // Initial check
    return () => emailController.removeListener(updateEmailValidity);
  }, [emailController]);

  useEffect(() {
    void updatePassValidity() {
      isPassValidNotifier.value = passController.text.length >= 8;
    }

    passController.addListener(updatePassValidity);
    updatePassValidity(); // Initial check
    return () => passController.removeListener(updatePassValidity);
  }, [passController]);

  useEffect(() {
    void updateFNameValidity() {
      isFNameValidNotifier.value = fNameController.text.isNotEmpty;
    }

    fNameController.addListener(updateFNameValidity);
    updateFNameValidity();
    return () => fNameController.removeListener(updateFNameValidity);
  }, [fNameController]);

  useEffect(() {
    void updateLNameValidity() {
      isLNameValidNotifier.value = lNameController.text.isNotEmpty;
    }

    lNameController.addListener(updateLNameValidity);
    updateLNameValidity();
    return () => lNameController.removeListener(updateLNameValidity);
  }, [lNameController]);

  // Phone validation can be more complex (e.g., length based on country)
  // For simplicity, we'll check if the main phoneController (for AuthProvider) is not empty
  useEffect(() {
    void updatePhoneValidity() {
      isPhoneValidNotifier.value = phoneController.text.isNotEmpty;
    }

    phoneController.addListener(updatePhoneValidity);
    updatePhoneValidity();
    return () => phoneController.removeListener(updatePhoneValidity);
  }, [phoneController]);

  return useMemoized(
    () => SignUpHooks(
      fNameController: fNameController,
      lNameController: lNameController,
      emailController: emailController,
      passController: passController,
      phoneController: phoneController,
      phoneNumberNotifier: phoneNumberNotifier,
      phoneIsoNotifier: phoneIsoNotifier,
      isObscureNotifier: isObscureNotifier,
      phoneKey: phoneKey,
      // Optional validation
      isEmailValidNotifier: isEmailValidNotifier,
      isPassValidNotifier: isPassValidNotifier,
      isFNameValidNotifier: isFNameValidNotifier,
      isLNameValidNotifier: isLNameValidNotifier,
      isPhoneValidNotifier: isPhoneValidNotifier,
    ),
    [
      fNameController,
      lNameController,
      emailController,
      passController,
      phoneController,
      phoneNumberNotifier,
      phoneIsoNotifier,
      isObscureNotifier,
      phoneKey,
      isEmailValidNotifier,
      isPassValidNotifier,
      isFNameValidNotifier,
      isLNameValidNotifier,
      isPhoneValidNotifier,
    ],
  );
}
