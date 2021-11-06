import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/components/pokemon_card_component.dart';
import 'package:pokedex_flutter/models/response_data.dart';
import 'package:pokedex_flutter/services/pokemon_service.dart';
import 'package:pokedex_flutter/utils/images.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PokemonService pokemonService = PokemonService();
  late Future<ResponseData> response;
  late AnimationController animationController;
  late Animation<Color?> colorTween;
  ScrollController controller = ScrollController();
  int limit = 10;

  @override
  void initState() {
    response = pokemonService.getAll();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    colorTween = animationController
        .drive(ColorTween(begin: Colors.red, end: Colors.blue));
    animationController.repeat();
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        setState(() {
          limit *= 2;
          response = pokemonService.getAll(limit);
        });
      }
    });
  }

  Widget progressIndicator() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          ),
          CircularProgressIndicator(
            valueColor: colorTween,
          ),
        ],
      ),
      alignment: Alignment.center,
    );
  }

  Widget cards() {
    return FutureBuilder(
        future: response,
        builder: (context, AsyncSnapshot<ResponseData?> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return progressIndicator();
          }
          return Expanded(
            child: GridView.builder(
              controller: controller,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: snapshot.data!.pokemons.length,
              itemBuilder: (context, index) {
                return PokemonCardComponent(
                    pokemon: snapshot.data!.pokemons[index]);
              },
            ),
          );
        });
  }

  Widget searchInput() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(1),
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            hintStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Color(0xFF666666),
                width: 1,
              ),
            )),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        searchInput(),
        cards(),
      ],
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: SizedBox(
        child: Image.asset(POKEBALL_IMAGE_PATH),
      ),
      title: Text(
        "Pokedex Flutter",
        style: GoogleFonts.poppins(
          fontSize: 24,
          letterSpacing: 0.1,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: body(),
    );
  }
}
