import 'package:flutter/material.dart';

class FinalVersionPage extends StatefulWidget {
  const FinalVersionPage({super.key});

  @override
  State<FinalVersionPage> createState() => _FinalVersionPageState();
}

class _FinalVersionPageState extends State<FinalVersionPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(fontSize: 12);

    final canPop = ModalRoute.of(context)?.canPop ?? false;

    return Scaffold(
      appBar: canPop
          ? AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text('Important Announcement'),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 25),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium,
                  text: 'This is the FINAL version of this app!',
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Unfortunately I can no longer support the app. I am leaving Germany and unable to continue to develop the app without an Esso card anymore. Although the app may continue to function, it will no longer receive bug fixes and feature support, so I must recommend that you stop using it. Thanks to every user and for everyone\'s support.',
                style: textStyle,
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
