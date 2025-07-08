import 'package:flutter/material.dart';
import 'package:flutter_pokedexapp/model/pokemon_model.dart';
import 'package:flutter_pokedexapp/services/pokedex_api.dart';
import 'package:flutter_pokedexapp/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  //kullanmadan hemen önce initialize edicez bu yüzden late istiyor.
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> listem = snapshot.data!;

          return GridView.builder(
              itemCount: listem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemBuilder: (context, index) {
                return PokeListItem(pokemon: listem[index]);
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("hata çıktı"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
