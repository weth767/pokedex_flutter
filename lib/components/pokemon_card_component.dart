import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/models/pokemon_data.dart';
import 'package:pokedex_flutter/utils/colors.dart';
import 'package:pokedex_flutter/utils/util_functions.dart';

class PokemonCardComponent extends StatelessWidget {
  final PokemonData pokemon;
  const PokemonCardComponent({Key? key, required this.pokemon})
      : super(key: key);

  Widget imageContainer() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(pokemon.sprites.frontDefault, scale: 0.5),
        ),
      ),
    );
  }

  Widget typeChips() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: pokemon.types
            .map((e) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Chip(
                    label: Text(
                      UtilFunctions.capitalize(e.type.name),
                      style: GoogleFonts.roboto(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: colorsMap[e.type.name],
                  ),
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorsMap[pokemon.types.elementAt(0).type.name] ?? Colors.black,
            pokemon.types.length > 1
                ? colorsMap[pokemon.types.elementAt(1).type.name] ??
                    Colors.black
                : colorsMap[pokemon.types.elementAt(0).type.name] ??
                    Colors.black,
          ],
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      margin: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        color: Colors.white,
        child: Column(
          children: [
            imageContainer(),
            Text(
              UtilFunctions.capitalize(pokemon.name),
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            typeChips()
          ],
        ),
      ),
    );
  }
}
