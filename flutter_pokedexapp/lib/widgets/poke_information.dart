import 'package:flutter/material.dart';
import 'package:flutter_pokedexapp/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemon.name),
            _buildInformationRow('Height', pokemon.height),
            _buildInformationRow('Weight', pokemon.weight),
            _buildInformationRow('Spawn Time', pokemon.spawnTime),
            _buildInformationRow('Weakness', pokemon.weaknesses),
            _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
            _buildInformationRow('Next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (value is List && value.isNotEmpty)
          Text(value.join(' , '),
              style: const TextStyle(color: Colors.black, fontSize: 16))
        else if (value == null)
          const Text('Not available',
              style: TextStyle(color: Colors.black, fontSize: 16))
        else
          Text(value, style: const TextStyle(color: Colors.black, fontSize: 16))
      ],
    );
  }
}
