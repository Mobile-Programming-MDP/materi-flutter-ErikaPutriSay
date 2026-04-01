class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  SigninScreenState createState() => SignInScreenState();
}

class SigninScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const Center(
        child: Text('Sign In Screen'),
      ),
    );
  }
}