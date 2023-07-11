

class SignUpWithEmailAndPasswordFailure {
  final String message;


  const SignUpWithEmailAndPasswordFailure([this.message = "An unknown error occured"]);


  factory SignUpWithEmailAndPasswordFailure.code(String code){


    switch(code){

      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Please enter a strong password');

      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Inavlid email');

      case 'email-aleady-in-use':
        return const SignUpWithEmailAndPasswordFailure('An account with this email is already in existence');


      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation not allowed, kindly contact support');


      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('This user has been disabled.');

      default:
        return const SignUpWithEmailAndPasswordFailure();

    }
  }



}