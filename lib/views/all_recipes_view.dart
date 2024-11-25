import 'package:flutter/material.dart';
import 'package:szef_kuchni_v2/models/recipe_name.dart';
import 'package:szef_kuchni_v2/services/database_service.dart';

class AllRecipesView extends StatefulWidget{
  const AllRecipesView({super.key});

  @override
  State<AllRecipesView> createState() => _AllRecipesViewState();
}

class _AllRecipesViewState extends State<AllRecipesView> {
  final DatabaseService databaseService = DatabaseService();
  List<RecipeName> recipeNames = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    final recipes = await databaseService.getRecipeNames();
    setState(() {
      recipeNames = recipes; // Use different variable name
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 20.0,
    );
    
    return Scaffold(
      backgroundColor: theme.colorScheme.inverseSurface,
      body: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: Text(recipeNames[index].name),
          );
        },
         separatorBuilder: (context, index) => const Divider(height: 0.5, color: Colors.amber,),
          // ignore: unnecessary_null_comparison
          itemCount: recipeNames==null?0:recipeNames.length
        ),
    );
  }
}

class AllRecipesViewState extends ChangeNotifier {

}