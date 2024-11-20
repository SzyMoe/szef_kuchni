import 'package:flutter/material.dart';

class AllRecipesView extends StatefulWidget{
  const AllRecipesView({super.key});

  @override
  State<AllRecipesView> createState() => _AllRecipesViewState();
}

class _AllRecipesViewState extends State<AllRecipesView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 20.0,
    );
    
    return Scaffold(
      backgroundColor: theme.colorScheme.inverseSurface,
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Wyszukaj przepis po nazwie",
                style: style,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AllRecipesViewState extends ChangeNotifier {

}